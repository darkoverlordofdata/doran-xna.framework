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

    public class Texture2D : Texture//, ISetData
    {
        public enum SurfaceType
        {
            Texture,
            RenderTarget,
            SwapChainRenderTarget,
        }

        public enum SurfaceFormat
        {
            Default,
            Grey,
            GreyAlpha,
            Rgb,
            Rgba
        }

		internal int width = 0;
		internal int height = 0;
        internal int format = SurfaceFormat.Rgba;
        internal int channels = 0;
        internal int ArraySize;
        internal int Handle;
                
        internal float TexelWidth { get; private set; }
        internal float TexelHeight { get; private set; }

        /// <summary>
        /// Gets the dimensions of the texture
        /// </summary>
        public Rectangle Bounds
        {
            get
            {
				return new Rectangle(0, 0, this.width, this.height);
            }
        }

        /// <summary>
        /// Changes the pixels of the texture
        /// </summary>
        /// <param name="path"></param>
        public override void SetData(string path)
        {
            GL.GenTextures(1, ref Handle);
            GL.BindTexture(TextureTarget.Texture2D, Handle); 
            // all upcoming TextureTarget.Texture2D operations now have effect on this texture object
            // set the texture wrapping parameters
            GL.TexParameteri(TextureTarget.Texture2D, TextureParameterName.TextureWrapS, (int)TextureWrapMode.Repeat);	
            // set texture wrapping to GL_REPEAT (default wrapping method)
            GL.TexParameteri(TextureTarget.Texture2D, TextureParameterName.TextureWrapT, (int)TextureWrapMode.Repeat);
            // set texture filtering parameters
            GL.TexParameteri(TextureTarget.Texture2D, TextureParameterName.TextureMinFilter, (int)TextureMinFilter.Linear);
            GL.TexParameteri(TextureTarget.Texture2D, TextureParameterName.TextureMagFilter, (int)TextureMagFilter.Linear);

            Image pixels = Image.Load(path, out width, out height, out channels, format);

            print("%s %d %d %d\n", path, width, height, channels);
            if (channels == 4)
                GL.TexImage2D(TextureTarget.Texture2D, 0, PixelInternalFormat.Rgba, width, height, 0, PixelFormat.Rgba, PixelType.UnsignedByte, pixels);
            else if (channels == 3)
                GL.TexImage2D(TextureTarget.Texture2D, 0, PixelInternalFormat.Rgb, width, height, 0, PixelFormat.Rgb, PixelType.UnsignedByte, pixels);
            else if (channels == 2)
                GL.TexImage2D(TextureTarget.Texture2D, 0, PixelInternalFormat.R8, width, height, 0, PixelFormat.Rgb, PixelType.UnsignedByte, pixels);
            GL.GenerateMipmap(GenerateMipmapTarget.Texture2D);
            pixels.Dispose();
            this.format = format;

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

        // // Generates texture from image data
        // public void Generate(int width, int height, IntPtr data)
        // {
        //     Width = width;
        //     Height = height;
        //     // Create Texture
        //     GL.GenTextures(1, ref Handle);
        //     GL.BindTexture(TextureTarget.Texture2D, Handle);
        //     // ?? GL.TexImage2D(TextureTarget.Texture2D, 0, InternalFormat, (GLsizei)width, (GLsizei)height, 0, ImageFormat, GL_UNSIGNED_BYTE, (GLvoid*)data);
        //     // Set Texture wrap and filter modes
        //     // all upcoming TextureTarget.Texture2D operations now have effect on this texture object
        //     // set the texture wrapping parameters
        //     GL.TexParameteri(TextureTarget.Texture2D, TextureParameterName.TextureWrapS, (int)TextureWrapMode.Repeat);	
        //     // set texture wrapping to GL_REPEAT (default wrapping method)
        //     GL.TexParameteri(TextureTarget.Texture2D, TextureParameterName.TextureWrapT, (int)TextureWrapMode.Repeat);
        //     // set texture filtering parameters
        //     GL.TexParameteri(TextureTarget.Texture2D, TextureParameterName.TextureMinFilter, (int)TextureMinFilter.Linear);
        //     GL.TexParameteri(TextureTarget.Texture2D, TextureParameterName.TextureMagFilter, (int)TextureMagFilter.Linear);
        //    // Unbind texture
        //     GL.BindTexture(TextureTarget.Texture2D, 0);
        // }

        // Binds the texture as the current active TextureTarget.Texture2D texture object
        public void Bind()
        {
            GL.BindTexture(TextureTarget.Texture2D, Handle);
        }
	}
}
