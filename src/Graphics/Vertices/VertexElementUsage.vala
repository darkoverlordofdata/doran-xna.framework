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
    /// Defines usage for vertex elements.
    /// </summary>
    public enum VertexElementUsage
    {
        /// <summary>
        /// Position data.
        /// </summary>
        Position,
        /// <summary>
        /// Color data.
        /// </summary>
        Color,   
        /// <summary>
        /// Texture coordinate data or can be used for user-defined data.
        /// </summary>
        TextureCoordinate, 
        /// <summary>
        /// Normal data.
        /// </summary>
        Normal,
        /// <summary>
        /// Binormal data.
        /// </summary>
        Binormal,
        /// <summary>
        /// Tangent data.
        /// </summary>
        Tangent,
        /// <summary>
        /// Blending indices data.
        /// </summary>
        BlendIndices,
        /// <summary>
        /// Blending weight data.
        /// </summary>
        BlendWeight,     
        /// <summary>
        /// Depth data.
        /// </summary>
        Depth,
        /// <summary>
        /// Fog data.
        /// </summary>
        Fog,      
        /// <summary>
        /// Point size data. Usable for drawing point sprites.
        /// </summary>
        PointSize,
        /// <summary>
        /// Sampler data for specifies the displacement value to look up.
        /// </summary>
        Sample,     
        /// <summary>
        /// Single, positive float value, specifies a tessellation factor used in the tessellation unit to control the rate of tessellation.
        /// </summary>
        TessellateFactor
    }
}
