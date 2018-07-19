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
    /// <summary>
    /// Defines how <see cref="GraphicsDevice.Present"/> updates the game window.
    /// </summary>
    public enum PresentInterval
    {
        /// <summary>
        /// Equivalent to <see cref="PresentInterval.One"/>.
        /// </summary>
        Default,
        /// <summary>
        /// The driver waits for the vertical retrace period, before updating window client area. Present operations are not affected more frequently than the screen refresh rate.
        /// </summary>
        One,
        /// <summary>
        /// The driver waits for the vertical retrace period, before updating window client area. Present operations are not affected more frequently than every second screen refresh. 
        /// </summary>
        Two,
        /// <summary>
        /// The driver updates the window client area immediately. Present operations might be affected immediately. There is no limit for framerate.
        /// </summary>
        Immediate,
    }
}