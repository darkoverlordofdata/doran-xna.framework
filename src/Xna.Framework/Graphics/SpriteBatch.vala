// MonoGame - Copyright (C) The MonoGame Team
// This file is subject to the terms and conditions defined in
// file 'LICENSE.txt', which is part of this source code package.

using System;
// using System.Text;

namespace Microsoft.Xna.Framework.Graphics
{
    /// <summary>
    /// Helper class for drawing text strings and sprites in one or more optimized batches.
    /// </summary>
	public class SpriteBatch : GraphicsResource
	{
        // #region Private Fields
        // readonly SpriteBatcher batcher;
        public SpriteBatcher batcher { get; construct; }

		SpriteSortMode _sortMode;
		BlendState _blendState;
        bool _beginCalled;

		Matrix4? _matrix;

        /// <summary>
        /// Constructs a <see cref="SpriteBatch"/>.
        /// </summary>
        /// <param name="graphicsDevice">The <see cref="GraphicsDevice"/>, which will be used for sprite rendering.</param>
        /// <exception cref="ArgumentNullException">Thrown when <paramref name="graphicsDevice"/> is null.</exception>
        public SpriteBatch (GraphicsDevice graphicsDevice)
		{
			if (graphicsDevice == null)
            {
				throw new Exception.ArgumentNullException ("graphicsDevice FrameworkResources.ResourceCreationWhenDeviceIsNull");
			}	

            GLib.Object(batcher: new SpriteBatcher(graphicsDevice));

			this.GraphicsDevice = graphicsDevice;
            _beginCalled = false;

		}

        /// <summary>
        /// Begins a new sprite and text batch with the specified render state.
        /// </summary>
        /// <param name="sortMode">The drawing order for sprite and text drawing. <see cref="SpriteSortMode.Deferred"/> by default.</param>
        /// <param name="blendState">State of the blending. Uses <see cref="BlendState.AlphaBlend"/> if null.</param>
        /// <param name="samplerState">State of the sampler. Uses <see cref="SamplerState.LinearClamp"/> if null.</param>
        /// <param name="depthStencilState">State of the depth-stencil buffer. Uses <see cref="DepthStencilState.None"/> if null.</param>
        /// <param name="rasterizerState">State of the rasterization. Uses <see cref="RasterizerState.CullCounterClockwise"/> if null.</param>
        /// <param name="effect">A custom <see cref="Effect"/> to override the default sprite effect. Uses default sprite effect if null.</param>
        /// <param name="transformMatrix">An optional matrix used to transform the sprite geometry. Uses <see cref="Matrix.Identity"/> if null.</param>
        /// <exception cref="InvalidOperationException">Thrown if <see cref="Begin"/> is called next time without previous <see cref="End"/>.</exception>
        /// <remarks>This method uses optional parameters.</remarks>
        /// <remarks>The <see cref="Begin"/> Begin should be called before drawing commands, and you cannot call it again before subsequent <see cref="End"/>.</remarks>
        public void Begin
        (
             SpriteSortMode sortMode = SpriteSortMode.Deferred,
             BlendState blendState = null,
             Matrix4? transformMatrix = null
        )
        {
            if (_beginCalled)
                throw new Exception.InvalidOperationException("Begin cannot be called again until End has been successfully called.");

            // defaults
            _sortMode = sortMode;
            _blendState = blendState ?? BlendState.AlphaBlend;
            _matrix = transformMatrix;

            // Setup things now so a user can change them.
            if (sortMode == SpriteSortMode.Immediate)
            {
                // Setup();
            }

            _beginCalled = true;
        }

        /// <summary>
        /// Flushes all batched text and sprites to the screen.
        /// </summary>
        /// <remarks>This command should be called after <see cref="Begin"/> and drawing commands.</remarks>
		public void End ()
		{
            if (!_beginCalled)
                throw new Exception.InvalidOperationException("Begin must be called before calling End.");

			_beginCalled = false;

			if (_sortMode != SpriteSortMode.Immediate)
				// Setup();
            
            batcher.DrawBatch(_sortMode);
        }

        void CheckValid(Texture2D texture)
        {
            if (texture == null)
                throw new Exception.ArgumentNullException("texture");
            if (!_beginCalled)
                throw new Exception.InvalidOperationException("Draw was called, but Begin has not yet been called. Begin must be called successfully before you can call Draw.");
        }

		// Mark the end of a draw operation for Immediate SpriteSortMode.
		internal void FlushIfNeeded()
		{
			if (_sortMode == SpriteSortMode.Immediate)
			{
				batcher.DrawBatch(_sortMode);
			}
		}

        /// <summary>
        /// Submit a sprite for drawing in the current batch.
        /// </summary>
        /// <param name="texture">A texture.</param>
        /// <param name="position">The drawing location on screen.</param>
        /// <param name="color">A color mask.</param>
		public void Draw (Texture2D texture, Vector2 position, Color color)
		{
			CheckValid(texture);
            
			var item = batcher.CreateBatchItem();
			item.Texture = texture;
            
            // set SortKey based on SpriteSortMode.
            item.SortKey = _sortMode == SpriteSortMode.Texture ? texture.SortingKey : 0;
            
            item.Set(position.X,
                     position.Y,
                     texture.Width,
                     texture.Height,
                     color,
                     Vector2.Zero,
                     Vector2.One,
                     0);

            FlushIfNeeded();
		}
        
        /// <summary>
        /// Immediately releases the unmanaged resources used by this object.
        /// </summary>
        /// <param name="dis    posing"><c>true</c> to release both managed and unmanaged resources; <c>false</c> to release only unmanaged resources.</param>
        protected override void Dispose2(bool disposing)
        {
            if (!IsDisposed)
            {
                if (disposing)
                {
                    // if (_spriteEffect != null)
                    // {
                    //     _spriteEffect.Dispose();
                    //     _spriteEffect = null;
                    // }
                }
            }
            base.Dispose2(disposing);
        }
	}
}

