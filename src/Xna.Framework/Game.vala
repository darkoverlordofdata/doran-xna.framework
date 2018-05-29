// MonoGame - Copyright (C) The MonoGame Team
// This file is subject to the terms and conditions defined in
// file 'LICENSE.txt', which is part of this source code package.

using Gee;
using System;
using System.Diagnostics;
// using Microsoft.Xna.Framework.Audio;
using Microsoft.Xna.Framework.Content;
// using Microsoft.Xna.Framework.Graphics;
// using Microsoft.Xna.Framework.Input.Touch;


namespace Microsoft.Xna.Framework
{
    public class Game : Object, IDisposable
    {
        // private GameComponentCollection _components;
        // private GameServiceContainer _services;
        private ContentManager _content;
        internal GamePlatform Platform;

        // private GenericArray<IUpdateable> _updateables;
        // private GenericArray<IDrawable> _drawables;

        private IGraphicsDeviceManager _graphicsDeviceManager;
        // private IGraphicsDeviceService _graphicsDeviceService;

        private bool _initialized = false;
        private bool _isFixedTimeStep = true;

        private TimeSpan _targetElapsedTime = TimeSpan.FromTicks(166667); // 60fps
        private TimeSpan _inactiveSleepTime = TimeSpan.FromSeconds(0.02);

        private TimeSpan _maxElapsedTime = TimeSpan.FromMilliseconds(500);

        private bool _shouldExit;
        private bool _suppressDraw;

        public Game()
        {
            _instance = this;
            _content = new ContentManager();
            Platform = GamePlatform.PlatformCreate(this);
            Platform.Activated.Add((Event)OnActivated);
            Platform.Deactivated.Add((Event)OnDeactivated);
        }

		internal void Log(string Message)
		{
			if (Platform != null) Platform.Log(Message);
		}

        private bool _isDisposed;
        public void Dispose()
        {
            Dispose2(true);
            EventHelpers.Raise(this, Disposed, EventArgs.Empty);
        }

        protected virtual void Dispose2(bool disposing)
        {
            if (!_isDisposed)
            {
            }
        }

        private void AssertNotDisposed()
        {
            if (_isDisposed)
            {
                // string name = GetType().Name;
                string name = get_type().name();
                throw new Exception.ObjectDisposedException(
                    "The %s object was used after being Disposed.".printf(name));
            }
        }

        private static Game _instance = null;
        internal static Game Instance { get { return Game._instance; } }

        // public LaunchParameters LaunchParameters { get; private set; }

        // public GameComponentCollection Components
        // {
        //     get { return _components; }
        // }

        public TimeSpan InactiveSleepTime
        {
            get { return _inactiveSleepTime; }
            set
            {
                if (value.LT(TimeSpan.Zero))
                    throw new Exception.ArgumentOutOfRangeException("The time must be positive.");

                _inactiveSleepTime = value;
            }
        }

        /// <summary>
        /// The maximum amount of time we will frameskip over and only perform Update calls with no Draw calls.
        /// MonoGame extension.
        /// </summary>
        public TimeSpan MaxElapsedTime
        {
            get { return _maxElapsedTime; }
            set
            {
                if (value.LT(TimeSpan.Zero))
                    throw new Exception.ArgumentOutOfRangeException("The time must be positive.");
                if (value.LT(_targetElapsedTime))
                    throw new Exception.ArgumentOutOfRangeException("The time must be at least TargetElapsedTime");

                _maxElapsedTime = value;
            }
        }

        public bool IsActive
        {
            get { return Platform.IsActive; }
        }

        public bool IsMouseVisible
        {
            get { return Platform.IsMouseVisible; }
            set { Platform.IsMouseVisible = value; }
        }

        public TimeSpan TargetElapsedTime
        {
            get { return _targetElapsedTime; }
            set
            {
                // Give GamePlatform implementations an opportunity to override
                // the new value.
                value = Platform.TargetElapsedTimeChanging(value);

                if (value.LE(TimeSpan.Zero))
                    throw new Exception.ArgumentOutOfRangeException(
                        "The time must be positive and non-zero.");

                if (value.NE(_targetElapsedTime))
                {
                    _targetElapsedTime = value;
                    Platform.TargetElapsedTimeChanged();
                }
            }
        }
        
        public bool IsFixedTimeStep
        {
            get { return _isFixedTimeStep; }
            set { _isFixedTimeStep = value; }
        }

        // public GameServiceContainer Services {
        //     get { return _services; }
        // }

        public ContentManager Content
        {
            get { return _content; }
            set
            {
                if (value == null)
                    throw new Exception.ArgumentNullException("Set ContentManager");

                _content = value;
            }
        }

        // public GraphicsDevice GraphicsDevice
        // {
        //     get
        //     {
        //         if (_graphicsDeviceService == null)
        //         {
        //             _graphicsDeviceService = (IGraphicsDeviceService)
        //                 Services.GetService(typeof(IGraphicsDeviceService));

        //             if (_graphicsDeviceService == null)
        //                 throw new InvalidOperationException("No Graphics Device Service");
        //         }
        //         return _graphicsDeviceService.GraphicsDevice;
        //     }
        // }

        public GameWindow Window
        {
            get { return Platform.Window; }
        }

        // FIXME: Internal members should be eliminated.
        // Currently Game.Initialized is used by the Mac game window class to
        // determine whether to raise DeviceResetting and DeviceReset on
        // GraphicsDeviceManager.
        internal bool Initialized
        {
            get { return _initialized; }
        }


        public EventHandler<EventArgs> Activated = new EventHandler<EventArgs>();
        public EventHandler<EventArgs> Deactivated = new EventHandler<EventArgs>();
        public EventHandler<EventArgs> Disposed = new EventHandler<EventArgs>();
        public EventHandler<EventArgs> Exiting = new EventHandler<EventArgs>();

        public void Exit()
        {
            _shouldExit = true;
            _suppressDraw = true;
        }

        public void ResetElapsedTime()
        {
            Platform.ResetElapsedTime();
            _gameTimer.Reset();
            _gameTimer.Start();
            _accumulatedElapsedTime = TimeSpan.Zero;
            _gameTime.ElapsedGameTime = TimeSpan.Zero;
            _previousTicks = 0L;
        }

        public void SuppressDraw()
        {
            _suppressDraw = true;
        }

        public void RunOneFrame()
        {
            if (Platform == null)
                return;

            if (!Platform.BeforeRun())
                return;

            if (!_initialized)
            {
                DoInitialize ();
                _gameTimer = Stopwatch.StartNew();
                _initialized = true;
            }

            BeginRun();            

            //Not quite right..
            Tick ();

            EndRun ();

        }

        public void Run()
        {
            AssertNotDisposed();
            if (!Platform.BeforeRun())
            {
                BeginRun();
                _gameTimer = Stopwatch.StartNew();
                return;
            }

            if (!_initialized) {
                Assets.Core(@"$(_content.RootDirectory)/assets_core");
                DoInitialize ();
                _initialized = true;
            }

            BeginRun();
            _gameTimer = Stopwatch.StartNew();
            var runBehavior = Platform.DefaultRunBehavior; 
            switch (runBehavior)
            {
            case GameRunBehavior.Asynchronous:
                Platform.AsyncRunLoopEnded.Add((Event)Platform_AsyncRunLoopEnded);
                Platform.StartRunLoop();
                break;
            case GameRunBehavior.Synchronous:
                // XNA runs one Update even before showing the window
                DoUpdate(new GameTime());

                Platform.RunLoop();
                EndRun();
				DoExiting();
                break;
            default:
                throw new Exception.ArgumentException(
                    "Handling for the run behavior %d is not implemented.".printf(runBehavior));
                
            }
            
            
        }

        private TimeSpan _accumulatedElapsedTime = TimeSpan.Zero;
        private GameTime _gameTime = new GameTime();
        private Stopwatch _gameTimer;
        private long _previousTicks = 0;
        private int _updateFrameLag;


        public void Tick()
        {
            // NOTE: This code is very sensitive and can break very badly
            // with even what looks like a safe change.  Be sure to test 
            // any change fully in both the fixed and variable timestep 
            // modes across multiple devices and platforms.

        // RetryTick:
            while (true)
            {
                // Advance the accumulated elapsed time.
                var currentTicks = _gameTimer.Elapsed.Ticks;
                _accumulatedElapsedTime.Plus(TimeSpan.FromTicks(currentTicks - _previousTicks));
                _previousTicks = (long)currentTicks;

                // If we're in the fixed timestep mode and not enough time has elapsed
                // to perform an update we sleep off the the remaining time to save battery
                // life and/or release CPU time to other threads and processes.
                if (IsFixedTimeStep && _accumulatedElapsedTime.LT(TargetElapsedTime))
                {
                    var sleepTime = (int)(TargetElapsedTime.Sub(_accumulatedElapsedTime)).TotalMilliseconds;
                    if (sleepTime < 1) break;

                    // NOTE: While sleep can be inaccurate in general it is 
                    // accurate enough for frame limiting purposes if some
                    // fluctuation is an acceptable result.
                    // GLib.Thread.usleep(sleepTime*1000);
                    Sdl.Delay(sleepTime);
                    // System.Threading.Thread.Sleep(sleepTime);
                    // goto RetryTick;
                }
                else break;
            }
            // Do not allow any update to take longer than our maximum.
            if (_accumulatedElapsedTime.GT(_maxElapsedTime))
                _accumulatedElapsedTime = _maxElapsedTime;

            if (IsFixedTimeStep)
            {
                _gameTime.ElapsedGameTime = TargetElapsedTime;
                var stepCount = 0;

                // Perform as many full fixed length time steps as we can.
                while (_accumulatedElapsedTime.GE(TargetElapsedTime) && !_shouldExit)
                {
                    // _gameTime.TotalGameTime.Plus(_accumulatedElapsedTime);
                    // _accumulatedElapsedTime.Minus(TargetElapsedTime);

                    // CRITICAL CODE FAILS UNLESS I DO THIS
                    int elapsed = (int)_accumulatedElapsedTime.Ticks;
                    int target = (int)TargetElapsedTime.Ticks;
                    _gameTime.TotalGameTime._ticks += elapsed;
                    _accumulatedElapsedTime._ticks = elapsed - target;

                    ++stepCount;

                    DoUpdate(_gameTime);
                }

                //Every update after the first accumulates lag
                _updateFrameLag += int.max(0, stepCount - 1);

                //If we think we are running slowly, wait until the lag clears before resetting it
                if (_gameTime.IsRunningSlowly)
                {
                    if (_updateFrameLag == 0)
                        _gameTime.IsRunningSlowly = false;
                }
                else if (_updateFrameLag >= 5)
                {
                    //If we lag more than 5 frames, start thinking we are running slowly
                    _gameTime.IsRunningSlowly = true;
                }

                //Every time we just do one update and one draw, then we are not running slowly, so decrease the lag
                if (stepCount == 1 && _updateFrameLag > 0)
                    _updateFrameLag--;

                // Draw needs to know the total elapsed time
                // that occured for the fixed length updates.
                _gameTime.ElapsedGameTime = TimeSpan.FromTicks(TargetElapsedTime.Ticks * stepCount);
            }
            else
            {
                // Perform a single variable length update.
                _gameTime.ElapsedGameTime = _accumulatedElapsedTime;
                _gameTime.TotalGameTime.Plus(_accumulatedElapsedTime);
                _accumulatedElapsedTime = TimeSpan.Zero;

                DoUpdate(_gameTime);
            }

            // Draw unless the update suppressed it.
            if (_suppressDraw)
                _suppressDraw = false;
            else
            {
                DoDraw(_gameTime);
            }

            if (_shouldExit)
                Platform.Exit();
            
        }

        protected virtual bool BeginDraw() { return true; }
        protected virtual void EndDraw()
        {
            // Platform.Present();
        }

        protected virtual void BeginRun() { }
        protected virtual void EndRun() 
        {
            Finish();
        }

        protected virtual void LoadContent() 
        { 
            // Assets.Core(@"$(_content.RootDirectory)/assets_core");
        }
        protected virtual void UnloadContent() { }

        protected virtual void Initialize()
        {
            LoadContent();
        }


        protected virtual void Draw(GameTime gameTime)
        {
            // print("Game::Draw\n");
            // _drawables.foreach(DrawAction);
        }

        protected virtual void Update(GameTime gameTime)
        {
            // print("Game::Update\n");
            // _updateables.foreach(UpdateAction, gameTime);
		}

        protected virtual void OnExiting(Object sender, EventArgs args)
        {
            EventHelpers.Raise(this, Exiting, args);
        }
		
		protected virtual void OnActivated (Object sender, EventArgs args)
		{
            EventHelpers.Raise(this, Activated, args);
		}
		
		protected virtual void OnDeactivated (Object sender, EventArgs args)
		{
            EventHelpers.Raise(this, Deactivated, args);
		}


        private void Platform_AsyncRunLoopEnded(Object sender, EventArgs e)
        {
            AssertNotDisposed();

            var platform = (GamePlatform)sender;
            platform.AsyncRunLoopEnded.Remove((Event)Platform_AsyncRunLoopEnded);
            EndRun();
			DoExiting();
        }

        internal void DoUpdate(GameTime gameTime)
        {
            Update(gameTime);
        }

        internal void DoDraw(GameTime gameTime)
        {
            AssertNotDisposed();
            if (Platform.BeforeDraw(gameTime) && BeginDraw())
            {
                Draw(gameTime);
                EndDraw();
            }
        }

        internal void DoInitialize()
        {
            AssertNotDisposed();

            Platform.BeforeInitialize();
            Initialize();
        }

		internal void DoExiting()
		{
			OnExiting(this, EventArgs.Empty);
			UnloadContent();
		}

        internal GraphicsDeviceManager GraphicsDeviceManager
        {
            get
            {
                // if (_graphicsDeviceManager == null)
                // {
                //     _graphicsDeviceManager = (IGraphicsDeviceManager)
                //         Services.GetService(typeof(IGraphicsDeviceManager));
                // }
                return (GraphicsDeviceManager)_graphicsDeviceManager;
            }
            set
            {
                if (_graphicsDeviceManager != null)
                    throw new Exception.InvalidOperationException("GraphicsDeviceManager already registered for this Game Object");
                _graphicsDeviceManager = value;
            }
        }

    }
}
