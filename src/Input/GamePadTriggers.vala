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
    /// A struct that countains information on the left and the right trigger buttons.
    /// </summary>
    public struct GamePadTriggers
    {
        /// <summary>
        /// Gets the position of the left trigger.
        /// </summary>
        /// <value>A value from 0.0f to 1.0f representing left trigger.</value>
        public float Left { get; private set; }

        /// <summary>
        /// Gets the position of the right trigger.
        /// </summary>
        /// <value>A value from 0.0f to 1.0f representing right trigger.</value>
        public float Right { get; private set; }

        /// <summary>
        /// Initializes a new instance of the <see cref="T:Microsoft.Xna.Framework.Input.GamePadTriggers"/> struct.
        /// </summary>
        /// <param name="leftTrigger">The position of the left trigger, the value will get clamped between 0.0f and 1.0f.</param>
        /// <param name="rightTrigger">The position of the right trigger, the value will get clamped between 0.0f and 1.0f.</param>
        public GamePadTriggers(float leftTrigger, float rightTrigger) 
        {
            Left = MathHelper.Clampf(leftTrigger, 0f, 1f);
            Right = MathHelper.Clampf(rightTrigger, 0f, 1f);
        }

        /// <summary>
        /// Returns a value indicating whether this instance is equal to a specified object.
        /// </summary>
        /// <param name="obj">An object to compare to this instance.</param>
        /// <returns>true if <paramref name="obj"/> is a <see cref="GamePadTriggers"/> and has the same value as this instance; otherwise, false.</returns>
        public bool Equals(GamePadTriggers obj)
        {
            return (Left == obj.Left) && (Right == obj.Right);
        }

        /// <summary>
        /// Serves as a hash function for a <see cref="T:Microsoft.Xna.Framework.Input.GamePadTriggers"/> object.
        /// </summary>
        /// <returns>A hash code for this instance that is suitable for use in hashing algorithms and data structures such as a
        /// hash table.</returns>
        public int GetHashCode()
        {
            return (Left.GetHashCode() * 397) ^ Right.GetHashCode();
        }

        /// <summary>
        /// Returns a <see cref="T:System.String"/> that represents the current <see cref="T:Microsoft.Xna.Framework.Input.GamePadTriggers"/>.
        /// </summary>
        /// <returns>A <see cref="T:System.String"/> that represents the current <see cref="T:Microsoft.Xna.Framework.Input.GamePadTriggers"/>.</returns>
        public string to_string()
        {
            return @"[GamePadTriggers: Left=$Left, Right=$Right]";
        }
    }
}
