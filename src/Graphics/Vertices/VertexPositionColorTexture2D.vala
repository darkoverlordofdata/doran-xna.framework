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

    // based on SpriteRenderer from LearnOpenGL - Breakout
    
    public struct VertexPositionColorTexture2D
    {
        public Vector2 Position;
        public Vector4 Color;
        public Vector2 TextureCoordinate;
        public static VertexDeclaration VertexDeclaration;

        public VertexPositionColorTexture2D(Vector2? position=null, Vector4? color=null, Vector2? textureCoordinate=null)
        {
            Position = position ?? new Vector2();
            Color = color ?? new Vector4();
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
            return @"{{Position: $Position Color: $Color TextureCoordinate: $TextureCoordinate}}";
        }

        public bool Equals(VertexPositionColorTexture2D obj)
        {
            return (Position.Equals(obj.Position) && Color.Equals(obj.Color) && TextureCoordinate.Equals(obj.TextureCoordinate));
        }
    }
}
