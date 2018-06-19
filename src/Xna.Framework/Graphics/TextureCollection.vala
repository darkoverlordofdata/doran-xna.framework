// MonoGame - Copyright (C) The MonoGame Team
// This file is subject to the terms and conditions defined in
// file 'LICENSE.txt', which is part of this source code package.

using System;
using ValaGame.OpenGL;

namespace Microsoft.Xna.Framework.Graphics
{
    public class TextureCollection : Object
    {
        public GraphicsDevice graphicsDevice { get; construct; }
        public bool applyToVertexStage { get; construct; }
        public Texture[] textures { get; private set; }
        private int _dirty;
        private TextureTarget[] _targets;

        internal TextureCollection(GraphicsDevice graphicsDevice, int maxTextures, bool applyToVertexStage)
        {
            GLib.Object (
                graphicsDevice : graphicsDevice,
                applyToVertexStage : applyToVertexStage
            );
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
