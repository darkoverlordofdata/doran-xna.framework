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
	/// Defines formats for depth-stencil buffer.
	/// </summary>
    public enum DepthFormat
    {
        /// <summary>
        /// Depth-stencil buffer will not be created.
        /// </summary>
		None,
        /// <summary>
        /// 16-bit depth buffer.
        /// </summary>
		Depth16,
        /// <summary>
        /// 24-bit depth buffer. Equivalent of <see cref="DepthFormat.Depth24Stencil8"/> for DirectX platforms.
        /// </summary>
		Depth24,
        /// <summary>
        /// 32-bit depth-stencil buffer. Where 24-bit depth and 8-bit for stencil used.
        /// </summary>
		Depth24Stencil8
    }
}