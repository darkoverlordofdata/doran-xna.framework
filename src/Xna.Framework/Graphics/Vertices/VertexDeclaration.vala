// MonoGame - Copyright (C) The MonoGame Team
// This file is subject to the terms and conditions defined in
// file 'LICENSE.txt', which is part of this source code package.

using System;
// // using System.Collections.Generic;
// using Microsoft.Xna.Framework.Utilities;

namespace Microsoft.Xna.Framework.Graphics
{
    /// <summary>
    /// Defines per-vertex data of a vertex buffer.
    /// </summary>
    /// <remarks>
    /// <see cref="VertexDeclaration"/> implements <see cref="IEquatable{T}"/> and can be used as
    /// a key in a HashTable. Two vertex declarations are considered equal if the vertices are
    /// structurally equivalent, i.e. the vertex elements and the vertex stride are identical. (The
    /// properties <see cref="GraphicsResource.Name"/> and <see cref="GraphicsResource.Tag"/> are
    /// ignored in <see cref="GetHashCode"/> and <see cref="Equals(VertexDeclaration)"/>!)
    /// </remarks>
    public class VertexDeclaration : Object // GraphicsResource //, IEquatable<VertexDeclaration>
    {
        // // Note for future refactoring:
        // // For XNA-compatibility VertexDeclaration is derived from GraphicsResource, which means it
        // // has GraphicsDevice, Name, Tag and implements IDisposable. This is unnecessary in
        // // MonoGame. VertexDeclaration.GraphicsDevice is never set.
        // // --> VertexDeclaration should be a lightweight immutable type. No base class, no IDisposable.
        // //     (Use the internal type Data. Do not expose a constructor. Use a factory method to
        // //     cache the vertex declarations.)

        // // #region ----- Data shared between structurally identical vertex declarations -----

        // private class Data : Object // IEquatable<Data>
        // {
        //     private int _hashCode;
        //     public int VertexStride;
        //     public VertexElement[] Elements;

        //     public Data(int vertexStride, VertexElement[] elements)
        //     {
        //         VertexStride = vertexStride;
        //         Elements = elements;

        //         // Pre-calculate hash code for fast comparisons and lookup in dictionaries.
        //         _hashCode = elements[0].GetHashCode();
        //         for (int i = 1; i < elements.Length; i++)
        //             _hashCode = (_hashCode * 397) ^ elements[i].GetHashCode();

        //         _hashCode = (_hashCode * 397) ^ elements.Length;
        //         _hashCode = (_hashCode * 397) ^ vertexStride;
        //     }

        //     // public override bool Equals(object obj)
        //     // {
        //     //     return Equals(obj as Data);
        //     // }

        //     public override bool Equals(Object other)
        //     {
        //         if (other is Data) 
        //         {
        //             if (ReferenceEquals(null, other))
        //                 return false;
        //             if (ReferenceEquals(this, other))
        //                 return true;

        //             if (_hashCode != other._hashCode
        //                 || VertexStride != other.VertexStride
        //                 || Elements.Length != other.Elements.Length)
        //             {
        //                 return false;
        //             }

        //             for (int i = 0; i < Elements.Length; i++)
        //                 if (!Elements[i].Equals(other.Elements[i]))
        //                     return false;

        //             return true;
        //         }
        //         else
        //         {
        //             return false;
        //         }
        //     }

        //     public override int GetHashCode()
        //     {
        //         return _hashCode;
        //     }
        // }
        // // #endregion


        // // #region ----- VertexDeclaration Cache -----

        // private static HashTable<Data, VertexDeclaration> _vertexDeclarationCache;

        // static construct
        // {
        //     _vertexDeclarationCache = new HashTable<Data, VertexDeclaration>(direct_equal, direct_hash);
        // }

        // internal static VertexDeclaration GetOrCreate(int vertexStride, VertexElement[] elements)
        // {
        //     // lock (_vertexDeclarationCache)
        //     // {
        //         var data = new Data(vertexStride, elements);
        //         VertexDeclaration vertexDeclaration;
        //         if (!_vertexDeclarationCache.TryGetValue(data, out vertexDeclaration))
        //         {
        //             // Data.Elements have already been set in the Data ctor. However, entries
        //             // in the vertex declaration cache must be immutable. Therefore, we create a 
        //             // copy of the array, which the user cannot access.
        //             data.Elements = (VertexElement[])elements.Clone();

        //             vertexDeclaration = new VertexDeclaration(data);
        //             _vertexDeclarationCache[data] = vertexDeclaration;
        //         }

        //         return vertexDeclaration;
        //     // }
        // }

        // private VertexDeclaration(Data data)
        // {
        //     _data = data;
        // }
        // // #endregion


        // private Data _data;

        // /// <summary>
        // /// Gets the internal vertex elements array.
        // /// </summary>
        // /// <value>The internal vertex elements array.</value>
        // internal VertexElement[] InternalVertexElements
        // {
        //     get { return _data.Elements; }
        // }

        // /// <summary>
        // /// Initializes a new instance of the <see cref="VertexDeclaration"/> class.
        // /// </summary>
        // /// <param name="elements">The vertex elements.</param>
        // /// <exception cref="ArgumentNullException">
        // /// <paramref name="elements"/> is <see langword="null"/> or empty.
        // /// </exception>
        // public VertexDeclaration.Elements(params VertexElement[] elements)
		// {
        //     this(GetVertexStride(elements), elements);
		// }

        // /// <summary>
        // /// Initializes a new instance of the <see cref="VertexDeclaration"/> class.
        // /// </summary>
        // /// <param name="vertexStride">The size of a vertex (including padding) in bytes.</param>
        // /// <param name="elements">The vertex elements.</param>
        // /// <exception cref="ArgumentNullException">
        // /// <paramref name="elements"/> is <see langword="null"/> or empty.
        // /// </exception>
        // public VertexDeclaration.Stride(int vertexStride, params VertexElement[] elements)
        // {
        //     if ((elements == null) || (elements.Length == 0))
        //         throw new Exception.ArgumentNullException("elements - Elements cannot be empty");

        //     lock (_vertexDeclarationCache)
        //     {
        //         var data = new Data(vertexStride, elements);
        //         VertexDeclaration vertexDeclaration;
        //         if (_vertexDeclarationCache.TryGetValue(data, out vertexDeclaration))
        //         {
        //             // Reuse existing data.
        //             _data = vertexDeclaration._data;
        //         }
        //         else
        //         {
        //             // Cache new vertex declaration.
        //             data.Elements = (VertexElement[])elements.Clone();
        //             _data = data;
        //             _vertexDeclarationCache[data] = this;
        //         }
        //     }
        // }

        // private static int GetVertexStride(VertexElement[] elements)
		// {
		// 	int max = 0;
		// 	for (var i = 0; i < elements.Length; i++)
		// 	{
        //         var start = elements[i].Offset + elements[i].VertexElementFormat.GetSize();
		// 		if (max < start)
		// 			max = start;
		// 	}

		// 	return max;
		// }

        // /// <summary>
        // /// Returns the VertexDeclaration for Type.
        // /// </summary>
        // /// <param name="vertexType">A value type which implements the IVertexType interface.</param>
        // /// <returns>The VertexDeclaration.</returns>
        // /// <remarks>
        // /// Prefer to use VertexDeclarationCache when the declaration lookup
        // /// can be performed with a templated type.
        // /// </remarks>
		// internal static VertexDeclaration FromType(Type vertexType)
		// {
		// 	if (vertexType == null)
		// 		throw new Exception.ArgumentNullException("vertexType - Cannot be null");

        //     // if (!ReflectionHelpers.IsValueType(vertexType))
        //     // {
		// 	// 	throw new Exception.ArgumentException("Must be value type - vertexType");
		// 	// }

        //     //var type = Activator.CreateInstance(vertexType) as IVertexType;
        //     IVertexType type = Object.new(type);
		// 	if (type == null)
		// 	{
		// 		throw new Exception.ArgumentException("vertexData does not inherit IVertexType");
		// 	}

        //     var vertexDeclaration = type.VertexDeclaration;
		// 	if (vertexDeclaration == null)
		// 	{
		// 		throw new Exception("VertexDeclaration cannot be null");
		// 	}

		// 	return vertexDeclaration;
		// }

        // /// <summary>
        // /// Gets a copy of the vertex elements.
        // /// </summary>
        // /// <returns>A copy of the vertex elements.</returns>
        // public VertexElement[] GetVertexElements()
		// {
		// 	return (VertexElement[])_data.Elements.Clone();
		// }

        // /// <summary>
        // /// Gets the size of a vertex (including padding) in bytes.
        // /// </summary>
        // /// <value>The size of a vertex (including padding) in bytes.</value>
        // public int VertexStride
		// {
		// 	get { return _data.VertexStride; }
		// }

        // /// <summary>
        // /// Determines whether the specified <see cref="object"/> is equal to this instance.
        // /// </summary>
        // /// <param name="obj">The object to compare with the current object.</param>
        // /// <returns>
        // /// <see langword="true"/> if the specified <see cref="object"/> is equal to this instance;
        // /// otherwise, <see langword="false"/>.
        // /// </returns>
        // // public override bool Equals(object obj)
        // // {
        // //     return Equals(obj as VertexDeclaration);
        // // }

        // /// <summary>
        // /// Determines whether the specified <see cref="VertexDeclaration"/> is equal to this
        // /// instance.
        // /// </summary>
        // /// <param name="other">The object to compare with the current object.</param>
        // /// <returns>
        // /// <see langword="true"/> if the specified <see cref="VertexDeclaration"/> is equal to this
        // /// instance; otherwise, <see langword="false"/>.
        // /// </returns>
        // public bool Equals(Object other)
        // {
        //     if (other is VertexDeclaration)
        //         return other != null && ReferenceEquals(_data, other._data);
        //     else return false;
        // }

        // /// <summary>
        // /// Returns a hash code for this instance.
        // /// </summary>
        // /// <returns>
        // /// A hash code for this instance, suitable for use in hashing algorithms and data
        // /// structures like a hash table.
        // /// </returns>
        // public override int GetHashCode()
        // {
        //     return _data.GetHashCode();
        // }

    }
}
