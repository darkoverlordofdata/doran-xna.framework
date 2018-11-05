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

    public class SpriteBatchItem : Comparable<SpriteBatchItem>
    {
        private Vector2 UnitY = new Vector2(0, 1);
        private Vector2 UnitX = new Vector2(1, 0);
        
        public Texture2D Texture;
        public float SortKey;
        // Triangle 1
        public VertexPositionColorTexture VertexTL;
        public VertexPositionColorTexture VertexTR;
        public VertexPositionColorTexture VertexBL;
        public VertexPositionColorTexture VertexBR;

		public SpriteBatchItem ()
		{
			VertexTL = new VertexPositionColorTexture();
            VertexTR = new VertexPositionColorTexture();
            VertexBL = new VertexPositionColorTexture();
            VertexBR = new VertexPositionColorTexture();            
 		}


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
			VertexTL.Position.X = x+dx*cos-dy*sin;
            VertexTL.Position.Y = y+dx*sin+dy*cos;
            VertexTL.Position.Z = depth;
            VertexTL.Color = color;
            VertexTL.TextureCoordinate.X = texCoordTL.X;
            VertexTL.TextureCoordinate.Y = texCoordTL.Y;

			VertexTR.Position.X = x+(dx+w)*cos-dy*sin;
            VertexTR.Position.Y = y+(dx+w)*sin+dy*cos;
            VertexTR.Position.Z = depth;
            VertexTR.Color = color;
            VertexTR.TextureCoordinate.X = texCoordBR.X;
            VertexTR.TextureCoordinate.Y = texCoordTL.Y;

			VertexBL.Position.X = x+dx*cos-(dy+h)*sin;
            VertexBL.Position.Y = y+dx*sin+(dy+h)*cos;
            VertexBL.Position.Z = depth;
            VertexBL.Color = color;
            VertexBL.TextureCoordinate.X = texCoordTL.X;
            VertexBL.TextureCoordinate.Y = texCoordBR.Y;

			VertexBR.Position.X = x+(dx+w)*cos-(dy+h)*sin;
            VertexBR.Position.Y = y+(dx+w)*sin+(dy+h)*cos;
            VertexBR.Position.Z = depth;
            VertexBR.Color = color;
            VertexBR.TextureCoordinate.X = texCoordBR.X;
            VertexBR.TextureCoordinate.Y = texCoordBR.Y;

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
            VertexTL.Position.X = x;
            VertexTL.Position.Y = y;
            VertexTL.Position.Z = depth;
            VertexTL.Color = color;
            VertexTL.TextureCoordinate.X = texCoordTL.X;
            VertexTL.TextureCoordinate.Y = texCoordTL.Y;

            VertexTR.Position.X = x + w;
            VertexTR.Position.Y = y;
            VertexTR.Position.Z = depth;
            VertexTR.Color = color;
            VertexTR.TextureCoordinate.X = texCoordBR.X;
            VertexTR.TextureCoordinate.Y = texCoordTL.Y;

            VertexBL.Position.X = x;
            VertexBL.Position.Y = y + h;
            VertexBL.Position.Z = depth;
            VertexBL.Color = color;
            VertexBL.TextureCoordinate.X = texCoordTL.X;
            VertexBL.TextureCoordinate.Y = texCoordBR.Y;

            VertexBR.Position.X = x + w;
            VertexBR.Position.Y = y + h;
            VertexBR.Position.Z = depth;
            VertexBR.Color = color;
            VertexBR.TextureCoordinate.X = texCoordBR.X;
            VertexBR.TextureCoordinate.Y = texCoordBR.Y;
        }

        public override int CompareTo(SpriteBatchItem other)
        {
            return SortKey.CompareTo(other.SortKey);
        }

    }
}