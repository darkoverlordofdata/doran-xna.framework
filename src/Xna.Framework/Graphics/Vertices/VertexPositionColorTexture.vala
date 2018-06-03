
namespace Microsoft.Xna.Framework.Graphics
{
    public struct VertexPositionColorTexture 
    {
        public Vector3 Position;
        public Color Color;
        public Vector2 TextureCoordinate;

        // public VertexPositionColorTexture(Vector3 position, Color color, Vector2 textureCoordinate)
        // {
        //     Position = position;
        //     Color = color;
        //     TextureCoordinate = textureCoordinate;
        // }
		
        public int GetHashCode()
        {
            var hashCode = Position.GetHashCode();
            hashCode = (hashCode * 397) ^ Color.GetHashCode();
            hashCode = (hashCode * 397) ^ TextureCoordinate.GetHashCode();
            return hashCode;
        }

        public string ToString()
        {
            return @"{{Position: $Position Color: $Color TextureCoordinate: $TextureCoordinate }}";
        }

        public bool Equals(VertexPositionColorTexture obj)
        {
            return (Position.Equals(obj.Position) && Color.Equals(obj.Color) && TextureCoordinate.Equals(TextureCoordinate));
        }
    }
}
