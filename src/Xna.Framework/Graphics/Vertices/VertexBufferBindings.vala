// MonoGame - Copyright (C) The MonoGame Team
// This file is subject to the terms and conditions defined in
// file 'LICENSE.txt', which is part of this source code package.

using System;
// using System.Diagnostics;


namespace Microsoft.Xna.Framework.Graphics
{
    /// <summary>
    /// Stores the vertex buffers to be bound to the input assembler stage.
    /// </summary>
    internal class VertexBufferBindings : VertexInputLayout
    {
        private VertexBuffer[] _vertexBuffers;
        private int[] _vertexOffsets;

        /// <summary>
        /// Initializes a new instance of the <see cref="VertexBufferBindings" /> class.
        /// </summary>
        /// <param name="maxVertexBufferSlots">The maximum number of vertex buffer slots.</param>
        public VertexBufferBindings(int maxVertexBufferSlots)
        {
            base(new VertexDeclaration[maxVertexBufferSlots], new int[maxVertexBufferSlots], 0);
            _vertexBuffers = new VertexBuffer[maxVertexBufferSlots];
            _vertexOffsets = new int[maxVertexBufferSlots];
        }

        /// <summary>
        /// Clears the vertex buffer slots.
        /// </summary>
        /// <returns>
        /// <see langword="true"/> if the input layout was changed; otherwise,
        /// <see langword="false"/>.
        /// </returns>
        public bool Clear()
        {
            if (Count == 0)
                return false;

            Memory.set(VertexDeclarations, 0, Count*sizeof(Object));
            Memory.set(InstanceFrequencies, 0, Count*sizeof(int));
            Memory.set(_vertexBuffers, 0, Count*sizeof(Object));
            Memory.set(_vertexOffsets, 0, Count*sizeof(int));
            Count = 0;
            return true;
        }

        /// <summary>
        /// Binds the specified vertex buffer to the first input slot.
        /// </summary>
        /// <param name="vertexBuffer">The vertex buffer.</param>
        /// <param name="vertexOffset">
        /// The offset (in vertices) from the beginning of the vertex buffer to the first vertex to 
        /// use.
        /// </param>
        /// <returns>
        /// <see langword="true"/> if the input layout was changed; otherwise,
        /// <see langword="false"/>.
        /// </returns>
        public bool Set(VertexBuffer vertexBuffer, int vertexOffset)
        {
            assert(vertexBuffer != null);
            assert(0 <= vertexOffset && vertexOffset < vertexBuffer.VertexCount);

            if (Count == 1
                && InstanceFrequencies[0] == 0
                && _vertexBuffers[0] == vertexBuffer
                && _vertexOffsets[0] == vertexOffset)
            {
                return false;
            }

            VertexDeclarations[0] = vertexBuffer.VertexDeclaration;
            InstanceFrequencies[0] = 0;
            _vertexBuffers[0] = vertexBuffer;
            _vertexOffsets[0] = vertexOffset;
            if (Count > 1)
            {
                Memory.set(VertexDeclarations[1], 0, (Count-1)*sizeof(Object));
                Memory.set(InstanceFrequencies[1], 0, (Count-1)*sizeof(int));
                Memory.set(_vertexBuffers[1], 0, (Count-1)*sizeof(Object));
                Memory.set(_vertexOffsets[1], 0, (Count-1)*sizeof(int));
            }

            Count = 1;
            return true;
        }

        /// <summary>
        /// Binds the the specified vertex buffers to the input slots.
        /// </summary>
        /// <param name="vertexBufferBindings">The vertex buffer bindings.</param>
        /// <returns>
        /// <see langword="true"/> if the input layout was changed; otherwise,
        /// <see langword="false"/>.
        /// </returns>
        public bool Sets(params VertexBufferBinding[] vertexBufferBindings)
        {
            assert(vertexBufferBindings != null);
            assert(vertexBufferBindings.Length > 0);
            assert(vertexBufferBindings.Length <= _vertexBuffers.Length);

            bool isDirty = false;
            for (int i = 0; i < vertexBufferBindings.Length; i++)
            {
                assert(vertexBufferBindings[i].VertexBuffer != null);

                if (InstanceFrequencies[i] == vertexBufferBindings[i].InstanceFrequency
                    && _vertexBuffers[i] == vertexBufferBindings[i].VertexBuffer
                    && _vertexOffsets[i] == vertexBufferBindings[i].VertexOffset)
                {
                    continue;
                }

                VertexDeclarations[i] = vertexBufferBindings[i].VertexBuffer.VertexDeclaration;
                InstanceFrequencies[i] = vertexBufferBindings[i].InstanceFrequency;
                _vertexBuffers[i] = vertexBufferBindings[i].VertexBuffer;
                _vertexOffsets[i] = vertexBufferBindings[i].VertexOffset;
                isDirty = true;
            }

            if (Count > vertexBufferBindings.Length)
            {
                int startIndex = vertexBufferBindings.Length;
                int length = Count - startIndex;

                Memory.set(VertexDeclarations[startIndex], 0, (length-1)*sizeof(Object));
                Memory.set(InstanceFrequencies[startIndex], 0, (length-1)*sizeof(int));
                Memory.set(_vertexBuffers[startIndex], 0, (length-1)*sizeof(Object));
                Memory.set(_vertexOffsets[startIndex], 0, (length-1)*sizeof(int));
                isDirty = true;
            }

            Count = vertexBufferBindings.Length;
            return isDirty;
        }

        /// <summary>
        /// Gets vertex buffer bound to the specified input slots.
        /// </summary>
        /// <returns>The vertex buffer binding.</returns>
        public VertexBufferBinding Get(int slot)
        {
            assert(0 <= slot && slot < Count);

            return new VertexBufferBinding(
                _vertexBuffers[slot],
                _vertexOffsets[slot],
                InstanceFrequencies[slot]);
        }

        /// <summary>
        /// Gets vertex buffers bound to the input slots.
        /// </summary>
        /// <returns>The vertex buffer bindings.</returns>
        public VertexBufferBinding[] Gets()
        {
            var bindings = new VertexBufferBinding[Count];
            for (int i = 0; i < bindings.Length; i++)
                bindings[i] = new VertexBufferBinding(
                    _vertexBuffers[i],
                    _vertexOffsets[i],
                    InstanceFrequencies[i]);

            return bindings;
        }
    }
}
