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

    // Not a sprite batch. Renders each sprite individually
    // but thats all the sprite batch really did anyway
    public class SpriteRenderer : Disposable
    {
        Shader _shader; 
        uint VAO; // Vertex Array Object
        private Texture2D? _texture;
        private bool _beginCalled;
		private SpriteSortMode _sortMode;

        public SpriteRenderer(Shader shader)
        {
            _shader = shader;
            _beginCalled = false;
            initRenderData();
        }

        public void Begin(SpriteSortMode sortMode = SpriteSortMode.Deferred)
        {
            if (_beginCalled)
                throw new Exception.InvalidOperationException("Begin cannot be called again until End has been successfully called.");

            GL.Enable(EnableCap.Texture2D);
            GL.Enable(EnableCap.Blend);
            GL.BlendFunc(BlendingFactorSrc.SrcAlpha, BlendingFactorDest.OneMinusSrcAlpha);

            _sortMode = sortMode;
            _beginCalled = true;
        }
        public void Draw(
                Texture2D texture, 
                float layerDepth = 0f,
                Vector2? position = null,
                Vector2? scale = null,
                Color? color = null,
                float rotate = 0f)
        {
            color = color ?? Color.White;
            scale = scale ?? new Vector2(1, 1); // region.Scale.Copy();

            var size = new Vector2(scale.X * texture.Width, scale.Y * texture.Height);
            DrawSprite(texture, position, size, 0, color.ToVector3());
        }

        public void DrawSprite(
                Texture2D texture, 
                Vector2 position, 
                Vector2 size, 
                float rotate = 0f, 
                Vector3 color = new Vector3(1f, 1f, 1f))
        {
            // Prepare transformations
            Matrix model = new Matrix();
            glm_mat4_identity(model);
            glm_translate(model, new Vector3(position.X, position.Y, 0f));  
            // First translate (transformations are: scale happens first, then rotation and then finall translation happens; reversed order)
            glm_translate(model, new Vector3(0.5f * size.X, 0.5f * size.Y, 0f)); 
            // Move origin of rotation to center of quad
            glm_rotate(model, rotate, new Vector3(0f, 0f, 1f)); // Then rotate
            glm_translate(model, new Vector3(-0.5f * size.X, -0.5f * size.Y, 0f)); 
            // Move origin back
            glm_scale(model, new Vector3(size.X, size.Y, 1f)); // Last scale

            _shader.Use();
            _shader.SetMatrix("model", model);          // uniform Matrix model;
            _shader.SetVector3("spriteColor", color);    // uniform Vector3 spriteColor;

            GL.ActiveTexture(TextureUnit.Texture0);
            texture.Bind();
            GL.BindVertexArray(VAO);
            GL.DrawArrays(PrimitiveType.Triangles, 0, 6);
            GL.BindVertexArray(0);
        }

        public void End()
        {
            if (!_beginCalled)
                throw new Exception.InvalidOperationException("Begin must be called before calling End.");

			_beginCalled = false;

        }

        void initRenderData()
        {
            uint VBO = 0; // Vertex Buffer Object
            float[] vertices = { 
                // Pos      // Tex
                0f, 1f,     0f, 1f,
                1f, 0f,     1f, 0f,
                0f, 0f,     0f, 0f, 

                0f, 1f,     0f, 1f,
                1f, 1f,     1f, 1f,
                1f, 0f,     1f, 0f
            };

            GL.GenVertexArrays(1, &VAO);        // returns n vertex array object names in arrays. 
            GL.GenBuffers(1, &VBO);             // returns n buffer object names in buffers.

            GL.BindBuffer(BufferTarget.ArrayBuffer, VBO); // binds a buffer object to the specified buffer binding point. 
                                                // create a new data store for a buffer object
            GL.BufferData(BufferTarget.ArrayBuffer, sizeof(float)*vertices.length, vertices, BufferUsageHint.StaticDraw);

            GL.BindVertexArray(VAO);            // binds the vertex array object with VAO
            GL.EnableVertexAttribArray(0);      // enable the generic vertex attribute array specified by index.
                                                // specify the location and data format of the array of 
                                                // generic vertex attributes at index index to use when rendering
            GL.VertexAttribPointer(0, 4, DataType.Float, false, (int)(4 * sizeof(float)), (void*)0);
                                                // reset:
            GL.BindBuffer(BufferTarget.ArrayBuffer, 0); // break the binding.
            GL.BindVertexArray(0);              // break the binding.
        }
        
        public override void Dispose() 
        {
            GL.DeleteVertexArrays(1, &VAO);
        }
    }
}