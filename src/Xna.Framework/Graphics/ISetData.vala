
using System;

namespace Microsoft.Xna.Framework.Graphics
{
    /// <summary>
    /// Used to set data for the object, 
    /// usually from the Corange cache
    /// </summary>
    /// <param name="path"></param>
    public interface ISetData : Object 
    {
        public abstract void SetData(string path);
    }
}