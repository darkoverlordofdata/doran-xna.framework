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
    using System;

    /// <summary>
    /// Defines the buffers for clearing when calling <see cref="GraphicsDevice.Clear(ClearOptions, Color, float, int)"/> operation.
    /// </summary>
    [Flags]
    public enum ClearOptions
    {
        /// <summary>
        /// Color buffer.
        /// </summary>
		Target = 1,
        /// <summary>
        /// Depth buffer.
        /// </summary>
        DepthBuffer = 2,
        /// <summary>
        /// Stencil buffer.
        /// </summary>
        Stencil = 4        
    }
}

