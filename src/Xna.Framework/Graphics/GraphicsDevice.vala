// MonoGame - Copyright (C) The MonoGame Team
// This file is subject to the terms and conditions defined in
// file 'LICENSE.txt', which is part of this source code package.
// using GL;
using System;
using ValaGame.OpenGL;
using System.Collections.Generic;
// using System.Diagnostics;
// using System.Globalization;
// using Microsoft.Xna.Framework.Utilities;
// using System.Runtime.InteropServices;
// using Microsoft.Xna.Framework.Utilities;


namespace Microsoft.Xna.Framework.Graphics
{
    public class GraphicsDevice : Object, IDisposable
    {
        private Viewport _viewport;

        private bool _isDisposed;

        internal GraphicsCapabilities GraphicsCapabilities; // { get; private set; }

        public TextureCollection Textures { get; private set; }
        
        // On Intel Integrated graphics, there is a fast hw unit for doing
        // clears to colors where all components are either 0 or 255.
        // Despite XNA4 using Purple here, we use black (in Release) to avoid
        // performance warnings on Intel/Mesa
#if DEBUG
        private static Color DiscardColor = new Color.Rgba(68, 34, 136, 255);
#else
        private static Color DiscardColor = new Color.Rgba(0, 0, 0, 255);
#endif

        // Resources may be added to and removed from the list from many threads.
        private Object _resourcesLock = new Object();

        // Use WeakReference for the global resources list as we do not know when a resource
        // may be disposed and collected. We do not want to prevent a resource from being
        // collected by holding a strong reference to it in this list.
        public System.Collections.Generic.List<WeakReference> resources { get; construct; }

		// TODO Graphics Device events need implementing
		public EventHandler<EventArgs> DeviceLost = new EventHandler<EventArgs>();
		public EventHandler<EventArgs> DeviceReset = new EventHandler<EventArgs>();
		public EventHandler<EventArgs> DeviceResetting = new EventHandler<EventArgs>();
        public EventHandler<EventArgs> Disposing = new EventHandler<EventArgs>();

        private int _maxVertexBufferSlots;
        internal int MaxTextureSlots = 16;
        internal int MaxVertexTextureSlots;

        public bool IsDisposed
        {
            get
            {
                return _isDisposed;
            }
        }

		public bool IsContentLost {
			get {
				// We will just return IsDisposed for now
				// as that is the only case I can see for now
				return IsDisposed;
			}
		}

        public GraphicsAdapter Adapter
        {
            get;
            private set;
        }

        internal GraphicsMetrics _graphicsMetrics;

        /// <summary>
        /// The rendering information for debugging and profiling.
        /// The metrics are reset every frame after draw within <see cref="GraphicsDevice.Present"/>. 
        /// </summary>
        public GraphicsMetrics Metrics { get { return _graphicsMetrics; } set { _graphicsMetrics = value; } }


        internal GraphicsDevice.GDI(GraphicsDeviceInformation gdi)
        {
            this(gdi.Adapter, gdi.GraphicsProfile, gdi.PresentationParameters);
        }

        internal GraphicsDevice.ctor()
		{
            // PresentationParameters = new Microsoft.Xna.Framework.Graphics.PresentationParameters();
            // PresentationParameters.DepthStencilFormat = DepthFormat.Depth24;
            Setup();
            // GraphicsCapabilities = new GraphicsCapabilities();
            // GraphicsCapabilities.Initialize(this);
            Initialize();
        }

        /// <summary>
        /// Initializes a new instance of the <see cref="GraphicsDevice" /> class.
        /// </summary>
        /// <param name="adapter">The graphics adapter.</param>
        /// <param name="graphicsProfile">The graphics profile.</param>
        /// <param name="presentationParameters">The presentation options.</param>
        /// <exception cref="ArgumentNullException">
        /// <paramref name="presentationParameters"/> is <see langword="null"/>.
        /// </exception>
        public GraphicsDevice(GraphicsAdapter? adapter, GraphicsProfile graphicsProfile, PresentationParameters presentationParameters)
        {
            // GLib.Object(resources: new ArrayList<WeakReference>());
            _resources = new ArrayList<WeakReference>();
            // if (adapter == null)
            //     throw new ArgumentNullException("adapter");
            // if (!adapter.IsProfileSupported(graphicsProfile))
            //     throw new NoSuitableGraphicsDeviceException(String.Format("Adapter '{0}' does not support the {1} profile.", adapter.Description, graphicsProfile));
            // if (presentationParameters == null)
            //     throw new ArgumentNullException("presentationParameters");
            Adapter = adapter;
            PresentationParameters = presentationParameters;
            _graphicsProfile = graphicsProfile;
            Setup();
            // GraphicsCapabilities = new GraphicsCapabilities();
            // GraphicsCapabilities.Initialize(this);

            Initialize();

        }

        private void Setup()
        {
            Textures = new TextureCollection(this, MaxTextureSlots, false);
            
        }

        internal void Initialize()
        {
        }

        public void Clear(Color color)
        {
            var options = ClearOptions.Target;
            options |= ClearOptions.DepthBuffer;
            options |= ClearOptions.Stencil;

            ClearBufferMask bufferMask = 0;
            bufferMask = bufferMask | ClearBufferMask.DepthBufferBit;
            bufferMask = bufferMask | ClearBufferMask.ColorBufferBit;

            // PlatformClear(options, color.ToVector4(), _viewport.MaxDepth, 0);
            ValaGame.OpenGL.GL.ClearColor(color.R/255, color.G/255, color.B/255, color.A/255);
            ValaGame.OpenGL.GL.Clear(bufferMask);

            _graphicsMetrics._clearCount++;
        }


        public void Dispose()
        {
            Dispose2(true);
            // GC.SuppressFinalize(this);
        }

        protected virtual void Dispose2(bool disposing)
        {
            if (!_isDisposed)
            {
                if (disposing)
                {
                    // Dispose of all remaining graphics resources before disposing of the graphics device

                }

                _isDisposed = true;
                EventHelpers.Raise(this, Disposing, EventArgs.Empty);
            }
        }

        internal void AddResourceReference(WeakReference resourceReference)
        {
            // lock (_resourcesLock)
            // {
                _resources.add(resourceReference);
            // }
        }

        internal void RemoveResourceReference(WeakReference resourceReference)
        {
            // lock (_resourcesLock)
            // {
                _resources.remove(resourceReference);
            // }
        }

        public void Present()
        {

            _graphicsMetrics = new GraphicsMetrics();
            PlatformPresent();
        }

        /*
        public void Present(Quadrangle? sourceRectangle, Quadrangle? destinationRectangle, IntPtr overrideWindowHandle)
        {
            throw new NotImplementedException();
        }
        */

        public void PlatformPresent(){}
        public void PlatformReset(){}

        public void Reset()
        {
            PlatformReset();

            EventHelpers.Raise(this, DeviceResetting, EventArgs.Empty);

            // Update the back buffer.
            // OnPresentationChanged();
            
            // EventHelpers.Raise(this, PresentationChanged, new PresentationEventArgs(PresentationParameters));
            EventHelpers.Raise(this, DeviceReset, EventArgs.Empty);
       }

        public void Reset2(PresentationParameters presentationParameters)
        {
            if (presentationParameters == null)
                throw new Exception.ArgumentNullException("presentationParameters");

            PresentationParameters = presentationParameters;
            Reset();
        }

        /// <summary>
        /// Trigger the DeviceResetting event
        /// Currently internal to allow the various platforms to send the event at the appropriate time.
        /// </summary>
        internal void OnDeviceResetting()
        {
            EventHelpers.Raise(this, DeviceResetting, EventArgs.Empty);

        }

        /// <summary>
        /// Trigger the DeviceReset event to allow games to be notified of a device reset.
        /// Currently internal to allow the various platforms to send the event at the appropriate time.
        /// </summary>
        internal void OnDeviceReset()
        {
            EventHelpers.Raise(this, DeviceReset, EventArgs.Empty);
        }

        public DisplayMode DisplayMode
        {
            get
            {
                return Adapter.CurrentDisplayMode;
            }
        }

        public GraphicsDeviceStatus GraphicsDeviceStatus
        {
            get
            {
                return GraphicsDeviceStatus.Normal;
            }
        }

        public PresentationParameters PresentationParameters
        {
            get;
            private set;
        }

        public Viewport Viewport
        {
            get
            {
                return _viewport;
            }

            set
            {
                _viewport = value;
                // PlatformSetViewport(ref value);
            }
        }

        private GraphicsProfile _graphicsProfile;
        public GraphicsProfile GraphicsProfile
        {
            get { return _graphicsProfile; }
        }

        /// <summary>
        /// Draw primitives of the specified type by indexing into the given array of vertices with 32-bit indices.
        /// </summary>
        /// <typeparam name="T">The type of the vertices.</typeparam>
        /// <param name="primitiveType">The type of primitives to draw with the vertices.</param>
        /// <param name="vertexData">An array of vertices to draw.</param>
        /// <param name="vertexOffset">The index in the array of the first vertex to draw.</param>
        /// <param name="numVertices">The number of vertices to draw.</param>
        /// <param name="indexData">The index data.</param>
        /// <param name="indexOffset">The index in the array of indices of the first index to use</param>
        /// <param name="primitiveCount">The number of primitives to draw.</param>
        /// <param name="vertexDeclaration">The layout of the vertices.</param>
        /// <remarks>All indices in the vertex buffer are interpreted relative to the specified <paramref name="vertexOffset"/>.
        /// For example value of zero in the array of indices points to the vertex at index <paramref name="vertexOffset"/>
        /// in the array of vertices.</remarks>
        public void DrawUserIndexedPrimitives(
            ValaGame.OpenGL.PrimitiveType primitiveType, 
            VertexPositionColorTexture[] vertexData, 
            int vertexOffset, 
            int numVertices, 
            short[] indexData, 
            int indexOffset, 
            int primitiveCount, 
            VertexDeclaration? vertexDeclaration
        )
        {

        }
    }
}
