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
    using Microsoft.Xna.Framework;

    public enum SpriteFlip
    {
        NONE,
        HORIZONTAL,
        VERTICAL,
        BOTH
    }

    public class SpriteBatchItem : Comparable<SpriteBatchItem>
    {
        public uint texture;
        public float position[2];
        public float dimensions[2];
        public float clip[4];
        public float color[4];
        public float rotation;
        public float origin[2];
        public float SortKey;

        internal void SetDimensions(Rectangle clip)
        {
            dimensions[0] = (float)clip.Width;
            dimensions[1] = (float)clip.Height;
        }

        internal void SetColor()
        {
            color[0] = 1.0f;
            color[1] = 1.0f;
            color[2] = 1.0f;
            color[3] = 1.0f;
        }

        internal void SetClip(Texture2D texture, Rectangle rect)
        {
            clip[0] = (float)rect.X / (float)texture.width;
            clip[1] = (float)rect.Y / (float)texture.height;
            clip[2] = ((float)rect.X + (float)rect.Width) / (float)texture.width;
            clip[3] = ((float)rect.Y + (float)rect.Height) / (float)texture.height;
        }

        internal void SetRotation(float rot, int x, int y, Rectangle clip)
        {
            rotation = rot;
            origin[0] = (float)x + (float)clip.Width/2f;
            origin[1] = (float)y + (float)clip.Height/2f;
        }

        internal void SetScaledDimensions(Rectangle clip, Vector2 scale)
        {
            dimensions[0] = (float)clip.Width *scale.X;
            dimensions[1] = (float)clip.Height *scale.Y;
        }

        internal void SetModColor(Color rgba)
        {
            color[0] = (float)rgba.R / 255f;
            color[1] = (float)rgba.G / 255f;
            color[2] = (float)rgba.B / 255f;
            color[3] = (float)rgba.A / 255f;
        }

        internal void SetFlippedClip(SpriteFlip flip, Texture2D texture, Rectangle rect)
        {
            switch (flip)
            {
            case SpriteFlip.NONE:
                clip[0] = (float)rect.X / (float)texture.width;
                clip[1] = (float)rect.Y / (float)texture.height;
                clip[2] = (float)(rect.X + rect.Width) / (float)texture.width;
                clip[3] = (float)(rect.Y + rect.Height) / (float)texture.height;
                break;
            case SpriteFlip.HORIZONTAL:
                clip[0] = (float)(rect.X + rect.Width) / (float)texture.width;
                clip[1] = (float)rect.Y / (float)texture.height;
                clip[2] = (float)rect.X / (float)texture.width;
                clip[3] = (float)(rect.Y + rect.Height) / (float)texture.height;
                break;
            case SpriteFlip.VERTICAL:
                clip[0] = (float)rect.X / (float)texture.width;
                clip[1] = (float)(rect.Y + rect.Height) / (float)texture.height;
                clip[2] = (float)(rect.X + rect.Width) / (float)texture.width;
                clip[3] = (float)rect.Y / (float)texture.height;
                break;
            case SpriteFlip.BOTH:
                clip[0] = (float)rect.X / (float)texture.width;
                clip[1] = (float)rect.Y / (float)texture.height;
                clip[2] = (float)(rect.X + rect.Width) / (float)texture.width;
                clip[3] = (float)(rect.Y + rect.Height) / (float)texture.height;
                break;
            }
        }
        public override int CompareTo(SpriteBatchItem other)
        {
            return SortKey.CompareTo(other.SortKey);
        }

    }

}