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
    /// Defines if the previous content in a render target is preserved when it set on the graphics device.
    /// </summary>
    public enum RenderTargetUsage
    {
        /// <summary>
        /// The render target content will not be preserved.
        /// </summary>
        DiscardContents,
        /// <summary>
        /// The render target content will be preserved even if it is slow or requires extra memory.
        /// </summary>
        PreserveContents,
        /// <summary>
        /// The render target content might be preserved if the platform can do so without a penalty in performance or memory usage.
        /// </summary>
        PlatformContents
    }
}

