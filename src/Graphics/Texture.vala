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
    using System.Diagnostics;
    // using System.Threading;

	public abstract class Texture : GraphicsResource
	{
		internal SurfaceFormat _format;
		internal int _levelCount;

        // private int _sortingKey = GLib.AtomicInt.add (ref _lastSortingKey, 1);
        public int SortingKey { get; construct; }
        private static int _lastSortingKey;

        /// <summary>
        /// Gets a unique identifier of this texture for sorting purposes.
        /// </summary>
        /// <remarks>
        /// <para>For example, this value is used by <see cref="SpriteBatch"/> when drawing with <see cref="SpriteSortMode.Texture"/>.</para>
        /// <para>The value is an implementation detail and may change between application launches or MonoGame versions.
        /// It is only guaranteed to stay consistent during application lifetime.</para>
        /// </remarks>
        // internal int SortingKey
        // {
        //     get { return _sortingKey; }
        // }

		public SurfaceFormat Format
		{
			get { return _format; }
		}
		
		public int LevelCount
		{
			get { return _levelCount; }
		}

        public Texture() {
            // GLib.Object(SortingKey: GLib.AtomicInt.add (ref _lastSortingKey, 1));
            _SortingKey = GLib.AtomicInt.add (ref _lastSortingKey, 1);
        }

        internal static int CalculateMipLevels(int width, int height = 0, int depth = 0)
        {
            int levels = 1;
            int size = int.max(int.max(width, height), depth);
            while (size > 1)
            {
                size = size / 2;
                levels++;
            }
            return levels;
        }

        internal static void GetSizeForLevel(int width, int height, int level, out int w, out int h)
        {
            w = width;
            h = height;
            while (level > 0)
            {
                --level;
                w /= 2;
                h /= 2;
            }
            if (w == 0)
                w = 1;
            if (h == 0)
                h = 1;
        }

        internal static void GetSizeForLevel2(int width, int height, int depth, int level, out int w, out int h, out int d)
        {
            w = width;
            h = height;
            d = depth;
            while (level > 0)
            {
                --level;
                w /= 2;
                h /= 2;
                d /= 2;
            }
            if (w == 0)
                w = 1;
            if (h == 0)
                h = 1;
            if (d == 0)
                d = 1;
        }

        internal int GetPitch(int width)
        {
            assert(width > 0); //, "The width is negative!");

            int pitch;

            switch (_format)
            {
                case SurfaceFormat.Dxt1:
                case SurfaceFormat.Dxt1SRgb:
                case SurfaceFormat.Dxt1a:
                case SurfaceFormat.RgbPvrtc2Bpp:
                case SurfaceFormat.RgbaPvrtc2Bpp:
                case SurfaceFormat.RgbEtc1:
                case SurfaceFormat.Dxt3:
                case SurfaceFormat.Dxt3SRgb:
                case SurfaceFormat.Dxt5:
                case SurfaceFormat.Dxt5SRgb:
                case SurfaceFormat.RgbPvrtc4Bpp:
                case SurfaceFormat.RgbaPvrtc4Bpp:                    
                    pitch = ((width + 3) / 4) * _format.GetSize();
                    break;

                default:
                    pitch = width * _format.GetSize();
                    break;
            };

            return pitch;
        }

        internal override void GraphicsDeviceResetting()
        {
            // PlatformGraphicsDeviceResetting();
        }
    }
}

