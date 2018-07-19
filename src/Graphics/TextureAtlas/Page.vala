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
    using System.IO;

    /**
     * povo - Plain Old Vala Object
     * one for each region in the atlas file 
     */
    public class Page  
    {
        public static int uniqueId;
        public int id;
        public FileHandle? textureFile;
        // public Surface.TextureSurface? texture;
        public int height;
        public int width;
        public bool useMipMaps;
        public Format format;
        public int minFilter;
        public int magFilter;
        public int uWrap;
        public int vWrap;
        public Page(
            FileHandle handle, 
            int width, 
            int height, 
            bool useMipMaps, 
            Format format, 
            int minFilter,
            int magFilter, 
            int uWrap, 
            int vWrap) 
        {
            this.id = uniqueId++;
            this.textureFile = handle;
            this.height = height;
            this.width = width;
            this.useMipMaps = useMipMaps;
            this.format = format;
            this.minFilter = minFilter;
            this.magFilter = magFilter;
            this.uWrap = uWrap;
            this.vWrap = vWrap;
        }
    }

}