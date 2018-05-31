// MonoGame - Copyright (C) The MonoGame Team
// This file is subject to the terms and conditions defined in
// file 'LICENSE.txt', which is part of this source code package.

using System;
// using System.Runtime.Serialization;

namespace Microsoft.Xna.Framework.Graphics
{
    /// <summary>
    /// Describes the view bounds for render-target surface.
    /// </summary>
    // [DataContract]
    public class Viewport : Object
    {
		private int x;
		private int y;
		private int width;
		private int height;
		private float minDepth;
		private float maxDepth;

        /// <summary>
        /// The height of the bounds in pixels.
        /// </summary>
        // [DataMember]
        public int Height
        {
			get {
				return this.height;
			}
			set {
				height = value;
			}
		}

        /// <summary>
        /// The upper limit of depth of this viewport.
        /// </summary>
        // [DataMember]
        public float MaxDepth
        {
			get {
				return this.maxDepth;
			}
			set {
				maxDepth = value;
			}
		}

        /// <summary>
        /// The lower limit of depth of this viewport.
        /// </summary>
        // [DataMember]
        public float MinDepth
        {
			get {
				return this.minDepth;
			}
			set {
				minDepth = value;
			}
		}

        /// <summary>
        /// The width of the bounds in pixels.
        /// </summary>
        // [DataMember]
        public int Width
        {
			get {
				return this.width;
			}
			set {
				width = value;
			}
		}

        /// <summary>
        /// The y coordinate of the beginning of this viewport.
        /// </summary>
        // [DataMember]
        public int Y
        {
			get {
				return this.y;

			}
			set {
				y = value;
			}
		}

        /// <summary>
        /// The x coordinate of the beginning of this viewport.
        /// </summary>
        // [DataMember]
        public int X 
		{
			get{ return x;}
			set{ x = value;}
		}

        /// <summary>
        /// Gets the aspect ratio of this <see cref="Viewport"/>, which is width / height. 
        /// </summary>
		public float AspectRatio 
		{
			get
			{
				if ((height != 0) && (width != 0))
				{
					return (((float) width)/((float)height));
				}
				return 0f;
			}
		}
		
        //  Referencing Rectangle here causes a symbol redefinition error:
        //
        // WINGDIAPI WINBOOL WINAPI Rectangle(HDC hdc,int left,int top,int right,int bottom);
        //
        //  Really, Windoze?
        //
        /// <summary>
        /// Gets or sets a boundary of this <see cref="Viewport"/>.
        /// </summary>
		// public Rectangle Bounds 
		// {
        //     get
        //     {
        //         return new Rectangle(x, y, width, height);
        //     }
				
		// 	set
		// 	{				
		// 		x = value.X;
		// 		y = value.Y;
		// 		width = value.Width;
		// 		height = value.Height;
		// 	}
		// }

        /// <summary>
        /// Constructs a viewport from the given values. The <see cref="MinDepth"/> will be 0.0 and <see cref="MaxDepth"/> will be 1.0.
        /// </summary>
        /// <param name="x">The x coordinate of the upper-left corner of the view bounds in pixels.</param>
        /// <param name="y">The y coordinate of the upper-left corner of the view bounds in pixels.</param>
        /// <param name="width">The width of the view bounds in pixels.</param>
        /// <param name="height">The height of the view bounds in pixels.</param>
        // public Viewport(int x, int y, int width, int height)
		// {
		// 	this.x = x;
		//     this.y = y;
		//     this.width = width;
		//     this.height = height;
		//     this.minDepth = 0.0f;
		//     this.maxDepth = 1.0f;
		// }

        /// <summary>
        /// Constructs a viewport from the given values.
        /// </summary>
        /// <param name="x">The x coordinate of the upper-left corner of the view bounds in pixels.</param>
        /// <param name="y">The y coordinate of the upper-left corner of the view bounds in pixels.</param>
        /// <param name="width">The width of the view bounds in pixels.</param>
        /// <param name="height">The height of the view bounds in pixels.</param>
        /// <param name="minDepth">The lower limit of depth.</param>
        /// <param name="maxDepth">The upper limit of depth.</param>
        public Viewport(int x, int y, int width, int height,float minDepth = 0,float maxDepth = 1)
        {
            this.x = x;
            this.y = y;
            this.width = width;
            this.height = height;
            this.minDepth = minDepth;
            this.maxDepth = maxDepth;
        }

        // /// <summary>
        // /// Creates a new instance of <see cref="Viewport"/> struct.
        // /// </summary>
        // /// <param name="bounds">A <see cref="Rectangle"/> that defines the location and size of the <see cref="Viewport"/> in a render target.</param>
		// public Viewport.FromRectangle(Rectangle bounds) 
		// {
        //     this(bounds.X, bounds.Y, bounds.Width, bounds.Height);
		// }

        /// <summary>
        /// Projects a <see cref="Vector3"/> from world space into screen space.
        /// </summary>
        /// <param name="source">The <see cref="Vector3"/> to project.</param>
        /// <param name="projection">The projection <see cref="Matrix4"/>.</param>
        /// <param name="view">The view <see cref="Matrix4"/>.</param>
        /// <param name="world">The world <see cref="Matrix4"/>.</param>
        /// <returns></returns>
        public Vector3 Project(Vector3 source, Matrix4 projection, Matrix4 view, Matrix4 world)
        {
            Matrix4 matrix = projection.Multiply(world.Multiply(view));
		    Vector3 vector = Transform(ref source, ref matrix);
		    float a = (((source.X * matrix.M14) + (source.Y * matrix.M24)) + (source.Z * matrix.M34)) + matrix.M44;
		    if (!WithinEpsilon(a, 1f))
		    {
		        vector.X = vector.X / a;
		        vector.Y = vector.Y / a;
		        vector.Z = vector.Z / a;
		    }
		    vector.X = (((vector.X + 1f) * 0.5f) * this.width) + this.x;
		    vector.Y = (((-vector.Y + 1f) * 0.5f) * this.height) + this.y;
		    vector.Z = (vector.Z * (this.maxDepth - this.minDepth)) + this.minDepth;
		    return vector;
        }

        Vector3 Transform(ref Vector3 position, ref Matrix4 matrix)
        {
            var x = (position.X * matrix.M11) + (position.Y * matrix.M21) + (position.Z * matrix.M31) + matrix.M41;
            var y = (position.X * matrix.M12) + (position.Y * matrix.M22) + (position.Z * matrix.M32) + matrix.M42;
            var z = (position.X * matrix.M13) + (position.Y * matrix.M23) + (position.Z * matrix.M33) + matrix.M43;
            return new Vector3(x, y, z);;
        }
        /// <summary>
        /// Unprojects a <see cref="Vector3"/> from screen space into world space.
        /// </summary>
        /// <param name="source">The <see cref="Vector3"/> to unproject.</param>
        /// <param name="projection">The projection <see cref="Matrix4"/>.</param>
        /// <param name="view">The view <see cref="Matrix4"/>.</param>
        /// <param name="world">The world <see cref="Matrix4"/>.</param>
        /// <returns></returns>
        public Vector3 Unproject(Vector3 source, Matrix4 projection, Matrix4 view, Matrix4 world)
        {
            // Matrix4 matrix = Matrix4.Invert(Matrix4.Multiply(Matrix4.Multiply(world, view), projection));
            var matrix = projection.Multiply(world.Multiply(view)).Invert();
		    source.X = (((source.X - this.x) / ((float) this.width)) * 2f) - 1f;
		    source.Y = -((((source.Y - this.y) / ((float) this.height)) * 2f) - 1f);
		    source.Z = (source.Z - this.minDepth) / (this.maxDepth - this.minDepth);
		    //Vector3 vector = Vector3.Transform(source, matrix);
            var vector = Transform(ref source, ref matrix);
		    float a = (((source.X * matrix.M14) + (source.Y * matrix.M24)) + (source.Z * matrix.M34)) + matrix.M44;
		    if (!WithinEpsilon(a, 1f))
		    {
		        vector.X = vector.X / a;
		        vector.Y = vector.Y / a;
		        vector.Z = vector.Z / a;
		    }
		    return vector;

        }
		
		private static bool WithinEpsilon(float a, float b)
		{
		    float num = a - b;
		    return ((-1.401298E-45f <= num) && (num <= float.EPSILON));
		}

        /// <summary>
        /// Returns a <see cref="String"/> representation of this <see cref="Viewport"/> in the format:
        /// {X:[<see cref="X"/>] Y:[<see cref="Y"/>] Width:[<see cref="Width"/>] Height:[<see cref="Height"/>] MinDepth:[<see cref="MinDepth"/>] MaxDepth:[<see cref="MaxDepth"/>]}
        /// </summary>
        /// <returns>A <see cref="String"/> representation of this <see cref="Viewport"/>.</returns>
        public override string ToString ()
	    {
	        return @"{X:$x Y:$y Width:$width Height:$height MinDepth:$minDepth MaxDepth:$maxDepth}";
	    }
    }
}

