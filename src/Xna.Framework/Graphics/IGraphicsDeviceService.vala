using System;

namespace Microsoft.Xna.Framework.Graphics 
{
    public interface IGraphicsDeviceService : Object 
    {
		public abstract GraphicsDevice GraphicsDevice { get; }
        
        // public abstract EventHandler<EventArgs> DeviceCreated { get; }
        // public abstract EventHandler<EventArgs> DeviceDisposing { get ;} 
        // public abstract EventHandler<EventArgs> DeviceReset { get ;} 
        // public abstract EventHandler<EventArgs> DeviceResetting { get ;} 
    }

}