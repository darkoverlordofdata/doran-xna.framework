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

    public class SpriteBatcher : Object
    {
        /// <summary>
        /// Size of float array chunk per Texture Coordinatre batch item.
        /// </summary>
        private const int TexCoordSize = 6 * 12;
        /// <summary>
        /// Size of float array chunk per Position batch item.
        /// </summary>
        private const int PositionSize = 6 * 18;
        /// <summary>
        /// Initialization size for the batch item list and queue.
        /// </summary>
        private const int InitialBatchSize = 8; // 256;
        /// <summary>
        /// The maximum number of batch items that can be processed per iteration
        /// </summary>
        private const int MaxBatchSize = short.MAX / 6; // 6 = 4 vertices unique and 2 shared, per quad
        /// <summary>
        /// Initialization size for the vertex array, in batch units.
        /// </summary>
		private const int InitialVertexArraySize = 8; // 256;

        /// <summary>
        /// The list of batch items to process.
        /// Uses GenericArray for sort
        /// </summary>
        private GenericArray<SpriteBatchItem> _batchItemList;
	    // private SpriteBatchItem[] _batchItemList;
        /// <summary>
        /// Index pointer to the next available SpriteBatchItem in _batchItemList.
        /// </summary>
        private int _batchItemCount;

        /// <summary>
        /// Current camera locus.
        /// </summary>
        // public Vector2 Camera = Vector2.Zero; 
        public OrthoCamera Camera; 
        /// <summary>
        /// The target graphics device.
        /// </summary>
        public GraphicsDevice device { get; construct; }
        public Shader shader { get; construct; }

        /// <summary>
        /// Vertex texture coordinates
        /// </summary>
        private int _indexTexCoords = 0;
        private uint _texcoordsVbo; // S.B in GraphicsDevice
        private float[] _vertexTexCoords = new float[0];
        /// <summary>
        /// Vertex texture positions
        /// </summary>
        private int _indexPositions = 0;
        private uint _positionsVbo; // S.B in GraphicsDevice
        private float[] _vertexPositions = new float[0];

        private VertexBuffer _positions = new VertexBuffer();
        private VertexBuffer _texCoords = new VertexBuffer();

        private uint m_ebo;
        private uint m_vbo;
        private float[] m_verts = new float[0];
        private int m_index = 0;


        float[] verts = {
            //  x      y      s      t
             -1.0f, -1.0f,  0.0f,  1.0f , // BL
             -1.0f,  1.0f,  0.0f,  0.0f , // TL
              1.0f,  1.0f,  1.0f,  0.0f , // TR
              1.0f, -1.0f,  1.0f,  1.0f , // BR
        };

        int[] indicies = {
            0, 1, 2, 0, 2, 3
        };

		public SpriteBatcher (GraphicsDevice device, Shader shader)
		{
            // GLib.Object(device: device);
            _device = device;
            _shader = shader;

			// _batchItemList = new SpriteBatchItem[InitialBatchSize];
            _batchItemList = new GenericArray<SpriteBatchItem>(InitialBatchSize);
            _batchItemCount = 0;

            for (int i = 0; i < InitialBatchSize; i++)
                _batchItemList.add(new SpriteBatchItem());
                // _batchItemList[i] = new SpriteBatchItem();

            EnsureArrayCapacity(InitialBatchSize);
            print("SpriteBatcher Created %d\n", _batchItemList.length);
		}
        

        /// <summary>
        /// Reuse a previously allocated SpriteBatchItem from the item pool. 
        /// if there is none available grow the pool and initialize new items.
        /// </summary>
        /// <returns></returns>
        public SpriteBatchItem CreateBatchItem()
        {
            if (_batchItemCount >= _batchItemList.length)
            {
                var oldSize = _batchItemList.length;
                var newSize = oldSize + oldSize/2; // grow by x1.5
                newSize = (newSize + 63) & (~63); // grow in chunks of 64.
                // _batchItemList.resize(newSize);
                _batchItemList.length = newSize;
                for(int i=oldSize; i<newSize; i++)
                    _batchItemList[i] = new SpriteBatchItem();

                EnsureArrayCapacity(int.min(newSize, MaxBatchSize));
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
            int neededCapacity = TexCoordSize * numBatchItems;
            if (neededCapacity <= _vertexTexCoords.length)
            {
                // Short circuit out of here because we have enough capacity.
                return;
            }

            m_verts.resize(numBatchItems * TexCoordSize);
            _vertexTexCoords.resize(numBatchItems * TexCoordSize);
            _vertexPositions.resize(numBatchItems * PositionSize);
            
        }
        
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
                // Array.Sort(_batchItemList, 0, _batchItemCount);
                _batchItemList.sort_with_data((a, b) => a.CompareTo(b));
				break;
			}

            // Determine how many iterations through the drawing code we need to make
            int batchIndex = 0;
            int batchCount = _batchItemCount;
            // Why??
            // _device._graphicsMetrics._spriteCount += batchCount;

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

                // Draw the batches
                for (int i = 0; i < numBatchesToProcess; i++, batchIndex++, index+=6)
                {
                    SpriteBatchItem item = _batchItemList[batchIndex];
                    // if the texture changed, we need to flush and bind the new texture
                    var shouldFlush = !Object.ReferenceEquals(item.Texture, tex);
                    if (shouldFlush)
                    {
                        FlushVertexArray(startIndex, index, tex);

                        tex = item.Texture;
                        startIndex = index = 0;
                    }

                    CopyItemToArray(item);

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

        // float[] verts = {
        //     //  x      y      s      t
        //      -1.0f, -1.0f,  0.0f,  1.0f , // BL
        //      -1.0f,  1.0f,  0.0f,  0.0f , // TL
        //       1.0f,  1.0f,  1.0f,  0.0f , // TR
        //       1.0f, -1.0f,  1.0f,  1.0f , // BR
        // };
        private void CopyItemToArray(SpriteBatchItem item)
        {
            m_verts[m_index++] = item.Vertex1TR.Position.X;
            m_verts[m_index++] = item.Vertex1TR.Position.Y;
            m_verts[m_index++] = item.Vertex1TR.TextureCoordinate.X; 
            m_verts[m_index++] = item.Vertex1TR.TextureCoordinate.Y; 

            m_verts[m_index++] = item.Vertex1TL.Position.X;
            m_verts[m_index++] = item.Vertex1TL.Position.Y;
            m_verts[m_index++] = item.Vertex1TL.TextureCoordinate.X; 
            m_verts[m_index++] = item.Vertex1TL.TextureCoordinate.Y; 

            m_verts[m_index++] = item.Vertex1BL.Position.X;
            m_verts[m_index++] = item.Vertex1BL.Position.Y;
            m_verts[m_index++] = item.Vertex1BL.TextureCoordinate.X; 
            m_verts[m_index++] = item.Vertex1BL.TextureCoordinate.Y; 

            m_verts[m_index++] = item.Vertex2BR.Position.X;
            m_verts[m_index++] = item.Vertex2BR.Position.Y;
            m_verts[m_index++] = item.Vertex2BR.TextureCoordinate.X; 
            m_verts[m_index++] = item.Vertex2BR.TextureCoordinate.Y; 

        }

        private void CopyItemToArrayOld(SpriteBatchItem item)
        {
            _vertexPositions[_indexPositions++] = item.Vertex1TR.Position.X;
            _vertexPositions[_indexPositions++] = item.Vertex1TR.Position.Y;
            _vertexPositions[_indexPositions++] = 0;
            _vertexPositions[_indexPositions++] = item.Vertex1TL.Position.X;
            _vertexPositions[_indexPositions++] = item.Vertex1TL.Position.Y;
            _vertexPositions[_indexPositions++] = 0;
            _vertexPositions[_indexPositions++] = item.Vertex1BL.Position.X;
            _vertexPositions[_indexPositions++] = item.Vertex1BL.Position.Y;
            _vertexPositions[_indexPositions++] = 0;

            _vertexTexCoords[_indexTexCoords++] = item.Vertex1TR.TextureCoordinate.X; 
            _vertexTexCoords[_indexTexCoords++] = item.Vertex1TR.TextureCoordinate.Y; 
            _vertexTexCoords[_indexTexCoords++] = item.Vertex1TL.TextureCoordinate.X; 
            _vertexTexCoords[_indexTexCoords++] = item.Vertex1TL.TextureCoordinate.Y; 
            _vertexTexCoords[_indexTexCoords++] = item.Vertex1BL.TextureCoordinate.X; 
            _vertexTexCoords[_indexTexCoords++] = item.Vertex1BL.TextureCoordinate.Y; 


            _vertexPositions[_indexPositions++] = item.Vertex2TR.Position.X;
            _vertexPositions[_indexPositions++] = item.Vertex2TR.Position.Y;
            _vertexPositions[_indexPositions++] = 0;
            _vertexPositions[_indexPositions++] = item.Vertex2BR.Position.X;
            _vertexPositions[_indexPositions++] = item.Vertex2BR.Position.Y;
            _vertexPositions[_indexPositions++] = 0;
            _vertexPositions[_indexPositions++] = item.Vertex2BL.Position.X;
            _vertexPositions[_indexPositions++] = item.Vertex2BL.Position.Y;
            _vertexPositions[_indexPositions++] = 0;

            _vertexTexCoords[_indexTexCoords++] = item.Vertex2TR.TextureCoordinate.X; 
            _vertexTexCoords[_indexTexCoords++] = item.Vertex2TR.TextureCoordinate.Y; 
            _vertexTexCoords[_indexTexCoords++] = item.Vertex2BR.TextureCoordinate.X; 
            _vertexTexCoords[_indexTexCoords++] = item.Vertex2BR.TextureCoordinate.Y; 
            _vertexTexCoords[_indexTexCoords++] = item.Vertex2BL.TextureCoordinate.X; 
            _vertexTexCoords[_indexTexCoords++] = item.Vertex2BL.TextureCoordinate.Y; 
            
        }

        private void FlushVertexArray(int start, int end, Texture2D? texture)
        {
            if (start == end)
            {
                return;
            }

            var vertexCount = end - start;

            DrawUserIndexedPrimitives(texture);
            // // If no custom effect is defined, then simply render.
            // _device.DrawUserIndexedPrimitives(
            //     PrimitiveType.TriangleList,
            //     _vertexArray,
            //     0,
            //     vertexCount,
            //     _index,
            //     0,
            //     (vertexCount / 4) * 2,
            //     null);
                
            Memory.set(m_verts, 0, m_index*sizeof(float));
            Memory.set(_vertexTexCoords, 0, _indexTexCoords*sizeof(float));
            Memory.set(_vertexPositions, 0, _indexPositions*sizeof(float));
            m_index = 0;
            _indexTexCoords = 0;
            _indexPositions = 0;
        }

        private void DrawUserIndexedPrimitives(Texture2D texture)
        {
            GL.BindTexture(TextureTarget.Texture2D, texture.Handle);

            _shader.Use();
            _shader.SetInteger("tex", 0);

            GL.Enable(EnableCap.Blend);
            GL.BlendFunc(BlendingFactorSrc.SrcAlpha, BlendingFactorDest.OneMinusSrcAlpha);
            // Populate vertex buffer
            GL.GenBuffers(1, &m_vbo);
            GL.BindBuffer(BufferTarget.ArrayBuffer, m_vbo);
            GL.BufferData(BufferTarget.ArrayBuffer, verts.length*sizeof(float), verts, BufferUsageHint.StaticDraw);
            // GL.BufferData(BufferTarget.ArrayBuffer, m_index*sizeof(float), m_verts, BufferUsageHint.StaticDraw);

            // Populate element buffer
            GL.GenBuffers(1, &m_ebo);
            GL.BindBuffer(BufferTarget.ElementArrayBuffer, m_ebo);
            GL.BufferData(BufferTarget.ElementArrayBuffer, indicies.length*sizeof(float), indicies, BufferUsageHint.StaticDraw);

            // Bind vertex position attribute
            int pos_attr_loc = GL.GetAttribLocation(_shader.ID, "in_Position");
            // print("pos_attr_loc = %d\n", pos_attr_loc);
            GL.VertexAttribPointer(pos_attr_loc, 2, DataType.Float, false, (int)(4*sizeof(float)), (void*)0);
            GL.EnableVertexAttribArray(pos_attr_loc);

            // Bind vertex texture coordinate attribute
            int tex_attr_loc = GL.GetAttribLocation(_shader.ID, "in_Texcoord");
            // print("tex_attr_loc = %d\n", tex_attr_loc);
            GL.VertexAttribPointer(tex_attr_loc, 2, DataType.Float, false, (int)(4*sizeof(float)), (void*)(2*sizeof(float)));
            GL.EnableVertexAttribArray(tex_attr_loc);
            GL.DrawElements(PrimitiveType.Triangles, 6, DataType.UnsignedInt, null);

            
        }
        /**
         * Ugly code - calls direct mode 
         */
        private void DrawUserIndexedPrimitivesOld(Texture2D texture)
        {
            // ApplyState(true);
            _positions.SetFloatData(_vertexPositions, _vertexPositions.length);
            _texCoords.SetFloatData(_vertexTexCoords, _vertexTexCoords.length);

            // fix so this doesn't use Immediate mode 
            // GL.Use2DCamera(Camera);
            // ortho = ortho ?? Microsoft.Xna.Framework.Graphics.OrthoCamera.Default;
            GL.MatrixMode(Mode.Projection);
            GL.LoadIdentity();
            GL.Ortho(Camera.Left, Camera.Right, Camera.Bottom, Camera.Top, Camera.Near, Camera.Far);
            GL.MatrixMode(Mode.ModelView);
            GL.LoadIdentity();
            GL.Enable(EnableCap.Texture2D);
            GL.Enable(EnableCap.Blend);
            GL.BlendFunc(BlendingFactorSrc.SrcAlpha, BlendingFactorDest.OneMinusSrcAlpha);

            GL.BindTexture(TextureTarget.Texture2D, texture.Handle);
            // fix so this doesn't use Immediate mode 
            // GL.DrawUserArrays(_batchItemCount, _positions.vbo, _texCoords.vbo);

            GL.TexParameteri(TextureTarget.Texture2D, TextureParameterName.TextureWrapS, (int)TextureWrapMode.ClampToEdge);
            GL.TexParameteri(TextureTarget.Texture2D, TextureParameterName.TextureWrapT, (int)TextureWrapMode.ClampToEdge);
            
            GL.EnableClientState(EnableCap.VertexArray);
            GL.EnableClientState(EnableCap.TextureCoordArray);
        
            GL.BindBuffer(BufferTarget.ArrayBuffer, _texCoords.vbo);
            GL.TexCoordPointer(2, DataType.Float, 0, (void*)0);
            
            GL.BindBuffer(BufferTarget.ArrayBuffer, _positions.vbo);
            GL.VertexPointer(3, DataType.Float, 0, (void*)0);
            
            GL.DrawArrays(PrimitiveType.Triangles, 0, _batchItemCount * 6);

            GL.BindBuffer(BufferTarget.ArrayBuffer, 0);
            GL.DisableClientState(EnableCap.TextureCoordArray);  
            GL.DisableClientState(EnableCap.VertexArray);
            
        }

        public void Dispose() 
        {
            _positions.DisposeBuffer(_batchItemCount);
            _texCoords.DisposeBuffer(_batchItemCount);

            // GL.DeleteBuffers(_batchItemCount, &_positionsVbo);
            // GL.DeleteBuffers(_batchItemCount, &_texcoordsVbo);
        }
            
    }
    public class VertexBuffer : Object
    {
        internal uint vbo;
        /// <summary>
        /// If the VBO does not exist, create it.
        /// </summary>

        void GenerateIfRequired()
        {
            if (vbo == 0)
            {
                GL.GenBuffers(1, &vbo);
                GraphicsExtensions.CheckGLError();
             }
        }

        public void SetFloatData(float* data, int length)
        {
            GenerateIfRequired();
            GL.BindBuffer(BufferTarget.ArrayBuffer, vbo);
            GraphicsExtensions.CheckGLError();
            GL.BufferData(BufferTarget.ArrayBuffer, length*sizeof(float), (GL.void*)data, BufferUsageHint.StaticDraw);
            GraphicsExtensions.CheckGLError();
        }

        public void DisposeBuffer(int count) 
        {
            GL.DeleteBuffers(count, &vbo);
            // // GraphicsExtensions.CheckGLError();
        }
    }
}