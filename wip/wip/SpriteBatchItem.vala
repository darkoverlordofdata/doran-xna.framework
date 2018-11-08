// MonoGame - Copyright (C) The MonoGame Team
// This file is subject to the terms and conditions defined in
// file 'LICENSE.txt', which is part of this source code package.

using System;

namespace Microsoft.Xna.Framework.Graphics
{
    internal class SpriteBatchItem : IComparable<SpriteBatchItem>
	{
		public Texture2D Texture;
        public float SortKey;

        public VertexPositionColorTexture2D vertexTL;
		public VertexPositionColorTexture2D vertexTR;
		public VertexPositionColorTexture2D vertexBL;
		public VertexPositionColorTexture2D vertexBR;
		public SpriteBatchItem ()
		{
			vertexTL = new VertexPositionColorTexture2D();
            vertexTR = new VertexPositionColorTexture2D();
            vertexBL = new VertexPositionColorTexture2D();
            vertexBR = new VertexPositionColorTexture2D();            
		}
		
		public void Set ( float x, float y, float dx, float dy, float w, float h, float sin, float cos, Color color, Vector2 texCoordTL, Vector2 texCoordBR, float depth )
		{
            // TODO, Should we be just assigning the Depth Value to Z?
            // According to http://blogs.msdn.com/b/shawnhar/archive/2011/01/12/spritebatch-billboards-in-a-3d-world.aspx
            // We do.
			vertexTL.Position.X = x+dx*cos-dy*sin;
            vertexTL.Position.Y = y+dx*sin+dy*cos;
            vertexTL.Color.W = color.W;
            vertexTL.Color.X = color.X;
            vertexTL.Color.Y = color.Y;
            vertexTL.Color.Z = color.Z;
            vertexTL.TextureCoordinate.X = texCoordTL.X;
            vertexTL.TextureCoordinate.Y = texCoordTL.Y;

			vertexTR.Position.X = x+(dx+w)*cos-dy*sin;
            vertexTR.Position.Y = y+(dx+w)*sin+dy*cos;
            vertexTR.Color.W = color.W;
            vertexTR.Color.X = color.X;
            vertexTR.Color.Y = color.Y;
            vertexTR.Color.Z = color.Z;
            vertexTR.TextureCoordinate.X = texCoordBR.X;
            vertexTR.TextureCoordinate.Y = texCoordTL.Y;

			vertexBL.Position.X = x+dx*cos-(dy+h)*sin;
            vertexBL.Position.Y = y+dx*sin+(dy+h)*cos;
            vertexBL.Color.W = color.W;
            vertexBL.Color.X = color.X;
            vertexBL.Color.Y = color.Y;
            vertexBL.Color.Z = color.Z;
            vertexBL.TextureCoordinate.X = texCoordTL.X;
            vertexBL.TextureCoordinate.Y = texCoordBR.Y;

			vertexBR.Position.X = x+(dx+w)*cos-(dy+h)*sin;
            vertexBR.Position.Y = y+(dx+w)*sin+(dy+h)*cos;
            vertexBR.Color.W = color.W;
            vertexBR.Color.X = color.X;
            vertexBR.Color.Y = color.Y;
            vertexBR.Color.Z = color.Z;
            vertexBR.TextureCoordinate.X = texCoordBR.X;
            vertexBR.TextureCoordinate.Y = texCoordBR.Y;
		}

        public void Set(float x, float y, float w, float h, Color color, Vector2 texCoordTL, Vector2 texCoordBR, float depth)
        {
            vertexTL.Position.X = x;
            vertexTL.Position.Y = y;
            vertexTL.Color.W = color.W;
            vertexTL.Color.X = color.X;
            vertexTL.Color.Y = color.Y;
            vertexTL.Color.Z = color.Z;
            vertexTL.TextureCoordinate.X = texCoordTL.X;
            vertexTL.TextureCoordinate.Y = texCoordTL.Y;

            vertexTR.Position.X = x + w;
            vertexTR.Position.Y = y;
            vertexTR.Color.W = color.W;
            vertexTR.Color.X = color.X;
            vertexTR.Color.Y = color.Y;
            vertexTR.Color.Z = color.Z;
            vertexTR.TextureCoordinate.X = texCoordBR.X;
            vertexTR.TextureCoordinate.Y = texCoordTL.Y;

            vertexBL.Position.X = x;
            vertexBL.Position.Y = y + h;
            vertexBL.Color.W = color.W;
            vertexBL.Color.X = color.X;
            vertexBL.Color.Y = color.Y;
            vertexBL.Color.Z = color.Z;
            vertexBL.TextureCoordinate.X = texCoordTL.X;
            vertexBL.TextureCoordinate.Y = texCoordBR.Y;

            vertexBR.Position.X = x + w;
            vertexBR.Position.Y = y + h;
            vertexBR.Color = color;
            vertexBR.Color.W = color.W;
            vertexBR.Color.X = color.X;
            vertexBR.Color.Y = color.Y;
            vertexBR.Color.Z = color.Z;
            vertexBR.TextureCoordinate.X = texCoordBR.X;
            vertexBR.TextureCoordinate.Y = texCoordBR.Y;
        }

        #region Implement IComparable
        public int CompareTo(SpriteBatchItem other)
        {
            return SortKey.CompareTo(other.SortKey);
        }
        #endregion
    }
}

