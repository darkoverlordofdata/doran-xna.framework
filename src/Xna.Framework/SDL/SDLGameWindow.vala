// MonoGame - Copyright (C) The MonoGame Team
// This file is subject to the terms and conditions defined in
// file 'LICENSE.txt', which is part of this source code package.

using System;
using Microsoft.Xna.Framework.Graphics;
using Microsoft.Xna.Framework.Input;

namespace Microsoft.Xna.Framework 
{

    public class SdlGameWindow : GameWindow, IDisposable 
    {

        internal Game _game;
        protected IntPtr _handle;
        private string _title;
        private int _width;
        private int _height;
        private bool _wasMoved;
        private bool _supressMoved;
        private IntPtr _icon;
        private bool _resizable;
        private bool _borderless;
        private bool _willBeFullScreen;
        private bool _mouseVisible;
        private bool _hardwareSwitch;
        private string _screenDeviceName;

        public override IntPtr Handle
        {
            get { return _handle; }
        }

        public SdlGameWindow(Game game) 
        {
            _game = game;
            _screenDeviceName = "";
            _width = GraphicsDeviceManager.DefaultBackBufferWidth;
            _height = GraphicsDeviceManager.DefaultBackBufferHeight;
            Sdl.SetHint("SDL_VIDEO_MINIMIZE_ON_FOCUS_LOSS", "0");
            Sdl.SetHint("SDL_JOYSTICK_ALLOW_BACKGROUND_EVENTS", "1");
            
            // _handle = Sdl.Window.Create("", 0, 0,
            //     _width, _height,
            //     // GraphicsDeviceManager.DefaultBackBufferWidth, GraphicsDeviceManager.DefaultBackBufferHeight,
            //     Sdl.Window.State.Hidden);

            _handle = Sdl.GetCurrentWindow();

                
        }

        internal void CreateWindow() 
        {
            // var initflags =
            //     Sdl.Window.State.OpenGL |
            //     Sdl.Window.State.Hidden |
            //     Sdl.Window.State.InputFocus |
            //     Sdl.Window.State.MouseFocus;
            
            // var winx = Sdl.Window.PosCentered;
            // var winy = Sdl.Window.PosCentered;
            
            // _handle = Sdl.Window.Create(_title, winx, winy, _width, _height, initflags);
            _handle = Sdl.GetCurrentWindow();

            if (_icon != null) Sdl.Window.SetIcon(_handle, _icon);
            
        }

        public override bool AllowUserResizing
        {
            get { return !IsBorderless && _resizable; }
            set
            {
                if (Sdl.Patch > 4)
                    Sdl.Window.SetResizable(_handle, value);
                else
                    throw new Exception.Exception("SDL 2.0.4 does not support changing resizable parameter of the window after it's already been created, please use a newer version of it.");

                _resizable = value;
            }
        }

        public bool IsBorderless
        {
            get { return _borderless; }
            set
            {
                Sdl.Window.SetBordered(_handle, value);// ? 0 : 1);
                _borderless = value;
            }
        }

        public override Rectangle ClientBounds {
            get {
                int x = 0, y = 0;
                Sdl.Window.GetPosition(Handle, out x, out y);
                return Rectangle(x, y, _width, _height);
            }
        }

        public override DisplayOrientation CurrentOrientation
        {
            get { return DisplayOrientation.Default; }
        }

        public Point Position {
            get {
                int x = 0, y = 0;
                Sdl.Window.GetPosition(Handle, out x, out y);
                return Point(x, y);
            }
            set {
                Sdl.Window.SetPosition(Handle, value.X, value.Y);
                _wasMoved = true;
            }
        }

        internal void Moved()
        {
            if (_supressMoved)
            {
                _supressMoved = false;
                return;
            }

            _wasMoved = true;
        }

        public void ClientResize(int width, int height)
        {
            // SDL reports many resize events even if the Size didn't change.
            // Only call the code below if it actually changed.
            // if (_game.GraphicsDevice.PresentationParameters.BackBufferWidth == width &&
            //     _game.GraphicsDevice.PresentationParameters.BackBufferHeight == height) {
            //     return;
            // }
            // _game.GraphicsDevice.PresentationParameters.BackBufferWidth = width;
            // _game.GraphicsDevice.PresentationParameters.BackBufferHeight = height;
            // _game.GraphicsDevice.Viewport = new Viewport(0, 0, width, height);

            Sdl.Window.GetSize(Handle, out _width, out _height);

            OnClientSizeChanged();
        }

        public void CallTextInput(char c, Keys key = Keys.None)
        {
            OnTextInput(this, new TextInputEventArgs(c, key));
        }

        internal override void SetSupportedOrientations(DisplayOrientation orientations)
        {
            // Nothing to do here
        }

        protected override void SetTitle(string title) 
        {
            Sdl.Window.SetTitle(_handle, title);
        }

        public override string ScreenDeviceName
        {
            get { return _screenDeviceName; }
        }
        
        public void Dispose() {}
    }    


}