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
        bool _sorting = true; 
        float _alpha;
        Shader _shader;
        Matrix _projection;
        SpriteSortMode _sortMode;

        GenericArray<SpriteBatchItem> _batchItemList;
        float[] _vertexArray = new float[BATCH_SIZE * 32];

        public SpriteBatch(Shader shader, int width, int height)
        {
            _initialized = false;
            _started = false;
            _count = 0;
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
            if (_initialized) return _initialized;

            _alphaChanged = true;
            _started = false;
            _batchItemList = new GenericArray<SpriteBatchItem>(initial_size);
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

            GL.BufferData(BufferTarget.ArrayBuffer, BATCH_SIZE * (32 * sizeof(float)), _vertexArray, BufferUsageHint.DynamicDraw);

            //Element array buffer
            int[] indices = {0, 1, 2, 2, 3, 1};
            int[] indice_array = new int[BATCH_SIZE * 6];

            for (int i = 0; i < BATCH_SIZE; ++i)
                for (int j = 0; j < 6; ++j)
                    indice_array[i * 6 + j] = indices[j] + i * 4;

            GL.BindBuffer(BufferTarget.ElementArrayBuffer, _ebo);
            GL.BufferData(BufferTarget.ElementArrayBuffer, BATCH_SIZE * 6 * sizeof(int), indice_array, BufferUsageHint.DynamicDraw);

            GL.BindBuffer(BufferTarget.ArrayBuffer, 0);

            GL.BindVertexArray(0);

            _initialized = true;
            return _initialized;
        }

        public void Begin(
                SpriteSortMode sortMode = SpriteSortMode.Deferred,   // If _sorting is enabled, sprites with a lower layer are drawn first
                Matrix? projection = null,
                float alpha = 1f)   // Multiply all queued sprites' _alpha by this value
        {
            if (!_initialized || _started) return;

            _count = 0;
            _started = true;
            _sortMode = sortMode;

            if (_alpha != alpha) _alphaChanged = true;
            _alpha = alpha;

            if (projection == null)
            {
                if (_projection == null)
                {
                    _projection = new Matrix();
                    glm_mat4_identity(_projection);
                    glm_ortho(0f, (float)_width, (float)_height, 0f, -1f, 1f, _projection);
                }
            }
            else _projection = projection;

            GL.Enable(EnableCap.Blend);
            GL.BlendFunc(BlendingFactorSrc.SrcAlpha, BlendingFactorDest.OneMinusSrcAlpha);
        }

        internal SpriteBatchItem CreateBatchItem(Texture2D texture, int x, int y, float layerDepth)
        {
            if (_count+1 > _batchItemList.length)
                _batchItemList.add(new SpriteBatchItem());
            var item = _batchItemList[_count];
            item.texture = texture.Handle;
            item.position[0] = (float)x;
            item.position[1] = (float)y;
            switch (_sortMode)
            {
                // Comparison of Texture objects.
                case SpriteSortMode.Texture:
                    item.SortKey = texture.SortingKey;
                    break;
                // Comparison of Depth
                case SpriteSortMode.FrontToBack:
                    item.SortKey = layerDepth;
                    break;
                // Comparison of Depth in reverse
                case SpriteSortMode.BackToFront:
                    item.SortKey = -layerDepth;
                    break;
            }
            return item;
        }

        internal void Draw(Texture2D texture,
                  Rectangle clip,
                  int x, int y, float layer)
        {
            if (!_started) return;
            var item = CreateBatchItem(texture, x, y, layer);
            item.SetDimensions(clip);
            item.SetClip(texture, clip);
            item.SetColor();
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

            int u = (int)region.X;
            int v = (int)region.Y;
            int u2 = (int)region.Width;
            int v2 = (int)region.Height;

            int w = size == null ? (int)(u2 * scale.X) : (int)(size.X * scale.X);
            int h = size == null ? (int)(v2 * scale.Y) : (int)(size.Y * scale.Y);

            int x = location == null ? 0 : (int)(location.X-(w * 0.5f));
            int y = location == null ? 0 : (int)(location.Y-(h * 0.5f));

            Rectangle source = { u, v, u2, v2 };

            var item = CreateBatchItem(region.texture, x, y, layerDepth);
            item.SetScaledDimensions(source, scale);
            item.SetClip(region.texture, source);
            item.SetModColor(color);
            item.rotation = 0f;
            ++_count;
        }

        internal void DrawScaled(Texture2D texture,
                        Rectangle clip,
                        int x, int y, float layer,
                        Vector2 scale)
        {
            if (!_started) return;
            
            var item = CreateBatchItem(texture, x, y, layer);
            item.SetScaledDimensions(clip, scale);
            item.SetClip(texture, clip);
            item.SetColor();
            item.rotation = 0f;
            ++_count;
        }

        internal void DrawFlipped(Texture2D texture,
                         Rectangle clip,
                         int x, int y, float layer,
                         SpriteFlip flip)
        {
            if (!_started) return;
            var item = CreateBatchItem(texture, x, y, layer);
            item.SetDimensions(clip);
            item.SetFlippedClip(flip, texture, clip);
            item.SetColor();
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
            var item = CreateBatchItem(texture, x, y, layer);
            item.SetDimensions(clip);
            item.SetClip(texture, clip);
            item.SetModColor(color);
            item.rotation = 0f;
            ++_count;
        }

        internal void DrawRotated(Texture2D texture,
                         Rectangle clip,
                         int x, int y, float layer,
                         float rot)
        {
            if (!_started) return;
            var item = CreateBatchItem(texture, x, y, layer);
            item.SetDimensions(clip);
            item.SetClip(texture, clip);
            item.SetColor();
            item.SetRotation(rot, x, y, clip);
            ++_count;
        }


        internal void DrawScaledFlipped(Texture2D texture,
                               Rectangle clip,
                               int x, int y, float layer,
                               Vector2 scale,
                               SpriteFlip flip)
        {
            if (!_started) return;
            var item = CreateBatchItem(texture, x, y, layer);
            item.SetScaledDimensions(clip, scale);
            item.SetFlippedClip(flip, texture, clip);
            item.SetColor();
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
            var item = CreateBatchItem(texture, x, y, layer);
            item.SetScaledDimensions(clip, scale);
            item.SetClip(texture, clip);
            item.SetColor();
            item.SetRotation(rot, x, y, clip);
            ++_count;
        }

        internal void DrawScaledTinted(Texture2D texture,
                              Rectangle clip,
                              int x, int y, float layer,
                              Vector2 scale,
                              Color color)
        {
            if (!_started) return;
            var item = CreateBatchItem(texture, x, y, layer);
            item.SetScaledDimensions(clip, scale);
            item.SetClip(texture, clip);
            item.SetModColor(color);
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
            var item = CreateBatchItem(texture, x, y, layer);
            item.SetScaledDimensions(clip, scale);
            item.SetClip(texture, clip);
            item.SetModColor(color);
            item.SetRotation(rot, x, y, clip);
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
            var item = CreateBatchItem(texture, x, y, layer);
            item.SetScaledDimensions(clip, scale);
            item.SetFlippedClip(flip, texture, clip);
            item.SetModColor(color);
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
            var item = CreateBatchItem(texture, x, y, layer);
            item.SetDimensions(clip);
            item.SetFlippedClip(flip, texture, clip);
            item.SetColor();
            item.SetRotation(rot, x, y, clip);
            ++_count;
        }


        internal void DrawFlippedTinted(Texture2D texture,
                               Rectangle clip,
                               int x, int y, float layer,
                               SpriteFlip flip,
                               Color color)
        {
            if (!_started) return;
            var item = CreateBatchItem(texture, x, y, layer);
            item.SetDimensions(clip);
            item.SetFlippedClip(flip, texture, clip);
            item.SetModColor(color);
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
            var item = CreateBatchItem(texture, x, y, layer);
            item.SetDimensions(clip);
            item.SetClip(texture, clip);
            item.SetModColor(color);
            item.SetRotation(rot, x, y, clip);
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
            var item = CreateBatchItem(texture, x, y, layer);
            item.SetDimensions(clip);
            item.SetFlippedClip(flip, texture, clip);
            item.SetModColor(color);
            item.SetRotation(rot, x, y, clip);
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
            var item = CreateBatchItem(texture, x, y, layer);
            item.rotation = 0f;
            ++_count;
        }


        public void End()
        {
            if (!_initialized
            ||  !_started
            ||  _count < 1)
                return;

            if (_sorting)
                _batchItemList.sort_with_data((a, b) => b.CompareTo(a));

            _shader.Use();
            _shader.SetMatrix("Projection", _projection);

            if (_alphaChanged)
            {
                _shader.SetFloat("Alpha", _alpha);
                _alphaChanged = false;
            }

            GL.BindVertexArray(_vao);
            GL.BindBuffer(BufferTarget.ArrayBuffer, _vbo);
            GL.BindBuffer(BufferTarget.ElementArrayBuffer, _ebo);

            // How many batches to process
            int num_batches = _count / BATCH_SIZE;

            for (int batch_num = 0; batch_num < num_batches + 1; ++batch_num)
            {
                int num_batchItemList = _count - batch_num * BATCH_SIZE;
                if (num_batchItemList > BATCH_SIZE) num_batchItemList = BATCH_SIZE;

                for (int i = batch_num * BATCH_SIZE; i < batch_num * BATCH_SIZE + num_batchItemList; ++i)
                {
                    SpriteBatchItem item = _batchItemList[i];

                    int ix = (i - (i / BATCH_SIZE * BATCH_SIZE)) * 32;

                    /* TL */
                    _vertexArray[ix +  0] = item.position[0];
                    _vertexArray[ix +  1] = item.position[1];
                    _vertexArray[ix +  2] = item.clip[0];
                    _vertexArray[ix +  3] = item.clip[1];
                    _vertexArray[ix +  4] = item.color[0];
                    _vertexArray[ix +  5] = item.color[1];
                    _vertexArray[ix +  6] = item.color[2];
                    _vertexArray[ix +  7] = item.color[3];

                    /* TR */
                    _vertexArray[ix +  8] = item.position[0] + item.dimensions[0];
                    _vertexArray[ix +  9] = item.position[1];
                    _vertexArray[ix + 10] = item.clip[2];
                    _vertexArray[ix + 11] = item.clip[1];
                    _vertexArray[ix + 12] = item.color[0];
                    _vertexArray[ix + 13] = item.color[1];
                    _vertexArray[ix + 14] = item.color[2];
                    _vertexArray[ix + 15] = item.color[3];

                    /* BL */
                    _vertexArray[ix + 16] = item.position[0];
                    _vertexArray[ix + 17] = item.position[1]  + item.dimensions[1];
                    _vertexArray[ix + 18] = item.clip[0];
                    _vertexArray[ix + 19] = item.clip[3];
                    _vertexArray[ix + 20] = item.color[0];
                    _vertexArray[ix + 21] = item.color[1];
                    _vertexArray[ix + 22] = item.color[2];
                    _vertexArray[ix + 23] = item.color[3];

                    /* BR */
                    _vertexArray[ix + 24] = item.position[0] + item.dimensions[0];
                    _vertexArray[ix + 25] = item.position[1] + item.dimensions[1];
                    _vertexArray[ix + 26] = item.clip[2];
                    _vertexArray[ix + 27] = item.clip[3];
                    _vertexArray[ix + 28] = item.color[0];
                    _vertexArray[ix + 29] = item.color[1];
                    _vertexArray[ix + 30] = item.color[2];
                    _vertexArray[ix + 31] = item.color[3];

                    //Rotate if necessary
                    if (item.rotation != 0f)
                    {
                        RotatePixel(ref _vertexArray[ix +  0], 
                                    ref _vertexArray[ix +  1],
                                        item.origin[0], 
                                        item.origin[1], 
                                        item.rotation);
                        RotatePixel(ref _vertexArray[ix +  8], 
                                    ref _vertexArray[ix +  9],
                                        item.origin[0], 
                                        item.origin[1], 
                                        item.rotation);
                        RotatePixel(ref _vertexArray[ix + 16], 
                                    ref _vertexArray[ix + 17],
                                        item.origin[0], 
                                        item.origin[1], 
                                        item.rotation);
                        RotatePixel(ref _vertexArray[ix + 24], 
                                    ref _vertexArray[ix + 25],
                                        item.origin[0], 
                                        item.origin[1], 
                                        item.rotation);
                    }
                }

                int size_multip = _count - batch_num * BATCH_SIZE;
                if (size_multip > BATCH_SIZE) size_multip = BATCH_SIZE;

                GL.BufferSubData(BufferTarget.ArrayBuffer,          // Target
                                0,                                  // Offset
                                size_multip * (32 * sizeof(float)), // Size
                                &_vertexArray[0]);                       // Data

                uint last_texture = _batchItemList[batch_num * BATCH_SIZE].texture;
                int offset = 0;

                SpriteBatchItem sprite;
                for (int i = 0; i < num_batchItemList; ++i)
                {
                    sprite = _batchItemList[batch_num * BATCH_SIZE + i];

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
                            (num_batchItemList - offset) * 6,
                            DataType.UnsignedInt,
                            (void*)(offset * 6 * sizeof(uint)));
            }
            GL.BindTexture(TextureTarget.Texture2D, 0);
            GL.BindBuffer(BufferTarget.ArrayBuffer, 0);

            GL.BindVertexArray(0);
            GL.UseProgram(0);
            _started = false;
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

        public int GetBufferSize()
        {
            return _batchItemList.length;
        }

        /* Free any resources used by the batch from the GPU and memory. */
        public override void Dispose()
        {
            if (!_initialized) return;

            GL.DeleteBuffers(1, &_vbo);
            GL.DeleteBuffers(1, &_ebo);
            GL.DeleteVertexArrays(1, &_vao);

            _batchItemList.remove_range(0, _batchItemList.length);
            _initialized = false;
            _started = false;
        }
    }
}