// MonoGame - Copyright (C) The MonoGame Team
// This file is subject to the terms and conditions defined in
// file 'LICENSE.txt', which is part of this source code package.

using System;
// using System.Diagnostics;


namespace Microsoft.Xna.Framework.Graphics
{
    /// <summary>
    /// Stores the vertex layout (input elements) for the input assembler stage.
    /// </summary>
    /// <remarks>
    /// In the DirectX version the input layouts are cached in a dictionary. The
    /// <see cref="VertexInputLayout"/> is used as the key in the dictionary and therefore needs to
    /// implement <see cref="IEquatable{T}"/>. Two <see cref="VertexInputLayout"/> instance are
    /// considered equal if the vertex layouts are structurally identical.
    /// </remarks>
    internal abstract class VertexInputLayout : Object // IEquatable<VertexInputLayout>
    {
        protected VertexDeclaration[] VertexDeclarations { get; private set; }
        protected int[] InstanceFrequencies { get; private set; }

        /// <summary>
        /// Gets or sets the number of used input slots.
        /// </summary>
        /// <value>The number of used input slots.</value>
        public int Count { get; protected set; }

        /// <summary>
        /// Initializes a new instance of the <see cref="VertexInputLayout"/> class.
        /// </summary>
        /// <param name="maxVertexBufferSlots">The maximum number of vertex buffer slots.</param>
        protected VertexInputLayout.Slots(int maxVertexBufferSlots)
        {
            this(new VertexDeclaration[maxVertexBufferSlots], new int[maxVertexBufferSlots], 0);
        }

        /// <summary>
        /// Initializes a new instance of the <see cref="VertexInputLayout"/> class.
        /// </summary>
        /// <param name="vertexDeclarations">The array for storing vertex declarations.</param>
        /// <param name="instanceFrequencies">The array for storing instance frequencies.</param>
        /// <param name="count">The number of used slots.</param>
        protected VertexInputLayout(VertexDeclaration[] vertexDeclarations, int[] instanceFrequencies, int count)
        {
            assert(vertexDeclarations != null);
            assert(instanceFrequencies != null);
            assert(count >= 0);
            assert(vertexDeclarations.Length >= count);
            assert(vertexDeclarations.Length == instanceFrequencies.Length);

            Count = count;
            VertexDeclarations = vertexDeclarations;
            InstanceFrequencies = instanceFrequencies;
        }

        /// <summary>
        /// Determines whether the specified <see cref="object"/> is equal to this instance.
        /// </summary>
        /// <param name="obj">The object to compare with the current object.</param>
        /// <returns>
        /// <see langword="true"/> if the specified <see cref="object"/> is equal to this instance;
        /// otherwise, <see langword="false"/>.
        /// </returns>
        // public bool Equals(Object obj)
        // {
        //     return Equals(obj as VertexInputLayout);
        // }

        /// <summary>
        /// Determines whether the specified <see cref="VertexInputLayout"/> is equal to this
        /// instance.
        /// </summary>
        /// <param name="other">The object to compare with the current object.</param>
        /// <returns>
        /// <see langword="true"/> if the specified <see cref="VertexInputLayout"/> is equal to this
        /// instance; otherwise, <see langword="false"/>.
        /// </returns>
        public override bool Equals(Object other)
        {
            if (other is VertexInputLayout)
            {
                if (ReferenceEquals(null, other))
                    return false;
                if (ReferenceEquals(this, other))
                    return true;

                if (Count != other.Count)
                    return false;

                for (int i = 0; i < Count; i++)
                {
                    assert(VertexDeclarations[i] != null);
                    if (!VertexDeclarations[i].Equals(other.VertexDeclarations[i]))
                        return false;
                }

                for (int i = 0; i < Count; i++)
                {
                    if (!InstanceFrequencies[i].Equals(other.InstanceFrequencies[i]))
                        return false;
                }

                return true;
            }
            else
            {
                return false;
            }
        }

        /// <summary>
        /// Returns a hash code for this instance.
        /// </summary>
        /// <returns>
        /// A hash code for this instance, suitable for use in hashing algorithms and data
        /// structures like a hash table.
        /// </returns>
        public override int GetHashCode()
        {
            // ReSharper disable NonReadonlyMemberInGetHashCode
            int hashCode = 0;
            if (Count > 0)
            {
                hashCode = VertexDeclarations[0].GetHashCode();
                hashCode = (hashCode * 397) ^ InstanceFrequencies[0];
                for (int i = 1; i < Count; i++)
                {
                    hashCode = (hashCode * 397) ^ VertexDeclarations[i].GetHashCode();
                    hashCode = (hashCode * 397) ^ InstanceFrequencies[i];
                }
            }
            return hashCode;
            // ReSharper restore NonReadonlyMemberInGetHashCode
        }

    }
}
