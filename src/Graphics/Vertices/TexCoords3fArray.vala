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
    public class TexCoords3fArray : Object
    {
        public float[] data;
        public int count;
        public int size;

        public TexCoords3fArray(int size)
        {
            this.size = (int)sizeof(float) * 2 * 6 * size;
            count = 0;
            data = new float[2 * 6 * size];
        }

        public void Add(float x, float y)
        {
            data[count++] = x;
            data[count++] = y;
        }
    }        
}