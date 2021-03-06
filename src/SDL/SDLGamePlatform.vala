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
    using System.Collections.Generic;
    // using Microsoft.Xna.Framework.Audio;
    using Microsoft.Xna.Framework.Graphics;
    using Microsoft.Xna.Framework.Input;
    // using MonoGame.Utilities;
    
    internal class SdlGamePlatform : GamePlatform
    {
        public override GameRunBehavior DefaultRunBehavior
        {
            #if (__EMSCRIPTEN__)
            get { return GameRunBehavior.Emscripten; }
            #else
            get { return GameRunBehavior.Synchronous; }
            #endif
        }

        private Game _game;
        // private OpenALSoundController _soundControllerInstance;
        private System.Collections.Generic.List<Keys> _keys;

        private int _isExiting;
        private SdlGameWindow _view;

        public SdlGamePlatform(Game game)
        {
            base(game);
            // if we're on Windows, we need to detect the CPU arch and load the correct dlls
            // on other system, the MonoGame.Framework.dll.config handles this
            // if (PlatformParameters.DetectWindowsArchitecture)
            //     NativeHelper.InitDllDirectory();

            _game = game;
            _keys = new ArrayList<Keys>();
            Keyboard.SetKeys(_keys);

            Sdl.Version sversion;
            Sdl.GetVersion(out sversion);

            Sdl.Major = sversion.Major;
            Sdl.Minor = sversion.Minor;
            Sdl.Patch = sversion.Patch;

            var version = 100 * Sdl.Major + 10 * Sdl.Minor + Sdl.Patch;

            if (version <= 204)
                print("Please use SDL 2.0.5 or higher.\n");

            // Needed so VS can debug the project on Windows
            // if (version >= 205 && CurrentPlatform.OS == OS.Windows && Debugger.IsAttached)
            //     Sdl.SetHint("SDL_WINDOWS_DISABLE_THREAD_NAMING", "1");

            Sdl.Init((int)(
                Sdl.InitFlags.Video |
                Sdl.InitFlags.Joystick |
                Sdl.InitFlags.GameController |
                Sdl.InitFlags.Haptic
            ));

            Sdl.DisableScreenSaver();

            // GamePad.InitDatabase();
            Window = _view = new SdlGameWindow(_game);

            /* Request opengl 3.3 context.
            * SDL doesn't have the ability to choose which profile at this time of writing,
            * but it should default to the core profile */
            Sdl.GL.SetAttribute(Sdl.GL.ContextMajorVersion, 3);
            #if (__EMSCRIPTEN__)
            Sdl.GL.SetAttribute(Sdl.GL.ContextMinorVersion, 0);
            #else
            Sdl.GL.SetAttribute(Sdl.GL.ContextMinorVersion, 3);
            #endif

            Sdl.GL.SetAttribute(Sdl.GL.ContextFlags, Sdl.GL.ContextFlag.ForwardCompat);

            /* Turn on double buffering with a 24bit Z buffer.
            * You may need to change this to 16 or 32 for your system */
            Sdl.GL.SetAttribute(Sdl.GL.DoubleBuffer, 1);
            Sdl.GL.SetAttribute(Sdl.GL.DepthSize, 24);
            // try
            // {
            //     _soundControllerInstance = OpenALSoundController.GetInstance;
            // }
            // catch (DllNotFoundException ex)
            // {
            //     throw (new NoAudioHardwareException("Failed to init OpenALSoundController", ex));
            // }
        }

        public override void BeforeInitialize ()
        {
            SdlRunLoop();

            base.BeforeInitialize ();
        }

        protected override void OnIsMouseVisibleChanged()
        {
            _view.SetCursorVisible(_game.IsMouseVisible);
        }

        internal override void OnPresentationChanged(PresentationParameters pp)
        {
            var displayIndex = Sdl.Window.GetDisplayIndex(Window.Handle);
            var displayName = Sdl.Display.GetDisplayName(displayIndex);
            BeginScreenDeviceChange(pp.IsFullScreen);
            EndScreenDeviceChange(displayName, pp.WindowPositionX, pp.WindowPositionY, pp.BackBufferWidth, pp.BackBufferHeight);
        }

        public override bool BeforeRun()
        {
            Sdl.Window.Show(Window.Handle);
            print("Platform::BeforeRun\n");
            return true;
        }

        public override void RunOnce()
        {
            // print("Platform::RunOnce %f\n", Game.gameTime.ElapsedGameTime.TotalMilliseconds);
            SdlRunLoop();
            Game.Tick();
            // Threading.Run();
            GraphicsDevice.DisposeContexts();
        }

        public override void RunLoop()
        {
            Sdl.Window.Show(Window.Handle);

            while (true)
            {
                SdlRunLoop();
                Game.Tick();
                // Threading.Run();
                GraphicsDevice.DisposeContexts();

                if (_isExiting > 0)
                    break;
            }
        }

        

        private void SdlRunLoop()
        {
            Sdl.Event ev;

            while (Sdl.PollEvent(out ev) == 1)
            {
                if (ev.Type == Sdl.EventType.Quit)
                    _isExiting++;

                else if (ev.Type == Sdl.EventType.JoyDeviceAdded)
                    Joystick.AddDevice(ev.JoystickDevice.Which);
                else if (ev.Type == Sdl.EventType.ControllerDeviceRemoved)
                    GamePad.RemoveDevice(ev.ControllerDevice.Which);
                else if (ev.Type == Sdl.EventType.JoyDeviceRemoved)
                    Joystick.RemoveDevice(ev.JoystickDevice.Which);
                else if (ev.Type == Sdl.EventType.MouseWheel)
                {
                    const int wheelDelta = 120;
                    Mouse.ScrollY += ev.Wheel.Y * wheelDelta;
                    Mouse.ScrollX += ev.Wheel.X * wheelDelta;
                }
                else if (ev.Type == Sdl.EventType.MouseMotion)
                {
                    Window.MouseState.X = ev.Motion.X;
                    Window.MouseState.Y = ev.Motion.Y;
                }
                else if (ev.Type == Sdl.EventType.MouseButtonDown)
                {
                    // print("Button Down (%d, %d)\n", ev.Button.Button, ev.Button.State);

                    if (ev.Button.Button == 1)
                        Window.MouseState.LeftButton = ButtonState.Pressed;
                    if (ev.Button.Button == 2)
                        Window.MouseState.MiddleButton = ButtonState.Pressed;
                    if (ev.Button.Button == 3)
                        Window.MouseState.RightButton = ButtonState.Pressed;
                    
                }
                else if (ev.Type == Sdl.EventType.MouseButtonup)
                {
                    // print("Button Up (%d, %d)\n", ev.Button.Button, ev.Button.State);

                    if (ev.Button.Button == 1)
                        Window.MouseState.LeftButton = ButtonState.Released;
                    if (ev.Button.Button == 2)
                        Window.MouseState.MiddleButton = ButtonState.Released;
                    if (ev.Button.Button == 3)
                        Window.MouseState.RightButton = ButtonState.Released;

                }
                else if (ev.Type == Sdl.EventType.KeyDown)
                {
                    var key = KeyboardUtil.ToXna(ev.Key.Keysym.Sym);
                    if (!_keys.Contains(key))
                        _keys.Add(key);
                    char character = (char)ev.Key.Keysym.Sym;
                    if (character.iscntrl())
                        _view.CallTextInput(character, key);
                }
                else if (ev.Type == Sdl.EventType.KeyUp)
                {
                    var key = KeyboardUtil.ToXna(ev.Key.Keysym.Sym);
                    _keys.Remove(key);
                }
                else if (ev.Type == Sdl.EventType.TextInput)
                {
                    int len = 0;
                    string text = ""; //String.Empty;
                    while (ev.Text.Text[len] != 0) {
                    // while (Marshal.ReadByte ((IntPtr)ev.Text.Text, len) != 0) {
                        len++;
                    }
                    // Marshal.Copy ((IntPtr)ev.Text.Text, buffer, 0, len);
                    // text = System.Text.Encoding.UTF8.GetString (buffer);
                    var buffer = new uint8 [len];
                    Memory.copy(buffer, ev.Text.Text, len);
                    text = (string)buffer;
                    if (text.length == 0)
                        continue;
                    foreach (var c in buffer)// text)
                    {
                        var key = KeyboardUtil.ToXna((int)c);
                        _view.CallTextInput((char)c, key);
                    }
                }
                else if (ev.Type == Sdl.EventType.WindowEvent)
                {
                    if (ev.Window.EventID == Sdl.Window.EventId.Resized || ev.Window.EventID == Sdl.Window.EventId.SizeChanged)
                        _view.ClientResize(ev.Window.Data1, ev.Window.Data2);
                    else if (ev.Window.EventID == Sdl.Window.EventId.FocusGained)
                        IsActive = true;
                    else if (ev.Window.EventID == Sdl.Window.EventId.FocusLost)
                        IsActive = false;
                    else if (ev.Window.EventID == Sdl.Window.EventId.Moved)
                        _view.Moved();
                }
            }
        }

        public override void StartRunLoop()
        {
            throw new Exception.NotSupportedException("The desktop platform does not support asynchronous run loops");
        }

        public override void Exit()
        {
            GLib.AtomicInt.add (ref _isExiting, 1);
        }

        public override bool BeforeUpdate(GameTime gameTime)
        {
            return true;
        }

        public override bool BeforeDraw(GameTime gameTime)
        {
            return true;
        }

        public override void EnterFullScreen()
        {
        }

        public override void ExitFullScreen()
        {
        }

        public override void BeginScreenDeviceChange(bool willBeFullScreen)
        {
            // _view.BeginScreenDeviceChange(willBeFullScreen);
        }

        public override void EndScreenDeviceChange(
            string screenDeviceName, 
            int clientX,
            int clientY,
            int clientWidth, 
            int clientHeight)
        {
            _view.EndScreenDeviceChange(screenDeviceName, clientX, clientY, clientWidth, clientHeight);
        }

        public override void Log(string message)
        {
            print(@"$message\n");
        }

        public override void Present()
        {
            // if (Game.GraphicsDevice != null)
            //     Game.GraphicsDevice.Present();
            Sdl.GL.SwapWindow(Window.Handle);
            // Sdl.Renderer.Present(Window.Handle);

        }

        /// <summary>
        /// Performs application-defined tasks associated with freeing,
        /// releasing, or resetting unmanaged resources.
        /// </summary>
        public override void Dispose()
        {
            if (_view != null)
            {
                _view.Dispose();
                _view = null;

                Joystick.CloseDevices();

                Sdl.Quit();
            }

            base.Dispose2(true);
        }
    }
}

