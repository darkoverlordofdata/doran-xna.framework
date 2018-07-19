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
    public enum TextureWrap 
    {
        ClampToEdge = 1,
        Repeat = 2;
        public static TextureWrap from(string value) 
        {
            switch (value)  {
                case "ClampToEdge": return ClampToEdge;
                case "Repeat": return Repeat;
                default: return ClampToEdge;
                //  default: throw new SdlException.NotReached("TextureWrap.from[%s]", value);
            }
        }
        public string ToString() 
        {
            switch (this) {
                case ClampToEdge: return "ClampToEdge";
                case Repeat: return "Repeat";
                default: return "ClampToEdge";
                //  default: throw new SdlException.NotReached("TextureWrap.ToString[%s]", this.ToString());
            }
        }
    }
}