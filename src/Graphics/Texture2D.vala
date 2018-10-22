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
    using Stb;
    // using System.IO;
    // using System.Runtime.InteropServices;
    // using Microsoft.Xna.Framework.Utilities;

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
        internal int Handle;
                
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
            /** START OLD */
            // var width = new int[1];
            // var height = new int[1];
            // Handle = corange_texture_handle(corange_asset_get(URI(path)));

            // GL.BindTexture(TextureTarget.Texture2D, Handle);
            // GL.GetTexLevelParameteriv(TextureTarget.Texture2D, 0, TextureParameter.Width, width);
            // GL.GetTexLevelParameteriv(TextureTarget.Texture2D, 0, TextureParameter.Height, height);

            // this.width = width[0];
            // this.height = height[0];
            /** END OLD */

            /** START NEW */
            GL.GenTextures(1, ref Handle);
            GL.BindTexture(TextureTarget.Texture2D, Handle); 
            // all upcoming GL_TEXTURE_2D operations now have effect on this texture object
            // set the texture wrapping parameters
            GL.TexParameteri(TextureTarget.Texture2D, TextureParameterName.TextureWrapS, (int)TextureWrapMode.Repeat);	
            // set texture wrapping to GL_REPEAT (default wrapping method)
            GL.TexParameteri(TextureTarget.Texture2D, TextureParameterName.TextureWrapT, (int)TextureWrapMode.Repeat);
            // set texture filtering parameters
            GL.TexParameteri(TextureTarget.Texture2D, TextureParameterName.TextureMinFilter, (int)TextureMinFilter.Linear);
            GL.TexParameteri(TextureTarget.Texture2D, TextureParameterName.TextureMagFilter, (int)TextureMagFilter.Linear);

            width = 0;
            height = 0;
            int channels = 0;

            IntPtr pixels = Stb.load(path, out width, out height, out channels, 0);

            print("Load %s, h=%d, w=%d, h=%d\n", path, width, height, Handle);
            GL.TexImage2D(TextureTarget.Texture2D, 0, PixelInternalFormat.Rgba, width, height, 0, PixelFormat.Rgba, PixelType.UnsignedByte, pixels);
            GL.GenerateMipmap(GenerateMipmapTarget.Texture2D);
            /** END NEW */

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
