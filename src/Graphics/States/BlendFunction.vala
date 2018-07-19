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
    /// Defines a function for color blending.
    /// </summary>
	public enum BlendFunction
	{
        /// <summary>
        /// The function will adds destination to the source. (srcColor * srcBlend) + (destColor * destBlend)
        /// </summary>
		Add,
        /// <summary>
        /// The function will subtracts destination from source. (srcColor * srcBlend) − (destColor * destBlend)
        /// </summary>
		Subtract,
        /// <summary>
        /// The function will subtracts source from destination. (destColor * destBlend) - (srcColor * srcBlend) 
        /// </summary>
        ReverseSubtract,
        /// <summary>
        /// The function will extracts minimum of the source and destination. min((srcColor * srcBlend),(destColor * destBlend))
        /// </summary>
        Min, 
        /// <summary>
        /// The function will extracts maximum of the source and destination. max((srcColor * srcBlend),(destColor * destBlend))
        /// </summary>
		Max
	}
}
