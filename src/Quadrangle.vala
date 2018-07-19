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
//
//  We're using Quadrangle because referencing 
//  Rectangle here causes a symbol redefinition error:
//
//      WINGDIAPI WINBOOL WINAPI Rectangle(HDC hdc,int left,int top,int right,int bottom);
//
//  Really, Windoze?
//
namespace Microsoft.Xna.Framework 
{
    /**
     * Describes a 2D-rectangle
     */
    public struct Quadrangle 
    {
        public int X;
        public int Y;
        public int Width;
        public int Height;

        public Quadrangle(int x, int y, int width, int height) {
            this.X = x;
            this.Y = y;
            this.Width = width;
            this.Height = height;
        }
        /// <summary>
        /// Gets whether or not the provided <see cref="Quadrangle"/> lies within the bounds of this <see cref="Quadrangle"/>.
        /// </summary>
        /// <param name="value">The <see cref="Quadrangle"/> to check for inclusion in this <see cref="Quadrangle"/>.</param>
        /// <returns><c>true</c> if the provided <see cref="Quadrangle"/>'s bounds lie entirely inside this <see cref="Quadrangle"/>; <c>false</c> otherwise.</returns>
        public bool Contains(Quadrangle value)
        {
            return ((((this.X <= value.X) && ((value.X + value.Width) <= (this.X + this.Width))) && (this.Y <= value.Y)) && ((value.Y + value.Height) <= (this.Y + this.Height)));
        }

        
    }
}