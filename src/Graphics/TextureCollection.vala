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
    using ValaGame.OpenGL;

    public class TextureCollection : Object
    {
        public GraphicsDevice graphicsDevice { get; construct; }
        public bool applyToVertexStage { get; construct; }
        public Texture[] textures { get; private set; }
        private int _dirty;
        private TextureTarget[] _targets;

        internal TextureCollection(GraphicsDevice graphicsDevice, int maxTextures, bool applyToVertexStage)
        {
            // GLib.Object (
            //     graphicsDevice : graphicsDevice,
            //     applyToVertexStage : applyToVertexStage
            // );
            _graphicsDevice = graphicsDevice;
            _applyToVertexStage = applyToVertexStage;
            textures = new Texture[maxTextures];
            
            _dirty = int.MAX;
            PlatformInit();
        }

        public Texture @get(int index)
        {
            return textures[index];
        }

        public void @set(int index, Texture value)
        {
            if (_applyToVertexStage && !_graphicsDevice.GraphicsCapabilities.SupportsVertexTextures)
                throw new Exception.NotSupportedException("Vertex textures are not supported on this device.");

            if (textures[index] == value)
                return;

            textures[index] = value;
            _dirty |= 1 << index;
        }

        internal void Clear()
        {
            for (var i = 0; i < textures.length; i++)
                textures[i] = null;

            PlatformClear();
            _dirty = int.MAX;
        }

        /// <summary>
        /// Marks all texture slots as dirty.
        /// </summary>
        internal void Dirty()
        {
            _dirty = int.MAX;
        }

        internal void SetTextures(GraphicsDevice device)
        {
            if (_applyToVertexStage && !device.GraphicsCapabilities.SupportsVertexTextures)
                return;
            PlatformSetTextures(device);
        }

        void PlatformInit()
        {
            _targets = new TextureTarget[textures.length];
        }

        void PlatformClear()
        {
            for (var i = 0; i < _targets.length; i++)
                _targets[i] = 0;
        }

        void PlatformSetTextures(GraphicsDevice device)
        {
            // Skip out if nothing has changed.
            if (_dirty == 0)
                return;

            for (var i = 0; i < textures.length; i++)
            {
                var mask = 1 << i;
                if ((_dirty & mask) == 0)
                    continue;

                var tex = textures[i];

                // GL.ActiveTexture(TextureUnit.Texture0 + i);
                // GraphicsExtensions.CheckGLError();

                // // Clear the previous binding if the 
                // // target is different from the new one.
                // if (_targets[i] != 0 && (tex == null || _targets[i] != tex.glTarget))
                // {
                //     GL.BindTexture(_targets[i], 0);
                //     _targets[i] = 0;
                //     GraphicsExtensions.CheckGLError();
                // }

                // if (tex != null)
                // {
                //     _targets[i] = tex.glTarget;
                //     GL.BindTexture(tex.glTarget, tex.glTexture);
                //     GraphicsExtensions.CheckGLError();

                //     _graphicsDevice._graphicsMetrics._textureCount++;
                // }

                _dirty &= ~mask;
                if (_dirty == 0)
                    break;
            }

            _dirty = 0;
        }
        
    }
}
