
namespace Microsoft.Xna.Framework.Graphics
{
    public struct VertexPositionColorTexture 
    {
        public Vector3 Position;
        public Color Color;
        public Vector2 TextureCoordinate;
        public static VertexDeclaration VertexDeclaration;

        public VertexPositionColorTexture(Vector3? position=null, Color? color=null, Vector2? textureCoordinate=null)
        {
            Position = position ?? Vector3.Zero;
            Color = color ?? Color.White;
            TextureCoordinate = textureCoordinate ?? Vector2.Zero;
        }
		
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
            // return @"{{Position: $Position TextureCoordinate: $TextureCoordinate }}";
        }

        public bool Equals(VertexPositionColorTexture obj)
        {
            return (Position.Equals(obj.Position) && Color.Equals(obj.Color) && TextureCoordinate.Equals(TextureCoordinate));
            // return (Position.Equals(obj.Position) && TextureCoordinate.Equals(TextureCoordinate));
        }
    }
}
