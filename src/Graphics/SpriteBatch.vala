namespace Microsoft.Xna.Framework.Graphics
{
    //  https://gitlab.com/Partanen/KTL_SpriteBatch

    using System;
    using System.Collections.Generic;
    using ValaGame.OpenGL;

    public class SpriteBatch : Disposable
    {
        /*  The maximum amount of sprite data to be sent to
         *  the GPU at one time. */
        const int BATCH_SIZE = 2048;

        int _count;
        int _width;
        int _height;
        uint _vao;
        uint _vbo;
        uint _ebo;
        bool _started;
        bool _initialized;
        bool _alphaChanged;
        bool _sorting;
        float _alpha;
        Shader _shader;
        Matrix _projection;

        GenericArray<SpriteBatchItem> _sprites;
        float[] _buffer = new float[BATCH_SIZE * 32];

        // public SpriteBatch(GraphicsDevice graphicsDevice, Shader shader)
        public SpriteBatch(Shader shader, int width, int height)
        {
            _initialized = false;
            _started = false;
            _count = 0;
            _shader = shader;
            _width = width;
            _height = height;
            _projection = new Matrix();

            _projection.M11 = 2f / (float)width;
            _projection.M12 = 0f;
            _projection.M13 = 0f;
            _projection.M14 = 0f;

            _projection.M21 = 0f;
            _projection.M22 = 2f / -(float)height;
            _projection.M23 = 0f;
            _projection.M24 = 0f;

            _projection.M31 = 0f;
            _projection.M32 = 0f;
            _projection.M33 = -1f;
            _projection.M34 = 0f;

            _projection.M41 = - 1f;
            _projection.M42 = 1f;
            _projection.M43 = 0f;
            _projection.M44 = 1f;

        }
        ~SpriteBatch()
        {

        }

        /* Initialize the batch for use. initial_size is the
         * starting batch size. If more sprites are queued,
         * the batch is automatically enlarged. */
        public bool Create(uint initial_size = 256)
        {
            if (_initialized) return _initialized;

            _alphaChanged = true;
            _started = false;
            _sprites = new GenericArray<SpriteBatchItem>(initial_size);
            _shader.Use();

            GL.GenVertexArrays(1, &_vao);
            GL.GenBuffers(1, &_vbo);
            GL.GenBuffers(1, &_ebo);

            GL.BindVertexArray(_vao);

            GL.BindBuffer(BufferTarget.ArrayBuffer, _vbo);

            GL.VertexAttribPointer(0, 4, DataType.Float, false, (int)(8 * sizeof(float)), (void*)0);
            GL.EnableVertexAttribArray(0);

            GL.VertexAttribPointer(1, 4, DataType.Float, false, (int)(8 * sizeof(float)), (void*)(4 * sizeof(float)));
            GL.EnableVertexAttribArray(1);

            GL.BufferData(BufferTarget.ArrayBuffer, BATCH_SIZE * (32 * sizeof(float)), _buffer, BufferUsageHint.DynamicDraw);

            //Element array buffer
            int[] indices = {0, 1, 2, 2, 3, 1};
            int[] indice_array = new int[BATCH_SIZE * 6];

            for (int i = 0; i < BATCH_SIZE; ++i)
                for (int j = 0; j < 6; ++j)
                    indice_array[i * 6 + j] = indices[j] + i * 4;

            GL.BindBuffer(BufferTarget.ElementArrayBuffer, _ebo);
            GL.BufferData(BufferTarget.ElementArrayBuffer, BATCH_SIZE * 6 * sizeof(int), indice_array, BufferUsageHint.DynamicDraw);

            indice_array = new int[0];

            GL.BindBuffer(BufferTarget.ArrayBuffer, 0);

            GL.BindVertexArray(0);

            _initialized = true;
            return _initialized;
        }

        public void Begin(
                bool sort = true,   // If _sorting is enabled, sprites with a lower layer are drawn first
                float alpha = 1f)   // Multiply all queued sprites' _alpha by this value
        {
            if (!_initialized || _started) return;

            _count = 0;
            _started = true;
            _sorting = sort;

            if (_alpha != alpha) _alphaChanged = true;
            _alpha = alpha;

            GL.Enable(EnableCap.Blend);
            GL.BlendFunc(BlendingFactorSrc.SrcAlpha, BlendingFactorDest.OneMinusSrcAlpha);
        }

        internal SpriteBatchItem CreateBatchItem(uint texture, int x, int y, float layer)
        {
            if (_count+1 > _sprites.length)
                _sprites.add(new SpriteBatchItem());
            var item = _sprites[_count];
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
            if (!_started) return;
            var item = CreateBatchItem(texture.Handle, x, y, layer);
            item.SetItemDefaultDimensions(clip);
            item.SetItemDefaultClip(texture, clip);
            item.SetItemDefaultColor();
            item.rotation = 0f;
            ++_count;

        }

        /**
         * Draw an Atlas Region
         */
        internal void DrawRegion(
            TextureRegion region, 
            float layerDepth = 0f,
            Vector2? location = null,
            Vector2? scale = null,
            Color? color = null,
            Vector2? size = null)
        {
            if (!_started) return;
            
            color = color ?? Color.White;
            scale = scale ?? new Vector2(region.Scale.X, region.Scale.Y); // region.Scale.Copy();

            int u = (int)region.Y;
            int v = (int)region.X;
            int u2 = (int)region.Width;
            int v2 = (int)region.Height;

            int w = size == null ? (int)(u2 * scale.X) : (int)(size.X * scale.X);
            int h = size == null ? (int)(v2 * scale.Y) : (int)(size.Y * scale.Y);

            int x = location == null ? 0 : (int)(location.X-(w * 0.5f));
            int y = location == null ? 0 : (int)(location.Y-(h * 0.5f));

            Rectangle clip = { v, u, u2, v2 };

            var item = CreateBatchItem(region.texture.Handle, x, y, layerDepth);
            item.SetItemScaledDimensions(clip, scale);
            item.SetItemDefaultClip(region.texture, clip);
            item.SetItemModColor(color);
            item.rotation = 0f;
            ++_count;

        }


        internal void DrawScaled(Texture2D texture,
                        Rectangle clip,
                        int x, int y, float layer,
                        Vector2 scale)
        {
            if (!_started) return;
            
            var item = CreateBatchItem(texture.Handle, x, y, layer);
            item.SetItemScaledDimensions(clip, scale);
            item.SetItemDefaultClip(texture, clip);
            item.SetItemDefaultColor();
            item.rotation = 0f;
            ++_count;
        }

        internal void DrawFlipped(Texture2D texture,
                         Rectangle clip,
                         int x, int y, float layer,
                         SpriteFlip flip)
        {
            if (!_started) return;
            var item = CreateBatchItem(texture.Handle, x, y, layer);
            item.SetItemDefaultDimensions(clip);
            item.SetItemFlippedClip(flip, texture, clip);
            item.SetItemDefaultColor();
            item.rotation = 0f;
            ++_count;
        }

        /*  Colored drawing multiplies the texture's colors by the
         *  input color. This can be used to apply _alpha alone,
         *  by passing in {1f, 1f, 1f, desired_alpha} */
        internal void DrawTinted(Texture2D texture,
                        Rectangle clip,
                        int x, int y, float layer,
                        Color color)
        {
            if (!_started) return;
            var item = CreateBatchItem(texture.Handle, x, y, layer);
            item.SetItemDefaultDimensions(clip);
            item.SetItemDefaultClip(texture, clip);
            item.SetItemModColor(color);
            item.rotation = 0f;
            ++_count;
        }

        internal void DrawRotated(Texture2D texture,
                         Rectangle clip,
                         int x, int y, float layer,
                         float rot)
        {
            if (!_started) return;
            var item = CreateBatchItem(texture.Handle, x, y, layer);
            item.SetItemDefaultDimensions(clip);
            item.SetItemDefaultClip(texture, clip);
            item.SetItemDefaultColor();
            item.rotation = rot;
            item.rot_origin[0] = (float)x + (float)clip.Width/2f;
            item.rot_origin[1] = (float)y + (float)clip.Height/2f;
            ++_count;
        }


        internal void DrawScaledFlipped(Texture2D texture,
                               Rectangle clip,
                               int x, int y, float layer,
                               Vector2 scale,
                               SpriteFlip flip)
        {
            if (!_started) return;
            var item = CreateBatchItem(texture.Handle, x, y, layer);
            item.SetItemScaledDimensions(clip, scale);
            item.SetItemFlippedClip(flip, texture, clip);
            item.SetItemDefaultColor();
            item.rotation = 0f;
            ++_count;
        }

        internal void DrawScaledRotated(Texture2D texture,
                               Rectangle clip,
                               int x, int y, float layer,
                               Vector2 scale,
                               float rot)
        {
            if (!_started) return;
            var item = CreateBatchItem(texture.Handle, x, y, layer);
            item.SetItemScaledDimensions(clip, scale);
            item.SetItemDefaultClip(texture, clip);
            item.SetItemDefaultColor();
            item.rotation = rot;
            item.rot_origin[0] = (float)x + (float)clip.Width/2f;
            item.rot_origin[1] = (float)y + (float)clip.Height/2f;
            ++_count;
        }

        internal void DrawScaledTinted(Texture2D texture,
                              Rectangle clip,
                              int x, int y, float layer,
                              Vector2 scale,
                              Color color)
        {
            if (!_started) return;
            var item = CreateBatchItem(texture.Handle, x, y, layer);
            item.SetItemScaledDimensions(clip, scale);
            item.SetItemDefaultClip(texture, clip);
            item.SetItemModColor(color);
            item.rotation = 0f;
            ++_count;
        }

        internal void DrawScaledTintedRotated(Texture2D texture,
                                     Rectangle clip,
                                     int x, int y, float layer,
                                     Vector2 scale,
                                     Color color,
                                     float rot)
        {
            if (!_started) return;
            var item = CreateBatchItem(texture.Handle, x, y, layer);
            item.SetItemScaledDimensions(clip, scale);
            item.SetItemDefaultClip(texture, clip);
            item.SetItemModColor(color);
            item.rotation = rot;
            item.rot_origin[0] = (float)x + (float)clip.Width/2f;
            item.rot_origin[1] = (float)y + (float)clip.Height/2f;
            ++_count;
        }

        internal void DrawScaledFlippedTinted(Texture2D texture,
                                     Rectangle clip,
                                     int x, int y, float layer,
                                     Vector2 scale,
                                     SpriteFlip flip,
                                     Color color)
        {
            if (!_started) return;
            var item = CreateBatchItem(texture.Handle, x, y, layer);
            item.SetItemScaledDimensions(clip, scale);
            item.SetItemFlippedClip(flip, texture, clip);
            item.SetItemModColor(color);
            item.rotation = 0f;
            ++_count;
        }

        internal void DrawFlippedRotated(Texture2D texture,
                                Rectangle clip,
                                int x, int y, float layer,
                                SpriteFlip flip,
                                float rot)
        {
            if (!_started) return;
            var item = CreateBatchItem(texture.Handle, x, y, layer);
            item.SetItemDefaultDimensions(clip);
            item.SetItemFlippedClip(flip, texture, clip);
            item.SetItemDefaultColor();
            item.rotation = rot;
            item.rot_origin[0] = (float)x + (float)clip.Width/2f;
            item.rot_origin[1] = (float)y + (float)clip.Height/2f;
            ++_count;
        }


        internal void DrawFlippedTinted(Texture2D texture,
                               Rectangle clip,
                               int x, int y, float layer,
                               SpriteFlip flip,
                               Color color)
        {
            if (!_started) return;
            var item = CreateBatchItem(texture.Handle, x, y, layer);
            item.SetItemDefaultDimensions(clip);
            item.SetItemFlippedClip(flip, texture, clip);
            item.SetItemModColor(color);
            item.rotation = 0f;
            ++_count;
        }


        internal void DrawTintedRotated(Texture2D texture,
                               Rectangle clip,
                               int x, int y, float layer,
                               Color color,
                               float rot)
        {
            if (!_started) return;
            var item = CreateBatchItem(texture.Handle, x, y, layer);
            item.SetItemDefaultDimensions(clip);
            item.SetItemDefaultClip(texture, clip);
            item.SetItemModColor(color);
            item.rotation = rot;
            item.rot_origin[0] = (float)x + (float)clip.Width/2f;
            item.rot_origin[1] = (float)y + (float)clip.Height/2f;
            ++_count;
        }

        internal void DrawFlippedTintedRotated(Texture2D texture,
                                      Rectangle clip,
                                      int x, int y, float layer,
                                      SpriteFlip flip,
                                      Color color,
                                      float rot)
        {
            if (!_started) return;
            var item = CreateBatchItem(texture.Handle, x, y, layer);
            item.SetItemDefaultDimensions(clip);
            item.SetItemFlippedClip(flip, texture, clip);
            item.SetItemModColor(color);
            item.rotation = rot;
            item.rot_origin[0] = (float)x + (float)clip.Width/2f;
            item.rot_origin[1] = (float)y + (float)clip.Height/2f;
            ++_count;
        }

        internal void DrawScaledFlippedTintedRotated(Texture2D texture,
                                            Rectangle clip,
                                            int x, int y, float layer,
                                            Vector2 scale,
                                            SpriteFlip flip,
                                            Color color,
                                            float rot)
        {
            if (!_started) return;
            var item = CreateBatchItem(texture.Handle, x, y, layer);
            item.rotation = 0f;
            ++_count;
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

            if (!_initialized
            || !_started
            || _count < 1)
                return;

            if (_sorting)
                _sprites.sort_with_data((a, b) => a.CompareTo(b));

            _shader.Use();
            _shader.SetMatrix("projection", _projection);

            if (_alphaChanged)
            {
                _shader.SetFloat("global_alpha", _alpha);
                _alphaChanged = false;
            }

            GL.BindVertexArray(_vao);
            GL.BindBuffer(BufferTarget.ArrayBuffer, _vbo);
            GL.BindBuffer(BufferTarget.ElementArrayBuffer, _ebo);

            // How many batches to process
            int num_batches = _count / BATCH_SIZE;

            for (int batch_num = 0; batch_num < num_batches + 1; ++batch_num)
            {
                int num_sprites = _count - batch_num * BATCH_SIZE;
                if (num_sprites > BATCH_SIZE) num_sprites = BATCH_SIZE;

                for (int i = batch_num * BATCH_SIZE; i < batch_num * BATCH_SIZE + num_sprites; ++i)
                {
                    SpriteBatchItem item = _sprites[i];

                    int fixed_i = (i - (i / BATCH_SIZE * BATCH_SIZE)) * 32;

                    /* Top left */
                    _buffer[fixed_i     ] = item.position[0];
                    _buffer[fixed_i +  1] = item.position[1];
                    _buffer[fixed_i +  2] = item.clip[0];
                    _buffer[fixed_i +  3] = item.clip[1];
                    _buffer[fixed_i +  4] = item.color[0];
                    _buffer[fixed_i +  5] = item.color[1];
                    _buffer[fixed_i +  6] = item.color[2];
                    _buffer[fixed_i +  7] = item.color[3];
                    /* Top right */
                    _buffer[fixed_i +  8] = item.position[0] + item.dimensions[0];
                    _buffer[fixed_i +  9] = item.position[1];
                    _buffer[fixed_i + 10] = item.clip[2];
                    _buffer[fixed_i + 11] = item.clip[1];
                    _buffer[fixed_i + 12] = item.color[0];
                    _buffer[fixed_i + 13] = item.color[1];
                    _buffer[fixed_i + 14] = item.color[2];
                    _buffer[fixed_i + 15] = item.color[3];
                    /* Bottom left */
                    _buffer[fixed_i + 16] = item.position[0];
                    _buffer[fixed_i + 17] = item.position[1]  + item.dimensions[1];
                    _buffer[fixed_i + 18] = item.clip[0];
                    _buffer[fixed_i + 19] = item.clip[3];
                    _buffer[fixed_i + 20] = item.color[0];
                    _buffer[fixed_i + 21] = item.color[1];
                    _buffer[fixed_i + 22] = item.color[2];
                    _buffer[fixed_i + 23] = item.color[3];
                    /* Bottom right */
                    _buffer[fixed_i + 24] = item.position[0] + item.dimensions[0];
                    _buffer[fixed_i + 25] = item.position[1] + item.dimensions[1];
                    _buffer[fixed_i + 26] = item.clip[2];
                    _buffer[fixed_i + 27] = item.clip[3];
                    _buffer[fixed_i + 28] = item.color[0];
                    _buffer[fixed_i + 29] = item.color[1];
                    _buffer[fixed_i + 30] = item.color[2];
                    _buffer[fixed_i + 31] = item.color[3];

                    //Rotate if necessary
                    if (item.rotation != 0f)
                    {
                        RotatePixel(ref _buffer[fixed_i     ], 
                                    ref _buffer[fixed_i +  1],
                                        item.rot_origin[0], 
                                        item.rot_origin[1], 
                                        item.rotation);
                        RotatePixel(ref _buffer[fixed_i +  8], 
                                    ref _buffer[fixed_i +  9],
                                        item.rot_origin[0], 
                                        item.rot_origin[1], 
                                        item.rotation);
                        RotatePixel(ref _buffer[fixed_i + 16], 
                                    ref _buffer[fixed_i + 17],
                                        item.rot_origin[0], 
                                        item.rot_origin[1], 
                                        item.rotation);
                        RotatePixel(ref _buffer[fixed_i + 24], 
                                    ref _buffer[fixed_i + 25],
                                        item.rot_origin[0], 
                                        item.rot_origin[1], 
                                        item.rotation);
                    }
                }

                int size_multip = _count - batch_num * BATCH_SIZE;
                if (size_multip > BATCH_SIZE) size_multip = BATCH_SIZE;

                GL.BufferSubData(BufferTarget.ArrayBuffer,          // Target
                                0,                                  // Offset
                                size_multip * (32 * sizeof(float)), // Size
                                &_buffer[0]);                       // Data

                uint last_texture = _sprites[batch_num * BATCH_SIZE].texture;
                int offset = 0;

                SpriteBatchItem sprite;
                for (int i = 0; i < num_sprites; ++i)
                {
                    sprite = _sprites[batch_num * BATCH_SIZE + i];

                    if (sprite.texture != last_texture)
                    {
                        GL.BindTexture(TextureTarget.Texture2D, last_texture);
                        GL.DrawElements(PrimitiveType.Triangles,
                                    (i - offset) * 6,
                                    DataType.UnsignedInt,
                                    (void*)(offset * 6 * sizeof(uint)));
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
            _started = false;
        }

        public int GetBufferSize()
        {
            return _sprites.length;
        }

        /* Free any resources used by the batch from the GPU and memory. */
        public override void Dispose()
        {
            if (!_initialized) return;

            GL.DeleteBuffers(1, &_vbo);
            GL.DeleteBuffers(1, &_ebo);
            GL.DeleteVertexArrays(1, &_vao);

            _sprites.remove_range(0, _sprites.length);
            _initialized = false;
            _started = false;
        }
    }
}