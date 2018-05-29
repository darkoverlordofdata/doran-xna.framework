using System;

namespace Microsoft.Xna.Framework.Graphics 
{
    public interface IGraphicsDeviceService : Object 
    {
		public abstract Microsoft.Xna.Framework.Graphics.GraphicsDevice graphicsDevice { get; }
        
		 public abstract EventHandler<EventArgs> DeviceCreated { get; }
         public abstract EventHandler<EventArgs> DeviceDisposing { get ;} 
         public abstract EventHandler<EventArgs> DeviceReset { get ;} 
         public abstract EventHandler<EventArgs> DeviceResetting { get ;} 
    }

}