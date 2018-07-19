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

    public enum TextureFilter 
    {
        Nearest,
        Linear,
        MipMap,
        MipMapNearestNearest,
        MipMapLinearNearest,
        MipMapNearestLinear,
        MipMapLinearLinear;
        public static TextureFilter from(string value) 
        {
            switch (value)  {
                case "Nearest": return Nearest;
                case "Linear": return Linear;
                case "MipMap": return MipMap;
                case "MipMapNearestNearest": return MipMapNearestNearest;
                case "MipMapLinearNearest": return MipMapLinearNearest;
                case "MipMapNearestLinear": return MipMapNearestLinear;
                case "MipMapLinearLinear": return MipMapLinearLinear;
                default: return Nearest;
                //  default: throw new SdlException.NotReached("TextureFilter.from["+value+"]");
            }
        }

        public bool isMipMap() 
        {
            return this != TextureFilter.Nearest && this != TextureFilter.Linear;
        }


        public string ToString() 
        {
            switch (this) {
                case Nearest: return "Nearest";
                case Linear: return "Linear";
                case MipMap: return "MipMap";
                case MipMapNearestNearest: return "MipMapNearestNearest";
                case MipMapLinearNearest: return "MipMapLinearNearest";
                case MipMapNearestLinear: return "MipMapNearestLinear";
                case MipMapLinearLinear: return "MipMapLinearLinear";
                default: return "Nearest";
                //  default: throw new SdlException.NotReached("TextureFilter.ToString["+this.ToString()+"]");
            }
        }
    }
}