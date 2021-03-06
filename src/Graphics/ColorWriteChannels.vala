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
    /// Defines the color channels for render target blending operations.
    /// </summary>
	[Flags]
	public enum ColorWriteChannels
	{
        /// <summary>
        /// No channels selected.
        /// </summary>
		None = 0,
        /// <summary>
        /// Red channel selected.
        /// </summary>
		Red = 1,
        /// <summary>
        /// Green channel selected.
        /// </summary>
		Green = 2,
        /// <summary>
        /// Blue channel selected.
        /// </summary>
		Blue = 4,
        /// <summary>
        /// Alpha channel selected.
        /// </summary>
		Alpha = 8,
        /// <summary>
        /// All channels selected.
        /// </summary>
		All = 15
	}
}