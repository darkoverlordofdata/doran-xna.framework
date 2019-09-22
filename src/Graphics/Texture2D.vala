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
    // using Stb;
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
            Auto,
            Grey,
            GreyAlpha,
            Rgb,
            Rgba
        }

		internal int width = 0;
		internal int height = 0;
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

            print(@"Texture2d::SetData $path\n");
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

            Sdl.Surface? surface = Sdl.IMG_Load(path);
            if (Sdl.MustLock(surface)) 
                Sdl.LockSurface(surface);
            this.width = surface.Width;
            this.height = surface.Height;
            
            switch (surface.Format->Format)
            {
                case Sdl.PixelFormatEnum.PIXELFORMAT_ABGR8888:
                    GL.TexImage2D(TextureTarget.Texture2D, 0, PixelInternalFormat.Rgba, width, height, 0, PixelFormat.Rgba, PixelType.UnsignedByte, surface.Pixels);
                    break;

                case Sdl.PixelFormatEnum.PIXELFORMAT_BGR888:
                    GL.TexImage2D(TextureTarget.Texture2D, 0, PixelInternalFormat.Rgb, width, height, 0, PixelFormat.Rgb, PixelType.UnsignedByte, surface.Pixels);
                    break;

                default: // assert_not_reached ();
                    print("PixelType not found : %s\n", (string)Sdl.GetPixelFormatName(surface.Format->Format));
                    break;
            }

            GL.GenerateMipmap(GenerateMipmapTarget.Texture2D);
            if (Sdl.MustLock(surface)) 
                Sdl.UnlockSurface(surface);
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

        // Binds the texture as the current active TextureTarget.Texture2D texture object
        public void Bind()
        {
            GL.BindTexture(TextureTarget.Texture2D, Handle);
        }
	}
}
