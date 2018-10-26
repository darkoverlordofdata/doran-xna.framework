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
    /**
     * povo - Plain Old Vala Object
     * one for each region in the atlas file 
     */
    public class Region : Object
    {
        public Page page;
        public int index;
        public string name;
        public int offsetX;
        public int offsetY;
        public int originalWidth;
        public int originalHeight;
        public bool rotate;
        public int left;
        public int top;
        public int width;
        public int height;
        public bool flip;
        public int[] splits;
        public int[] pads;
        public bool slice9;
        public Region(
            Page page, 
            int left, 
            int top, 
            int width, 
            int height, 
            string name, 
            bool rotatate) 
        {
            this.page = page;
            this.left = left;
            this.top = top;
            this.width = width;
            this.height = height;
            this.name = name;
            this.rotate = rotate;
            this.slice9 = false;
        }
    }

}