// /* ******************************************************************************
//  * Copyright 2018 darkoverlordofdata.
//  * 
//  * Licensed under the Apache License, Version 2.0 (the "License");
//  * you may not use this file except in compliance with the License.
//  * You may obtain a copy of the License at
//  * 
//  *   http://www.apache.org/licenses/LICENSE-2.0
//  * 
//  * Unless required by applicable law or agreed to in writing, software
//  * distributed under the License is distributed on an "AS IS" BASIS,
//  * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  * See the License for the specific language governing permissions and
//  * limitations under the License.
//  ******************************************************************************/
// namespace Microsoft.Xna.Framework.Graphics 
// {
//     using System;
//     using ValaGame.OpenGL;
//     using Microsoft.Xna.Framework;

//     public class SpriteBatcher : Object
//     {
//         /// <summary>
//         /// Size of float array chunk per Texture Coordinatre batch item.
//         /// </summary>
//         private const int TexCoordSize = 256;
//         /// <summary>
//         /// Initialization size for the batch item list and queue.
//         /// </summary>
//         private const int InitialBatchSize = 6;
//         /// <summary>
//         /// The maximum number of batch items that can be processed per iteration
//         /// </summary>
//         private const int MaxBatchSize = short.MAX / 6; // 6 = 4 vertices unique and 2 shared, per quad
//         /// <summary>
//         /// Initialization size for the vertex array, in batch units.
//         /// </summary>
// 		private const int InitialVertexArraySize = 256;

//         /// <summary>
//         /// The list of batch items to process.
//         /// Uses GenericArray for sort
//         /// </summary>
//         private GenericArray<SpriteBatchItem> _batchItemList;
// 	    // private SpriteBatchItem[] _batchItemList;
//         /// <summary>
//         /// Index pointer to the next available SpriteBatchItem in _batchItemList.
//         /// </summary>
//         private int _batchItemCount;

//         /// <summary>
//         /// The target graphics device.
//         /// </summary>
//         public GraphicsDevice device { get; construct; }
//         public Shader shader { get; construct; }

//         /// <summary>
//         /// Vertex texture coordinates
//         /// </summary>
//         private int _indexVertex = 0;
//         private int[] _index = new int[0];
//         private float[] _vertexArray = new float[0];
//         private uint vbo;
//         private uint ebo;

// /**
// 0.000000,0.000000 : 0.001953,0.493164
// 700.000000,0.000000 : 0.501953,0.493164
// 0.000000,480.000000 : 0.001953,0.993164
// 700.000000,480.000000 : 0.501953,0.993164

// 408.000000,204.000000 : 0.187500,0.323242
// 494.000000,204.000000 : 0.292969,0.323242
// 408.000000,341.000000 : 0.187500,0.491211
// 494.000000,341.000000 : 0.292969,0.491211

// 0.000000,0.000000 : 0.001953,0.493164
// 700.000000,0.000000 : 0.501953,0.493164
// 0.000000,480.000000 : 0.001953,0.993164
// 700.000000,480.000000 : 0.501953,0.993164

// 408.000000,204.000000 : 0.187500,0.323242
// 494.000000,204.000000 : 0.292969,0.323242
// 408.000000,341.000000 : 0.187500,0.491211
// 494.000000,341.000000 : 0.292969,0.491211

//              -0.5f, -0.5f,  0.0f,  1.0f , // BL
//              -0.5f,  0.5f,  0.0f,  0.0f , // TL
//               0.5f,  0.5f,  1.0f,  0.0f , // TR
//               0.5f, -0.5f,  1.0f,  1.0f , // BR

//  */
//         // float[] verts = {
//         //     //  x      y      u      v
//         //      -0.5f, -0.5f,  0.0f,  1.0f , // BL
//         //      -0.5f,  0.5f,  0.0f,  0.0f , // TL
//         //       0.5f,  0.5f,  1.0f,  0.0f , // TR
//         //       0.5f, -0.5f,  1.0f,  1.0f , // BR
//         // };
//         // int[] indicies = {
//         //     0, 1, 3, 1, 2, 3
//         // };


//         float[] verts = {
//             -0.5f, -0.5f, 0.0f, 0.0f,
//              0.5f, -0.5f, 1.0f, 0.0f,
//              0.5f, 0.5f,  1.0f, 1.0f,
//             -0.5f, 0.5f,  0.0f, 1.0f,
//         };

//         int[] indices = {
//             0, 1, 2,
//             2, 3, 0
//         };


// 		public SpriteBatcher (GraphicsDevice device, Shader shader)
// 		{
//             // GLib.Object(device: device);
//             _device = device;
//             _shader = shader;

// 			// _batchItemList = new SpriteBatchItem[InitialBatchSize];
//             _batchItemList = new GenericArray<SpriteBatchItem>(InitialBatchSize);
//             _batchItemCount = 0;

//             for (int i = 0; i < InitialBatchSize; i++)
//                 _batchItemList.add(new SpriteBatchItem());

//             EnsureArrayCapacity(InitialBatchSize);
//             print("SpriteBatcher Created %d\n", _batchItemList.length);
// 		}
        

//         /// <summary>
//         /// Reuse a previously allocated SpriteBatchItem from the item pool. 
//         /// if there is none available grow the pool and initialize new items.
//         /// </summary>
//         /// <returns></returns>
//         public SpriteBatchItem CreateBatchItem()
//         {
//             if (_batchItemCount >= _batchItemList.length)
//             {
//                 var oldSize = _batchItemList.length;
//                 var newSize = oldSize + oldSize/2; // grow by x1.5
//                 newSize = (newSize + 63) & (~63); // grow in chunks of 64.
//                 // _batchItemList.resize(newSize);
//                 _batchItemList.length = newSize;
//                 for(int i=oldSize; i<newSize; i++)
//                     _batchItemList[i] = new SpriteBatchItem();

//                 EnsureArrayCapacity(int.min(newSize, MaxBatchSize));
//             }
//             var item = _batchItemList[_batchItemCount++];
//             return item;
//         }
        
//         /// <summary>
//         /// Resize and recreate the missing indices for the index and vertex position color buffers.
//         /// </summary>
//         /// <param name="numBatchItems"></param>
//         private void EnsureArrayCapacity(int numBatchItems)
//         {
//             int neededCapacity = 6 * numBatchItems;
//             if (neededCapacity <= _index.length)
//             {
//                 // Short circuit out of here because we have enough capacity.
//                 return;
//             }
//             int start = _index.length / 6;

//             _index.resize(numBatchItems * 6);
            
//             var indexPtr = start * 6;
//             for (var i = start; i<numBatchItems; i++, indexPtr += 6)
//             {
//                 /*
//                     *  TL    TR
//                     *   0----1 0,1,2,3 = index offsets for vertex indices
//                     *   |   /| TL,TR,BL,BR are vertex references in SpriteBatchItem.
//                     *   |  / |
//                     *   | /  |
//                     *   |/   |
//                     *   2----3
//                     *  BL    BR
//                     */
//                 //            0, 1, 2, 0, 2, 3

//                 // Triangle 1
//                 print("indexPtr = %d %d\n", indexPtr, (i*4));
//                 _index[indexPtr + 0] =  i * 4 + 0;
//                 _index[indexPtr + 1] =  i * 4 + 1;
//                 _index[indexPtr + 2] =  i * 4 + 2;
//                 // Triangle 2
//                 _index[indexPtr + 3] =  i * 4 + 2; //3;
//                 _index[indexPtr + 4] =  i * 4 + 3; //4;
//                 _index[indexPtr + 5] =  i * 4 + 0; //5;

//             }
//             // _vertexArray = new float[4 * numBatchItems * 6];
//             _vertexArray.resize(numBatchItems * 6);
            
//         }
        
//         public void DrawBatch(SpriteSortMode sortMode)
//         {
// 			// nothing to do
//             if (_batchItemCount == 0)
// 				return;

// 			// sort the batch items
// 			switch ( sortMode )
// 			{
// 			case SpriteSortMode.Texture :
// 			case SpriteSortMode.FrontToBack :
// 			case SpriteSortMode.BackToFront :
//                 // Array.Sort(_batchItemList, 0, _batchItemCount);
//                 _batchItemList.sort_with_data((a, b) => a.CompareTo(b));
// 				break;
// 			}

//             // Determine how many iterations through the drawing code we need to make
//             int batchIndex = 0;
//             int batchCount = _batchItemCount;
//             // Why??
//             // _device._graphicsMetrics._spriteCount += batchCount;

//             // Iterate through the batches, doing short.MaxValue sets of vertices only.
//             while(batchCount > 0)
//             {
//                 // setup the vertexArray array
//                 var startIndex = 0;
//                 var index = 0;
//                 Texture2D tex = null;

//                 int numBatchesToProcess = batchCount;
//                 if (numBatchesToProcess > MaxBatchSize)
//                 {
//                     numBatchesToProcess = MaxBatchSize;
//                 }

//                 // Draw the batches
//                 for (int i = 0; i < numBatchesToProcess; i++, batchIndex++, index+=6)
//                 {
//                     SpriteBatchItem item = _batchItemList[batchIndex];
//                     // if the texture changed, we need to flush and bind the new texture
//                     var shouldFlush = !Object.ReferenceEquals(item.Texture, tex);
//                     if (shouldFlush)
//                     {
//                         FlushVertexArray(startIndex, index, tex);

//                         tex = item.Texture;
//                         startIndex = index = 0;
//                     }

//                     CopyItemToArray(item);

//                     // Release the texture.
//                     item.Texture = null;
//                 }
//                 // flush the remaining vertexArray data
//                 FlushVertexArray(startIndex, index, tex);

//                 // Update our batch count to continue the process of culling down
//                 // large batches
//                 batchCount -= numBatchesToProcess;
//             }
//             // return items to the pool.  
//             _batchItemCount = 0;
// 		}

//         private void CopyItemToArray(SpriteBatchItem item)
//         {
//             // dummy values
//             _vertexArray[_indexVertex++] = verts[0];
//             _vertexArray[_indexVertex++] = verts[1];
//             _vertexArray[_indexVertex++] = verts[2];
//             _vertexArray[_indexVertex++] = verts[3];

//             _vertexArray[_indexVertex++] = verts[4];
//             _vertexArray[_indexVertex++] = verts[5];
//             _vertexArray[_indexVertex++] = verts[6];
//             _vertexArray[_indexVertex++] = verts[7];

//             _vertexArray[_indexVertex++] = verts[8];
//             _vertexArray[_indexVertex++] = verts[9];
//             _vertexArray[_indexVertex++] = verts[10];
//             _vertexArray[_indexVertex++] = verts[11];

//             _vertexArray[_indexVertex++] = verts[12];
//             _vertexArray[_indexVertex++] = verts[13];
//             _vertexArray[_indexVertex++] = verts[14];
//             _vertexArray[_indexVertex++] = verts[15];

//             verts[0] += 0.005f;
//             verts[1] += 0.005f;
//             verts[4] += 0.005f;
//             verts[5] += 0.005f;
//             verts[8] += 0.005f;
//             verts[9] += 0.005f;
//             verts[12] += 0.005f;
//             verts[13] += 0.005f;

//             return;

//             _vertexArray[_indexVertex++] = item.VertexTL.Position.X;
//             _vertexArray[_indexVertex++] = item.VertexTL.Position.Y;
//             _vertexArray[_indexVertex++] = item.VertexTL.TextureCoordinate.X; 
//             _vertexArray[_indexVertex++] = item.VertexTL.TextureCoordinate.Y; 

//             // print("%f,%f : %f,%f\n", item.VertexTL.Position.X, 
//             //                         item.VertexTL.Position.Y,
//             //                         item.VertexTL.TextureCoordinate.X, 
//             //                         item.VertexTL.TextureCoordinate.Y);

//             _vertexArray[_indexVertex++] = item.VertexTR.Position.X;
//             _vertexArray[_indexVertex++] = item.VertexTR.Position.Y;
//             _vertexArray[_indexVertex++] = item.VertexTR.TextureCoordinate.X; 
//             _vertexArray[_indexVertex++] = item.VertexTR.TextureCoordinate.Y; 

//             // print("%f,%f : %f,%f\n", item.VertexTR.Position.X, 
//             //                         item.VertexTR.Position.Y,
//             //                         item.VertexTR.TextureCoordinate.X, 
//             //                         item.VertexTR.TextureCoordinate.Y);
                                    
//             _vertexArray[_indexVertex++] = item.VertexBL.Position.X;
//             _vertexArray[_indexVertex++] = item.VertexBL.Position.Y;
//             _vertexArray[_indexVertex++] = item.VertexBL.TextureCoordinate.X; 
//             _vertexArray[_indexVertex++] = item.VertexBL.TextureCoordinate.Y; 

//             // print("%f,%f : %f,%f\n", item.VertexBL.Position.X, 
//             //                         item.VertexBL.Position.Y,
//             //                         item.VertexBL.TextureCoordinate.X, 
//             //                         item.VertexBL.TextureCoordinate.Y);
                                    
//             _vertexArray[_indexVertex++] = item.VertexBR.Position.X;
//             _vertexArray[_indexVertex++] = item.VertexBR.Position.Y;
//             _vertexArray[_indexVertex++] = item.VertexBR.TextureCoordinate.X; 
//             _vertexArray[_indexVertex++] = item.VertexBR.TextureCoordinate.Y; 

//             // print("%f,%f : %f,%f\n", item.VertexBR.Position.X, 
//             //                         item.VertexBR.Position.Y,
//             //                         item.VertexBR.TextureCoordinate.X, 
//             //                         item.VertexBR.TextureCoordinate.Y);
                                    
//         }


//         private void FlushVertexArray(int start, int end, Texture2D? texture)
//         {
//             if (start == end)
//             {
//                 return;
//             }

//             var vertexCount = end - start;

//             DrawUserIndexedPrimitives(texture);
//             // // If no custom effect is defined, then simply render.
//             // _device.DrawUserIndexedPrimitives(
//             //     PrimitiveType.TriangleList,
//             //     _vertexArray,
//             //     0,
//             //     vertexCount,
//             //     _index,
//             //     0,
//             //     (vertexCount / 4) * 2,
//             //     null);
                
//             Memory.set(_vertexArray, 0, _indexVertex*sizeof(float));
//             _indexVertex = 0;
//         }

//         private void DrawUserIndexedPrimitives(Texture2D texture)
//         {
//             GL.BindTexture(TextureTarget.Texture2D, texture.Handle);

//             _shader.Use();
//             _shader.SetInteger("tex", 0);

//             // print("{%f, %f, %f, %f}\n{%f, %f, %f, %f}\n{%f, %f, %f, %f}\n{%f, %f, %f, %f}\n", 
//             //     _vertexArray[0], _vertexArray[1], _vertexArray[2], _vertexArray[3], 
//             //     _vertexArray[4], _vertexArray[5], _vertexArray[6], _vertexArray[7],
//             //     _vertexArray[8], _vertexArray[9], _vertexArray[10], _vertexArray[11],
//             //     _vertexArray[12], _vertexArray[13], _vertexArray[14], _vertexArray[15]);
//             // print("==========================================\n");
//             // print("{%f, %f, %f, %f}\n{%f, %f, %f, %f}\n{%f, %f, %f, %f}\n{%f, %f, %f, %f}\n", 
//             //     verts[0], verts[1], verts[2], verts[3], 
//             //     verts[4], verts[5], verts[6], verts[7],
//             //     verts[8], verts[9], verts[10], verts[11],
//             //     verts[12], verts[13], verts[14], verts[15]);
//             // print("==========================================\n");

//             GL.Enable(EnableCap.Blend);
//             GL.BlendFunc(BlendingFactorSrc.SrcAlpha, BlendingFactorDest.OneMinusSrcAlpha);
//             // Populate vertex buffer
//             GL.GenBuffers(1, &vbo);
//             GL.BindBuffer(BufferTarget.ArrayBuffer, vbo);
//             // GL.BufferData(BufferTarget.ArrayBuffer, verts.length*sizeof(float), verts, BufferUsageHint.StaticDraw);
//             GL.BufferData(BufferTarget.ArrayBuffer, _vertexArray.length*sizeof(float), _vertexArray, BufferUsageHint.StaticDraw);

//             // Populate element buffer
//             GL.GenBuffers(1, &ebo);
//             GL.BindBuffer(BufferTarget.ElementArrayBuffer, ebo);
//             // GL.BufferData(BufferTarget.ElementArrayBuffer, indicies.length*sizeof(int), indicies, BufferUsageHint.StaticDraw);
//             GL.BufferData(BufferTarget.ElementArrayBuffer, _index.length*sizeof(int), _index, BufferUsageHint.StaticDraw);

//             // Bind vertex position attribute
//             int posIndex = GL.GetAttribLocation(_shader.ID, "in_Position");
//             // print("posIndex = %d\n", posIndex);
//             GL.VertexAttribPointer(posIndex, 2, DataType.Float, false, (int)(4*sizeof(float)), (void*)0);
//             GL.EnableVertexAttribArray(posIndex);

//             // Bind vertex texture coordinate attribute
//             int texIndex = GL.GetAttribLocation(_shader.ID, "in_Texcoord");
//             // print("texIndex = %d\n", texIndex);
//             GL.VertexAttribPointer(texIndex, 2, DataType.Float, false, (int)(4*sizeof(float)), (void*)(2*sizeof(float)));
//             GL.EnableVertexAttribArray(texIndex);
//             GL.DrawElements(PrimitiveType.Triangles, 6, DataType.UnsignedInt, null);

            
//         }

//         public void Dispose() 
//         {
//         }
            
//     }
// }