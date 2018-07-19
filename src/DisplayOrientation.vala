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
    using System;

    /// <summary>
    /// Defines the orientation of the display.
    /// </summary>
    [Flags]
    public enum DisplayOrientation
    {
        /// <summary>
        /// The default orientation.
        /// </summary>
        Default = 0,
        /// <summary>
        /// The display is rotated counterclockwise into a landscape orientation. Width is greater than height.
        /// </summary>
        LandscapeLeft = 1,
        /// <summary>
        /// The display is rotated clockwise into a landscape orientation. Width is greater than height.
        /// </summary>
        LandscapeRight = 2,
        /// <summary>
        /// The display is rotated as portrait, where height is greater than width.
        /// </summary>
        Portrait = 4,
        /// <summary>
        /// The display is rotated as inverted portrait, where height is greater than width.
        /// </summary>
        PortraitDown = 8,
        /// <summary>
        /// Unknown display orientation.
        /// </summary>
        Unknown = 16
    }
}