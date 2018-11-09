/* ******************************************************************************
 * Copyright 2018 darkoverlordofdata.
 * 
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *   http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 ******************************************************************************/
namespace Microsoft.Xna.Framework.Graphics 
{
    using System;
    using ValaGame.OpenGL;
    using Microsoft.Xna.Framework;

    public class SpriteBatcher2D : Object
    {
        /// <summary>
        /// Size of each sprite element.
        /// </summary>
        const int BlockSize = (int)(sizeof(VertexPositionColorTexture2D));
        /// <summary>
        /// Initialization size for the batch item list and queue.
        /// </summary>
        private const int InitialBatchSize = 256;
        /// <summary>
        /// The maximum number of batch items that can be processed per iteration
        /// </summary>
        const int MaxBatchSize = 2048;
        /// <summary>
        /// Initialization size for the vertex array, in batch units.
        /// </summary>
		private const int InitialVertexArraySize = MaxBatchSize * BlockSize;
        
        /// <summary>
        /// The list of batch items to process.
        /// Uses GenericArray for sort
        /// </summary>
        private GenericArray<SpriteBatchItem2D> _batchItemList;
	    // private SpriteBatchItem[] _batchItemList;
        /// <summary>
        /// Index pointer to the next available SpriteBatchItem in _batchItemList.
        /// </summary>
        private int _batchItemCount;

        /// <summary>
        /// The target graphics device.
        /// </summary>
        public GraphicsDevice device { get; construct; }

        /// <summary>
        /// Vertex index array. The values in this array never change.
        /// </summary>
        private int[] _index;

        private float[] _vertexArray;

        uint _vao;
        uint _vbo;
        uint _ebo;

		public SpriteBatcher2D ()
		{
			_batchItemList = new GenericArray<SpriteBatchItem2D>(InitialBatchSize);
            _batchItemCount = 0;

            EnsureArrayCapacity(InitialBatchSize);
            BindArrayBuffer();
            BindElementBuffer();
		}
        
        void BindArrayBuffer()
        {
            GL.GenVertexArrays(1, &_vao);
            GL.GenBuffers(1, &_vbo);
            GL.GenBuffers(1, &_ebo);

            GL.BindVertexArray(_vao);

            GL.BindBuffer(BufferTarget.ArrayBuffer, _vbo);

            GL.VertexAttribPointer(0, 4, DataType.Float, false, (int)(8 * sizeof(float)), (void*)0);
            GL.EnableVertexAttribArray(0);

            GL.VertexAttribPointer(1, 4, DataType.Float, false, (int)(8 * sizeof(float)), (void*)(4 * sizeof(float)));
            GL.EnableVertexAttribArray(1);

            GL.BufferData(BufferTarget.ArrayBuffer, MaxBatchSize * (BlockSize * sizeof(float)), _vertexArray, BufferUsageHint.DynamicDraw);
        }

        void BindElementBuffer()
        {
            GL.BindBuffer(BufferTarget.ElementArrayBuffer, _ebo);
            GL.BufferData(BufferTarget.ElementArrayBuffer, MaxBatchSize * 6 * sizeof(int), _index, BufferUsageHint.DynamicDraw);

            GL.BindBuffer(BufferTarget.ArrayBuffer, 0);

            GL.BindVertexArray(0);
        }

        /// <summary>
        /// Reuse a previously allocated SpriteBatchItem from the item pool. 
        /// if there is none available grow the pool and initialize new items.
        /// </summary>
        /// <returns></returns>
        public SpriteBatchItem2D CreateBatchItem()
        {
            if (_batchItemCount+1 > _batchItemList.length)
                _batchItemList.add(new SpriteBatchItem2D());
            var item = _batchItemList[_batchItemCount];
            ++_batchItemCount;
            return item;
        }
        
        /// <summary>
        /// Resize and recreate the missing indices for the index and vertex position color buffers.
        /// </summary>
        /// <param name="numBatchItems"></param>
        private void EnsureArrayCapacity(int numBatchItems)
        {
            //Element array buffer
            int[] indices = { 0, 1, 2, 2, 3, 1 };
            _index = new int[MaxBatchSize * 6];

            /*
             *  TL    TR
             *   0----1 0,1,2,3 = index offsets for vertex indices
             *   |   /| TL,TR,BL,BR are vertex references in SpriteBatchItem.
             *   |  / |
             *   | /  |
             *   |/   |
             *   2----3
             *  BL    BR
             */
            for (int i = 0; i < MaxBatchSize; ++i)
                for (int j = 0; j < 6; ++j)
                    _index[i * 6 + j] = indices[j] + i * 4;

            _vertexArray = new float[InitialVertexArraySize];
        }
        
        /// <summary>
        /// Sorts the batch items and then groups batch drawing into maximal allowed batch sets that do not
        /// overflow the 16 bit array indices for vertices.
        /// </summary>
        /// <param name="sortMode">The type of depth sorting desired for the rendering.</param>
        public void DrawBatch(SpriteSortMode sortMode)
        {
			// nothing to do
            if (_batchItemCount == 0)
				return;
			
			// sort the batch items
			switch ( sortMode )
			{
			case SpriteSortMode.Texture :                
			case SpriteSortMode.FrontToBack :
			case SpriteSortMode.BackToFront :            
                _batchItemList.sort_with_data((a, b) => b.CompareTo(a));
				break;
			}

            SpriteBatchItem2D sprite;

            /** Copy each sorted batch item into the vertex array */
            for (var i = 0, index = 0; i < _batchItemCount; i++, index+=BlockSize)
            {
                sprite = _batchItemList[i];
                Memory.copy(&_vertexArray[index], &sprite.vertexTL, BlockSize * sizeof(float));
            }
            FlushVertexArray();
            _batchItemCount = 0;
		}

        /// <summary>
        /// Sends the triangle list to the graphics device. Here is where the actual drawing starts.
        /// </summary>
        /// <param name="start">Start index of vertices to draw. Not used except to compute the count of vertices to draw.</param>
        /// <param name="end">End index of vertices to draw. Not used except to compute the count of vertices to draw.</param>
        /// <param name="texture">The texture to draw.</param>
        private void FlushVertexArray()
        {
            GL.BindVertexArray(_vao);
            GL.BindBuffer(BufferTarget.ArrayBuffer, _vbo);
            GL.BindBuffer(BufferTarget.ElementArrayBuffer, _ebo);

            GL.BufferSubData(BufferTarget.ArrayBuffer,          // Target
                            0,                                  // Offset
                            _batchItemCount * (BlockSize * sizeof(float)),   // Size
                            &_vertexArray[0]);                  // Data

            var last_texture = _batchItemList[0].Texture.Handle;
            var offset = 0;

            for (var i = 0; i < _batchItemCount; i++)
            {
                var sprite = _batchItemList[i];
                if (sprite.Texture.Handle != last_texture)
                {
                    GL.BindTexture(TextureTarget.Texture2D, last_texture);
                    GL.DrawElements(PrimitiveType.Triangles,
                                (i - offset) * 6,
                                DataType.UnsignedInt,
                                (void*)(offset * 6 * sizeof(uint)));
                    offset = i;
                    last_texture = sprite.Texture.Handle;
                }
            }

            GL.BindTexture(TextureTarget.Texture2D, last_texture);
            GL.DrawElements(PrimitiveType.Triangles,
                        (_batchItemCount - offset) * 6,
                        DataType.UnsignedInt,
                        (void*)(offset * 6 * sizeof(uint)));

            // Done
            GL.BindTexture(TextureTarget.Texture2D, 0);
            GL.BindBuffer(BufferTarget.ArrayBuffer, 0);
            GL.BindVertexArray(0);
            GL.UseProgram(0);
        }

        public void Dispose() 
        {

            GL.DeleteBuffers(1, &_vbo);
            GL.DeleteBuffers(1, &_ebo);
            GL.DeleteVertexArrays(1, &_vao);

            _batchItemList.remove_range(0, _batchItemList.length);
        }
            
    }
}