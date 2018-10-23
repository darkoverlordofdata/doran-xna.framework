using System;

namespace ValaGame.OpenGL
{
    internal class WindowInfo : Object
    {
        public IntPtr Handle { get; private set; }

        public WindowInfo(IntPtr handle)
        {
            Handle = handle;
        }
    }

}