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
    public enum Format 
    {
        Alpha,
        Intensity,
        LuminanceAlpha,
        RGB565,
        RGBA4444,
        RGB888,
        RGBA8888;
        public static Format from(string value) 
        {
            switch (value)  {
                case "Alpha": return Alpha;
                case "Intensity": return Intensity;
                case "LuminanceAlpha": return LuminanceAlpha;
                case "RGB565": return RGB565;
                case "RGBA4444": return RGBA4444;
                case "RGB888": return RGB888;
                case "RGBA8888": return RGBA8888;
                //  default: throw new SdlException.NotReached("Format.from["+value+"]");
                default: return RGBA8888;
            }
        }
        public string ToString() 
        {
            switch (this) {
                case Alpha: return "Alpha";
                case Intensity: return "Intensity";
                case LuminanceAlpha: return "LuminanceAlpha";
                case RGB565: return "RGB565";
                case RGBA4444: return "RGBA4444";
                case RGB888: return "RGB888";
                case RGBA8888: return "RGBA8888";
                //  default: throw new SdlException.NotReached("Format.ToString["+this.ToString()+"]");
                default: return "RGBA8888";
            }
        }
    }
}