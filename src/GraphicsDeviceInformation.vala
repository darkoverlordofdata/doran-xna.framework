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
    /// The settings used in creation of the graphics device.
    /// See <see cref="GraphicsDeviceManager.PreparingDeviceSettings"/>.
    /// </summary>
    public class GraphicsDeviceInformation : Object
    {	
        /// <summary>
        /// The graphics adapter on which the graphics device will be created.
        /// </summary>
        /// <remarks>
        /// This is only valid on desktop systems where multiple graphics 
        /// adapters are possible.  Defaults to <see cref="GraphicsAdapter.DefaultAdapter"/>.
        /// </remarks>
        public GraphicsAdapter Adapter { get; set; }
        
        /// <summary>
        /// The requested graphics device feature set. 
        /// </summary>
        public GraphicsProfile GraphicsProfile { get; set; }
        
        /// <summary>
        /// The settings that define how graphics will be presented to the display.
        /// </summary>
        public PresentationParameters PresentationParameters { get; set; }
    }
}

