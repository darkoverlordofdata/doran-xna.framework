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
    using Glm;
    /** Defines a rectangular area of a texture. 
     *  based on libGDX
     */
    public class TextureRegion : Object
    {
        internal Texture2D texture;
        internal int X;
        internal int Y;
        internal int Width;
        internal int Height;
        public Vec2 Scale = new Vec2(1,1);

        public Point Size
        {
            get { return new Point(Width, Height);}
        }

        public TextureRegion (
            Texture2D texture, 
            int x = -1, 
            int y = -1, 
            int width = -1, 
            int height = -1) 
        {
            if (texture == null) throw new Exception.IllegalArgumentException("texture cannot be null.");
            this.texture = texture;
            if (x == -1)
                SetRegion(0, 0, texture.Width, texture.Height);
            else
                SetRegion(x, y, width, height);

        }

        /** Constructs a region with the same texture as the specified region and sets the coordinates relative to the specified region.
        * @param width The width of the texture region.
        * @param height The height of the texture region.*/
        public TextureRegion.Clone (
            TextureRegion region, 
            int x = -1, 
            int y = -1, 
            int width = -1, 
            int height = -1) 
        {
            texture = region.texture;
            if (x == -1)
                SetRegion(region.X, region.Y, region.Width, region.Height);
            else
                SetRegion(x, y, width, height);
        }


        /** @param width The width of the texture region. May be negative to flip the sprite when drawn.
        * @param height The height of the texture region. May be negative to flip the sprite when drawn. */
        public void SetRegion (int x, int y, int width, int height) 
        {
            X = x;
            Y = y;
            Width = width;
            Height = height;
        }


        /** Sets the texture to that of the specified region and sets the coordinates relative to the specified region. */
        public void Copy (
            TextureRegion region, 
            int x = -1, 
            int y = -1, 
            int width = -1, 
            int height = -1) 
        {
            texture = region.texture;
            if (x == -1)
                SetRegion(region.X, region.Y, region.Width, region.Height);
            else
                SetRegion(region.X + x, region.Y + y, width, height);
        }

        public Texture GetTexture () 
        {
            return texture;
        }

        public void SetTexture (Texture2D texture) 
        {
            this.texture = texture;
        }

        public int GetRegionX () 
        {
            return X;
        }

        public void SetRegionX (int x) 
        {
            X = x;
        }

        public int GetRegionY () 
        {
            return Y;
        }

        public void SetRegionY (int y) 
        {
            Y = y;
        }

        /** Returns the region's width. */
        public int GetRegionWidth () 
        {
            return Width;
        }

        public void SetRegionWidth (int width) 
        {
            Width = width;
        }

        /** Returns the region's height. */
        public int GetRegionHeight () 
        {
            return Height;
        }

        public void SetRegionHeight (int height) 
        {
            Height = height;
        }

    }
}