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

    
    public struct VertexPositionColorTexture 
    {
        public Vector3 Position;
        public Color Color;
        public Vector2 TextureCoordinate;
        public static VertexDeclaration VertexDeclaration;

        public VertexPositionColorTexture(Vector3? position=null, Color? color=null, Vector2? textureCoordinate=null)
        {
            Position = position ?? new Vector3();
            Color = color ?? Color.White;
            TextureCoordinate = textureCoordinate ?? new Vector2();
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
