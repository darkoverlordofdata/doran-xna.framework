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

    /*  0,1  1,1
     *  TL    TR
     *   0----1 0,1,2,3 = index offsets for vertex indices
     *   |   /| TL,TR,BL,BR are vertex references in SpriteBatchItem.
     *   |  / |
     *   | /  |
     *   |/   |
     *   2----3
     *  BL    BR
     *  0,0   1,0
     */

    public class SpriteBatchItem : Object, IComparable<SpriteBatchItem>
    {
        private const Vector2 UnitY = { 0, 1 };
        private const Vector2 UnitX = { 1, 0 };
        
        public Texture2D Texture;
        public float SortKey;
        // Triangle 1
        public VertexPositionColorTexture Vertex1TR;
        public VertexPositionColorTexture Vertex1TL;
        public VertexPositionColorTexture Vertex1BL;
        // Triangle 2
        public VertexPositionColorTexture Vertex2TR;
        public VertexPositionColorTexture Vertex2BR;
        public VertexPositionColorTexture Vertex2BL;


		public void Set2( 
            float x, 
            float y, 
            float dx,
            float dy, 
            float w, 
            float h, 
            float sin, 
            float cos, 
            Color color, 
            Vector2 texCoordTL, 
            Vector2 texCoordBR, 
            float depth )
		{
			Vertex1TL.Position.X = x+dx*cos-dy*sin;
            Vertex1TL.Position.Y = y+dx*sin+dy*cos;
            Vertex1TL.Position.Z = depth;
            Vertex1TL.Color = color;
            Vertex1TL.TextureCoordinate.X = texCoordTL.X;
            Vertex1TL.TextureCoordinate.Y = texCoordTL.Y;

			Vertex1TR.Position.X = x+(dx+w)*cos-dy*sin;
            Vertex1TR.Position.Y = y+(dx+w)*sin+dy*cos;
            Vertex1TR.Position.Z = depth;
            Vertex1TR.Color = color;
            Vertex1TR.TextureCoordinate.X = texCoordBR.X;
            Vertex1TR.TextureCoordinate.Y = texCoordTL.Y;

			Vertex1BL.Position.X = x+dx*cos-(dy+h)*sin;
            Vertex1BL.Position.Y = y+dx*sin+(dy+h)*cos;
            Vertex1BL.Position.Z = depth;
            Vertex1BL.Color = color;
            Vertex1BL.TextureCoordinate.X = texCoordTL.X;
            Vertex1BL.TextureCoordinate.Y = texCoordBR.Y;


			Vertex2TR.Position.X = x+(dx+w)*cos-dy*sin;
            Vertex2TR.Position.Y = y+(dx+w)*sin+dy*cos;
            Vertex2TR.Position.Z = depth;
            Vertex2TR.Color = color;
            Vertex2TR.TextureCoordinate.X = texCoordBR.X;
            Vertex2TR.TextureCoordinate.Y = texCoordTL.Y;

			Vertex2BR.Position.X = x+(dx+w)*cos-(dy+h)*sin;
            Vertex2BR.Position.Y = y+(dx+w)*sin+(dy+h)*cos;
            Vertex2BR.Position.Z = depth;
            Vertex2BR.Color = color;
            Vertex2BR.TextureCoordinate.X = texCoordBR.X;
            Vertex2BR.TextureCoordinate.Y = texCoordBR.Y;

			Vertex2BL.Position.X = x+dx*cos-(dy+h)*sin;
            Vertex2BL.Position.Y = y+dx*sin+(dy+h)*cos;
            Vertex2BL.Position.Z = depth;
            Vertex2BL.Color = color;
            Vertex2BL.TextureCoordinate.X = texCoordTL.X;
            Vertex2BL.TextureCoordinate.Y = texCoordBR.Y;
		}
        
        public void Set(
            float x, 
            float y, 
            float w, 
            float h, 
            Color color, 
            Vector2 texCoordTL, 
            Vector2 texCoordBR,
            float depth)
        {
            // TR { 1, 1 }
            Vertex1TR.Position.X = x + w;
            Vertex1TR.Position.Y = y;
            Vertex1TR.Position.Z = depth;
            Vertex1TR.Color = color;
            Vertex1TR.TextureCoordinate.X = texCoordBR.X;
            Vertex1TR.TextureCoordinate.Y = texCoordTL.Y;
            // TL { 0, 1 }
            Vertex1TL.Position.X = x;
            Vertex1TL.Position.Y = y;
            Vertex1TL.Position.Z = depth;
            Vertex1TL.Color = color;
            Vertex1TL.TextureCoordinate.X = texCoordTL.X;
            Vertex1TL.TextureCoordinate.Y = texCoordTL.Y;
            // BL { 0, 0 }
            Vertex1BL.Position.X = x;
            Vertex1BL.Position.Y = y + h;
            Vertex1BL.Position.Z = depth;
            Vertex1BL.Color = color;
            Vertex1BL.TextureCoordinate.X = texCoordTL.X;
            Vertex1BL.TextureCoordinate.Y = texCoordBR.Y;
            // TR { 1, 1 }
            Vertex2TR.Position.X = x + w;
            Vertex2TR.Position.Y = y;
            Vertex2TR.Position.Z = depth;
            Vertex2TR.Color = color;
            Vertex2TR.TextureCoordinate.X = texCoordBR.X;
            Vertex2TR.TextureCoordinate.Y = texCoordTL.Y;
            // BR { 1, 0 }
            Vertex2BR.Position.X = x + w;
            Vertex2BR.Position.Y = y + h;
            Vertex2BR.Position.Z = depth;
            Vertex2BR.Color = color;
            Vertex2BR.TextureCoordinate.X = texCoordBR.X;
            Vertex2BR.TextureCoordinate.Y = texCoordBR.Y;
            // BL { 0, 0 }
            Vertex2BL.Position.X = x;
            Vertex2BL.Position.Y = y + h;
            Vertex2BL.Position.Z = depth;
            Vertex2BL.Color = color;
            Vertex2BL.TextureCoordinate.X = texCoordTL.X;
            Vertex2BL.TextureCoordinate.Y = texCoordBR.Y;

        }

        public int CompareTo(SpriteBatchItem other)
        {
            return SortKey.CompareTo(other.SortKey);
        }

    }
}