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
    using Microsoft.Xna.Framework.Input;

    public class SdlGameWindow : GameWindow//, IDisposable 
    {
        public static GameWindow Instance;
        public bool IsFullScreen;
        internal Game _game;
        protected IntPtr _handle;
        private string _title;
        private int _x;
        private int _y;
        private int _width;
        private int _height;
        private bool _wasMoved;
        private bool _supressMoved;
        private Sdl.Surface? _icon;
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

            Instance = this;

            _width = GraphicsDeviceManager.DefaultBackBufferWidth;
            _height = GraphicsDeviceManager.DefaultBackBufferHeight;
            Sdl.SetHint("SDL_VIDEO_MINIMIZE_ON_FOCUS_LOSS", "0");
            Sdl.SetHint("SDL_JOYSTICK_ALLOW_BACKGROUND_EVENTS", "1");
            
            // _handle = Sdl.Window.Create("", 0, 0,
            //     _width, _height,
            //     // GraphicsDeviceManager.DefaultBackBufferWidth, GraphicsDeviceManager.DefaultBackBufferHeight,
            //     Sdl.Window.State.Hidden);
            _handle = Sdl.GetCurrentWindow();

            #if (__EMSCRIPTEN__)
            var img_flags = Sdl.ImgInitFlags.Png;
            #else
            var img_flags = Sdl.ImgInitFlags.Png | Sdl.ImgInitFlags.Jpg;
            #endif
            if (Sdl.ImgInit(img_flags) != img_flags) {
                print("ERR: SdlInit image");
            }

        }

        internal void CreateWindow() 
        {
            var winx = Sdl.Window.PosCentered;
            var winy = Sdl.Window.PosCentered;
            
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

        public override Rectangle ClientBounds 
        {
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

        public override Point Size
        {
            get { return new Point(_width, _height); }
        }

        public override Point Position 
        {
            get {
                int x = 0, y = 0;
                Sdl.Window.GetPosition(Handle, out x, out y);
                return new Point(x, y);
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

        public void SetCursorVisible(bool visible)
        {
            _mouseVisible = visible;
            Sdl.Mouse.ShowCursor(visible ? 1 : 0);
        }

        public override void BeginScreenDeviceChange(bool willBeFullScreen)
        {
            _willBeFullScreen = willBeFullScreen;
        }
        
        public override void EndScreenDeviceChange(
            string screenDeviceName, 
            int clientX,
            int clientY,
            int clientWidth, 
            int clientHeight)
        {
            _screenDeviceName = screenDeviceName;

            if (!_willBeFullScreen) 
            {
                Sdl.Window.SetPosition(Handle, clientX, clientY);
                Sdl.Window.SetSize(Handle, clientWidth, clientHeight);
                ValaGame.OpenGL.GL.Viewport(0, 0, clientWidth, clientHeight);
                _width = clientWidth;
                _height = clientHeight;
                _x = clientX;
                _y = clientY;
            }
        }
    }    
}