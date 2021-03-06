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
namespace Microsoft.Xna.Framework.Input
{
    /// <summary>
    /// Describes joystick hat state.
    /// </summary>
    public struct JoystickHat
    {
        /// <summary>
        /// Gets if joysticks hat "down" is pressed.
        /// </summary>
        /// <value><see cref="ButtonState.Pressed"/> if the button is pressed otherwise, <see cref="ButtonState.Released"/>.</value>
        public ButtonState Down { get; internal set; }

        /// <summary>
        /// Gets if joysticks hat "left" is pressed.
        /// </summary>
        /// <value><see cref="ButtonState.Pressed"/> if the button is pressed otherwise, <see cref="ButtonState.Released"/>.</value>
        public ButtonState Left { get; internal set; }

        /// <summary>
        /// Gets if joysticks hat "right" is pressed.
        /// </summary>
        /// <value><see cref="ButtonState.Pressed"/> if the button is pressed otherwise, <see cref="ButtonState.Released"/>.</value>
        public ButtonState Right { get; internal set; }

        /// <summary>
        /// Gets if joysticks hat "up" is pressed.
        /// </summary>
        /// <value><see cref="ButtonState.Pressed"/> if the button is pressed otherwise, <see cref="ButtonState.Released"/>.</value>
        public ButtonState Up { get; internal set; }


        /// <summary>
        /// Determines whether the specified <see cref="object"/> is equal to the current <see cref="T:Microsoft.Xna.Framework.Input.JoystickHat"/>.
        /// </summary>
        /// <param name="obj">The <see cref="object"/> to compare with the current <see cref="T:Microsoft.Xna.Framework.Input.JoystickHat"/>.</param>
        /// <returns><c>true</c> if the specified <see cref="object"/> is equal to the current
        /// <see cref="T:Microsoft.Xna.Framework.Input.JoystickHat"/>; otherwise, <c>false</c>.</returns>
        public bool Equals(JoystickHat obj)
        {
            return (Down == obj.Down) &&
                (Left == obj.Left) &&
                (Right == obj.Right) &&
                (Up == obj.Up);
        }

        /// <summary>
        /// Serves as a hash function for a <see cref="T:Microsoft.Xna.Framework.Input.JoystickHat"/> object.
        /// </summary>
        /// <returns>A hash code for this instance that is suitable for use in hashing algorithms and data structures such as a
        /// hash table.</returns>
        public int GetHashCode()
        {
            var hash = 0;

            if (Left == ButtonState.Pressed)
                hash |= (1 << 3);
            if (Up == ButtonState.Pressed)
                hash |= (1 << 2);
            if (Right == ButtonState.Pressed)
                hash |= (1 << 1);
            if (Down == ButtonState.Pressed)
                hash |= (1 << 0);

            return hash;
        }

        /// <summary>
        /// Returns a <see cref="T:System.String"/> that represents the current <see cref="T:Microsoft.Xna.Framework.Input.JoystickHat"/> in a format of 0000 where each number represents a boolean value of each respecting object property: Left, Up, Right, Down.
        /// </summary>
        /// <returns>A <see cref="T:System.String"/> that represents the current <see cref="T:Microsoft.Xna.Framework.Input.JoystickHat"/>.</returns>
        public string to_string()
        {
            return @"$Left $Up $Right $Down";
            // return "" + (int)Left + (int)Up + (int)Right + (int)Down;
        }
    }
}

