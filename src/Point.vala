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
namespace Microsoft.Xna.Framework 
{
    /**
     *  Describes a 2D-point.
     */
    public struct Point 
    {
        public int X;
        public int Y;

        public Point(int x, int y) 
        {
            this.X = x;
            this.Y = y;
        }

        public static Point Zero() {
            return Point(0, 0);
        }

        public Point Add(Point other) {
            return Point(X + other.X, Y + other.Y);
        }

        public Point Sub(Point other) {
            return Point(X - other.X, Y - other.Y);
        }

        public Point Mul(Point other) {
            return Point(X * other.X, Y * other.Y);
        }

        public Point Div(Point other) {
            return Point(X / other.X, Y / other.Y);
        }

        public bool Equal(Point other) {
            return (X == other.X) && (Y == other.Y);
        }

        public string to_string() {
            return @"{X: $X, Y: $Y}";
        }

        public string ToString() {
            return @"$this";
            // return to_string();
        }

        public Vector2 ToVector2() {
            return new Vector2(X, Y); 
        }
    }
}