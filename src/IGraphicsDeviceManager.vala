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
    using Microsoft.Xna.Framework.Graphics;

    /// <summary>
    /// Used by the platform code to control the graphics device.
    /// </summary>
    // public interface IGraphicsDeviceManager : Object
    public abstract class IGraphicsDeviceManager : IGraphicsDeviceService
    {
        /// <summary>
        /// Called at the start of rendering a frame.
        /// </summary>
        /// <returns>Returns true if the frame should be rendered.</returns>
        public abstract bool BeginDraw();

        /// <summary>
        /// Called to create the graphics device.
        /// </summary>
        /// <remarks>Does nothing if the graphics device is already created.</remarks>
        public abstract void CreateDevice();

        /// <summary>
        /// Called after rendering to present the frame to the screen.
        /// </summary>
        public abstract void EndDraw();
    }
}

