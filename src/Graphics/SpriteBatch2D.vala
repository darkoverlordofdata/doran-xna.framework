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
        int _lastWidth;
        int _lastHeight;
        bool _beginCalled;
        bool _alphaChanged;
        float _alpha;
        Shader _shader;
        Matrix _projection;
        SpriteSortMode _sortMode;
        SpriteBatcher2D _batcher;
        GraphicsDevice graphicsDevice;
		Vector2 _texCoordTL = new Vector2 (0,0);
		Vector2 _texCoordBR = new Vector2 (0,0);


        public SpriteBatch2D(GraphicsDevice graphicsDevice, Shader shader)
        {
            this.graphicsDevice = graphicsDevice;
            _shader = shader;
            _alphaChanged = true;
            _batcher = new SpriteBatcher2D();
            _beginCalled = false;
        }

        public void Begin(
                SpriteSortMode sortMode = SpriteSortMode.Deferred,   // If _sorting is enabled, sprites with a lower layer are drawn first
                float alpha = 1f)   // Multiply all queued sprites' _alpha by this value
        {
            if (_beginCalled)
                throw new Exception.InvalidOperationException("Begin cannot be called again until End has been successfully called.");

            // defaults
            _sortMode = sortMode;

            if (_alpha != alpha) _alphaChanged = true;
            _alpha = alpha;

			if (_sortMode == SpriteSortMode.Immediate)
                Setup();

            _beginCalled = true;
        }

        public void End()
        {
            if (!_beginCalled)
                throw new Exception.InvalidOperationException("Begin must be called before calling End.");
            _beginCalled = false;

			if (_sortMode != SpriteSortMode.Immediate)
                Setup();

            _batcher.DrawBatch(_sortMode);
        }

        void Setup()
        {
            GL.Enable(EnableCap.Blend);
            GL.BlendFunc(BlendingFactorSrc.SrcAlpha, BlendingFactorDest.OneMinusSrcAlpha);

            var vp = graphicsDevice.Viewport;
            if ((vp.Width != _lastWidth) || (vp.Height != _lastHeight))
            {
                // Normal 3D cameras look into the -z direction (z = 1 is in font of z = 0). The
                // sprite batch layer depth is the opposite (z = 0 is in front of z = 1).
                // --> We get the correct matrix with near plane 0 and far plane -1.
                _projection = new Matrix();
                glm_ortho(0f, (float)vp.Width, (float)vp.Height, 0f, 0f, -1f, _projection);
                _lastWidth = vp.Width;
                _lastHeight = vp.Height;
            }

            _shader.Use();
            _shader.SetMatrix("Projection", _projection);

            if (_alphaChanged)
            {
                _shader.SetFloat("Alpha", _alpha);
                _alphaChanged = false;
            }
        }

        void CheckValid(Texture2D texture)
        {
            if (texture == null)
                throw new Exception.ArgumentNullException("texture");
            if (!_beginCalled)
                throw new Exception.InvalidOperationException("Draw was called, but Begin has not yet been called. Begin must be called successfully before you can call Draw.");
        }

        public void Draw(Texture2D texture,
                  Rectangle srcRect,
                  int x, int y, float layerDepth)
        {
            CheckValid(texture);
            var item = _batcher.CreateBatchItem();
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

            FlushIfNeeded();
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

            var item = _batcher.CreateBatchItem();
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

            FlushIfNeeded();
        }

		// Mark the end of a draw operation for Immediate SpriteSortMode.
		internal void FlushIfNeeded()
		{
			if (_sortMode == SpriteSortMode.Immediate)
			{
				_batcher.DrawBatch(_sortMode);
			}
		}

        /* Free any resources used by the batch from the GPU and memory. */
        public override void Dispose()
        {
            _batcher.Dispose();
            _beginCalled = false;
        }
    }
}