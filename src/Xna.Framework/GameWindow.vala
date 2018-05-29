// MonoGame - Copyright (C) The MonoGame Team
// This file is subject to the terms and conditions defined in
// file 'LICENSE.txt', which is part of this source code package.

using Microsoft.Xna.Framework.Input;
// using Microsoft.Xna.Framework.Input.Touch;
using System;
// using System.ComponentModel;

namespace Microsoft.Xna.Framework {
	public abstract class GameWindow : Object {
		//#region Properties

		public abstract bool AllowUserResizing { get; set; }

		public abstract Rectangle ClientBounds { get; }

	    internal bool _allowAltF4 = true;

        /// <summary>
        /// Gets or sets a bool that enables usage of Alt+F4 for window closing on desktop platforms. Value is true by default.
        /// </summary>
        public virtual bool AllowAltF4 { get { return _allowAltF4; } set { _allowAltF4 = value; } }

		public abstract DisplayOrientation CurrentOrientation { get; }

		public abstract IntPtr Handle { get; }

		public abstract string ScreenDeviceName { get; }

		private string _title;
        /// <summary>
        /// Gets or sets the title of the game window.
        /// </summary>
        /// <remarks>
        /// For Windows 8 and Windows 10 UWP this has no effect. For these platforms the title should be
        /// set by using the DisplayName property found in the app manifest file.
        /// </remarks>
        public string Title {
			get { return _title; }
			set {
				if (_title != value) {
					SetTitle(value);
					_title = value;
				}
			}
		}

        /// <summary>
        /// Determines whether the border of the window is visible. Currently only supported on the WinDX and WinGL/Linux platforms.
        /// </summary>
        /// <exception cref="System.Exception.NotImplementedException">
        /// Thrown when trying to use this property on a platform other than the WinDX and WinGL/Linux platforms.
        /// </exception>
        public virtual bool IsBorderless
        {
            get
            {
                return false;
            }
            set
            {
                throw new Exception.NotImplementedException("GameWindow.IsBorderless");
            }
        }

        internal MouseState MouseState;
	    // internal TouchPanelState TouchPanelState;

        protected GameWindow()
        { 
            // TouchPanelState = new TouchPanelState(this);
        }

		//#endregion Properties

		//#region Events

		public EventHandler<EventArgs> ClientSizeChanged = new EventHandler<EventArgs>();
		public EventHandler<EventArgs> OrientationChanged = new EventHandler<EventArgs>();
		public EventHandler<EventArgs> ScreenDeviceNameChanged = new EventHandler<EventArgs>();

        /// <summary>
		/// Use this event to retrieve text for objects like textbox's.
		/// This event is not raised by noncharacter keys.
		/// This event also supports key repeat.
		/// For more information this event is based off:
		/// http://msdn.microsoft.com/en-AU/library/system.windows.forms.control.keypress.aspx
		/// </summary>
		/// <remarks>
		/// This event is only supported on the Windows DirectX, Windows OpenGL and Linux platforms.
		/// </remarks>
		public EventHandler<TextInputEventArgs> TextInput;

		//#endregion Events

		// public abstract void BeginScreenDeviceChange (bool willBeFullScreen);

		// public abstract void EndScreenDeviceChange (
		// 	string screenDeviceName, 
		// 	int clientWidth = ClientBounds.Width, 
		// 	int clientHeight = ClientBounds.Height);


		protected void OnActivated ()
		{
		}

		internal void OnClientSizeChanged ()
		{
            EventHelpers.Raise(this, ClientSizeChanged, EventArgs.Empty);
		}

		protected void OnDeactivated ()
		{
		}
         
		protected void OnOrientationChanged ()
		{
            EventHelpers.Raise(this, OrientationChanged, EventArgs.Empty);
		}

		protected void OnPaint ()
		{
		}

		protected void OnScreenDeviceNameChanged ()
		{
            EventHelpers.Raise(this, ScreenDeviceNameChanged, EventArgs.Empty);
		}

		protected void OnTextInput(Object sender, TextInputEventArgs e)
		{
            EventHelpers.Raise(this, TextInput, e);
		}

	 	internal abstract void SetSupportedOrientations (DisplayOrientation orientations);
		protected abstract void SetTitle (string title);

        // public static GameWindow Create(Game game, int width, int height)
        // {
        //     var window = new MonoGame.Framework.WinFormsGameWindow((MonoGame.Framework.WinFormsGamePlatform)game.Platform);
        //     window.Initialize(width, height);

        //     return window;
        // }
    }
}
