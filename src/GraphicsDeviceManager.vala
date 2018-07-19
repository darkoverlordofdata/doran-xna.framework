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
namespace Microsoft.Xna.Framework 
{
    using System;
    using Microsoft.Xna.Framework.Graphics;

    /** 
     * Used to initialize and control the presentation of the graphics device.
     */ 
    public class GraphicsDeviceManager : Object, 
                                        IGraphicsDeviceService, 
                                        IDisposable, 
                                        IGraphicsDeviceManager 
    {
        public Game game { get; construct; }
        private GraphicsDevice _graphicsDevice;
        private bool _initialized = false;

        private int _preferredBackBufferHeight;
        private int _preferredBackBufferWidth;  
        private SurfaceFormat _preferredBackBufferFormat;
        private DepthFormat _preferredDepthStencilFormat;
        private bool _preferMultiSampling;
        private DisplayOrientation _supportedOrientations;
        private bool _synchronizedWithVerticalRetrace = true;
        private bool _drawBegun;
        private bool _disposed;
        private bool _hardwareModeSwitch = true;
        private bool _wantFullScreen;
        private GraphicsProfile _graphicsProfile;
        // dirty flag for ApplyChanges
        private bool _shouldApplyChanges;

        /**
         * The default back buffer width.
         */
        public const int DefaultBackBufferWidth = 800;

        /**
         * The default back buffer height.
         */
        public const int DefaultBackBufferHeight = 480;
        
        /// <summary>
        /// Optional override for platform specific defaults.
        /// </summary>
        //  void PlatformConstruct();
        /// <summary>
        /// Associates this graphics device manager to a game instances.
        /// </summary>
        /// <param name="game">The game instance to attach.</param>
        public GraphicsDeviceManager(Game game)
        {
            if (game == null)
                throw new Exception.ArgumentNullException("Game cannot be null.");
            // GLib.Object ( game: game );
            _game = game;
            
            _supportedOrientations = DisplayOrientation.Default;
            _preferredBackBufferFormat = SurfaceFormat.Color;
            _preferredDepthStencilFormat = DepthFormat.Depth24;
            _synchronizedWithVerticalRetrace = true;

            // Assume the window client size as the default back 
            // buffer resolution in the landscape orientation.
            var clientBounds = game.Window.ClientBounds;
            if (clientBounds.Width >= clientBounds.Height)
            {
                _preferredBackBufferWidth = clientBounds.Width;
                _preferredBackBufferHeight = clientBounds.Height;
            }
            else
            {
                _preferredBackBufferWidth = clientBounds.Height;
                _preferredBackBufferHeight = clientBounds.Width;
            }

            // Default to windowed mode... this is ignored on platforms that don't support it.
            _wantFullScreen = false;

            // XNA would read this from the manifest, but it would always default
            // to reach unless changed.  So lets mimic that without the manifest bit.
            GraphicsProfile = GraphicsProfile.Reach;

            // Let the plaform optionally overload construction defaults.
            //  PlatformConstruct();

            // if (game.services.getService(typeof(IGraphicsDeviceManager)) != null)
            //     throw new MongoException.ArgumentException("A graphics device manager is already registered.  The graphics device manager cannot be changed once it is set.");
            game.graphicsDeviceManager = this;

            game.Services.AddService(typeof(IGraphicsDeviceManager), this);
            game.Services.AddService(typeof(IGraphicsDeviceService), this);
        }

        private void CreateDevice()
        {
            if (_graphicsDevice != null)
                return;

            try
            {
                if (!_initialized)
                    Initialize();

                var gdi = DoPreparingDeviceSettings();
                CreateDevice2(gdi);
            }
            catch (Exception.NoSuitableGraphicsDeviceException ex)
            {
                throw ex;
            }
            catch (Exception ex)
            {
                throw new Exception.NoSuitableGraphicsDeviceException("Failed to create graphics device!");
            }
        }

        private void CreateDevice2(GraphicsDeviceInformation gdi)
        {
            if (_graphicsDevice != null)
                return;

            _graphicsDevice = new GraphicsDevice.GDI(gdi);
            _shouldApplyChanges = false;

            // hook up reset events
            GraphicsDevice.DeviceReset.Add((sender, args) => OnDeviceReset((EventArgs)args));
            GraphicsDevice.DeviceResetting.Add((sender, args) => OnDeviceResetting((EventArgs)args));

            // update the touchpanel display size when the graphicsdevice is reset
            // _graphicsDevice.DeviceReset.Add(UpdateTouchPanel);
            // _graphicsDevice.PresentationChanged.Add(OnPresentationChanged);

            OnDeviceCreated(EventArgs.Empty);
        }

        // void IGraphicsDeviceManager_CreateDevice()
        // {
        //     CreateDevice();
        // }
        
        public bool BeginDraw()
        {
            // if (_graphicsDevice == null)
            //     return false;

            _drawBegun = true;
            return true;
        }

        public void EndDraw()
        {
            // if (_graphicsDevice != null && _drawBegun)
            // {
            //     _drawBegun = false;
            //     _graphicsDevice.Present();
            // }
        }

		public EventHandler<EventArgs> DeviceCreated = new EventHandler<EventArgs>();
        public EventHandler<EventArgs> DeviceDisposing = new EventHandler<EventArgs>();
        public EventHandler<EventArgs> DeviceReset = new EventHandler<EventArgs>();
        public EventHandler<EventArgs> DeviceResetting = new EventHandler<EventArgs>();
        // public EventHandler<PreparingDeviceSettingsEventArgs> PreparingDeviceSettings;
        public EventHandler<EventArgs> Disposed = new EventHandler<EventArgs>();
        
        protected void OnDeviceDisposing(EventArgs e)
        {
            EventHelpers.Raise(this, DeviceDisposing, e);
        }

        protected void OnDeviceResetting(EventArgs e)
        {
            EventHelpers.Raise(this, DeviceResetting, e);
        }

        internal void OnDeviceReset(EventArgs e)
        {
            EventHelpers.Raise(this, DeviceReset, e);
        }

        internal void OnDeviceCreated(EventArgs e)
        {
            EventHelpers.Raise(this, DeviceCreated, e);
        }

        /// <summary>
        /// This populates a GraphicsDeviceInformation instance and invokes PreparingDeviceSettings to
        /// allow users to change the settings. Then returns that GraphicsDeviceInformation.
        /// Throws NullReferenceException if users set GraphicsDeviceInformation.PresentationParameters to null.
        /// </summary>
        private GraphicsDeviceInformation DoPreparingDeviceSettings()
        {
            var gdi = new GraphicsDeviceInformation();
            PrepareGraphicsDeviceInformation(gdi);
            // var preparingDeviceSettingsHandler = PreparingDeviceSettings;

            // if (preparingDeviceSettingsHandler != null)
            // {
            //     // this allows users to overwrite settings through the argument
            //     var args = new PreparingDeviceSettingsEventArgs(gdi);
            //     preparingDeviceSettingsHandler.Dispatch(this, args);

            //     if (gdi.presentationParameters == null || gdi.Adapter == null)
            //         throw new Exception.NullReferenceException("Members should not be set to null in PreparingDeviceSettingsEventArgs");
            // }

            return gdi;
        }

        public void Dispose() {
            Dispose2(true);
        }

        protected virtual void Dispose2(bool disposing)
        {
            if (!_disposed)
            {
                if (disposing)
                {
                    if (_graphicsDevice != null)
                    {
                        _graphicsDevice.dispose();
                        _graphicsDevice = null;
                    }
                }
                _disposed = true;
                EventHelpers.Raise(this, Disposed, EventArgs.Empty);
            }
        }

        public void PlatformApplyChanges(){}

        public void PlatformPreparePresentationParameters(PresentationParameters presentationParameters){}

        private void PreparePresentationParameters(PresentationParameters presentationParameters)
        {
            presentationParameters.BackBufferFormat = _preferredBackBufferFormat;
            presentationParameters.BackBufferWidth = _preferredBackBufferWidth;
            presentationParameters.BackBufferHeight = _preferredBackBufferHeight;
            presentationParameters.DepthStencilFormat = _preferredDepthStencilFormat;
            presentationParameters.IsFullScreen = _wantFullScreen;
            presentationParameters.HardwareModeSwitch = _hardwareModeSwitch;
            presentationParameters.PresentationInterval = _synchronizedWithVerticalRetrace ? PresentInterval.One : PresentInterval.Immediate;
            presentationParameters.DisplayOrientation = game.Window.CurrentOrientation;
            presentationParameters.DeviceWindowHandle = game.Window.Handle;

            if (_preferMultiSampling)
            {
                // always initialize MultiSampleCount to the maximum, if users want to overwrite
                // this they have to respond to the PreparingDeviceSettingsEvent and modify
                // args.GraphicsDeviceInformation.PresentationParameters.MultiSampleCount
                // presentationParameters.MultiSampleCount = GraphicsDevice != null
                //     ? graphicsDevice.GraphicsCapabilities.MaxMultiSampleCount
                //     : 32;
            }
            else
            {
                presentationParameters.MultiSampleCount = 0;
            }

            PlatformPreparePresentationParameters(presentationParameters);
        }

        private void PrepareGraphicsDeviceInformation(GraphicsDeviceInformation gdi)
        {
            // gdi.Adapter = GraphicsAdapter.DefaultAdapter;
            gdi.GraphicsProfile = GraphicsProfile;
            var pp = new PresentationParameters();
            PreparePresentationParameters(pp);
            gdi.PresentationParameters = pp;
        }

        /// <summary>
        /// Applies any pending property changes to the graphics device.
        /// </summary>
        public void ApplyChanges()
        {
            // If the device hasn't been created then create it now.
            if (_graphicsDevice == null)
                CreateDevice();

            if (!_shouldApplyChanges)
                return;

            _shouldApplyChanges = false;

            game.Window.SetSupportedOrientations(_supportedOrientations);

            // Allow for optional platform specific behavior.
            PlatformApplyChanges();

            // populates a gdi with settings in this gdm and allows users to override them with
            // PrepareDeviceSettings event this information should be applied to the GraphicsDevice
            var gdi = DoPreparingDeviceSettings();

            // if (gdi.GraphicsProfile != GraphicsDevice.GraphicsProfile)
            // {
            //     // if the GraphicsProfile changed we need to create a new GraphicsDevice
            //     DisposeGraphicsDevice();
            //     CreateDevice(gdi);
            //     return;
            // }

            // GraphicsDevice.Reset(gdi.PresentationParameters);
        }

        private void DisposeGraphicsDevice()
        {
            // _graphicsDevice.Dispose();
            EventHelpers.Raise(this, DeviceDisposing, EventArgs.Empty);
            // _graphicsDevice = null;
        }

        public void PlatformInitialize(PresentationParameters presentationParameters)
        {
            ((SdlGameWindow)SdlGameWindow.Instance).CreateWindow();
        }

        private void Initialize()
        {
            game.Window.SetSupportedOrientations(_supportedOrientations);

            var presentationParameters = new PresentationParameters();
            PreparePresentationParameters(presentationParameters);

            // Allow for any per-platform changes to the presentation.
            PlatformInitialize(presentationParameters);

            _initialized = true;
        }

        // private void UpdateTouchPanel(Object sender, EventArgs eventArgs)
        // {
        //     TouchPanel.DisplayWidth = _graphicsDevice.PresentationParameters.BackBufferWidth;
        //     TouchPanel.DisplayHeight = _graphicsDevice.PresentationParameters.BackBufferHeight;
        //     TouchPanel.DisplayOrientation = _graphicsDevice.PresentationParameters.DisplayOrientation;
        // }

        /// <summary>
        /// Toggles between windowed and fullscreen modes.
        /// </summary>
        /// <remarks>
        /// Note that on platforms that do not support windowed modes this has no affect.
        /// </remarks>
        public void ToggleFullScreen()
        {
            IsFullScreen = !IsFullScreen;
            ApplyChanges();
        }

        // private void OnPresentationChanged(Object sender, PresentationEventArgs args)
        // {
        //     game.Platform.OnPresentationChanged(args.PresentationParameters);
        // }
        
        /// <summary>
        /// The profile which determines the graphics feature level.
        /// </summary>
        public GraphicsProfile GraphicsProfile
        {
            get
            {
                return _graphicsProfile;
            }
            set
            {
                _shouldApplyChanges = true;
                _graphicsProfile = value;
            }
        }
        
        /// <summary>
        /// Returns the graphics device for this manager.
        /// </summary>
        public GraphicsDevice GraphicsDevice
        {
            get
            {
                return _graphicsDevice;
            }
        }

        /// <summary>
        /// Indicates the desire to switch into fullscreen mode.
        /// </summary>
        /// <remarks>
        /// When called at startup this will automatically set fullscreen mode during initialization.  If
        /// set after startup you must call ApplyChanges() for the fullscreen mode to be changed.
        /// Note that for some platforms that do not support windowed modes this property has no affect.
        /// </remarks>
        public bool IsFullScreen
        {
            get { return _wantFullScreen; }
            set
            {
                _shouldApplyChanges = true;
                _wantFullScreen = value;
            }
        }

        /// <summary>
        /// Gets or sets the boolean which defines how window switches from windowed to fullscreen state.
        /// "Hard" mode(true) is slow to switch, but more effecient for performance, while "soft" mode(false) is vice versa.
        /// The default value is <c>true</c>.
        /// </summary>
        public bool HardwareModeSwitch
        {
            get { return _hardwareModeSwitch;}
            set
            {
                _shouldApplyChanges = true;
                _hardwareModeSwitch = value;
            }
        }

        /// <summary>
        /// Indicates the desire for a multisampled back buffer.
        /// </summary>
        /// <remarks>
        /// When called at startup this will automatically set the MSAA mode during initialization.  If
        /// set after startup you must call ApplyChanges() for the MSAA mode to be changed.
        /// </remarks>
        public bool PreferMultiSampling
        {
            get
            {
                return _preferMultiSampling;
            }
            set
            {
                _shouldApplyChanges = true;
                _preferMultiSampling = value;
            }
        }

        /// <summary>
        /// Indicates the desired back buffer color format.
        /// </summary>
        /// <remarks>
        /// When called at startup this will automatically set the format during initialization.  If
        /// set after startup you must call ApplyChanges() for the format to be changed.
        /// </remarks>
        public SurfaceFormat PreferredBackBufferFormat
        {
            get
            {
                return _preferredBackBufferFormat;
            }
            set
            {
                _shouldApplyChanges = true;
                _preferredBackBufferFormat = value;
            }
        }
        
        /// <summary>
        /// Indicates the desired back buffer height in pixels.
        /// </summary>
        /// <remarks>
        /// When called at startup this will automatically set the height during initialization.  If
        /// set after startup you must call ApplyChanges() for the height to be changed.
        /// </remarks>
        public int PreferredBackBufferHeight
        {
            get
            {
                return _preferredBackBufferHeight;
            }
            set
            {
                _shouldApplyChanges = true;
                _preferredBackBufferHeight = value;
            }
        }
        
        /// <summary>
        /// Indicates the desired back buffer width in pixels.
        /// </summary>
        /// <remarks>
        /// When called at startup this will automatically set the width during initialization.  If
        /// set after startup you must call ApplyChanges() for the width to be changed.
        /// </remarks>
        public int PreferredBackBufferWidth
        {
            get
            {
                return _preferredBackBufferWidth;
            }
            set
            {
                _shouldApplyChanges = true;
                _preferredBackBufferWidth = value;
            }
        }

        /// <summary>
        /// Indicates the desired depth-stencil buffer format.
        /// </summary>
        /// <remarks>
        /// The depth-stencil buffer format defines the scene depth precision and stencil bits available for effects during rendering.
        /// When called at startup this will automatically set the format during initialization.  If
        /// set after startup you must call ApplyChanges() for the format to be changed.
        /// </remarks>
        public DepthFormat PreferredDepthStencilFormat
        {
            get
            {
                return _preferredDepthStencilFormat;
            }
            set
            {
                _shouldApplyChanges = true;
                _preferredDepthStencilFormat = value;
            }
        }

        /// <summary>
        /// Indicates the desire for vsync when presenting the back buffer.
        /// </summary>
        /// <remarks>
        /// Vsync limits the frame rate of the game to the monitor referesh rate to prevent screen tearing.
        /// When called at startup this will automatically set the vsync mode during initialization.  If
        /// set after startup you must call ApplyChanges() for the vsync mode to be changed.
        /// </remarks>
        public bool SynchronizeWithVerticalRetrace
        {
            get
            {
                return _synchronizedWithVerticalRetrace;
            }
            set
            {
                _shouldApplyChanges = true;
                _synchronizedWithVerticalRetrace = value;
            }
        }

        /// <summary>
        /// Indicates the desired allowable display orientations when the device is rotated.
        /// </summary>
        /// <remarks>
        /// This property only applies to mobile platforms with automatic display rotation.
        /// When called at startup this will automatically apply the supported orientations during initialization.  If
        /// set after startup you must call ApplyChanges() for the supported orientations to be changed.
        /// </remarks>
        public DisplayOrientation SupportedOrientations
        {
            get
            {
                return _supportedOrientations;
            }
            set
            {
                _shouldApplyChanges = true;
                _supportedOrientations = value;
            }
        }
    }
}