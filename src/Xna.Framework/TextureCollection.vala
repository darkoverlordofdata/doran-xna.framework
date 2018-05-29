// MonoGame - Copyright (C) The MonoGame Team
// This file is subject to the terms and conditions defined in
// file 'LICENSE.txt', which is part of this source code package.

using System;

namespace Microsoft.Xna.Framework.Graphics
{
    public abstract class TextureCollection : Object
    {
        private GraphicsDevice _graphicsDevice;
        private Texture[] _textures;
        private bool _applyToVertexStage;
        private int _dirty;
        private TextureTarget[] _targets;

        internal TextureCollection(GraphicsDevice graphicsDevice, int maxTextures, bool applyToVertexStage)
        {
            _graphicsDevice = graphicsDevice;
            _textures = new Texture[maxTextures];
            _applyToVertexStage = applyToVertexStage;
            _dirty = int.MaxValue;
        }

        public Texture @get(int index)
        {
            return _textures[index];
        }
        public void @set(int index, value Texture)
        {
            if (_applyToVertexStage && !_graphicsDevice.GraphicsCapabilities.SupportsVertexTextures)
                throw new Exception.NotSupportedException("Vertex textures are not supported on this device.");

            if (_textures[index] == value)
                return;

            _textures[index] = value;
            _dirty |= 1 << index;
        }

        internal void Clear()
        {
            for (var i = 0; i < _textures.length; i++)
                _textures[i] = null;

            PlatformClear();
            _dirty = int.MaxValue;
        }

        /// <summary>
        /// Marks all texture slots as dirty.
        /// </summary>
        internal void Dirty()
        {
            _dirty = int.MaxValue;
        }

        internal void SetTextures(GraphicsDevice device)
        {
            if (_applyToVertexStage && !device.GraphicsCapabilities.SupportsVertexTextures)
                return;
            PlatformSetTextures(device);
        }


        abstract void PlatformInit();

        abstract void PlatformClear();

        abstract void PlatformSetTextures(GraphicsDevice device);
        }
        
    }
}
