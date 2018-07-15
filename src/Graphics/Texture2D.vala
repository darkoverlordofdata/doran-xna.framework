// MonoGame - Copyright (C) The MonoGame Team
// This file is subject to the terms and conditions defined in
// file 'LICENSE.txt', which is part of this source code package.

using System;
using ValaGame.OpenGL;
// using System.IO;
// using System.Runtime.InteropServices;
// using Microsoft.Xna.Framework.Utilities;

namespace Microsoft.Xna.Framework.Graphics
{
    public class Texture2D : Texture, ISetData
    {
        public enum SurfaceType
        {
            Texture,
            RenderTarget,
            SwapChainRenderTarget,
        }

		internal int width;
		internal int height;
        internal int format;
        internal int ArraySize;
        internal uint Handle;
                
        internal float TexelWidth { get; private set; }
        internal float TexelHeight { get; private set; }

        /// <summary>
        /// Gets the dimensions of the texture
        /// </summary>
        public Quadrangle Bounds
        {
            get
            {
				return new Quadrangle(0, 0, this.width, this.height);
            }
        }

        /// <summary>
        /// Changes the pixels of the texture
        /// </summary>
        /// <param name="path"></param>
        public void SetData(string path)
        {
            var width = new int[1];
            var height = new int[1];
            Handle = corange_texture_handle(corange_asset_get(URI(path)));

            GL.BindTexture(TextureTarget.Texture2D, Handle);
            GL.GetTexLevelParameteriv(TextureTarget.Texture2D, 0, TextureParameter.Width, width);
            GL.GetTexLevelParameteriv(TextureTarget.Texture2D, 0, TextureParameter.Height, height);

            this.width = width[0];
            this.height = height[0];
            this.TexelWidth = 1f / (float)this.width;
            this.TexelHeight = 1f / (float)this.height;
        }


        /// <summary>
        /// Gets the width of the texture in pixels.
        /// </summary>
        public int Width
        {
            get
            {
                return width;
            }
        }

        /// <summary>
        /// Gets the height of the texture in pixels.
        /// </summary>
        public int Height
        {
            get
            {
                return height;
            }
        }

	}
}
