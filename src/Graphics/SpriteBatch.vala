namespace Microsoft.Xna.Framework.Graphics
{
    //  https://gitlab.com/Partanen/KTL_SpriteBatch

    using System;
    using System.Collections.Generic;
    using ValaGame.OpenGL;

    public enum Flip
    {
        FLIP_NONE,
        FLIP_HORIZONTAL,
        FLIP_VERTICAL,
        FLIP_BOTH
    }


    public class SpriteBatch : Disposable
    {
        public const string[] FragmentShader = 
        {
            "in vec2 tex_pos;",
            "in vec4 tint;",
            "out vec4 color;",
            "uniform sampler2D tex;",
            "uniform float global_alpha;",
            "void main(void)",
            "{",
            "   color = vec4(tint.x, tint.y, tint.z, global_alpha * tint.w) * texture(tex, tex_pos);",
            "}"
        };
        public const string[] VertexShader = 
        {
            "layout (location = 0) in vec4 position;",
            "layout (location = 1) in vec4 in_tint;",
            "out vec2 tex_pos;",
            "out vec4 tint;",
            "uniform mat4 projection;",
            "void main(void)",
            "{",
            "   gl_Position = projection * vec4(position.x, position.y, 0.0f, 1.0f);",
            "   tex_pos = vec2(position.z, position.w);",
            "   tint = in_tint;",
            "}"
        };
        /*  The maximum amount of sprite data to be sent to
        *  the GPU at one time. */
        const int BATCH_SIZE = 2048;
        bool is_initialized;
        bool batching_started;

        int sprite_count;

        uint VAO;
        uint VBO;
        uint EBO;

        float scale_x;
        float scale_y;
        float alpha;
        bool alpha_changed;
        bool sorting;

        Shader _shader;
        int _width;
        int _height;
        Rectangle? _viewp = null;

        GenericArray<SpriteBatchItem> sprite_buffer;
        float[] vertex_buffer = new float[BATCH_SIZE * 32];

        // public SpriteBatch(GraphicsDevice graphicsDevice, Shader shader)
        public SpriteBatch(Shader shader, int width, int height)
        {
            is_initialized     = false;
            batching_started   = false;
            sprite_count = 0;
            _shader = shader;
            _width = width;
            _height = height;

        }
        ~SpriteBatch()
        {

        }

        /* Initialize the batch for use. initial_size is the
         * starting batch size. If more sprites are queued,
         * the batch is automatically enlarged. */
        public bool Create(uint initial_size = 256)
        {
            if (is_initialized) return is_initialized;

            alpha_changed = true;
            batching_started = false;

            // sprite_buffer = new ArrayList<SpriteBatchItem?>();
            sprite_buffer = new GenericArray<SpriteBatchItem>();

            _shader.Use();
            GL.GenVertexArrays(1, &VAO);
            GL.GenBuffers(1, &VBO);
            GL.GenBuffers(1, &EBO);

            GL.BindVertexArray(VAO);

            GL.BindBuffer(BufferTarget.ArrayBuffer, VBO);

            GL.VertexAttribPointer(0, 4, DataType.Float, false, (int)(8 * sizeof(float)), (void*)0);
            GL.EnableVertexAttribArray(0);

            GL.VertexAttribPointer(1, 4, DataType.Float, false, (int)(8 * sizeof(float)), (void*)(4 * sizeof(float)));
            GL.EnableVertexAttribArray(1);

            GL.BufferData(BufferTarget.ArrayBuffer, BATCH_SIZE * (32 * sizeof(float)), vertex_buffer, BufferUsageHint.DynamicDraw); //GL_DYNAMIC_DRAW);

            //Element array buffer
            int indices[6] = {0, 1, 2, 2, 3, 1};
            int *indice_array = new int[BATCH_SIZE * 6];

            for (int i = 0; i < BATCH_SIZE; ++i)
                for (int j = 0; j < 6; ++j)
                    indice_array[i * 6 + j] = indices[j] + i * 4;

            GL.BindBuffer(BufferTarget.ElementArrayBuffer, EBO);
            GL.BufferData(BufferTarget.ElementArrayBuffer, BATCH_SIZE * 6 * sizeof(int), indice_array, BufferUsageHint.DynamicDraw); //GL_DYNAMIC_DRAW);

            indice_array = new int[0];

            GL.BindBuffer(BufferTarget.ArrayBuffer, 0);

            GL.BindVertexArray(0);

            is_initialized = true;
            return is_initialized;
        }

        public void Begin(
                float global_alpha = 1f,     // Multiply all queued sprites' alpha by this value
                Vector2? scale = null,
                bool sort = true,        // If sorting is enabled, sprites with a lower layer are drawn first
                Rectangle? viewp = null) // Projection viewport - if null, will use OpenGL's own 
        {
            if (!is_initialized || batching_started) return;

            sprite_count = 0;
            batching_started = true;
            sorting = sort;

            if (scale == null) 
            {
                scale_x = 1f;
                scale_y = 1f;
            }
            else
            {
                scale_x = (float)scale.X;
                scale_y = (float)scale.Y;
            }

            if (alpha != global_alpha) alpha_changed = true;
            alpha = global_alpha;

            _viewp = viewp;
            GL.Enable(EnableCap.Blend);
            GL.BlendFunc(BlendingFactorSrc.SrcAlpha, BlendingFactorDest.OneMinusSrcAlpha);
        }

        internal SpriteBatchItem CreateItem(uint texture, int x, int y, float layer)
        {
            if (sprite_count+1 > sprite_buffer.length)
                sprite_buffer.add(new SpriteBatchItem());
            SpriteBatchItem item = sprite_buffer[sprite_count];
            item.texture = texture;
            item.position[0] = (float)x;
            item.position[1] = (float)y;
            item.layer = layer;
            return item;
        }

        internal void Draw(Texture2D texture,
                  Rectangle clip,
                  int x, int y, float layer)
        {
            if (!batching_started) return;
            SpriteBatchItem item = CreateItem(texture.Handle, x, y, layer);
            item.SetItemDefaultDimensions(clip);
            item.SetItemDefaultClip(texture, clip);
            item.SetItemDefaultColor();
            item.rotation = 0.0f;
            ++sprite_count;

        }

        internal void DrawScaled(Texture2D texture,
                        Rectangle clip,
                        int x, int y, float layer,
                        Vector2 scale)
        {
            if (!batching_started) return;
            SpriteBatchItem item = CreateItem(texture.Handle, x, y, layer);
            item.SetItemScaledDimensions(clip, scale);
            item.SetItemDefaultClip(texture, clip);
            item.SetItemDefaultColor();
            item.rotation = 0.0f;
            ++sprite_count;
        }

        internal void DrawFlipped(Texture2D texture,
                         Rectangle clip,
                         int x, int y, float layer,
                         Flip flip)
        {
            if (!batching_started) return;
            SpriteBatchItem item = CreateItem(texture.Handle, x, y, layer);
            item.SetItemDefaultDimensions(clip);
            item.SetItemFlippedClip(flip, texture, clip);
            item.SetItemDefaultColor();
            item.rotation = 0.0f;
            ++sprite_count;
        }

        /*  Colored drawing multiplies the texture's colors by the
         *  input color. This can be used to apply alpha alone,
         *  by passing in {1.0f, 1.0f, 1.0f, desired_alpha} */
        internal void DrawTinted(Texture2D texture,
                        Rectangle clip,
                        int x, int y, float layer,
                        Color color)
        {
            if (!batching_started) return;
            SpriteBatchItem item = CreateItem(texture.Handle, x, y, layer);
            item.SetItemDefaultDimensions(clip);
            item.SetItemDefaultClip(texture, clip);
            item.SetItemModColor(color);
            item.rotation = 0.0f;
            ++sprite_count;
        }

        internal void DrawRotated(Texture2D texture,
                         Rectangle clip,
                         int x, int y, float layer,
                         float rot)
        {
            if (!batching_started) return;
            SpriteBatchItem item = CreateItem(texture.Handle, x, y, layer);
            item.SetItemDefaultDimensions(clip);
            item.SetItemDefaultClip(texture, clip);
            item.SetItemDefaultColor();
            item.rotation = rot;
            item.rot_origin[0] = (float)x + (float)clip.Width/2.0f;
            item.rot_origin[1] = (float)y + (float)clip.Height/2.0f;
            ++sprite_count;
        }


        internal void DrawScaledFlipped(Texture2D texture,
                               Rectangle clip,
                               int x, int y, float layer,
                               Vector2 scale,
                               Flip flip)
        {
            if (!batching_started) return;
            SpriteBatchItem item = CreateItem(texture.Handle, x, y, layer);
            item.SetItemScaledDimensions(clip, scale);
            item.SetItemFlippedClip(flip, texture, clip);
            item.SetItemDefaultColor();
            item.rotation = 0.0f;
            ++sprite_count;
        }

        internal void DrawScaledRotated(Texture2D texture,
                               Rectangle clip,
                               int x, int y, float layer,
                               Vector2 scale,
                               float rot)
        {
            if (!batching_started) return;
            SpriteBatchItem item = CreateItem(texture.Handle, x, y, layer);
            item.SetItemScaledDimensions(clip, scale);
            item.SetItemDefaultClip(texture, clip);
            item.SetItemDefaultColor();
            item.rotation = rot;
            item.rot_origin[0] = (float)x + (float)clip.Width/2.0f;
            item.rot_origin[1] = (float)y + (float)clip.Height/2.0f;
            ++sprite_count;
        }

        internal void DrawScaledTinted(Texture2D texture,
                              Rectangle clip,
                              int x, int y, float layer,
                              Vector2 scale,
                              Color color)
        {
            if (!batching_started) return;
            SpriteBatchItem item = CreateItem(texture.Handle, x, y, layer);
            item.SetItemScaledDimensions(clip, scale);
            item.SetItemDefaultClip(texture, clip);
            item.SetItemModColor(color);
            item.rotation = 0.0f;
            ++sprite_count;
        }

        internal void DrawScaledTintedRotated(Texture2D texture,
                                     Rectangle clip,
                                     int x, int y, float layer,
                                     Vector2 scale,
                                     Color color,
                                     float rot)
        {
            if (!batching_started) return;
            SpriteBatchItem item = CreateItem(texture.Handle, x, y, layer);
            item.SetItemScaledDimensions(clip, scale);
            item.SetItemDefaultClip(texture, clip);
            item.SetItemModColor(color);
            item.rotation = rot;
            item.rot_origin[0] = (float)x + (float)clip.Width/2.0f;
            item.rot_origin[1] = (float)y + (float)clip.Height/2.0f;
            ++sprite_count;
        }

        internal void DrawScaledFlippedTinted(Texture2D texture,
                                     Rectangle clip,
                                     int x, int y, float layer,
                                     Vector2 scale,
                                     Flip flip,
                                     Color color)
        {
            if (!batching_started) return;
            SpriteBatchItem item = CreateItem(texture.Handle, x, y, layer);
            item.SetItemScaledDimensions(clip, scale);
            item.SetItemFlippedClip(flip, texture, clip);
            item.SetItemModColor(color);
            item.rotation = 0.0f;
            ++sprite_count;
        }

        internal void DrawFlippedRotated(Texture2D texture,
                                Rectangle clip,
                                int x, int y, float layer,
                                Flip flip,
                                float rot)
        {
            if (!batching_started) return;
            SpriteBatchItem item = CreateItem(texture.Handle, x, y, layer);
            item.SetItemDefaultDimensions(clip);
            item.SetItemFlippedClip(flip, texture, clip);
            item.SetItemDefaultColor();
            item.rotation = rot;
            item.rot_origin[0] = (float)x + (float)clip.Width/2.0f;
            item.rot_origin[1] = (float)y + (float)clip.Height/2.0f;
            ++sprite_count;
        }


        internal void DrawFlippedTinted(Texture2D texture,
                               Rectangle clip,
                               int x, int y, float layer,
                               Flip flip,
                               Color color)
        {
            if (!batching_started) return;
            SpriteBatchItem item = CreateItem(texture.Handle, x, y, layer);
            item.SetItemDefaultDimensions(clip);
            item.SetItemFlippedClip(flip, texture, clip);
            item.SetItemModColor(color);
            item.rotation = 0.0f;
            ++sprite_count;
        }


        internal void DrawTintedRotated(Texture2D texture,
                               Rectangle clip,
                               int x, int y, float layer,
                               Color color,
                               float rot)
        {
            if (!batching_started) return;
            SpriteBatchItem item = CreateItem(texture.Handle, x, y, layer);
            item.SetItemDefaultDimensions(clip);
            item.SetItemDefaultClip(texture, clip);
            item.SetItemModColor(color);
            item.rotation = rot;
            item.rot_origin[0] = (float)x + (float)clip.Width/2.0f;
            item.rot_origin[1] = (float)y + (float)clip.Height/2.0f;
            ++sprite_count;
        }

        internal void DrawFlippedTintedRotated(Texture2D texture,
                                      Rectangle clip,
                                      int x, int y, float layer,
                                      Flip flip,
                                      Color color,
                                      float rot)
        {
            if (!batching_started) return;
            SpriteBatchItem item = CreateItem(texture.Handle, x, y, layer);
            item.SetItemDefaultDimensions(clip);
            item.SetItemFlippedClip(flip, texture, clip);
            item.SetItemModColor(color);
            item.rotation = rot;
            item.rot_origin[0] = (float)x + (float)clip.Width/2.0f;
            item.rot_origin[1] = (float)y + (float)clip.Height/2.0f;
            ++sprite_count;
        }

        internal void DrawScaledFlippedTintedRotated(Texture2D texture,
                                            Rectangle clip,
                                            int x, int y, float layer,
                                            Vector2 scale,
                                            Flip flip,
                                            Color color,
                                            float rot)
        {
            if (!batching_started) return;
            SpriteBatchItem item = CreateItem(texture.Handle, x, y, layer);
            item.rotation = 0.0f;
            ++sprite_count;
        }

        void RotatePixel(
                    ref float x, 
                    ref float y,
                    float orig_x, 
                    float orig_y,
                    float angle)
        {
            float trans_x = x - orig_x;
            float trans_y = y - orig_y;

            float rot_x = trans_x * Math.cosf(angle) - trans_y * Math.sinf(angle);
            float rot_y = trans_x * Math.sinf(angle) + trans_y * Math.cosf(angle);

            x = rot_x + orig_x;
            y = rot_y + orig_y;
        }


        public void End()
        {

            if (!is_initialized
            || !batching_started
            || sprite_count < 1)
                return;

            if (sorting)
                sprite_buffer.sort_with_data((a, b) => a.CompareTo(b));

            //Calculate the projection matrix by viewport dimensions
            int vp0, vp1, vp2, vp3;
            if (_viewp == null)
            {
                vp0 = 0;
                vp1 = 0;
                vp2 = _width;
                vp3 = _height;
            }
            else
            {
                vp0 = _viewp.X;
                vp1 = _viewp.Y;
                vp2 = _viewp.Width;
                vp3 = _viewp.Height;
            }

            Matrix projection = new Matrix();

            projection.M11 = 2.0f / (float)(vp2 - vp0);
            projection.M12 = 0.0f;
            projection.M13 = 0.0f;
            projection.M14 = 0.0f;

            projection.M21 = 0.0f;
            projection.M22 = 2.0f / (float)(vp1 - vp3);
            projection.M23 = 0.0f;
            projection.M24 = 0.0f;

            projection.M31 = 0.0f;
            projection.M32 = 0.0f;
            projection.M33 = -1.0f;
            projection.M34 = 0.0f;

            projection.M41 = - (float)(vp2 + vp0) / (float)(vp2 - vp0);
            projection.M42 = - (float)(vp1 + vp3) / (float)(vp1 - vp3);
            projection.M43 = 0.0f;
            projection.M44 = 1.0f;

            _shader.Use();
            _shader.SetMatrix("projection", projection);

            if (alpha_changed)
            {
                _shader.SetFloat("global_alpha", alpha);
                alpha_changed = false;
            }

            GL.BindVertexArray(VAO);

            GL.BindBuffer(BufferTarget.ArrayBuffer, VBO);
            GL.BindBuffer(BufferTarget.ElementArrayBuffer, EBO);

            // How many batches to process
            int num_batches = sprite_count / BATCH_SIZE;

            for (int batch_num = 0; batch_num < num_batches + 1; ++batch_num)
            {
                int num_sprites = sprite_count - batch_num * BATCH_SIZE;
                if (num_sprites > BATCH_SIZE) num_sprites = BATCH_SIZE;

                for (int i = batch_num * BATCH_SIZE; i < batch_num * BATCH_SIZE + num_sprites; ++i)
                {
                    SpriteBatchItem item = sprite_buffer[i];

                    int fixed_i = (i - (i / BATCH_SIZE * BATCH_SIZE)) * 32;

                    /* Top left */
                    vertex_buffer[fixed_i     ] = scale_x * item.position[0];
                    vertex_buffer[fixed_i +  1] = scale_y * item.position[1];
                    vertex_buffer[fixed_i +  2] = item.clip[0];
                    vertex_buffer[fixed_i +  3] = item.clip[1];
                    vertex_buffer[fixed_i +  4] = item.color[0];
                    vertex_buffer[fixed_i +  5] = item.color[1];
                    vertex_buffer[fixed_i +  6] = item.color[2];
                    vertex_buffer[fixed_i +  7] = item.color[3];
                    /* Top right */
                    vertex_buffer[fixed_i +  8] = scale_x * (item.position[0] + item.dimensions[0]);
                    vertex_buffer[fixed_i +  9] = scale_y * item.position[1];
                    vertex_buffer[fixed_i + 10] = item.clip[2];
                    vertex_buffer[fixed_i + 11] = item.clip[1];
                    vertex_buffer[fixed_i + 12] = item.color[0];
                    vertex_buffer[fixed_i + 13] = item.color[1];
                    vertex_buffer[fixed_i + 14] = item.color[2];
                    vertex_buffer[fixed_i + 15] = item.color[3];
                    /* Bottom left */
                    vertex_buffer[fixed_i + 16] = scale_x * item.position[0];
                    vertex_buffer[fixed_i + 17] = scale_y * (item.position[1]  + item.dimensions[1]);
                    vertex_buffer[fixed_i + 18] = item.clip[0];
                    vertex_buffer[fixed_i + 19] = item.clip[3];
                    vertex_buffer[fixed_i + 20] = item.color[0];
                    vertex_buffer[fixed_i + 21] = item.color[1];
                    vertex_buffer[fixed_i + 22] = item.color[2];
                    vertex_buffer[fixed_i + 23] = item.color[3];
                    /* Bottom right */
                    vertex_buffer[fixed_i + 24] = scale_x * (item.position[0] + item.dimensions[0]);
                    vertex_buffer[fixed_i + 25] = scale_y * (item.position[1] + item.dimensions[1]);
                    vertex_buffer[fixed_i + 26] = item.clip[2];
                    vertex_buffer[fixed_i + 27] = item.clip[3];
                    vertex_buffer[fixed_i + 28] = item.color[0];
                    vertex_buffer[fixed_i + 29] = item.color[1];
                    vertex_buffer[fixed_i + 30] = item.color[2];
                    vertex_buffer[fixed_i + 31] = item.color[3];

                    //Rotate if necessary
                    if (item.rotation != 0.0f)
                    {
                        RotatePixel(ref vertex_buffer[fixed_i     ], 
                                    ref vertex_buffer[fixed_i +  1],
                                        item.rot_origin[0], 
                                        item.rot_origin[1], 
                                        item.rotation);
                        RotatePixel(ref vertex_buffer[fixed_i +  8], 
                                    ref vertex_buffer[fixed_i +  9],
                                        item.rot_origin[0], 
                                        item.rot_origin[1], 
                                        item.rotation);
                        RotatePixel(ref vertex_buffer[fixed_i + 16], 
                                    ref vertex_buffer[fixed_i + 17],
                                        item.rot_origin[0], 
                                        item.rot_origin[1], 
                                        item.rotation);
                        RotatePixel(ref vertex_buffer[fixed_i + 24], 
                                    ref vertex_buffer[fixed_i + 25],
                                        item.rot_origin[0], 
                                        item.rot_origin[1], 
                                        item.rotation);
                    }
                }

                int size_multip = sprite_count - batch_num * BATCH_SIZE;
                if (size_multip > BATCH_SIZE) size_multip = BATCH_SIZE;

                GL.BufferSubData(BufferTarget.ArrayBuffer,                        // Target
                                0,                                      // Offset
                                size_multip * (32 * sizeof(float)),   // Size
                                &vertex_buffer[0]);                     // Data

                uint last_texture = sprite_buffer[batch_num * BATCH_SIZE].texture;
                int offset = 0;

                SpriteBatchItem sprite;
                for (int i = 0; i < num_sprites; ++i)
                {
                    sprite = sprite_buffer[batch_num * BATCH_SIZE + i];

                    if (sprite.texture != last_texture)
                    {
                        GL.BindTexture(TextureTarget.Texture2D, last_texture);
                        GL.DrawElements(PrimitiveType.Triangles,
                                    (i - offset) * 6,
                                    DataType.UnsignedInt,
                                    (void *)(offset * 6 * sizeof(uint)));
                        offset = i;
                        last_texture = sprite.texture;
                    }
                }

                GL.BindTexture(TextureTarget.Texture2D, last_texture);
                GL.DrawElements(PrimitiveType.Triangles,
                            (num_sprites - offset) * 6,
                            DataType.UnsignedInt,
                            (void*)(offset * 6 * sizeof(uint)));
            }
            GL.BindTexture(TextureTarget.Texture2D, 0);
            GL.BindBuffer(BufferTarget.ArrayBuffer, 0);

            GL.BindVertexArray(0);
            GL.UseProgram(0);
            batching_started = false;

        }

        /* Resize the sprite buffer, calling std::vector.clear(),
         * hence causing a reallocation. Fails if called between
         * begin() and end(). Returns the new size.*/
        public int ResizeBuffer(uint new_size)
        {
            if (is_initialized && !batching_started)
            {
                sprite_buffer.remove_range(0, sprite_buffer.length);
            }

            return sprite_buffer.length;
        }

        public int GetBufferSize()
        {
            return sprite_buffer.length;
        }

        /* Free any resources used by the batch from the GPU and memory. */
        public override void Dispose()
        {
            print("Why am I here?\n");
            if (!is_initialized) return;

            GL.DeleteBuffers(1, &VBO);
            GL.DeleteBuffers(1, &EBO);
            GL.DeleteVertexArrays(1, &VAO);

            sprite_buffer.remove_range(0, sprite_buffer.length);
            is_initialized = false;
            batching_started = false;
        }



    }

}