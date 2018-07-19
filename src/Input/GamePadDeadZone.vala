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
    /// Specifies a type of dead zone processing to apply to Xbox 360 Controller
    /// analog sticks when calling GetState.
    /// </summary>
    public enum GamePadDeadZone
    {
        /// <summary>
        /// The values of each stick are not processed and are returned by GetState as
        /// "raw" values. This is best if you intend to implement your own dead zone
        /// processing.
        /// </summary>
        None,

        /// <summary>
        /// The X and Y positions of each stick are compared against the dead zone independently.
        /// This setting is the default when calling GetState.
        /// </summary>
        IndependentAxes,

        /// <summary>
        /// The combined X and Y position of each stick is compared to the dead zone.
        /// This provides better control than IndependentAxes when the stick is used
        /// as a two-dimensional control surface, such as when controlling a character's
        /// view in a first-person game.
        /// </summary>
        Circular
    }
}
