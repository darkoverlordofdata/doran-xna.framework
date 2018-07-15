using System;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;

namespace Microsoft.Xna.Framework.Graphics 
{
    public class SpriteBatch : Object, IDisposable
    {
        private const Vector2 UnitY = { 0, 1 };
        private const Vector2 UnitX = { 1, 0 };

        private Texture2D? _texture;
        private Vector2 _camera;
        private bool _beginCalled;
        private SpriteBatcher _batcher;
		private SpriteSortMode _sortMode;
		Vector2 _texCoordTL = new Vector2 (0,0);
		Vector2 _texCoordBR = new Vector2 (0,0);

        public SpriteBatch(GraphicsDevice graphicsDevice)
        {
            _beginCalled = false;
            _batcher = new SpriteBatcher(graphicsDevice);
        }

        public void Begin(
            Vector2? camera = null, 
            SpriteSortMode sortMode = SpriteSortMode.Deferred)
        {
            if (_beginCalled)
                throw new Exception.InvalidOperationException("Begin cannot be called again until End has been successfully called.");

            _sortMode = sortMode;
            _camera = camera ?? Vector2.Zero;
            _beginCalled = true;
        }

        /// <summary>
        /// Submit a sprite for drawing in the current batch.
        /// </summary>
        /// <param name="texture">A texture.</param>
        /// <param name="position">The drawing location on screen or null if <paramref name="destinationRectangle"> is used.</paramref></param>
        /// <param name="destinationRectangle">The drawing bounds on screen or null if <paramref name="position"> is used.</paramref></param>
        /// <param name="sourceRectangle">An optional region on the texture which will be rendered. If null - draws full texture.</param>
        /// <param name="origin">An optional center of rotation. Uses <see cref="Vector2.Zero"/> if null.</param>
        /// <param name="rotation">An optional rotation of this sprite. 0 by default.</param>
        /// <param name="scale">An optional scale vector. Uses <see cref="Vector2.One"/> if null.</param>
        /// <param name="color">An optional color mask. Uses <see cref="Color.White"/> if null.</param>
        /// <param name="effects">The optional drawing modificators. <see cref="SpriteEffects.None"/> by default.</param>
        /// <param name="layerDepth">An optional depth of the layer of this sprite. 0 by default.</param>
        /// <exception cref="InvalidOperationException">Throwns if both <paramref name="position"/> and <paramref name="destinationRectangle"/> been used.</exception>
        /// <remarks>This overload uses optional parameters. This overload requires only one of <paramref name="position"/> and <paramref name="destinationRectangle"/> been used.</remarks>
        public void Draw(
            Texture2D texture, 
            Vector2? position = null, 
            Quadrangle? destinationRectangle = null,
            Quadrangle? sourceRectangle = null,
            Vector2? origin = null,
            float rotation = 0f,
            Vector2? scale = null,
            Color? color = null,
			SpriteEffects effects = SpriteEffects.None,
            float layerDepth = 0f)
        {
            CheckValid(texture);
            _texture = texture;
            color = color ?? Color.White;
            origin = origin ?? Vector2.Zero;
            scale = scale ?? Vector2.One;

            if ((destinationRectangle != null) == (position != null))
            {
                throw new Exception.InvalidOperationException("Expected drawRectangle or position, but received neither or both.");
            }
            else if(position != null)
            {
                // Call Draw() using position
                Draw2(texture, (Vector2)position, sourceRectangle, (Color)color, rotation, (Vector2)origin, (Vector2)scale, effects, layerDepth);
            }
            else
            {
                // Call Draw() using drawRectangle
                Draw3(texture, (Quadrangle)destinationRectangle, sourceRectangle, (Color)color, rotation, (Vector2)origin, effects, layerDepth);
            }
        }

           
        /// <summary>
        /// Submit a sprite for drawing in the current batch.
        /// </summary>
        /// <param name="texture">A texture.</param>
        /// <param name="position">The drawing location on screen.</param>
        /// <param name="sourceRectangle">An optional region on the texture which will be rendered. If null - draws full texture.</param>
        /// <param name="color">A color mask.</param>
        /// <param name="rotation">A rotation of this sprite.</param>
        /// <param name="origin">Center of the rotation. 0,0 by default.</param>
        /// <param name="scale">A scaling of this sprite.</param>
        /// <param name="effects">Modificators for drawing. Can be combined.</param>
        /// <param name="layerDepth">A depth of the layer of this sprite.</param>
		public void Draw2 (Texture2D texture,
				Vector2 position,
				Quadrangle? sourceRectangle,
				Color color,
				float rotation,
				Vector2 origin,
				Vector2 scale,
				SpriteEffects effects,
                float layerDepth)
		{
            CheckValid(texture);

			var item = _batcher.CreateBatchItem();
			item.Texture = texture;

            // set SortKey based on SpriteSortMode.
            item.SortKey = (float)SpriteSortMode.Texture;

            origin = origin.MulVec2(scale);
            
            float h;
            float w;
            if (sourceRectangle != null)
            {
                var srcRect = sourceRectangle ?? new Quadrangle(0, 0, texture.Width, texture.Height);
                w = srcRect.Width * scale.X;
                h = srcRect.Height * scale.Y;
                _texCoordTL.X = srcRect.X * texture.TexelWidth;
                _texCoordTL.Y = srcRect.Y * texture.TexelHeight;
                _texCoordBR.X = (srcRect.X + srcRect.Width) * texture.TexelWidth;
                _texCoordBR.Y = (srcRect.Y + srcRect.Height) * texture.TexelHeight;
            }
            else
            {
                w = texture.Width * scale.X;
                h = texture.Height * scale.Y;
                _texCoordTL = Vector2.Zero;
                _texCoordBR = Vector2.One;
            }

            if ((effects & SpriteEffects.FlipVertically) != 0)
            {
                var temp = _texCoordBR.Y;
				_texCoordBR.Y = _texCoordTL.Y;
				_texCoordTL.Y = temp;
            }
            if ((effects & SpriteEffects.FlipHorizontally) != 0)
            {
                var temp = _texCoordBR.X;
				_texCoordBR.X = _texCoordTL.X;
				_texCoordTL.X = temp;
            }

            if (rotation == 0f)
            {
                item.Set(position.X - origin.X,
                        position.Y - origin.Y,
                        w,
                        h,
                        color,
                        _texCoordBR,
                        _texCoordTL,
                        layerDepth);
            }
            else
            {
                item.Set2(position.X,
                        position.Y,
                        -origin.X,
                        -origin.Y,
                        w,
                        h,
                        Math.sinf(rotation),
                        Math.cosf(rotation),
                        color,
                        _texCoordTL,
                        _texCoordBR,
                        layerDepth);
            }

            FlushIfNeeded();
        }

        /// <summary>
        /// Submit a sprite for drawing in the current batch.
        /// </summary>
        /// <param name="texture">A texture.</param>
        /// <param name="destinationRectangle">The drawing bounds on screen.</param>
        /// <param name="sourceRectangle">An optional region on the texture which will be rendered. If null - draws full texture.</param>
        /// <param name="color">A color mask.</param>
        /// <param name="rotation">A rotation of this sprite.</param>
        /// <param name="origin">Center of the rotation. 0,0 by default.</param>
        /// <param name="effects">Modificators for drawing. Can be combined.</param>
        /// <param name="layerDepth">A depth of the layer of this sprite.</param>
		public void Draw3 (Texture2D texture,
			Quadrangle destinationRectangle,
			Quadrangle? sourceRectangle,
			Color color,
			float rotation,
			Vector2 origin,
			SpriteEffects effects,
            float layerDepth)
		{
            CheckValid(texture);

			var item = _batcher.CreateBatchItem();
			item.Texture = texture;

            // set SortKey based on SpriteSortMode.
            item.SortKey = (float)SpriteSortMode.Texture;

            if (sourceRectangle != null)
            {
                var srcRect = sourceRectangle ?? new Quadrangle(0, 0, texture.Width, texture.Height);
                _texCoordTL.X = srcRect.X * texture.TexelWidth;
                _texCoordTL.Y = srcRect.Y * texture.TexelHeight;
                _texCoordBR.X = (srcRect.X + srcRect.Width) * texture.TexelWidth;
                _texCoordBR.Y = (srcRect.Y + srcRect.Height) * texture.TexelHeight;

                if(srcRect.Width != 0)
                    origin.X = origin.X * (float)destinationRectangle.Width / (float)srcRect.Width;
                else
                    origin.X = origin.X * (float)destinationRectangle.Width * texture.TexelWidth;
                if(srcRect.Height != 0)
                    origin.Y = origin.Y * (float)destinationRectangle.Height / (float)srcRect.Height; 
                else
                    origin.Y = origin.Y * (float)destinationRectangle.Height * texture.TexelHeight;
            }
            else
            {
                _texCoordTL = Vector2.Zero;
                _texCoordBR = Vector2.One;
                
                origin.X = origin.X * (float)destinationRectangle.Width  * texture.TexelWidth;
                origin.Y = origin.Y * (float)destinationRectangle.Height * texture.TexelHeight;
            }

            if ((effects & SpriteEffects.FlipVertically) != 0)
            {
                var temp = _texCoordBR.Y;
				_texCoordBR.Y = _texCoordTL.Y;
				_texCoordTL.Y = temp;
            }
            if ((effects & SpriteEffects.FlipHorizontally) != 0)
            {
                var temp = _texCoordBR.X;
				_texCoordBR.X = _texCoordTL.X;
				_texCoordTL.X = temp;
            }

		    if (rotation == 0f)
		    {
                item.Set(destinationRectangle.X - origin.X,
                        destinationRectangle.Y - origin.Y,
                        destinationRectangle.Width,
                        destinationRectangle.Height,
                        color,
                        _texCoordTL,
                        _texCoordBR,
                        layerDepth);
            }
            else
		    {
                item.Set2(destinationRectangle.X,
                        destinationRectangle.Y,
                        -origin.X,
                        -origin.Y,
                        destinationRectangle.Width,
                        destinationRectangle.Height,
                        Math.sinf(rotation),
                        Math.cosf(rotation),
                        color,
                        _texCoordTL,
                        _texCoordBR,
                        layerDepth);
            }
            FlushIfNeeded();
        }

		// Mark the end of a draw operation for Immediate SpriteSortMode.
		internal void FlushIfNeeded()
		{
			if (_sortMode == SpriteSortMode.Immediate)
			{
                _batcher.Camera = _camera;
				_batcher.DrawBatch(_sortMode);
			}
		}

        public void End()
        {
            if (!_beginCalled)
                throw new Exception.InvalidOperationException("Begin must be called before calling End.");

			_beginCalled = false;

            _batcher.Camera = _camera;
            _batcher.DrawBatch(_sortMode);
        }

        public void Dispose() 
        {
            _batcher.Dispose();
        }

        void CheckValid(Texture2D? texture)
        {
            if (texture == null)
                throw new Exception.ArgumentNullException("texture");
            if (!_beginCalled)
                throw new Exception.InvalidOperationException("Draw was called, but Begin has not yet been called. Begin must be called successfully before you can call Draw.");
        }
    }
}