using System;
using Microsoft.Xna.Framework.Graphics;

namespace ValaGame.OpenGL
{
    internal class GraphicsContext : Disposable
    {
        private IntPtr _context;
        private IntPtr _winHandle;
        private bool _disposed;

        public int SwapInterval
        {
            get
            {
                return Sdl.GL.GetSwapInterval();
            }
            set
            {
                Sdl.GL.SetSwapInterval(value);
            }
        }

        public bool IsDisposed
        {
            get { return _disposed; }
        }

		public bool IsCurrent
		{
			get { return true; }
		}

        public GraphicsContext(WindowInfo info)
        {
            if (_disposed)
                return;
            
            SetWindowHandle(info);
            _context = Sdl.GL.CreateContext(_winHandle);

            // GL entry points must be loaded after the GL context creation, otherwise some Windows drivers will return only GL 1.3 compatible functions
            try
            {
                print("GraphicsContext::GraphicsContext\n");
                OpenGL.GL.LoadEntryPoints();
            }
            catch (Exception.EntryPointNotFound e)
            {
                throw new Exception.PlatformNotSupported(
                    "MonoGame requires OpenGL 3.0 compatible drivers, or either ARB_framebuffer_object or EXT_framebuffer_object extensions. " +
                    "Try updating your graphics drivers.");
            }
        }

        public void MakeCurrent(WindowInfo info)
        {
            if (_disposed)
                return;
            
            SetWindowHandle(info);
            Sdl.GL.MakeCurrent(_winHandle, _context);
        }

        public void SwapBuffers()
        {
            if (_disposed)
                return;
            
            Sdl.GL.SwapWindow(_winHandle);
        }

        public override void Dispose()
        {
            if (_disposed)
                return;

            GraphicsDevice.DisposeContext(_context);
            _context = IntPtr.Zero;
            _disposed = true;
        }

        private void SetWindowHandle(WindowInfo info)
        {
            if (info == null)
                _winHandle = IntPtr.Zero;
            else
                _winHandle = info.Handle;
        }

    }
}