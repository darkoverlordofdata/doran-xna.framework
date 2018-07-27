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
    using Microsoft.Xna.Framework.Content;

    /// <summary>
    /// Used to set data for the object, 
    /// usually from the Corange cache
    /// </summary>
    /// <param name="path"></param>
    public interface ISetData : Object 
    {
        public abstract void SetData(string path);
    }

    public interface ISetContent : Object 
    {
        public abstract void SetContent(ContentManager content);
    }

}