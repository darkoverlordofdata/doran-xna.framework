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
        /// Initialization size for the batch item list and queue.
        /// </summary>
        private const int InitialBatchSize = 256;
        /// <summary>
        /// The maximum number of batch items that can be processed per iteration
        /// </summary>
        private const int MaxBatchSize = short.MAX / 6; // 6 = 4 vertices unique and 2 shared, per quad
        /// <summary>
        /// Initialization size for the vertex array, in batch units.
        /// </summary>
		private const int InitialVertexArraySize = 256;

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
        public Shader shader { get; construct; }

        /// <summary>
        /// Vertex index array. The values in this array never change.
        /// </summary>
        private int[] _index;

        private VertexPositionColorTexture2D[] _vertexArray;

		public SpriteBatcher2D (Shader shader)
		{
            // _device = device;
            _shader = shader;

			_batchItemList = new GenericArray<SpriteBatchItem2D>(InitialBatchSize);
            _batchItemCount = 0;

            for (int i = 0; i < InitialBatchSize; i++)
                _batchItemList[i] = new SpriteBatchItem2D();

            EnsureArrayCapacity(InitialBatchSize);
		}
        

        /// <summary>
        /// Reuse a previously allocated SpriteBatchItem from the item pool. 
        /// if there is none available grow the pool and initialize new items.
        /// </summary>
        /// <returns></returns>
        public SpriteBatchItem2D CreateBatchItem()
        {
            if (_batchItemCount >= _batchItemList.length)
            {
                var oldSize = _batchItemList.length;
                var newSize = oldSize + oldSize/2; // grow by x1.5
                newSize = (newSize + 63) & (~63); // grow in chunks of 64.
                // Array.Resize(ref _batchItemList, newSize);
                _batchItemList.length = newSize;
                for(int i=oldSize; i<newSize; i++)
                    _batchItemList[i]=new SpriteBatchItem2D();

                EnsureArrayCapacity((int)Math.fminf(newSize, MaxBatchSize));
            }
            var item = _batchItemList[_batchItemCount++];
            return item;
        }
        
        /// <summary>
        /// Resize and recreate the missing indices for the index and vertex position color buffers.
        /// </summary>
        /// <param name="numBatchItems"></param>
        private void EnsureArrayCapacity(int numBatchItems)
        {
            int neededCapacity = 6 * numBatchItems;
            if (_index != null && neededCapacity <= _index.length)
            {
                // Short circuit out of here because we have enough capacity.
                return;
            }
            int start = _index.length / 6;
            _index.resize(6 * numBatchItems);
            var indexPtr = (start * 6);
            for (var i = start; i < numBatchItems; i++, indexPtr += 6)
            {
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
                // Triangle 1   
                _index[indexPtr + 0] = (int)(i * 4);
                _index[indexPtr + 1] = (int)(i * 4 + 1);
                _index[indexPtr + 2] = (int)(i * 4 + 2);
                // Triangle 2
                _index[indexPtr + 3] = (int)(i * 4 + 2);
                _index[indexPtr + 4] = (int)(i * 4 + 3);
                _index[indexPtr + 5] = (int)(i * 4 + 1);
            }

            _vertexArray = new VertexPositionColorTexture2D[4 * numBatchItems];
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

            // Determine how many iterations through the drawing code we need to make
            int batchIndex = 0;
            int batchCount = _batchItemCount;

            
            _device._graphicsMetrics._spriteCount += batchCount;

            // Iterate through the batches, doing short.MaxValue sets of vertices only.
            while(batchCount > 0)
            {
                // setup the vertexArray array
                var startIndex = 0;
                var index = 0;
                Texture2D tex = null;

                int numBatchesToProcess = batchCount;
                if (numBatchesToProcess > MaxBatchSize)
                {
                    numBatchesToProcess = MaxBatchSize;
                }

                var vertexArrayPtr = 0;

                // Draw the batches
                for (int i = 0; i < numBatchesToProcess; i++, batchIndex++, index += 4, vertexArrayPtr += 4)
                {
                    SpriteBatchItem2D item = _batchItemList[batchIndex];
                    // if the texture changed, we need to flush and bind the new texture
                    var shouldFlush = !ReferenceEquals(item.Texture, tex);
                    if (shouldFlush)
                    {
                        FlushVertexArray(startIndex, index, tex);

                        tex = item.Texture;
                        startIndex = index = 0;
                        vertexArrayPtr = 0;
                        _device.Textures[0] = tex;
                    }

                    // store the SpriteBatchItem data in our vertexArray
                    _vertexArray[vertexArrayPtr+0] = item.vertexTL;
                    _vertexArray[vertexArrayPtr+1] = item.vertexTR;
                    _vertexArray[vertexArrayPtr+2] = item.vertexBL;
                    _vertexArray[vertexArrayPtr+3] = item.vertexBR;

                    // Release the texture.
                    item.Texture = null;
                }
                // flush the remaining vertexArray data
                FlushVertexArray(startIndex, index, tex);
                // Update our batch count to continue the process of culling down
                // large batches
                batchCount -= numBatchesToProcess;
            }
            // return items to the pool.  
            _batchItemCount = 0;
		}

        /// <summary>
        /// Sends the triangle list to the graphics device. Here is where the actual drawing starts.
        /// </summary>
        /// <param name="start">Start index of vertices to draw. Not used except to compute the count of vertices to draw.</param>
        /// <param name="end">End index of vertices to draw. Not used except to compute the count of vertices to draw.</param>
        /// <param name="texture">The texture to draw.</param>
        private void FlushVertexArray(int start, int end, Texture2D? texture)
        {
            if (start == end)
                return;

            var vertexCount = end - start;

            // If no custom effect is defined, then simply render.
            _device.DrawUserIndexedPrimitives(
                PrimitiveType.Triangles,
                _vertexArray,
                0,
                vertexCount,
                _index,
                0,
                (vertexCount / 4) * 2,
                VertexPositionColorTexture.VertexDeclaration);
        }

        public void Dispose() 
        {
        }
            
    }
}