namespace Microsoft.Xna.Framework.Graphics
{
    //  https://gitlab.com/Partanen/KTL_SpriteBatch

    using System;
    using System.Collections.Generic;
    using ValaGame.OpenGL;

    public class SpriteBatch2D : Disposable
    {
        /*  The maximum amount of sprite data to be sent to
         *  the GPU at one time. */
        const int BATCH_SIZE = 2048;
        const int BLOCK_SIZE = (int)(sizeof(VertexPositionColorTexture2D));

        int _count;
        int _width;
        int _height;
        uint _vao;
        uint _vbo;
        uint _ebo;
        bool _beginCalled;
        bool _initialized;
        bool _alphaChanged;
        bool _sorting = true; 
        float _alpha;
        Shader _shader;
        Matrix _projection;
        SpriteSortMode _sortMode;
        SpriteBatcher2D _batcher;
		Vector2 _texCoordTL = new Vector2 (0,0);
		Vector2 _texCoordBR = new Vector2 (0,0);

        GenericArray<SpriteBatchItem2D> _batchItemList;
        float[] _vertexArray = new float[BATCH_SIZE * BLOCK_SIZE];
        // SpriteBatchItem2D[] _vertexArray = new SpriteBatchItem2D[BATCH_SIZE];

        public SpriteBatch2D(Shader shader, int width, int height)
        {
            _initialized = false;
            _beginCalled = false;
            _count = 0;
            _shader = shader;
            _width = width;
            _height = height;
        }
        ~SpriteBatch2D()
        {

        }

        /* Initialize the batch for use. initial_size is the
         * starting batch size. If more sprites are queued,
         * the batch is automatically enlarged. */
        public bool Create(int initial_size = 256)
        {
            if (_initialized) return _initialized;

            _alphaChanged = true;
            _beginCalled = false;
            _batchItemList = new GenericArray<SpriteBatchItem2D>(initial_size);
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

            GL.BufferData(BufferTarget.ArrayBuffer, BATCH_SIZE * (BLOCK_SIZE * sizeof(float)), _vertexArray, BufferUsageHint.DynamicDraw);

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
            if (!_initialized || _beginCalled) return;

            _count = 0;
            _beginCalled = true;
            _sortMode = sortMode;

            if (_alpha != alpha) _alphaChanged = true;
            _alpha = alpha;

            if (projection == null)
            {
                if (_projection == null)
                {
                    _projection = new Matrix();
                    glm_ortho(0f, (float)_width, (float)_height, 0f, -1f, 1f, _projection);
                }
            }
            else _projection = projection;

            GL.Enable(EnableCap.Blend);
            GL.BlendFunc(BlendingFactorSrc.SrcAlpha, BlendingFactorDest.OneMinusSrcAlpha);
        }

        void CheckValid(Texture2D texture)
        {
            if (texture == null)
                throw new Exception.ArgumentNullException("texture");
            if (!_beginCalled)
                throw new Exception.InvalidOperationException("Draw was called, but Begin has not yet been called. Begin must be called successfully before you can call Draw.");
        }

        internal SpriteBatchItem2D CreateBatchItem()
        {
            if (_count+1 > _batchItemList.length)
                _batchItemList.add(new SpriteBatchItem2D());
            var item = _batchItemList[_count];
            ++_count;
            return item;
        }

        public void Draw(Texture2D texture,
                  Rectangle srcRect,
                  int x, int y, float layerDepth)
        {
            CheckValid(texture);
            var item = CreateBatchItem();
            item.Texture = texture;

            // set SortKey based on SpriteSortMode.
            item.SortKey = _sortMode == SpriteSortMode.Texture ? texture.SortingKey : 0;
            Vector2 size = new Vector2(srcRect.Width, srcRect.Height);
            _texCoordTL.X = srcRect.X * texture.TexelWidth;
            _texCoordTL.Y = srcRect.Y * texture.TexelHeight;
            _texCoordBR.X = (srcRect.X + srcRect.Width)  * texture.TexelWidth;
            _texCoordBR.Y = (srcRect.Y + srcRect.Height) * texture.TexelHeight;

            item.Set(x,
                    y,
                    size.X,
                    size.Y,
                    Color.White.ToVector4(),
                    _texCoordTL,
                    _texCoordBR,
                    layerDepth);
        }

        /**
         * Draw an Atlas Region
         */
        public void DrawRegion(
            TextureRegion region, 
            float layerDepth = 0f,
            Vector2? position = null,
            Vector2? scale = null,
            Color? color = null,
            Vector2? size = null)
        {
            var texture = region.texture;
            CheckValid(texture);

            var item = CreateBatchItem();
            item.Texture = texture;
            // set SortKey based on SpriteSortMode.
            switch ( _sortMode )
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

            color = color ?? Color.White;
            scale = scale ?? new Vector2(region.Scale.X, region.Scale.Y); 

            var w = (int) (size == null ? region.Width * scale.X : size.X * scale.X);
            var h = (int) (size == null ? region.Height * scale.Y : size.Y * scale.Y);
            var x = position == null ? 0 : (int)(position.X-(w * 0.5f));
            var y = position == null ? 0 : (int)(position.Y-(h * 0.5f));

            _texCoordTL.X = region.X * texture.TexelWidth;
            _texCoordTL.Y = region.Y * texture.TexelHeight;
            _texCoordBR.X = (region.X + region.Width)  * texture.TexelWidth;
            _texCoordBR.Y = (region.Y + region.Height) * texture.TexelHeight;

            item.Set(x, 
                y,
                region.Width * scale.X, 
                region.Height * scale.Y,
                color.ToVector4(), 
                _texCoordTL, 
                _texCoordBR, 
                layerDepth);

        }

        public void End()
        {
            if (!_initialized
            ||  !_beginCalled
            ||  _count < 1)
                return;

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

            if (_sorting)
                _batchItemList.sort_with_data((a, b) => b.CompareTo(a));

            SpriteBatchItem2D sprite;

            for (var i = 0, index = 0; i < _count; i++, index+=BLOCK_SIZE)
            {
                /** Copy sorted batch items to vertex array */
                sprite = _batchItemList[i];
                Memory.copy(&_vertexArray[index], &sprite.vertexTL, BLOCK_SIZE * 4);
            }

            GL.BufferSubData(BufferTarget.ArrayBuffer,          // Target
                            0,                                  // Offset
                            _count * (BLOCK_SIZE * 4),          // Size
                            _vertexArray);                      // Data
                            // &_vertexArray[0]);                  // Data

            var last_texture = _batchItemList[0].Texture.Handle;
            var offset = 0;

            for (var i = 0; i < _count; i++)
            {
                sprite = _batchItemList[i];
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
                        (_count - offset) * 6,
                        DataType.UnsignedInt,
                        (void*)(offset * 6 * sizeof(uint)));
            GL.BindTexture(TextureTarget.Texture2D, 0);
            GL.BindBuffer(BufferTarget.ArrayBuffer, 0);

            GL.BindVertexArray(0);
            GL.UseProgram(0);
            _beginCalled = false;
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
            _beginCalled = false;
        }
    }
}