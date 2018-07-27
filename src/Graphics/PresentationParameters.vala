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
namespace Microsoft.Xna.Framework.Graphics
{
    using System;

    public class PresentationParameters : Object
    {
        public const int DefaultPresentRate = 60;

        private DepthFormat depthStencilFormat;
        private SurfaceFormat backBufferFormat;
        private int windowPositionX = GraphicsDeviceManager.DefaultWindowPositionX;
        private int windowPositionY = GraphicsDeviceManager.DefaultWindowPositionY;
        private int backBufferHeight = GraphicsDeviceManager.DefaultBackBufferHeight;
        private int backBufferWidth = GraphicsDeviceManager.DefaultBackBufferWidth;
        private IntPtr deviceWindowHandle;
        private int multiSampleCount;
        private bool disposed;
        private bool isFullScreen;
        private bool hardwareModeSwitch = true;

        /// <summary>
        /// Create a <see cref="PresentationParameters"/> instance with default values for all properties.
        /// </summary>
        public PresentationParameters()
        {
            Clear();
        }


        /// <summary>
        /// Get or set the format of the back buffer.
        /// </summary>
        public SurfaceFormat BackBufferFormat
        {
            get { return backBufferFormat; }
            set { backBufferFormat = value; }
        }

        public int WindowPositionX
        {
            get { return windowPositionX;}
            set { windowPositionX = value;}
        }

        public int WindowPositionY
        {
            get { return windowPositionY;}
            set { windowPositionY = value;}
        }

        /// <summary>
        /// Get or set the height of the back buffer.
        /// </summary>
        public int BackBufferHeight
        {
            get { return backBufferHeight; }
            set { backBufferHeight = value; }
        }

        /// <summary>
        /// Get or set the width of the back buffer.
        /// </summary>
        public int BackBufferWidth
        {
            get { return backBufferWidth; }
            set { backBufferWidth = value; }
        }

        /// <summary>
        /// Get the bounds of the back buffer.
        /// </summary>
        public Quadrangle Bounds 
        {
            get { return new Quadrangle(windowPositionX, windowPositionY, backBufferWidth, backBufferHeight); }
        }

        /// <summary>
        /// Get or set the handle of the window that will present the back buffer.
        /// </summary>
        public IntPtr DeviceWindowHandle
        {
            get { return deviceWindowHandle; }
            set { deviceWindowHandle = value; }
        }

        /// <summary>
        /// Get or set the depth stencil format for the back buffer.
        /// </summary>
		public DepthFormat DepthStencilFormat
        {
            get { return depthStencilFormat; }
            set { depthStencilFormat = value; }
        }

        /// <summary>
        /// Get or set a value indicating if we are in full screen mode.
        /// </summary>
        public bool IsFullScreen
        {
			get
            {
				 return isFullScreen;
            }
            set
            {
                isFullScreen = value;				
			}
        }

        /// <summary>
        /// If <code>true</code> the <see cref="GraphicsDevice"/> will do a mode switch
        /// when going to full screen mode. If <code>false</code> it will instead do a
        /// soft full screen by maximizing the window and making it borderless.
        /// </summary>
        public bool HardwareModeSwitch
        {
            get { return hardwareModeSwitch; }
            set { hardwareModeSwitch = value; }
        }

        /// <summary>
        /// Get or set the multisample count for the back buffer.
        /// </summary>
        public int MultiSampleCount
        {
            get { return multiSampleCount; }
            set { multiSampleCount = value; }
        }

        /// <summary>
        /// Get or set the presentation interval.
        /// </summary>
        public PresentInterval PresentationInterval;// { get; set; }

        /// <summary>
        /// Get or set the display orientation.
        /// </summary>
		public DisplayOrientation DisplayOrientation
		 { 
		 	get; 
		 	set; 
		 }
		
        /// <summary>
        /// Get or set the RenderTargetUsage for the back buffer.
        /// Determines if the back buffer is cleared when it is set as the
        /// render target by the <see cref="GraphicsDevice"/>.
        /// <see cref="GraphicsDevice"/> target.
        /// </summary>
		public RenderTargetUsage RenderTargetUsage;// { get; set; }

        /// <summary>
        /// Reset all properties to their default values.
        /// </summary>
        public void Clear()
        {
            backBufferFormat = SurfaceFormat.Color;
            backBufferWidth = 800; // GraphicsDeviceManager.DefaultBackBufferWidth;
            backBufferHeight = 640; // GraphicsDeviceManager.DefaultBackBufferHeight;     
            deviceWindowHandle = IntPtr.Zero;
            depthStencilFormat = DepthFormat.None;
            multiSampleCount = 0;
            PresentationInterval = PresentInterval.Default;
            DisplayOrientation = Microsoft.Xna.Framework.DisplayOrientation.Default;
        }

        /// <summary>
        /// Create a copy of this <see cref="PresentationParameters"/> instance.
        /// </summary>
        /// <returns></returns>
        public PresentationParameters Clone()
        {
            PresentationParameters clone = new PresentationParameters();
            clone.backBufferFormat = this.backBufferFormat;
            clone.backBufferHeight = this.backBufferHeight;
            clone.backBufferWidth = this.backBufferWidth;
            clone.deviceWindowHandle = this.deviceWindowHandle;
            clone.depthStencilFormat = this.depthStencilFormat;
            clone.isFullScreen = this.isFullScreen;
            clone.hardwareModeSwitch = this.hardwareModeSwitch;
            clone.multiSampleCount = this.multiSampleCount;
            clone.PresentationInterval = this.PresentationInterval;
            clone.DisplayOrientation = this.DisplayOrientation;
            clone.RenderTargetUsage = this.RenderTargetUsage;
            return clone;
        }
    }
}
