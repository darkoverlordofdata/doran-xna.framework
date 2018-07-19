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
    // using System.Globalization;
    // using System.Runtime.Serialization;

    // [DataContract]
    public class DisplayMode : Object
    {
        // #region Fields

        private SurfaceFormat format;
        private int height;
        private int width;

        // #endregion Fields

        // #region Properties
        
        public float AspectRatio {
            get { return (float)width / (float)height; }
        }

        public SurfaceFormat Format {
            get { return format; }
        }

        public int Height {
            get { return this.height; }
        }

        public int Width {
            get { return this.width; }
        }
        
        // public  TitleSafeArea {
        //     get { return GraphicsDevice.GetTitleSafeArea(0, 0, width, height); }
        // }

        // #endregion Properties

        // #region Constructors
        
        internal DisplayMode(int width, int height, SurfaceFormat format)
        {
            this.width = width;
            this.height = height;
            this.format = format;
        }

        // #endregion Constructors


        // #region Public Methods

        public bool Equals(Object obj)
        {
            return obj is DisplayMode && this == (DisplayMode)obj;
        }

        // public int GetHashCode()
        // {
        //     return (this.width.GetHashCode() ^ this.height.GetHashCode() ^ this.format.GetHashCode());
        // }

        public string ToString()
        {
            return @"{Width:$width Height:$height Format:$Format AspectRatio:$AspectRatio}";
        }

        public string to_string()
        {
            return ToString();
        }

        // #endregion Public Methods
    }
}
