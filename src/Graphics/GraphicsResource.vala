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
    using System.Diagnostics;

    public abstract class GraphicsResource : ISetData
    {
        bool disposed;

        // The GraphicsDevice property should only be accessed in Dispose(bool) if the disposing
        // parameter is true. If disposing is false, the GraphicsDevice may or may not be
        // disposed yet.
        GraphicsDevice graphicsDevice;

        private WeakReference _selfReference;

        internal GraphicsResource()
        {
            
        }

        // ~GraphicsResource()
        // {
        //     // Pass false so the managed objects are not released
        //     Dispose(false);
        // }

        /// <summary>
        /// Called before the device is reset. Allows graphics resources to 
        /// invalidate their state so they can be recreated after the device reset.
        /// Warning: This may be called after a call to Dispose() up until
        /// the resource is garbage collected.
        /// </summary>
        internal virtual void GraphicsDeviceResetting()
        {

        }

        public override void Dispose()
        {
            // Dispose of managed objects as well
            Dispose2(true);
            // Since we have been manually disposed, do not call the finalizer on this object
            // GC.SuppressFinalize(this);
        }

        /// <summary>
        /// The method that derived classes should override to implement disposing of managed and native resources.
        /// </summary>
        /// <param name="disposing">True if managed objects should be disposed.</param>
        /// <remarks>Native resources should always be released regardless of the value of the disposing parameter.</remarks>
        protected virtual void Dispose2(bool disposing)
        {
            if (!disposed)
            {
                if (disposing)
                {
                    // Release managed objects
                    // ...
                }

                // Release native objects
                // ...

                // Do not trigger the event if called from the finalizer
                if (disposing)
                    EventHelpers.Raise(this, Disposing, EventArgs.Empty);

                // Remove from the global list of graphics resources
                if (graphicsDevice != null)
                    graphicsDevice.RemoveResourceReference(_selfReference);

                _selfReference = null;
                graphicsDevice = null;
                disposed = true;
            }
        }

		public EventHandler<EventArgs> Disposing = new EventHandler<EventArgs>();
		
		public GraphicsDevice GraphicsDevice
		{
			get
			{
				return graphicsDevice;
			}

            internal set
            {
                assert(value != null);

                if (graphicsDevice == value)
                    return;

                // VertexDeclaration objects can be bound to multiple GraphicsDevice objects
                // during their lifetime. But only one GraphicsDevice should retain ownership.
                if (graphicsDevice != null)
                {
                    graphicsDevice.RemoveResourceReference(_selfReference);
                    _selfReference = null;
                }

                graphicsDevice = value;

                _selfReference = new WeakReference(this);
                graphicsDevice.AddResourceReference(_selfReference);
            }
		}
		
		public bool IsDisposed
		{
			get
			{
				return disposed;
			}
		}
		
		public string Name { get; set; }
		
		public Object Tag { get; set; }

        public override string ToString()
        {
            // return string.IsNullOrEmpty(Name) ? base.ToString() : Name;
            return Name;
        }
	}
}

