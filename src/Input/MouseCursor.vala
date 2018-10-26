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
namespace Microsoft.Xna.Framework.Input
{
    using System;
    using Microsoft.Xna.Framework.Graphics;

    /// <summary>
    /// Describes a mouse cursor.
    /// </summary>
    public class MouseCursor : Disposable
    {
        /// <summary>
        /// Gets the default arrow cursor.
        /// </summary>
        public static MouseCursor Arrow { get; private set; }

        /// <summary>
        /// Gets the cursor that appears when the mouse is over text editing regions.
        /// </summary>
        public static MouseCursor IBeam { get; private set; }

        /// <summary>
        /// Gets the waiting cursor that appears while the application/system is busy.
        /// </summary>
        public static MouseCursor Wait { get; private set; }

        /// <summary>
        /// Gets the crosshair ("+") cursor.
        /// </summary>
        public static MouseCursor Crosshair { get; private set; }

        /// <summary>
        /// Gets the cross between Arrow and Wait cursors.
        /// </summary>
        public static MouseCursor WaitArrow { get; private set; }

        /// <summary>
        /// Gets the northwest/southeast ("\") cursor.
        /// </summary>
        public static MouseCursor SizeNWSE { get; private set; }

        /// <summary>
        /// Gets the northeast/southwest ("/") cursor.
        /// </summary>
        public static MouseCursor SizeNESW { get; private set; }

        /// <summary>
        /// Gets the horizontal west/east ("-") cursor.
        /// </summary>
        public static MouseCursor SizeWE { get; private set; }

        /// <summary>
        /// Gets the vertical north/south ("|") cursor.
        /// </summary>
        public static MouseCursor SizeNS { get; private set; }

        /// <summary>
        /// Gets the size all cursor which points in all directions.
        /// </summary>
        public static MouseCursor SizeAll { get; private set; }

        /// <summary>
        /// Gets the cursor that points that something is invalid, usually a cross.
        /// </summary>
        public static MouseCursor No { get; private set; }

        /// <summary>
        /// Gets the hand cursor, usually used for web links.
        /// </summary>
        public static MouseCursor Hand { get; private set; }

        /// <summary>
        /// Creates a mouse cursor from the specified texture.
        /// </summary>
        /// <param name="texture">Texture to use as the cursor image.</param>
        /// <param name="originx">X cordinate of the image that will be used for mouse position.</param>
        /// <param name="originy">Y cordinate of the image that will be used for mouse position.</param>
        // public static MouseCursor FromTexture2D(Texture2D texture, int originx, int originy)
        // {
        //     if (texture.Format != SurfaceFormat.Color && texture.Format != SurfaceFormat.ColorSRgb)
        //         throw new ArgumentException("Only Color or ColorSrgb textures are accepted for mouse cursors", "texture");

        //     return PlatformFromTexture2D(texture, originx, originy);
        // }

        public IntPtr Handle { get; private set; }

        private bool _disposed;

        private MouseCursor(IntPtr handle)
        {
            Handle = handle;
        }

        public override void Dispose()
        {
            if (_disposed)
                return;

            PlatformDispose();
            _disposed = true;
        }

        private MouseCursor.Platform(Sdl.Mouse.SystemCursor cursor)
        {
            Handle = Sdl.Mouse.CreateSystemCursor(cursor);
        }

        public static void Initialize()
        {
            PlatformInitalize();
        }

        private static void PlatformInitalize()
        {
            Arrow = new MouseCursor.Platform(Sdl.Mouse.SystemCursor.Arrow);
            IBeam = new MouseCursor.Platform(Sdl.Mouse.SystemCursor.IBeam);
            Wait = new MouseCursor.Platform(Sdl.Mouse.SystemCursor.Wait);
            Crosshair = new MouseCursor.Platform(Sdl.Mouse.SystemCursor.Crosshair);
            WaitArrow = new MouseCursor.Platform(Sdl.Mouse.SystemCursor.WaitArrow);
            SizeNWSE = new MouseCursor.Platform(Sdl.Mouse.SystemCursor.SizeNWSE);
            SizeNESW = new MouseCursor.Platform(Sdl.Mouse.SystemCursor.SizeNESW);
            SizeWE = new MouseCursor.Platform(Sdl.Mouse.SystemCursor.SizeWE);
            SizeNS = new MouseCursor.Platform(Sdl.Mouse.SystemCursor.SizeNS);
            SizeAll = new MouseCursor.Platform(Sdl.Mouse.SystemCursor.SizeAll);
            No = new MouseCursor.Platform(Sdl.Mouse.SystemCursor.No);
            Hand = new MouseCursor.Platform(Sdl.Mouse.SystemCursor.Hand);
        }

        // private static MouseCursor PlatformFromTexture2D(Texture2D texture, int originx, int originy)
        // {
        //     IntPtr surface = IntPtr.Zero;
        //     IntPtr handle = IntPtr.Zero;
        //     try
        //     {
        //         var bytes = new byte[texture.Width * texture.Height * 4];
        //         texture.GetData(bytes);
        //         surface = Sdl.CreateRGBSurfaceFrom(bytes, texture.Width, texture.Height, 32, texture.Width * 4, 0x000000ff, 0x0000FF00, 0x00FF0000, 0xFF000000);
        //         if (surface == IntPtr.Zero)
        //             throw new InvalidOperationException("Failed to create surface for mouse cursor: " + Sdl.GetError());

        //         handle = Sdl.Mouse.CreateColorCursor(surface, originx, originy);
        //         if (handle == IntPtr.Zero)
        //             throw new InvalidOperationException("Failed to set surface for mouse cursor: " + Sdl.GetError());
        //     }
        //     finally
        //     {
        //         if (surface != IntPtr.Zero)
        //             Sdl.FreeSurface(surface);
        //     }

        //     return new MouseCursor(handle);
        // }

        private void PlatformDispose()
        {
            if (Handle == IntPtr.Zero)
                return;
            
            Sdl.Mouse.FreeCursor(Handle);
            Handle = IntPtr.Zero;
        }


    }
}