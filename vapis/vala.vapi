[CCode (cprefix = "", lower_case_cprefix = "", cheader_filename = "valagame.h")]
namespace Vala 
{
	public const int MajorVersion;
	public const int MinorVersion;
	public const int BuildVersion;


	[Compact]
	[CCode (cname = "Vala_Object", ref_function = "Vala_Object_AddRef", unref_function = "Vala_Object_Release")]
	public class Object
	{
		[CCode (cname = "Vala_Object_New")]
		public Object();
		[CCode (cname = "Vala_Object_ToString")]
		public unowned string ToString();
		[CCode (cname = "Vala_Object_GetHashCode")]
		public int GetHashCode();
		[CCode (cname = "Vala_Object_Equals")]
		public bool Equals(Object? other);
		[CCode (cname = "Vala_Object_ReferenceEquals")]
		public static bool ReferenceEquals(Object? objA, Object? objB);
		[CCode (cname = "Vala_Object_InstanceEquals")]
		public static bool InstanceEquals(Object? objA, Object? objB);
	}

	[Compact]
	[CCode (cname = "Vala_Shape", ref_function = "Vala_Object_AddRef", unref_function = "Vala_Object_Release")]
	public abstract class Shape : Object
	{
		[CCode (cname = "Vala_Shape_New")]
		public Shape();
		[CCode (cname = "Vala_Shape_Area")]
		public abstract int Area();
		[CCode (cname = "Vala_Shape_Draw")]
		public abstract int Draw();
		[CCode (cname = "Vala_Shape_MoveBy")]
		public int MoveBy(int dx, int dy);
		[CCode (cname = "Vala_Shape_ToString")]
		public abstract unowned string ToString();
	}

	[Compact]
	[CCode (cname = "Vala_Rect", ref_function = "Vala_Object_AddRef", unref_function = "Vala_Object_Release")]
	public class Rect : Shape
	{
		[CCode (cname = "Vala_Rect_New")]
		public Rect(int x, int y, int width, int height);
	}

	[Compact]
	[CCode (cname = "Vala_Circle", ref_function = "Vala_Object_AddRef", unref_function = "Vala_Object_Release")]
	public class Circle : Shape
	{
		[CCode (cname = "Vala_Circle_New")]
		public Circle(int x, int y, int radius);
	}

}
