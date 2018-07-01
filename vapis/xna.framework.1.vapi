/*
The MIT License (MIT)

Copyright (c) <2018> <xna.framework vapi>

Corange definitions used for xna port.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
*/
[Version (since = "0.8.0")] // Corange v0.8.0
[CCode (cprefix = "", lower_case_cprefix = "", cheader_filename = "corange.h")]
namespace Microsoft.Xna.Framework 
{
	public static void corange_init(string core_assets_path);
	public static void corange_finish();

	[CCode (cname = "ui_render")]
	public void corange_ui_render();
	[CCode (cname = "ui_update")]
	public void corange_ui_update();
	[CCode (cname = "ui_event")]
	public void corange_ui_event(Sdl.Event e);

	[CCode (cname = "frame_begin")]
	public void corange_frame_begin();
	[CCode (cname = "frame_end")]
	public void corange_frame_end();
	[CCode (cname = "frame_rate")]
	public double corange_frame_rate();
	[CCode (cname = "frame_time")]
	public double corange_frame_time();

	[CCode (cname = "texture_handle")]
	public uint corange_texture_handle(IntPtr texture);
	[CCode (cname = "asset_get")]
	public IntPtr corange_asset_get(URI path);
	[CCode (cname = "texture_get_image")]
	public Assets.Image corange_texture_get_image(IntPtr texture);

	[CCode (cname = "graphics_viewport_ratio")]
	public static double corange_graphics_viewport_ratio();
	[CCode (cname = "graphics_viewport_height")]
	public static int corange_graphics_viewport_height();
	[CCode (cname = "graphics_viewport_width")]
	public static int corange_graphics_viewport_width();
	[CCode (cname = "graphics_viewport_title")]
	public static string corange_graphics_viewport_title();
	[CCode (cname = "graphics_get_multisamples")]
	public static int corange_graphics_get_multisamples();
	[CCode (cname = "graphics_set_multisamples")]
	public static void corange_graphics_set_multisamples(int samples);
	[CCode (cname = "graphics_get_fullscreen")]
	public static bool corange_graphics_get_fullscreen();
	[CCode (cname = "graphics_set_fullscreen")]
	public static void corange_graphics_set_fullscreen(bool fullscreen);
	[CCode (cname = "graphics_get_antialiasing")]
	public static int corange_graphics_get_antialiasing();
	[CCode (cname = "graphics_set_antialiasing")]
	public static void corange_graphics_set_antialiasing(int quality);
	[CCode (cname = "graphics_get_cursor_hidden")]
	public static bool corange_graphics_get_cursor_hidden();
	[CCode (cname = "graphics_set_cursor_hidden")]
	public static void corange_graphics_set_cursor_hidden(bool hidden);
	[CCode (cname = "graphics_context_new")]
	public static IntPtr corange_graphics_context_new();
	[CCode (cname = "graphics_context_delete")]
	public static void corange_graphics_context_delete(IntPtr context);
	[CCode (cname = "graphics_context_current")]
	public static void corange_graphics_context_current(IntPtr context);
	[CCode (cname = "graphics_viewport_set_title")]
	public static void corange_graphics_viewport_set_title(string title);
	[CCode (cname = "graphics_viewport_set_icon")]
	public static void corange_graphics_viewport_set_icon(URI icon);
	[CCode (cname = "graphics_viewport_set_position")]
	public static void corange_graphics_viewport_set_position(int x, int y);
	[CCode (cname = "graphics_viewport_set_size")]
	public static void corange_graphics_viewport_set_size(int w, int h);
	[CCode (cname = "graphics_set_vsync")]
	public static void corange_graphics_set_vsync(bool vsync);
	[CCode (cname = "graphics_viewport_screenshot")]
	public static void corange_graphics_viewport_screenshot();
	[CCode (cname = "graphics_swap")]
	public static void corange_graphics_swap();

	[SimpleType, CCode (cname = "type_id")]
	public struct TypeId : int {}

	/** 
	 * URI
	 * 
	 * P and FPath are terrible names.
	 * Path and Resource are already taken
	 * so ... URI
	 * 
	 */
	[SimpleType, CCode (cname = "fpath")]
	public struct URI 
	{
		[CCode (array_null_terminated = true)]
		private char ptr[512];

		[CCode (cname = "P")]
		public URI (string path);
		[CCode (cname = "fpath_full")]
		public URI Full();
		[CCode (cname = "fpath_file")]
		public URI File();
		[CCode (cname = "fpath_file_location")]
		public URI Location();
		[CCode (cname = "fpath_file_extension")]
		public URI Extension();
		public unowned string to_string() {
			return (string)ptr;
		}
		public unowned string ToString() {
			return (string)ptr;
		}
	}
	
	[SimpleType, CCode (cname = "asset_hndl", cprefix="")]
	public struct AssetHandle 
	{
		private URI path;
		private IntPtr ptr;
		private uint32 timestamp;

		[CCode (cname = "asset_hndl_new")]
		public AssetHandle(URI path);
		[CCode (cname = "asset_hndl_null")]
		public static AssetHandle Null();
		[CCode (cname = "asset_hndl_new_load")]
		public static AssetHandle Load(URI path);
		[CCode (cname = "asset_hndl_new_ptr")]
		public static AssetHandle AssetPtr(IntPtr as);
		[CCode (cname = "asset_hndl_isnull")]
		public bool IsNull();
		[CCode (cname = "asset_hndl_path")]
		public URI Path();
		[CCode (cname = "asset_hndl_ptr")]
		public static Asset* Ptr(ref AssetHandle ah);
		[CCode (cname = "asset_hndl_ptr")]
		public static Assets.Material MaterialPtr(ref AssetHandle ah);
		[CCode (cname = "asset_hndl_ptr")]
		public static Assets.Renderable RenderablePtr(ref AssetHandle ah);
		[CCode (cname = "asset_hndl_equal")]
		public bool Equal(AssetHandle other);
	}

	[CCode (has_target = false)]
	public delegate Entity AssetLoader(string filenanme);
	[CCode (has_target = false)]
	public delegate void AssetDeleter(Entity asset);
	
	[SimpleType, CCode (cname = "IntPtr", cprefix="")]
	public struct Sound 
	{
		[CCode (cname = "audio_sound_play")]
		public static void Play(IntPtr s, int loops=0);
		[CCode (cname = "audio_sound_pause")]
		public static void Pause();
		[CCode (cname = "audio_sound_resume")]
		public static void Resume();
		[CCode (cname = "audio_sound_stop")]
		public static void Stop();
	}
	
	[SimpleType, CCode (cname = "IntPtr", cprefix="")]
	public struct Music 
	{
		[CCode (cname = "audio_music_play")]
		public static void Play(Assets.Music m);
		[CCode (cname = "audio_music_pause")]
		public static void Pause();
		[CCode (cname = "audio_music_resume")]
		public static void Resume();
		[CCode (cname = "audio_music_stop")]
		public static void Stop();
	}

	[CCode (has_target = false)]
	public delegate Entity ElemNew();

	[CCode (has_target = false)]
	public delegate void ElemDel(Entity entity);


	[SimpleType, CCode (cname = "IntPtr", cprefix="")]
	public struct Folder 
	{
		[CCode (cname = "folder_load")]
		public static void Load(URI folder);
		[CCode (cname = "folder_unload")]
		public static void Unload(URI folder);
		[CCode (cname = "folder_reload")]
		public static void Reload(URI folder);
		[CCode (cname = "assetfolder_load_recursive_get_load")]
		public static void LoadRecursive(URI folder);
	}

	[SimpleType, CCode (cname = "asset", cprefix="")]
	public struct Asset 
	{
		[CCode (cname = "asset_get_load")]
		public static IntPtr Load(URI path);
		[CCode (cname = "asset_get")]
		public static IntPtr Get(URI path);
		[CCode (cname = "asset_get_as_type")]
		public static IntPtr As(URI path, TypeId type);
		[CCode (cname = "asset_reload_type_id")]
		public static void ReloadTypeId(TypeId type);
		[CCode (cname = "asset_reload_all")]
		public static void ReloadAll();
		[CCode(cname = "asset_handler_cast")]
		public static void Handler(int type, string extension, AssetLoader funca, AssetDeleter funcd);
		[CCode (cname = "asset_ptr_path")]
		public static unowned string PtrPath(IntPtr asset);
		[CCode (cname = "asset_ptr_typename")]
		public static unowned string PtrTypename(IntPtr asset);
	}

	[SimpleType, CCode (cname = "IntPtr", cprefix="")]
	public struct Entity 
	{
		[CCode (cname = "entity_new_type_id")]
		public Entity (string fmt, TypeId id, ...);

		[CCode (cname = "entity_get")]
		public static Entity Get(string fmt, ...);
		[CCode (cname = "entity_get_as_type_id")]
		public static Entity As(string fmt, TypeId id, ...);
		[CCode (cname = "entity_handler_cast")]
		public static void Handler(int TypeId, ElemNew entity_new, ElemDel entity_del);
		[CCode (cname = "entity_name")]
		public static unowned string Name(IntPtr* e);
		[CCode (cname = "entity_delete")]
		public static void Delete(char* fmt, ...);
		[CCode (cname = "entity_type_count_type_id")]
		public static int Count(TypeId id);
		[CCode (cname = "type_find")]
		public static int Register(string type, size_t size);

	}

	[SimpleType, CCode (cname = "IntPtr", cprefix="")]
	public struct EntityManager //Entities 
	{
		[CCode (cname = "entities_new_type_id")]
		public static void Create(string name_format, int count, TypeId id);
		public static int Get(IntPtr* result, TypeId id)
		{
			int count;
			entities_get(result, out count, id);
			return count;

		}
	}

	[CCode (cname = "entities_get_type_id")]
	private void entities_get(IntPtr* result, out int count, TypeId id);

	[SimpleType, CCode (cname = "timer")]
	public struct Timer 
	{
		private int id;
		private ulong start;
		private ulong end;
		private ulong split;

		[CCode (cname = "timer_start")]
		public Timer(int id, string tag);
		[CCode (cname = "timer_split")]
		public Timer Split(string tag);
		[CCode (cname = "timer_stop")]
		public Timer End(string tag);
	}

	[SimpleType, CCode (cname = "vec2")]
	public struct Vector2 
	{
		[CCode (cname = "x")]
		public float X;
		[CCode (cname = "y")]
		public float Y;

		[CCode (cname = "vec2_new")]
		public Vector2 (float x, float y);
		[CCode (cname = "vec2_zero")]
		private static Vector2 zero();
		public static Vector2 Zero { get { return zero();}}
		[CCode (cname = "vec2_one")]
		private static Vector2 one();
		public static Vector2 One { get { return one();}}
		
		[CCode (cname = "vec2_add")]
		public Vector2 Add(Vector2 other);
		[CCode (cname = "vec2_sub")]
		public Vector2 Sub(Vector2 other);
		[CCode (cname = "vec2_mul")]
		public Vector2 Multiply(float fac);
		[CCode (cname = "vec2_mul_vec2")]
		public Vector2 MulVec2(Vector2 other);
		[CCode (cname = "vec2_div")]
		public Vector2 Divide(float fac);
		[CCode (cname = "vec2_div_vec2")]
		public Vector2 DivVec2(Vector2 other);
		[CCode (cname = "vec2_pow")]
		public Vector2 Pow(float exp);
		[CCode (cname = "vec2_neg")]
		public Vector2 Neg();
		[CCode (cname = "vec2_abs")]
		public Vector2 Abs();
		[CCode (cname = "vec2_floor")]
		public Vector2 Floor();
		[CCode (cname = "vec2_fmod")]
		public Vector2 FMod(float val);
		
		[CCode (cname = "vec2_max")]
		public Vector2 Max(float x);
		[CCode (cname = "vec2_min")]
		public Vector2 Min(float x);
		[CCode (cname = "vec2_clamp")]
		public Vector2 Clamp(float b, float t);
		
		[CCode (cname = "vec2_equ")]
		public bool Equals(Vector2 other);
		
		[CCode (cname = "vec2_dot")]
		public float Dot(Vector2 other);
		[CCode (cname = "vec2_length_sqrd")]
		public float LengthSquared();
		[CCode (cname = "vec2_length")]
		public float Length();
		[CCode (cname = "vec2_dist_sqrd")]
		public float DistSquared(Vector2 other);
		[CCode (cname = "vec2_dist")]
		public float Dist(Vector2 other);
		[CCode (cname = "vec2_dist_manhattan")]
		public float DistManhattan(Vector2 other);
		[CCode (cname = "vec2_normalize")]
		public Vector2 Normalize();
		
		[CCode (cname = "vec2_reflect")]
		public Vector2 Reflect(Vector2 other);
		
		[CCode (cname = "vec2_from_string")]
		public Vector2 Parse(string s);
		[CCode (cname = "vec2_print")]
		public void Print();
		
		[CCode (cname = "vec2_to_array")]
		public void ToArray(ref float result);
		
		[CCode (cname = "vec2_hash")]
		public int GetHashCode();
		[CCode (cname = "vec2_mix_hash")]
		public int MixHash();
		
		[CCode (cname = "vec2_saturate")]
		public Vector2 Saturate();
		[CCode (cname = "vec2_lerp")]
		public Vector2 Lerp(Vector2 other, float amount);
		[CCode (cname = "vec2_smoothstep")]
		public Vector2 SmoothStep(Vector2 other, float amount);
		[CCode (cname = "vec2_smootherstep")]
		public Vector2 SmootherStep(Vector2 other, float amount);

		public string to_string()
		{
			return @"{X:$X, Y:$Y}";
		}
				
	}

	[SimpleType, CCode (cname = "vec3")]
	public struct Vector3 
	{
		[CCode (cname = "x")]
		public float X;
		[CCode (cname = "y")]
		public float Y;
		[CCode (cname = "z")]
		public float Z;

		[CCode (cname = "vec3_new")]
		public Vector3 (float x, float y, float z);
		[CCode (cname = "vec3_zero")]
		private static Vector3 zero();
		public static Vector3 Zero { get { return zero();}}
		[CCode (cname = "vec3_one")]
		private static Vector3 one();
		public static Vector3 One { get { return one();}}
		[CCode (cname = "vec3_up")]
		private static Vector3 up();
		public static Vector3 Up { get { return up();}}
		[CCode (cname = "vec3_red")]
		private static Vector3 red();
		public static Vector3 Red { get { return red();}}
		[CCode (cname = "vec3_green")]
		private static Vector3 green();
		public static Vector3 Green { get { return green();}}
		[CCode (cname = "vec3_blue")]
		private static Vector3 blue();
		public static Vector3 Blue { get { return blue();}}
		[CCode (cname = "vec3_white")]
		private static Vector3 white();
		public static Vector3 White { get { return white();}}
		[CCode (cname = "vec3_black")]
		private static Vector3 black();
		public static Vector3 Black { get { return black();}}
		[CCode (cname = "vec3_grey")]
		private static Vector3 grey();
		public static Vector3 Grey { get { return grey();}}
		[CCode (cname = "vec3_light_grey")]
		private static Vector3 lightGrey();
		public static Vector3 LightGrey { get { return lightGrey();}}
		[CCode (cname = "vec3_dark_grey")]
		private static Vector3 darkGrey();
		public static Vector3 DarkGrey { get { return darkGrey();}}
		
		[CCode (cname = "vec3_add")]
		public Vector3 Add(Vector3 other);
		[CCode (cname = "vec3_sub")]
		public Vector3 Sub(Vector3 other);
		[CCode (cname = "vec3_mul")]
		public Vector3 Multiply(float fac);
		[CCode (cname = "vec3_mul_vec3")]
		public Vector3 MulVec3(Vector3 other);
		[CCode (cname = "vec3_div")]
		public Vector3 Divide(float fac);
		[CCode (cname = "vec3_div_vec3")]
		public Vector3 DivVec3(Vector3 other);
		[CCode (cname = "vec3_pow")]
		public Vector3 Pow(float fac);
		[CCode (cname = "vec3_neg")]
		public Vector3 Neg();
		[CCode (cname = "vec3_abs")]
		public Vector3 Abs();
		[CCode (cname = "vec3_floor")]
		public Vector3 Floor();
		[CCode (cname = "vec3_fmod")]
		public Vector3 FMod(float val);
		
		[CCode (cname = "vec3_equ")]
		public bool Equals(Vector3 other);
		[CCode (cname = "vec3_neq")]
		public bool NotEquals(Vector3 other);
		
		[CCode (cname = "vec3_dot")]
		public float Dot(Vector3 other);
		[CCode (cname = "vec3_length_sqrd")]
		public float LengthSquared();
		[CCode (cname = "vec3_length")]
		public float Length();
		[CCode (cname = "vec3_dist_sqrd")]
		public float DistSquared(Vector3 other);
		[CCode (cname = "vec3_dist")]
		public float Dist(Vector3 other);
		[CCode (cname = "vec3_dist_manhattan")]
		public float DistManhattan(Vector3 other);
		[CCode (cname = "vec3_cross")]
		public Vector3 Cross(Vector3 other);
		[CCode (cname = "vec3_normalize")]
		public Vector3 Normalize();
		
		[CCode (cname = "vec3_reflect")]
		public Vector3 Reflect(Vector3 other);
		[CCode (cname = "vec3_project")]
		public Vector3 Project(Vector3 other);
		
		[CCode (cname = "vec3_from_string")]
		public Vector3 Parse(string s);
		[CCode (cname = "vec3_print")]
		public void Print();
		
		[CCode (cname = "vec3_to_array")]
		public void ToArray(ref float result);
		
		[CCode (cname = "vec3_hash")]
		public int GetHashCode();
		
		[CCode (cname = "vec3_saturate")]
		public Vector3 Saturate();
		[CCode (cname = "vec3_lerp")]
		public Vector3 Lerp(Vector3 other, float amount);
		[CCode (cname = "vec3_smoothstep")]
		public Vector3 SmoothStep(Vector3 other, float amount);
		[CCode (cname = "vec3_smootherstep")]
		public Vector3 SmootherStep(Vector3 other, float amount);

		public string to_string()
		{
			return @"{X:$X, Y:$Y, Z:$Z}";
		}
				
	}

	[SimpleType, CCode (cname = "vec4")]
	public struct Vector4 
	{
		[CCode (cname = "x")]
		public float X;
		[CCode (cname = "y")]
		public float Y;
		[CCode (cname = "z")]
		public float Z;
		[CCode (cname = "w")]
		public float W;

		[CCode (cname = "vec4_new")]
		public Vector4 (float x, float y, float z, float w);
		[CCode (cname = "vec4_zero")]
		public static Vector4 Zero();
		[CCode (cname = "vec4_one")]
		public static Vector4 one();
		[CCode (cname = "vec4_red")]
		public static Vector4 Red();
		[CCode (cname = "vec4_green")]
		public static Vector4 Green();
		[CCode (cname = "vec4_blue")]
		public static Vector4 Blue();
		[CCode (cname = "vec4_white")]
		public static Vector4 White();
		[CCode (cname = "vec4_black")]
		public static Vector4 Black();
		[CCode (cname = "vec4_grey")]
		public static Vector4 Grey();
		[CCode (cname = "vec4_light_grey")]
		public static Vector4 LightGrey();
		[CCode (cname = "vec4_dark_grey")]
		public static Vector4 DarkGrey();
		
		[CCode (cname = "vec4_add")]
		public Vector4 Add(Vector4 v2);
		[CCode (cname = "vec4_sub")]
		public Vector4 Sub(Vector4 v2);
		[CCode (cname = "vec4_mul")]
		public Vector4 Multiply(float fac);
		[CCode (cname = "vec4_mul_vec4")]
		public Vector4 MulVec4(Vector4 v2);
		[CCode (cname = "vec4_div")]
		public Vector4 Divide(float fac);
		[CCode (cname = "vec4_pow")]
		public Vector4 Pow(float fac);
		[CCode (cname = "vec4_neg")]
		public Vector4 Neg();
		[CCode (cname = "vec4_abs")]
		public Vector4 Abs();
		[CCode (cname = "vec4_floor")]
		public Vector4 Floor();
		[CCode (cname = "vec4_fmod")]
		public Vector4 FMod(float val);
		[CCode (cname = "vec4_sqrt")]
		public Vector4 Sqrt();
		
		[CCode (cname = "vec4_max")]
		public Vector4 Max(Vector4 v2);
		[CCode (cname = "vec4_min")]
		public Vector4 Min(Vector4 v2);
		[CCode (cname = "vec4_equ")]
		public bool Equals(Vector4 v2);
		
		[CCode (cname = "vec4_dot")]
		public float Dot(Vector4 v2);
		[CCode (cname = "vec4_length_sqrd")]
		public float LengthSquared();
		[CCode (cname = "vec4_length")]
		public float Length();
		[CCode (cname = "vec4_dist_sqrd")]
		public float DistSquared(Vector4 v2);
		[CCode (cname = "vec4_dist")]
		public float Dist(Vector4 v2);
		[CCode (cname = "vec4_dist_manhattan")]
		public float DistManhattan(Vector4 v2);
		[CCode (cname = "vec4_normalize")]
		public Vector4 Normalize();
		
		[CCode (cname = "vec4_reflect")]
		public Vector4 Reflect(Vector4 v2);
		
		[CCode (cname = "vec4_from_string")]
		public Vector4 Parse(string s);
		[CCode (cname = "vec4_print")]
		public void Print();
		
		[CCode (cname = "vec4_to_array")]
		public void ToArray(ref float result);
		
		[CCode (cname = "vec3_to_homogeneous")]
		public Vector4 ToHomogeneous(Vector3 v);
		[CCode (cname = "vec4_from_homogeneous")]
		public Vector3 FromHomogeneous();
		
		[CCode (cname = "vec4_hash")]
		public int GetHashCode();
		
		[CCode (cname = "vec4_saturate")]
		public Vector4 Saturate();
		[CCode (cname = "vec4_lerp")]
		public Vector4 Lerp(Vector4 v2, float amount);
		[CCode (cname = "vec4_smoothstep")]
		public Vector4 SmoothStep(Vector4 v2, float amount);
		[CCode (cname = "vec4_smootherstep")]
		public Vector4 SmootherStep(Vector4 v2, float amount);
		[CCode (cname = "vec4_nearest_interp")]
		public Vector4 NearestInterp(Vector4 v2, float amount);
		
		[CCode (cname = "vec4_binearest_interp")]
		public Vector4 BinearestInterp(Vector4 top_left, Vector4 top_right, Vector4 bottom_left, Vector4 bottom_right, float x_amount, float y_amount);
		[CCode (cname = "vec4_bilinear_interp")]
		public Vector4 BilinearInterp(Vector4 top_left, Vector4 top_right, Vector4 bottom_left, Vector4 bottom_right, float x_amount, float y_amount);
	}
		
	[SimpleType, CCode (cname = "quat")]
	public struct Quaternion 
	{
		[CCode (cname = "x")]
		public float X;
		[CCode (cname = "y")]
		public float Y;
		[CCode (cname = "z")]
		public float Z;
		[CCode (cname = "w")]
		public float W;

		[CCode (cname = "quat_new")]
		public Quaternion (float x, float y, float z, float w);
		[CCode (cname = "quat_id")]
		public static Quaternion Identity();
		[CCode (cname = "quat_from_euler")]
		public static Quaternion FromEuler(Vector3 r);
		[CCode (cname = "quat_angle_axis")]
		public static Quaternion AngleAxis(float angle, Vector3 axis);
		[CCode (cname = "quat_rotation_x")]
		public static Quaternion RotationX(float angle);
		[CCode (cname = "quat_rotation_y")]
		public static Quaternion RotationY(float angle);
		[CCode (cname = "quat_rotation_z")]
		public static Quaternion RotationZ(float angle);
		
		[CCode (cname = "quat_at")]
		public float At(int i);
		[CCode (cname = "quat_real")]
		public float Real();
		[CCode (cname = "quat_imaginaries")]
		public Vector3 Imaginaries();
		
		[CCode (cname = "quat_to_angle_axis")]
		public void ToAngleAxis(ref Vector3 axis, ref float angle);
		[CCode (cname = "quat_to_euler")]
		public Vector3 ToEuler();
		
		[CCode (cname = "quat_neg")]
		public Quaternion Neg();
		[CCode (cname = "quat_dot")]
		public float Dot(Quaternion other);
		[CCode (cname = "quat_scale")]
		public Quaternion Scale(float f);
		[CCode (cname = "quat_mul_quat")]
		public Quaternion Mul(Quaternion other);
		[CCode (cname = "quat_mul_vec3")]
		public Vector3 MulVec3(Vector3 v);
		
		[CCode (cname = "quat_inverse")]
		public Quaternion Inverse();
		[CCode (cname = "quat_unit_inverse")]
		public Quaternion UnitInverse();
		[CCode (cname = "quat_length")]
		public float Length();
		[CCode (cname = "quat_normalize")]
		public Quaternion Normalize();
		
		[CCode (cname = "quat_exp")]
		public Quaternion Exp(Vector3 w);
		[CCode (cname = "quat_log")]
		public Vector3 Log();
		
		[CCode (cname = "quat_slerp")]
		public Quaternion SLerp(Quaternion other, float amount);
		
		[CCode (cname = "quat_constrain")]
		public Quaternion Constrain(Vector3 axis);
		[CCode (cname = "quat_constrain_y")]
		public Quaternion ConstrainY();
		
		[CCode (cname = "quat_distance")]
		public float Distance(Quaternion other);
		[CCode (cname = "quat_interpolate")]
		public Quaternion Interpolate(ref Quaternion other, ref float ws, int count);
	}
	
	[SimpleType, CCode (cname = "quat_dual")]
	public struct DualQuaternion 
	{
		[CCode (cname = "real")]
		public Quaternion Real;
		[CCode (cname = "dual")]
		public Quaternion Dual;

		[CCode (cname = "quat_dual_new")]
		public DualQuaternion (DualQuaternion real, DualQuaternion dual);
		[CCode (cname = "quat_dual_id")]
		public static DualQuaternion Identity();
		[CCode (cname = "quat_dual_transform")]
		public static DualQuaternion Transform(Quaternion q, Vector3 t);
		[CCode (cname = "quat_dual_mul")]
		public DualQuaternion Mul(DualQuaternion q1);
		[CCode (cname = "quat_dual_mul_vec3")]
		public Vector3 MulVec3(Vector3 v);
		[CCode (cname = "quat_dual_mul_vec3_rot")]
		public Vector3 MulVec3Rot(Vector3 v);
	}
	
	[SimpleType, CCode (cname = "mat2")]
	public struct Matrix2 
	{
		[CCode (cname = "xx")]
		public float M11; 
		[CCode (cname = "xy")]
		public float M12;
		[CCode (cname = "yx")]
		public float M21; 
		[CCode (cname = "yy")]
		public float M22;

		[CCode (cname = "mat2_new")]
		public Matrix2 (float m11, float m12, float m21, float m22);
		[CCode (cname = "mat2_id")]
		public static Matrix2 Identity();
		[CCode (cname = "mat2_zero")]
		public static Matrix2 Zero();

		[CCode (cname = "mat2_mul_mat2")]
		public Matrix2 Mul(Matrix2 other);
		[CCode (cname = "mat2_mul_vec2")]
		public Vector2 MulVec2(Vector2 other);
		[CCode (cname = "mat2_transpose")]
		public Matrix2 Transpose();
		[CCode (cname = "mat2_det")]
		public float Det();
		[CCode (cname = "mat2_inverse")]
		public Matrix2 Inverse();
		[CCode (cname = "mat2_to_array")]
		public void ToArray(ref float result);
		[CCode (cname = "mat2_print")]
		public void Print();
		[CCode (cname = "mat2_rotation")]
		public Matrix2 Rotation(float a);
	}


	[SimpleType, CCode (cname = "mat3")]
	public struct Matrix3 
	{
		[CCode (cname = "xx")]
		public float M11; 
		[CCode (cname = "xy")]
		public float M12; 
		[CCode (cname = "xz")]
		public float M13;
		[CCode (cname = "yz")]
		public float M21; 
		[CCode (cname = "yy")]
		public float M22; 
		[CCode (cname = "yz")]
		public float M23;
		[CCode (cname = "zx")]
		public float M31; 
		[CCode (cname = "zy")]
		public float M32; 
		[CCode (cname = "zz")]
		public float M33;

		[CCode (cname = "mat3_new")]
		public Matrix3 (float m11, float m12, float m13,
					float m21, float m22, float m23,
					float m31, float m32, float m33);
		[CCode (cname = "mat3_id")]
		public static Matrix3 Identity();
		[CCode (cname = "mat3_zero")]
		public static Matrix3 Zero();
		[CCode (cname = "mat3_scale")]
		public static Matrix3 Scale(Vector3 s);
		[CCode (cname = "mat3_rotation_x")]
		public static Matrix3 RotationX(float a);
		[CCode (cname = "mat3_rotation_y")]
		public static Matrix3 RotationY(float a);
		[CCode (cname = "mat3_rotation_z")]
		public static Matrix3 RotationZ(float a);
		[CCode (cname = "mat3_rotation_angle_axis")]
		public static Matrix3 RotationAngleAxis(float angle, Vector3 axis);

		[CCode (cname = "mat3_mul_mat3")]
		public Matrix3 Mul(Matrix3 other);
		[CCode (cname = "mat3_mul_vec3")]
		public Vector3 MulVec3(Vector3 other);
		
		[CCode (cname = "mat3_transpose")]
		public Matrix3 Transpose();
		[CCode (cname = "mat3_det")]
		public float Det();
		[CCode (cname = "mat3_inverse")]
		public Matrix3 Inverse();
		
		[CCode (cname = "mat3_to_array")]
		public void ToArray(ref float result);
		[CCode (cname = "mat3_print")]
		public void Print();
	}

	[SimpleType, CCode (cname = "mat4")]
	public struct Matrix4 
	{
		[CCode (cname = "xx")]
		public float M11; 
		[CCode (cname = "xy")]
		public float M12; 
		[CCode (cname = "xz")]
		public float M13;
		[CCode (cname = "xw")]
		public float M14;
		[CCode (cname = "yz")]
		public float M21; 
		[CCode (cname = "yy")]
		public float M22; 
		[CCode (cname = "yz")]
		public float M23;
		[CCode (cname = "yw")]
		public float M24;
		[CCode (cname = "zx")]
		public float M31; 
		[CCode (cname = "zy")]
		public float M32; 
		[CCode (cname = "zz")]
		public float M33;
		[CCode (cname = "zw")]
		public float M34;
		[CCode (cname = "wx")]
		public float M41; 
		[CCode (cname = "wy")]
		public float M42; 
		[CCode (cname = "wz")]
		public float M43;
		[CCode (cname = "ww")]
		public float M44;
		
		[CCode (cname = "mat4_new")]
		public Matrix4 (float m11, float m12, float m13, float m14,
					float m21, float m22, float m23, float m24,
					float m31, float m32, float m33, float m34,
					float m41, float m42, float m43, float m44);

		[CCode (cname = "mat4_id")]
		public static Matrix4 Identity();
		[CCode (cname = "mat4_zero")]
		public static Matrix4 Zero();

		[CCode (cname = "mat4_at")]
		public float At(int i, int j);
		[CCode (cname = "mat4_set")]
		public Matrix4 Set(int x, int y, float v);
		[CCode (cname = "mat4_transpose")]
		public Matrix4 Transpose();
		
		[CCode (cname = "mat4_mul_mat4")]
		public Matrix4 Multiply(Matrix4 other);
		
		[CCode (cname = "mat4_mul_vec4")]
		public Vector4 MulVec4(Vector4 v);
		[CCode (cname = "mat4_mul_vec3")]
		public Vector3 MulVec3(Vector3 v);
		
		[CCode (cname = "mat4_det")]
		public float Det();
		[CCode (cname = "mat4_inverse")]
		public Matrix4 Invert();
		
		[CCode (cname = "mat3_to_mat4")]
		public static Matrix4 Matrix3ToMatrix4(Matrix3 m);
		[CCode (cname = "mat4_to_mat3")]
		public Matrix3 ToMatrix3();
		[CCode (cname = "mat4_to_quat")]
		public Quaternion ToQuaternion();
		[CCode (cname = "mat4_to_quat_dual")]
		public DualQuaternion ToDualQuaternion();
		
		[CCode (cname = "mat4_to_array")]
		public void ToArray(ref float result);
		[CCode (cname = "mat4_to_array_trans")]
		public void ToArrayTrans(ref float result);
		
		[CCode (cname = "mat4_print")]
		public void Print();
		
		[CCode (cname = "mat4_translation")]
		public static Matrix4 Translation(Vector3 v);
		[CCode (cname = "mat4_scale")]
		public static Matrix4 Scale(Vector3 v);
		
		[CCode (cname = "mat4_rotation_x")]
		public static Matrix4 RotationX(float a);
		[CCode (cname = "mat4_rotation_y")]
		public static Matrix4 RotationY(float a);
		[CCode (cname = "mat4_rotation_z")]
		public static Matrix4 RotationZ(float a);
		[CCode (cname = "mat4_rotation_axis_angle")]
		public static Matrix4 RotationAxisAngle(Vector3 axis, float angle);
		
		[CCode (cname = "mat4_rotation_euler")]
		public static Matrix4 RotationEuler(float x, float y, float z);
		[CCode (cname = "mat4_rotation_quat")]
		public static Matrix4 Rotation(Quaternion q);
		[CCode (cname = "mat4_rotation_quat_dual")]
		public static Matrix4 RotationDual(DualQuaternion q);
		
		[CCode (cname = "mat4_view_look_at")]
		public static Matrix4 ViewLookAt(Vector3 position, Vector3 target, Vector3 up);
		[CCode (cname = "mat4_perspective")]
		public static Matrix4 Perspective(float fov, float near_clip, float far_clip, float ratio);
		[CCode (cname = "mat4_orthographic")]
		public static Matrix4 Orthographic(float left, float right, float bottom, float top, float near, float far);
		
		[CCode (cname = "mat4_world")]
		public static Matrix4 World(Vector3 position, Vector3 scale, Quaternion rotation);
		
		[CCode (cname = "mat4_lerp")]
		public Matrix4 Lerp(Matrix4 other, float amount);
		[CCode (cname = "mat4_smoothstep")]
		public Matrix4 SmoothStep(Matrix4 other, float amount);
															
	}

	[SimpleType, CCode (cname = "plane")]
	public struct Plane 
	{
		[CCode (cname = "direction")]
		public Vector3 Direction;
		[CCode (cname = "position")]
		public Vector3 Position;

		[CCode (cname = "plane_new")]
		public Plane (Vector3 position, Vector3 direction);
		
		[CCode (cname = "plane_transform")]
		public Plane Transform(Matrix4 world, Matrix3 world_normal);
		[CCode (cname = "plane_transform_space")]
		public Plane TransformSpace(Matrix3 space, Matrix3 space_normal);
		[CCode (cname = "plane_distance")]
		public float Distance(Vector3 point);
		
		[CCode (cname = "point_inside_plane", instance_pos=-1)]
		public bool PointInside(Vector3 point);
		[CCode (cname = "point_outside_plane", instance_pos=-1)]
		public bool PointOutside(Vector3 point);
		[CCode (cname = "point_intersects_plane", instance_pos=-1)]
		public bool PointIntersects(Vector3 point);
		
		[CCode (cname = "point_swept_inside_plane", instance_pos=-1)]
		public bool PointSweptInside(Vector3 point, Vector3 v);
		[CCode (cname = "point_swept_outside_plane", instance_pos=-1)]
		public bool PointSweptOutside(Vector3 point, Vector3 v);
		[CCode (cname = "point_swept_intersects_plane", instance_pos=-1)]
		public bool PointSweptIntersects(Vector3 point, Vector3 v);
		
		[CCode (cname = "plane_closest")]
		public Vector3 Closest(Vector3 v);
		[CCode (cname = "plane_project")]
		public Vector3 Project(Vector3 v);
				
	}

	[SimpleType, CCode (cname = "box")]
	public struct Box 
	{
		[CCode (cname = "top")]
		public Plane Top;
		[CCode (cname = "bottom")]
		public Plane Bottom;
		[CCode (cname = "left")]
		public Plane Left;
		[CCode (cname = "right")]
		public Plane Right;
		[CCode (cname = "front")]
		public Plane Front;
		[CCode (cname = "back")]
		public Plane Back;

		[CCode (cname = "box_new")]
		public Box (float x_min, float x_max, float y_min, float y_max, float z_min, float z_max);
		[CCode (cname = "box_spere")]
		public static Box Sphere(Vector3 center, float radius);
		[CCode (cname = "box_merge")]
		public Box Merge(Box other);
		[CCode (cname = "box_transform")]
		public Box Transform(Matrix4 world, Matrix3 world_normal);
		[CCode (cname = "box_invert")]
		public Box Invert();
		[CCode (cname = "box_invert_depth")]
		public Box InvertDepth();
		[CCode (cname = "box_invert_width")]
		public Box InvertWidth();
		[CCode (cname = "box_invert_height")]
		public Box InvertHeight();
		[CCode (cname = "point_inside_box", instance_pos=-1)]
		public bool PointInside(Vector3 point);
		[CCode (cname = "point_outside_box", instance_pos=-1)]
		public bool PointOutside(Vector3 point);
		[CCode (cname = "point_intersects_box", instance_pos=-1)]
		public bool PointIntersects(Vector3 point);
					  
	}

	[SimpleType, CCode (cname = "frustum")]
	public struct Frustum {
		public Vector3 ntr;
		public Vector3 ntl;
		public Vector3 nbr;
		public Vector3 nbl;
		public Vector3 ftr;
		public Vector3 ftl;
		public Vector3 fbr;
		public Vector3 fbl;
	  
		[CCode (cname = "frustum_new")]
		public Frustum (Vector3 ntr, Vector3 ntl, Vector3 nbr, Vector3 nbl, Vector3 ftr, Vector3 ftl, Vector3 fbr, Vector3 fbl);
		[CCode (cname = "frustum_new_clipbox")]
		public static Frustum Clipbox();
		[CCode (cname = "frustum_new_camera")]
		public static Frustum Camera(Matrix4 view, Matrix4 proj);
		public Frustum slice(float start, float end);
		public Frustum transform(Matrix4 m);
		public Frustum translate(Vector3 v);
		
		public Vector3 center();
		public Vector3 maximums();
		public Vector3 minimums();
		
		public Box box();
		
		[CCode (cname = "frustum_outside_box")]
		public bool outsideBox(Box b);
		
	}

	[SimpleType, CCode (cname = "sphere")]
	public struct Sphere {
		public Vector3 center;
		public float radius;
	  
		[CCode (cname = "sphere_new")]
		public Sphere (Vector3 center, float radius);
		public static Sphere unit();
		public static Sphere point();
		public Sphere merge(Sphere other);
		[CCode (cname = "sphere_")]
		public static Sphere merge_many(Sphere[] s, int count);
		public Sphere transform(Matrix4 world);
		public Sphere translate(Vector3 x);
		public Sphere scale(float x);
		[CCode (cname = "sphere_transform_space")]
		public Sphere transformSpace(Matrix3 space);
		[CCode (cname = "sphere_of_box")]
		public static Sphere ofBox(Box bb);
		[CCode (cname = "sphere_of_frustum")]
		public static Sphere ofFrustum(Frustum f);
		[CCode (cname = "sphere_inside_box")]
		public bool insideBox(Box b);
		[CCode (cname = "sphere_outside_box")]
		public bool outsideBox(Box b);
		[CCode (cname = "sphere_intersects_box")]
		public bool intersectsBox(Box b);
		[CCode (cname = "sphere_inside_frustum")]
		public bool insideFrustum(Frustum f);
		[CCode (cname = "sphere_outside_frustum")]
		public bool outsideFrustum(Frustum f);
		[CCode (cname = "sphere_intersects_frustum")]
		public bool intersectsFrustum(Frustum f);
		[CCode (cname = "sphere_outside_sphere")]
		public bool outsideSphere(Sphere other); 
		[CCode (cname = "sphere_inside_sphere")]
		public bool insideSphere(Sphere other); 
		[CCode (cname = "sphere_intersects_sphere")]
		public bool intersectsSphere(Sphere other); 
		[CCode (cname = "sphere_point_inside_sphere")]
		public bool pointInsideSphere(Vector3 point);
		[CCode (cname = "sphere_point_outside_sphere")]
		public bool pointOutsideSphere(Vector3 point);
		[CCode (cname = "sphere_point_intersects_sphere")]
		public bool pointIntersectsSphere(Vector3 point);
		[CCode (cname = "sphere_line_inside_sphere")]
		public bool lineInsideSphere(Vector3 start, Vector3 end);
		[CCode (cname = "sphere_line_outside_sphere")]
		public bool lineOutsideSphere(Vector3 start, Vector3 end);
		[CCode (cname = "sphere_line_intersects_sphere")]
		public bool lineIntersectsSphere(Vector3 start, Vector3 end);
		[CCode (cname = "sphere_inside_plane")]
		public bool insidePlane(Plane p);
		[CCode (cname = "sphere_outside_plane")]
		public bool outsidePlane(Plane p);
		[CCode (cname = "sphere_intersects_plane")]
		public bool intersectsPlane(Plane p);
		[CCode (cname = "sphere_point_swept_inside_sphere")]
		public bool pointSweptInsideSphere(Vector3 v, Vector3 point);
		[CCode (cname = "sphere_point_swept_outside_sphere")]
		public bool pointSweptOutsideSphere(Vector3 v, Vector3 point);
		[CCode (cname = "sphere_point_swept_intersects_sphere")]
		public bool poinSweptIntersectsSphere(Vector3 v, Vector3 point);
		[CCode (cname = "sphere_swept_inside_plane")]
		public bool sweptInsidePlane(Vector3 v, Plane p);
		[CCode (cname = "sphere_swept_outside_plane")]
		public bool sweptOutsidePlane(Vector3 v, Plane p);
		[CCode (cname = "sphere_swept_intersects_plane")]
		public bool sweptIntersectsPlane(Vector3 v, Plane p);
		[CCode (cname = "sphere_swept_outside_sphere")]
		public bool sweptOutsideSphere(Vector3 v, Sphere s2); 
		[CCode (cname = "sphere_swept_inside_sphere")]
		public bool sweptInsideSphere(Vector3 v, Sphere s2); 
		[CCode (cname = "sphere_swept_intersects_sphere")]
		public bool sweptIntersectsSphere(Vector3 v, Sphere s2); 
		[CCode (cname = "sphere_point_inside_triangle")]
		public static bool pointInsideTriangle(Vector3 p, Vector3 v0, Vector3 v1, Vector3 v2);
		[CCode (cname = "sphereIntersectsFace")]
		public bool intersects_face(Vector3 v0, Vector3 v1, Vector3 v2, Vector3 norm);
	}

	[SimpleType, CCode (cname = "ellipsoid")]
	public struct Ellipsoid {
		public Vector3 center;
		public Vector3 radiuses;
		  
		[CCode (cname = "ellipsoid_new")]
		public Ellipsoid (Vector3 center, Vector3 radiuses);
		public Ellipsoid transform(Matrix4 m);
		[CCode (cname = "ellipsoid_of_sphere")]
		public static Ellipsoid ofSphere(Sphere s);
		public Matrix3 space();
		[CCode (cname = "ellipsoid_inv_space")]
		public Matrix3 invSpace();
	}

	[SimpleType, CCode (cname = "capsule")]
	public struct Capsule {
		public Vector3 start;
		public Vector3 end;
		public float radius;

		[CCode (cname = "capsule_new")]
		public Capsule (Vector3 start, Vector3 end, float radius);
		public Capsule transform(Matrix4 m);
		[CCode (cname = "capsule_inside_plane")]
		public bool insidePlane(Plane p);
		[CCode (cname = "capsule_outside_plane")]
		public bool outsidePlane(Plane p);
		[CCode (cname = "capsule_intersects_plane")]
		public bool intersectsPlane(Plane p);
				
	}

	[SimpleType, CCode (cname = "vertex")]
	public struct Vertex {
		public Vector3 position;
		public Vector3 normal;
		public Vector3 tangent;
		public Vector3 binormal;
		public Vector4 color;
		public Vector2 uvs;

		[CCode (cname = "vertex_new")]
		public Vertex ();
		public bool equal(Vertex other);
		public void print();
	}

	[CCode (cname = "mesh")]
	public class Mesh {
		public int num_verts;
		public int num_triangles;
		[CCode (array_length = false)]
		public Vertex[] verticies;
		[CCode (array_length = false)]
		public uint32[] triangles;

		[CCode (cname = "mesh_new")]
		public Mesh();
		public void delete();
		
		[CCode (cname = "mesh_generate_normals")]
		public void generateNormals();
		[CCode (cname = "mesh_generate_tangents")]
		public void generateTangents();
		[CCode (cname = "mesh_generate_orthagonal_tangents")]
		public void generateOrthagonalTangents();
		[CCode (cname = "mesh_generate_texcoords_cylinder")]
		public void generateTexcoordsCylinder();
		void print();
		[CCode (cname = "mesh_surface_area")]
		public float surfaceArea();
		public void transform(Matrix4 transform);
		public void translate(Vector3 translation);
		public void scale(float scale);
		[CCode (cname = "mesh_bounding_sphere")]
		public Sphere boundingSphere();
		
	}

	[CCode (cname = "model")]
	public class Model {
		public int num_meshes;
		[CCode (array_length = false)]
		public Mesh[] meshes;

		[CCode (cname = "mode_new")]
		public Model ();
		public void delete();
		[CCode (cname = "mode_generate_normals")]
		public void generateNormals();
		[CCode (cname = "mode_generate_tangents")]
		public void generateTangents();
		[CCode (cname = "mode_generate_orthagonal_tangents")]
		public void generateOrthagonalTangents();
		[CCode (cname = "mode_generate_texcoords_cylinder")]
		public void generateTexcoordsCylinder();
		public void print();
		[CCode (cname = "mode_surface_area")]
		public float surfaceArea();
		public void transform(Matrix4 transform);
		public void translate(Vector3 translation);
		public void scale(float scale);
	}
	
	[SimpleType, CCode (cname = "audio")]
	public struct Audio : uint64 {
		public static void init();
		public static void finish();
		
		public int play(int loops);
		public static void pause(int channel);
		public static void resume(int channel);
		public static void stop(int channel);
		
	}
	
	[CCode (cname = "int", cprefix = "HTTP_ERR_")]
	public enum HttpErr {
		NONE, URL, HOST, SOCKET, DATA, NOFILE
	}

	[SimpleType, CCode (cname = "net")]
	public struct Net {
		public static void init();
		public static void finish();
		
		[CCode (cname = "net_set_server")]
		public static void setServer(bool server);
		[CCode (cname = "net_is_server")]
		public static bool isServer();
		[CCode (cname = "net_is_client")]
		public static bool isClient();
		[CCode (cname = "net_http_get")]
		public static HttpErr httpGet(string result, int max, string fmt, ...);
		[CCode (cname = "net_http_upload")]
		public static HttpErr httpUpload(string filename, string fmt, ...);

	}

	[CCode (has_target = false)]
	public delegate Collision ColFunc (IntPtr obj, ref Vector3 pos, ref Vector3 vel);
	
	[SimpleType, CCode (cname = "collision")]
	public struct Collision {
		[CCode (cname = "collision_new")]
		public Collision (float time, Vector3 point, Vector3 norm);
		public static Collision none();
		public Collision merge(Collision other);
		[CCode (cname = "collision_point_collide_point")]
		public static Collision pointCollidePoint(Vector3 p, Vector3 v, Vector3 p0);
		[CCode (cname = "collision_point_collide_sphere")]
		public static Collision pointCollideSphere(Vector3 p, Vector3 v, Sphere s);
		[CCode (cname = "collision_point_collide_ellipsoid")]
		public static Collision pointCollideEllipsoid(Vector3 p, Vector3 v, Ellipsoid e);
		[CCode (cname = "collision_point_collide_edge")]
		public static Collision pointCollideEdge(Vector3 p, Vector3 v, Vector3 e0, Vector3 e1);
		[CCode (cname = "collision_sphere_collide_point")]
		public static Collision sphereCollidePoint(Sphere s, Vector3 v, Vector3 p);
		[CCode (cname = "collision_sphere_collide_sphere")]
		public static Collision sphereCollideSphere(Sphere s, Vector3 v, Sphere s0);
		[CCode (cname = "collision_sphere_collide_edge")]
		public static Collision sphereCollideEdge(Sphere s, Vector3 v, Vector3 e0, Vector3 e1);
		[CCode (cname = "collision_ellipsoid_collide_point")]
		public static Collision ellipsoidCollidePoint(Ellipsoid e, Vector3 v, Vector3 p);
		[CCode (cname = "collision_ellipsoid_collide_sphere")]
		public static Collision ellipsoidCollideSphere(Ellipsoid e, Vector3 v, Sphere s);
		[CCode (cname = "collision_collision_response_slide")]
		public static void collisionResponseSlide(IntPtr obj, ref Vector3 pos, ref Vector3 vel, ColFunc func);
	}

	[CCode (cname = "ui_init")]
	public void UIInit();
	[CCode (cname = "ui_finish")]
	public void UIFinish();
	[CCode (cname = "ui_set_style")]
	public void UISetStyle(UI.Style s);
	/* Pass Event, Update, and Render whole UI */
	public void ui_render();
	public void ui_update();
	public void ui_event(Sdl.Event e);

	[Compact, CCode (cname = "ui_elem", free_function = "override_free")]
	public class UIElem {
		[CCode (cname = "ui_elem_new_type_id")]
		public UIElem(string fmt, int type, ...);
		[CCode (cname = "ui_elem_get")]
		public static UIElem get(string fmt, ...);
	}


	[Compact, CCode (cname = "camera", free_function = "override_free")]
	public class Camera {
		public Vector3 position;
		public Vector3 target;
		public float fov;
		[CCode (cname = "near_clip")]
		public float nearClip;
		[CCode (cname = "far_clip")]
		public float farClip;
			  
		[CCode (cname = "camera_new")]
		public Camera();

		public static int type { get { return Entity.Register("camera", sizeof(Camera)); } }
		public static Camera create() {
			return (Camera)Entity("camera", type);
		} 

		public void delete();
		public Vector3 direction();
		[CCode (cname = "camera_view_matrix")]
		public Matrix4 viewMatrix();
		[CCode (cname = "camera_proj_matrix")]
		public Matrix4 projMatrix();
		[CCode (cname = "camera_view_proj_matrix")]
		public Matrix4 viewProjMatrix();
		[CCode (cname = "camera_normalize_target")]
		public void normalizeTarget();
		[CCode (cname = "camera_control_orbit")]
		public void controlOrbit(Sdl.Event e);
		[CCode (cname = "camera_control_freecam")]
		public void controlFreecam(float timestep);
		[CCode (cname = "camera_control_joyorbit")]
		public void controlJoyorbit(float timestep);
				
	}

	[CCode (cname = "int", cprefix = "LIGHT_TYPE_")]
	public enum LightType {
		POINT, DIRECTIONAL, SUN, SPOT
	}
	
	namespace Assets 
	{

		[Compact, CCode (cname = "animation", cprefix="", free_function = "override_free")]
		public class Animation 
		{
			[CCode (cname = "frame_count")]
			public int FrameCount;
			[CCode (cname = "frame_time")]
			public float FrameTime;
			[CCode (array_length = false, cname = "frames")]
			Frame[] Frames;
			[CCode (cname = "animation_new")]
			public Animation();
			[CCode (cname = "animation_delete")]
			public void Delete();
			[CCode (cname = "animation_duration")]
			public float Duration();
			[CCode (cname = "animation_add_frame")]
			public Frame AddFrame(Frame base);
			[CCode (cname = "animation_frame")]
			public Frame Frame(int i);
			[CCode (cname = "animation_sample")]
			public Frame Sample(float time);
			[CCode (cname = "animation_sample_to")]
			public void SampleTo(float time, Frame result);
			[CCode (cname = "ani_load_file")]
			public static Animation LoadFile(string filename);
		}

		[SimpleType, CCode (cname = "ctri", cprefix="")]
		public struct Ctri 
		{
			private Vector3 a;
			private Vector3 b;
			private Vector3 c;
			private Vector3 norm;
			private Sphere bound;

			[CCode (cname = "ctri_new")]
			public Ctri(Vector3 a, Vector3 b, Vector3 c, Vector3 norm);
			[CCode (cname = "ctri_transform")]
			Ctri Transform(Matrix4 m, Matrix3 mn);
			[CCode (cname = "ctri_transform_space")]
			Ctri TransformSpace(Matrix3 s, Matrix3 sn);
			[CCode (cname = "ctri_inside_plane")]
			bool InsidePlane(Plane p);
			[CCode (cname = "ctri_outside_plane")]
			bool OutsidePlane(Plane p);
			[CCode (cname = "ctri_intersects_plane")]
			bool IntersectsPlane(Plane p);
		}

		[Compact, CCode (cname = "cmesh", cprefix="", free_function = "override_free")]
		public class CMesh 
		{
			[CCode (cname = "is_leaf")]
			public bool IsLeaf;
			[CCode (cname = "division")]
			public Plane Division;
			[CCode (cname = "front")]
			public CMesh Front;
			[CCode (cname = "back")]
			public CMesh Back;

			[CCode (cname = "col_load_file")]
			public CMesh (string filename);
			[CCode (cname = "cmesh_delete")]
			public void Delete();
			[CCode (cname = "cmesh_bound")]
			public Sphere Bound();
			[CCode (cname = "cmesh_subdivide")]
			public void Subdivide(int iterations);
		}		


		[CCode (cname = "int", cprefix = "IMAGE_REPEAT_")]
		public enum ImageRepeat {
			TILE, CLAMP, MIRROR, ERROR, BLACK
		}

		[CCode (cname = "int", cprefix = "IMAGE_SAMPLE_")]
		public enum ImageSample {
			LINEAR, NEAREST
		}

		public delegate bool MaskBinaryFunc(bool b1, bool b2);
		public delegate Vector4 MapFunc(Vector4 v);

		[Compact, CCode (cname = "image", cprefix="", free_function = "override_free")]
		public class Image 
		{
			[CCode (cname = "width")]
			public int Width;
			[CCode (cname = "height")]
			public int Height;
			[CCode (array_length = false, cname = "data")]
			public uchar[] Data;
			[CCode (cname = "repeat_type")]
			public int RepeatType;
			[CCode (cname = "sample_type")]
			public int SampleType;
			[CCode (cname = "image_new", array_length = false)]
			public Image (int width, int height, uchar[] data);
			[CCode (cname = "image_empty")]
			public static Image Empty (int width, int height);
			[CCode (cname = "image_blank")]
			public static Image Blank (int width, int height);

			[CCode (cname = "image_copy")]
			public Image Copy();
			[CCode (cname = "image_delete")]
			public void Delete();
			[CCode (cname = "image_get")]
			public Vector4 Get(int u, int v);
			[CCode (cname = "image_set")]
			public void Set(int u, int v, Vector4 c);
			[CCode (cname = "image_map")]
			public void Map(MapFunc func);
			
			[CCode (cname = "image_red_channel")]
			public Image RedChannel();
			[CCode (cname = "image_green_channel")]
			public Image GreenChannel();
			[CCode (cname = "image_blue_channel")]
			public Image BlueChannel();
			[CCode (cname = "image_alpha_channel")]
			public Image AlphaChannel();
			
			[CCode (cname = "image_bgr_to_rgb")]
			public void BgrToRgb();
			[CCode (cname = "image_rotate_90_clockwise")]
			public void Rotate90Clockwise();
			[CCode (cname = "image_rotate_90_counterclockwise")]
			public void Rotate90Counterclockwise();
			[CCode (cname = "image_rotate_180")]
			public void Rotate180();
			[CCode (cname = "image_rotate_inplace")]
			public void RotateInplace(float amount);
			[CCode (cname = "image_flip_horizontal")]
			public void FlipHorizontal();
			[CCode (cname = "image_flip_vertical")]
			public void FlipVertical();
			
			[CCode (cname = "image_fill")]
			public void Fill(Vector4 color);
			[CCode (cname = "image_fill_black")]
			public void FillBlack();
			[CCode (cname = "image_fill_white")]
			public void FillWhite();
			
			[CCode (cname = "image_apply_gamma")]
			public void ApplyGamma(float amount);
			[CCode (cname = "image_to_gamma")]
			public void ToGamma();
			[CCode (cname = "image_from_gamma")]
			public void FromGamma();
			
			[CCode (cname = "image_rgb_to_hsv")]
			public void RgbToHsv();
			[CCode (cname = "image_hsv_to_rgb")]
			public void HsvToRgb();
			[CCode (cname = "image_hsv_scalar")]
			public void HsvScalar();
			
			[CCode (cname = "image_min")]
			public Vector4 Min();
			[CCode (cname = "image_max")]
			public Vector4 Max();
			[CCode (cname = "image_mean")]
			public Vector4 Mean();
			[CCode (cname = "image_var")]
			public Vector4 Var();
			[CCode (cname = "image_std")]
			public Vector4 Std();
			[CCode (cname = "image_auto_contrast")]
			public void AutoContrast();
			[CCode (cname = "image_set_to_mask")]
			public void SetToMask();
			[CCode (cname = "image_set_brightness")]
			public void SetBrightness(float brightness);
			[CCode (cname = "image_alpha_mean")]
			public Vector4 AlphaMean();
			[CCode (cname = "image_get_subimage")]
			public Image GetSubimage(int left, int top, int width, int height);
			[CCode (cname = "image_set_subimage")]
			public void SetSubimage(int left, int top, Image src);
			[CCode (cname = "image_paste_subimage")]
			public void PasteSubimage(int left, int top, Image src);
			[CCode (cname = "image_paste_subimage")]
			public Vector4 Sample(Vector2 uv);
			[CCode (cname = "image_sample")]
			public void Paint(Vector2 uv, Vector4 color);
			[CCode (cname = "image_paint")]
			public void Scale(Vector2 scale);
			[CCode (cname = "image_scale")]
			public void MaskNot();
			[CCode (cname = "image_mask_not")]
			public void MaskBinary(Image other, MaskBinaryFunc func);
			[CCode (cname = "image_mask_binary")]
			public void MaskOr(Image other);
			[CCode (cname = "image_mask_or")]
			public void MaskAnd(Image other);
			[CCode (cname = "image_mask_xor")]
			public void MaskXor(Image other);
			[CCode (cname = "image_mask_nor")]
			public void MaskNor(Image other);
			[CCode (cname = "image_mask_nand")]
			public void MaskNand(Image other);
			[CCode (cname = "image_mask_xnor")]
			public void MaskXnor(Image other);
			[CCode (cname = "image_mask_alpha")]
			public Image MaskAlpha();
			[CCode (cname = "image_mask_nearest")]
			public Image MaskNearest();
			[CCode (cname = "image_mask_flood_fill")]
			public Image MaskFloodFill(int u, int v, float tolerance);
			[CCode (cname = "image_mask_difference")]
			public Image MaskDifference(Vector4 color, float tolerance);
			[CCode (cname = "image_mask_count")]
			public long MaskCount();
			[CCode (cname = "image_mask_median")]
			public void MaskMedian(ref int u, ref int v);
			[CCode (cname = "image_mask_random")]
			public void MaskRandom(ref int u, ref int v);
			[CCode (cname = "image_read_from_file")]
			public Image ReadFromFile(string filename);
			[CCode (cname = "image_tga_load_file")]
			public Image TgaLoadFile(string filename);
			[CCode (cname = "image_bmp_load_file")]
			public Image BmpLoadFile(string filename);
			[CCode (cname = "image_write_to_file")]
			public void WriteToFile(string filename);
			[CCode (cname = "image_tga_save_file")]
			public void TgaSaveFile(string filename);
			[CCode (cname = "image_bmp_save_file")]
			public void BmpSaveFile(string filename);
		}

		[Compact, CCode (cname = "frame", cprefix="", free_function = "override_free")]
		public class Frame {
			public int joint_count;
			[CCode (array_length = false)]
			public int[] joint_parents;
			[CCode (array_length = false)]
			public Vector3[] joint_positions;
			[CCode (array_length = false)]
			public Quaternion[] joint_rotations;
			[CCode (array_length = false)]
			public Matrix4[] transforms;
			[CCode (array_length = false)]
			public Matrix4[] transforms_inv;
			[CCode (cname = "frame_new")]
			public Frame();
			[CCode (cname = "frame_copy")]
			public Frame copy();
			[CCode (cname = "frame_interpolate")]
			public Frame interpolate(Frame other, float amount);
		}

		[Compact, CCode (cname = "config", cprefix="", free_function = "override_free")]
		public class Config {
			public Data.Dict entries;
			[CCode (cname = "cfg_load_file")]
			public Config(string filename);
			[CCode (cname = "cfg_save_file")]
			public void save();
			[CCode (cname = "config_delete")]
			public void delete();
			[CCode (cname = "config_string")]
			public unowned string str(string key);
			[CCode (cname = "config_int")]
			public int   int(string key);
			[CCode (cname = "config_float")]
			public float float(string key);
			[CCode (cname = "config_bool")]
			public bool  bool(string key);
			[CCode (cname = "config_set_string")]
			public void setString(string key, string val);
			[CCode (cname = "config_set_int")]
			public void setInt(string key, int val);
			[CCode (cname = "config_set_float")]
			public void setFloat(string key, float val);
			[CCode (cname = "config_set_bool")]
			public void setBool(string key, bool val);
			[CCode (cname = "option_graphics_asset")]
			public AssetHandle optionGraphicsAsset(string key, AssetHandle high, AssetHandle medium, AssetHandle low);
			[CCode (cname = "option_graphics_int")]
			public int optionGraphicsInt(string key, int high, int medium, int low);
			[CCode (cname = "option_graphics_float")]
			public float optionGraphicsFloat(string key, float high, float medium, float low);
		}

		[SimpleType, CCode (cname = "effect_key", cprefix="")]
		public class EffectKey {
			public float time;
			public float rotation;
			[CCode (cname = "rotation_r")]
			public float rotationR;
			public Vector3 scale;
			[CCode (cname = "scale_r")]
			public Vector3 scaleR;
			public Vector4 color;
			[CCode (cname = "color_r")]
			public Vector4 colorR;
			public Vector3 force;
			[CCode (cname = "force_r")]
			public Vector3 forceR;
		}
		public EffectKey effect_key_lerp(EffectKey x, EffectKey y, float amount);
		
		[Compact, CCode (cname = "effect", cprefix="", free_function = "override_free")]
		public class Effect {
			public AssetHandle texture;
			[CCode (cname = "texture_nm")]
			public AssetHandle textureNm;
			[CCode (cname = "blend_src")]
			public uint blendSrc;
			[CCode (cname = "blend_dst")]
			public uint blendDst;
			public int count;
			public float depth;
			public float thickness;
			public float bumpiness;
			public float scattering;
			public float lifetime;
			public float output;
			[CCode (cname = "output_r")]
			public float outputR;
			[CCode (cname = "alpha_decay")]
			public bool alphaDecay;
			[CCode (cname = "color_decay")]
			public bool colorDecay;
			[CCode (cname = "keys_num")]
			public int keysNum;
			[CCode (array_length = false)]
			public EffectKey[] keys;

			[CCode (cname = "effect_new")]
			public Effect();
			[CCode (cname = "effect_load_file")]
			public static Effect loadFile(string filename);
			[CCode (cname = "effect_delete")]
			public void delete();
			[CCode (cname = "effect_get_key")]
			public EffectKey getKey(float ptime);
		}

		[Compact, CCode (cname = "font", cprefix="", free_function = "override_free")]
		public class Font {
			[CCode (cname = "texture_map")]
			public AssetHandle textureMap;
			public int width;
			public int height;
			[CCode (array_length = false)]
			public Vector2[] locations;
			[CCode (array_length = false)]
			public Vector2[] sizes;
			[CCode (array_length = false)]
			public Vector2[] offsets;
			[CCode (cname = "font_load_file")]
			public Font(string filename);
			[CCode (cname = "font_delete")]
			public void delete();
		}

		[Compact, CCode (cname = "lang", cprefix="", free_function = "override_free")]
		public class Lang {
			public Data.Dict map;
			[CCode (cname = "lang_load_file")]
			public Lang(string filename);
			[CCode (cname = "lang_delete")]
			public void delete();
			[CCode (cname = "lang_get")]
			public unowned string get(string id);
			[CCode (cname = "lang_set_language")]
			public static void setLanguage(AssetHandle t);
			[CCode (cname = "S")]
			public static string S(string id);
		}
		
		[Compact, CCode (cname = "shader", cprefix="", free_function = "override_free")]
		public class Shader  {
			public uint shader;

			[CCode (cname = "vs_load_file")]
			public static Shader vsLoadFile(string filename);
			[CCode (cname = "fs_load_file")]
			public static Shader fsLoadFile(string filename);
			[CCode (cname = "gs_load_file")]
			public static Shader gsLoadFile(string filename);
			[CCode (cname = "tcs_load_file")]
			public static Shader tcsLoadFile(string filename);
			[CCode (cname = "tes_load_file")]
			public static Shader tesLoadFile(string filename);
			[CCode (cname = "shader_delete")]
			void delete();
			[CCode (cname = "shader_print_log")]
			void printLog();
			[CCode (cname = "shader_handle")]
			uint handle();
		}

		[Compact, CCode (cname = "shader_program", cprefix="", free_function = "override_free")]
		public class ShaderProgram {
			public uint shader;

			[CCode (cname = "shader_program_new")]
			public ShaderProgram();
			[CCode (cname = "shader_program_delete")]
			public void delete();
			[CCode (cname = "shader_program_has_shader")]
			public bool hasShader(Shader s);
			[CCode (cname = "shader_program_attach_shader")]
			public void attachShader(Shader s);
			[CCode (cname = "shader_program_link")]
			public void link();
			[CCode (cname = "shader_program_print_info")]
			public void printInfo();
			[CCode (cname = "shader_program_print_log")]
			public void printLog();
			[CCode (cname = "shader_program_handle")]
			public uint handle();
			[CCode (cname = "shader_program_get_attribute")]
			public int getAttribute(string name);
			[CCode (cname = "shader_program_enable")]
			public void enable();
			[CCode (cname = "shader_program_disable")]
			public void disable();
			[CCode (cname = "shader_program_set_int")]
			public void setInt(string name, int val);
			[CCode (cname = "shader_program_set_float")]
			public void setFloat(string name, float val);
			[CCode (cname = "shader_program_set_vec2")]
			public void setVec2(string name, Vector2 val);
			[CCode (cname = "shader_program_set_vec3")]
			public void setVec3(string name, Vector3 val);
			[CCode (cname = "shader_program_set_vec4")]
			public void setVec4(string name, Vector4 val);
			[CCode (cname = "shader_program_set_mat3")]
			public void setMat3(string name, Matrix3 val);
			[CCode (cname = "shader_program_set_mat4")]
			public void setMat4(string name, Matrix4 val);
			[CCode (cname = "shader_program_set_float_array")]
			public void setFloatArray(string name, ref float vals, int count);
			[CCode (cname = "shader_program_set_vec2_array")]
			public void setVec2Array(string name, ref Vector2 vals, int count);
			[CCode (cname = "shader_program_set_vec3_array")]
			public void setVec3Array(string name, ref Vector3 vals, int count);
			[CCode (cname = "shader_program_set_vec3_array")]
			public void setVec4Array(string name, ref Vector4 vals, int count);
			[CCode (cname = "shader_program_set_vec4_array")]
			public void setMat4Array(string name, ref Matrix4 vals, int count);
			[CCode (cname = "shader_program_set_texture")]
			public void setTexture(string name, int index, AssetHandle t);
			[CCode (cname = "shader_program_set_texture_id")]
			public void setTextureId(string name, int index, int t);
			[CCode (cname = "shader_program_enable_attribute")]
			public void enableAttribute(string name, int count, int stride, void* ptr);
			[CCode (cname = "shader_program_enable_attribute_instance")]
			public void enableAttribute_instance(string name, int count, int stride, void* ptr);
			[CCode (cname = "shader_program_disable_attribute")]
			public void disableAttribute(string name);
			[CCode (cname = "shader_program_enable_attribute_instance_matrix")]
			public void enableAttributeInstanceMatrix(string name, void* ptr);
			[CCode (cname = "shader_program_disable_attribute_matrix")]
			public void disableAttributeMatrix(string name);
		}
		
		public const int mat_item_int;
		public const int mat_item_float;
		public const int mat_item_vec2;
		public const int mat_item_vec3;
		public const int mat_item_vec4;
		public const int mat_item_shader;
		public const int mat_item_texture;
				
		[SimpleType, CCode (cname = "material_item", cprefix="")]
		public struct MaterialItem {
			[CCode (cname = "as_int")]
			public int asInt;
			[CCode (cname = "as_float")]
			public float asFloat;
			[CCode (cname = "as_vec2")]
			public Vector2 asVec2;
			[CCode (cname = "as_vec3")]
			public Vector3 asVec3;
			[CCode (cname = "as_vec4")]
			public Vector4 asVec4;
			[CCode (cname = "as_asset")]
			public AssetHandle asAsset;
		}

		[Compact, CCode (cname = "material_entry", cprefix="", free_function = "override_free")]
		public class MaterialEntry {
			public ShaderProgram program;
			[CCode (cname = "num_items")]
			public int numItems;
			[CCode (array_length = false)]
			public int[] types;
			[CCode (array_length = false)]
			public unowned string[] names;
			[CCode (array_length = false)]
			public MaterialItem[] items;

			[CCode (cname = "material_delete")]
			public void delete();
			[CCode (cname = "material_item")]
			public MaterialItem item(string name);
			[CCode (cname = "material_has_item")]
			public bool hasItem(string name);
			[CCode (cname = "material_add_item")]
			public void addItem(string name, int type, MaterialItem mi);
		}

		[Compact, CCode (cname = "material", cprefix="", free_function = "override_free")]
		public class Material {
			[CCode (cname = "num_entries")]
			public int numEntries;
			[CCode (array_length = false)]
			public MaterialEntry[] entries;

			[CCode (cname = "material_new")]
			public Material();
			[CCode (cname = "material_delete")]
			public void delete();
			[CCode (cname = "mat_load_file")]
			public static Material loadFile(string filename);
			[CCode (cname = "material_get_entry")]
			public MaterialEntry getEntry(int index);
			[CCode (cname = "material_add_entry")]
			public MaterialEntry addEntry();
			[CCode (cname = "material_first_program")]
			public static ShaderProgram firstProgram(void* m);
		}	

		[Compact, CCode (cname = "music", cprefix="", free_function = "override_free")]
		public class Music {
			//  public SDLMixer.Music handle;
			public GLib.Object handle;
			[CCode (cname = "music_delete")]
			public void delete();
		}
		Music mp3_load_file(string filename);
		Music ogg_load_file(string filename);

		[SimpleType, CCode (cname = "vertex_weight", cprefix="")]
		public class VertexWeight {
			[CCode (cname = "bone_ids")]
			public int boneIds[3];
			[CCode (cname = "bone_weights")]
			public float boneWeights[3];
		}

		[Compact, CCode (cname = "renderable_surface", cprefix="", free_function = "override_free")]
		public class RenderableSurface {
			[CCode (cname = "vertex_vbo")]
			public uint vertexVbo;
			[CCode (cname = "triangle_vbo")]
			public uint triangleVbo;
			[CCode (cname = "num_verticies")]
			public int numVerticies;
			[CCode (cname = "num_triangles")]
			public int numTriangles;
			public Sphere bound;

			[CCode (cname = "renderable_surface_new")]
			public RenderableSurface(Mesh m);
			[CCode (cname = "renderable_surface_rigged")]
			public static RenderableSurface rigged(Mesh m, VertexWeight* weights);
			[CCode (cname = "renderable_surface_delete")]
			void delete();
		}

		[Compact, CCode (cname = "renderable", cprefix="", free_function = "override_free")]
		public class Renderable {
			[CCode (array_length = false)]
			public RenderableSurface[] surfaces;
			[CCode (cname = "num_surfaces")]
			public int numSurfaces;
			[CCode (cname = "is_rigged")]
			public bool isRigged;
			public AssetHandle material;

			[CCode (cname = "renderable_new")]
			public Renderable();
			[CCode (cname = "renderable_delete")]
			public void delete();
			[CCode (cname = "renderable_add_mesh")]
			public void addMesh(Mesh m);
			[CCode (cname = "renderable_add_model")]
			public void addModel(Model m);
			[CCode (cname = "renderable_set_material")]
			public void setMaterial(AssetHandle mat);
			[CCode (cname = "renderable_to_model")]
			public Model toModel();
			[CCode (cname = "renderable_bmf_load_file")]
			public static Renderable bmfLoadFile(string filename);
			[CCode (cname = "renderable_obj_load_file")]
			public static Renderable objLoadFile(string filename);
			[CCode (cname = "renderable_smd_load_file")]
			public static Renderable smdLoadFile(string filename);
			[CCode (cname = "renderable_ply_load_file")]
			public static Renderable plyLoadFile(string filename);
			[CCode (cname = "renderable_bmf_save_file")]
			public void saveFile(string filename);
						
		}
		
		[Compact, CCode (cname = "skeleton", cprefix="", free_function = "override_free")]
		public class Skeleton {
			public int joint_count;
			[CCode (array_length = false, cname = "joint_names")]
			public unowned string[] jointNames;
			[CCode (cname = "rest_pose")]
			public Frame restPose;
			[CCode (cname = "skeleton_new")]
			public Skeleton();
			[CCode (cname = "skeleton_delete")]
			public void delete();
			[CCode (cname = "skeleton_joint_add")]
			public void jointAdd(string name, int parent);
			[CCode (cname = "skeleton_joint_id")]
			public int jointId(string name);
			[CCode (cname = "skeleton_skl_load_file")]
			public static Skeleton loadFile(string filename);
		}

		[Compact, CCode (cname = "sound", cprefix="", free_function = "override_free")]
		public class Sound {
			//  public SDLMixer.Chunk handle;
			public GLib.Object handle;
			[CCode (cname = "wav_load_file")]
			public Sound(string name);
			[CCode (cname = "sound_delete")]
			public void delete();
			[CCode (cname = "sound_play")]
			public int play();
			[CCode (cname = "sound_play_looped")]
			public int playLooped(int loops);
			[CCode (cname = "sound_play_at")]
			public int playAt(Vector3 pos, Vector3 cam_pos, Vector3 cam_dir);
			[CCode (cname = "sound_play_at_looped")]
			public int playAtLooped(Vector3 pos, Vector3 cam_pos, Vector3 cam_dir, int loops);
		}

		[Compact, CCode (cname = "terrain_chunk", cprefix="", free_function = "override_free")]
		public class TerrainChunk {
			public int id;
			public int x;
			public int y;
			public int width;
			public int height;
			public Sphere bound;
			public TerrainChunk left;
			public TerrainChunk right;
			public TerrainChunk top;
			public TerrainChunk bottom;
			public CMesh colmesh;
			[CCode (cname = "num_verts")]
			public int numVerts;
			[CCode (cname = "vertex_buffer")]
			public uint vertexBuffer;
			[CCode (cname = "num_indicies")]
			public int numIndicies[7];
			[CCode (cname = "index_buffers")]
			public uint indexBuffers[7];
			public void delete();
		}

		[Compact, CCode (cname = "terrain", cprefix="", free_function = "override_free")]
		public class Terrain {
			public int width;
			[CCode (cname = "height")]
			public int _height;
			public float* heightmap;
			[CCode (cname = "chunk_width")]
			public int chunkWidth;
			[CCode (cname = "chunk_height")]
			public int chunkHeight;
			[CCode (cname = "num_chunks")]
			public int numChunks;
			[CCode (cname = "num_cols")]
			public int numCols;
			[CCode (cname = "num_rows")]
			public int numRows;
			[CCode (array_length = false)]
			public TerrainChunk[] chunks;
			[CCode (cname = "raw_load_file")]
			public Terrain (string filename);
			[CCode (cname = "raw_save_file")]
			public void save(string filename);
			[CCode (cname = "terrain_delete")]
			public void delete();
			[CCode (cname = "terrain_terrain_get_chunk")]
			public TerrainChunk terrain_get_chunk(int x, int y);
			[CCode (cname = "terrain_reload_chunk")]
			public void reloadChunk(int i);
			[CCode (cname = "terrain_tbn")]
			public Matrix3  tbn(Vector2 position);
			[CCode (cname = "terrain_axis")]
			public Matrix3  axis(Vector2 position);
			[CCode (cname = "terrain_height")]
			public float height(Vector2 position);
			[CCode (cname = "terrain_normal")]
			public Vector3  normal(Vector2 position);
		}		

		[Compact, CCode (cname = "texture", cprefix="", free_function = "override_free")]
		public class Texture {
			[CCode (cname = "handle")]
			public uint _handle;
			[CCode (cname = "type")]
			public int _type;
			[CCode (cname = "texture_new")]
			public Texture();
			[CCode (cname = "texture_new_handle")]
			public static Texture new_handle(uint h);
			[CCode (cname = "texture_delete")]
			public void delete();
			[CCode (cname = "texture_handle")]
			public uint handle();
			public static uint GL(string path) {
				return ((Texture)Asset.Get(URI(path))).handle();
			}			
			[CCode (cname = "texture_type")]
			public int type();
			[CCode (cname = "texture_set_image")]
			public void setImage(Image i);
			[CCode (cname = "texture_get_image")]
			public Image getImage();
			[CCode (cname = "texture_generate_mipmaps")]
			public void generateMipmaps();
			[CCode (cname = "texture_set_filtering_nearest")]
			public void setFilteringNearest();
			[CCode (cname = "texture_set_filtering_linear")]
			public void setFilteringLinear();
			[CCode (cname = "texture_set_filtering_anisotropic")]
			public void setFilteringAnisotropic();
			[CCode (cname = "bmp_load_file")]
			public static Texture bmpLoadFile( string filename );
			[CCode (cname = "tga_load_file")]
			public static Texture tgaLoadFile( string filename );
			[CCode (cname = "dds_load_file")]
			public static Texture ddsLoadFile( string filename );
			[CCode (cname = "lut_load_file")]
			public static Texture lutLoadFile( string filename );
			[CCode (cname = "acv_load_file")]
			public static Texture acvLoadFile( string filename );
			[CCode (cname = "texture_write_to_file")]
			public void writeToFile(string filename);
			[CCode (cname = "texture3de_write_to_file")]
			public void writeToFile3d(string filename);
		}		
	}

	namespace Data 
	{
		[CCode (cname = "randf")]
		public float rand();
		[CCode (cname = "randf_seed")]
		public float randSeed(float s);
		/* Random float in range -1 to 1 */
		[CCode (cname = "randf_n")]
		public float randN();
		[CCode (cname = "randf_nseed")]
		public float randNseed(float s);
		/* Random float in range 0 to s */
		[CCode (cname = "randf_scale")]
		public float randScale(float s);
		/* Random float in range -s to s */
		[CCode (cname = "randf_nscale")]
		public float randNscale(float s);
		/* Random float in range s to e */
		[CCode (cname = "randf_range")]
		public float randRange(float s, float e);
		[CCode (cname = "randf_circle")]
		public Vector2 randCircle(float radius);

		[CCode (has_target = false)]
		public delegate void BucketFunc();

		[CCode (has_target = false)]
		public delegate int FilterFunc();

		[Compact, CCode (cname = "bucket", cprefix="", free_function = "override_free")]
		public class Bucket<T> {
			public string key;
			public T item;
			public Bucket next;
			[CCode (cname = "bucket_new")]
			public Bucket(string s, IntPtr item);
			[CCode (cname = "bucket_map")]
			public void map(BucketFunc func);
			[CCode (cname = "bucket_filter_map")]
			public void filterMap(FilterFunc ffunc , BucketFunc bfunc);
			[CCode (cname = "bucket_delete_with")]
			public void deleteWith(FilterFunc func);
			[CCode (cname = "bucket_delete_recursive")]
			public void deleteRecursive();
			[CCode (cname = "bucket_print")]
			public void print();
		}

		[CCode (has_target = false)]
		public delegate void DictFunc();


		[Compact, CCode (cname = "dict", cprefix="", free_function = "override_free")]
		public class Dict<T> {
			public int size;
			[CCode (array_length = false)]
			public Bucket<T>[] buckets;

			[CCode (cname = "dict_new")]
			public Dict(int size);
			[CCode (cname = "dict_delete")]
			public void delete();
			[CCode (cname = "dict_contains")]
			public bool contains(string s);
			[CCode (cname = "dict_get")]
			public T get(string s);
			[CCode (cname = "dict_set")]
			public void set(string s, owned T item);
			[CCode (cname = "dict_remove_with")]
			public void removeWith(string s, DictFunc func);
			[CCode (cname = "dict_mao")]
			public void map(DictFunc func);
			[CCode (cname = "dict_filter_map")]
			public void filterMap(FilterFunc ffunc , DictFunc dfunc);
			[CCode (cname = "dict_print")]
			public void print();
			[CCode (cname = "dict_find")]
			public unowned string find(T item);
		}		

		[Compact, CCode (cname = "int_list", cprefix="", free_function = "override_free")]
		public class IntList {
			[CCode (cname = "num_items")]
			public int numItems;
			[CCode (cname = "num_slots")]
			public int numSlots;
			[CCode (array_length = false)]
			public int[] items;  

			[CCode (cname = "int_list_new")]
			public IntList();
			[CCode (cname = "int_list_delete")]
			public void delete();
			[CCode (cname = "int_list_push_back")]
			public void pushBack(int item);
			[CCode (cname = "int_list_pop_back")]
			public int popBack();
			[CCode (cname = "int_list_get")]
			public int get(int index);
			[CCode (cname = "int_list_set")]
			public void set(int index, int item);
			[CCode (cname = "int_list_is_empty")]
			public bool isEmpty();
			[CCode (cname = "int_list_clear")]
			public void clear();
		}		

		[CCode (has_target = false)]
		public delegate void ListFilter();

		[Compact, CCode (cname = "list", cprefix="", free_function = "override_free")]
		public class List<T> {
			[CCode (cname = "num_items")]
			public int numItems;
			[CCode (cname = "num_slots")]
			public int numSlots;
			[CCode (array_length = false)]
			public T[] items;

			[CCode (cname = "list_new")]
			public List();
			[CCode (cname = "list_push_back")]
			public void pushBack(T item);
			[CCode (cname = "list_pop_back")]
			public IntPtr popBack();
			[CCode (cname = "list_pop_at")]
			public IntPtr popAt(int index);
			[CCode (cname = "list_remove")]
			public void remove(T item);
			[CCode (cname = "list_get")]
			public T get(int index);
			[CCode (cname = "list_set")]
			public void set(int index, owned T item);
			[CCode (cname = "list_is_empty")]
			public bool isEmpty();
			[CCode (cname = "list_delete")]
			public void delete();
			[CCode (cname = "list_clear")]
			public void clear();
			[CCode (cname = "list_delete_with")]
			public void deleteWith(ListFilter func);
			[CCode (cname = "list_clear_with")]
			public void clearWith(ListFilter func);
		}		

		[Compact, CCode (cname = "int_bucket", cprefix="", free_function = "override_free")]
		public struct IntBucket {
			public List keys;
			public IntList values;
		}		
		
		[Compact, CCode (cname = "int_hashtable", cprefix="", free_function = "override_free")]
		public class IntHashtable {
			[CCode (array_length = false)]
			public IntBucket items[];
			[CCode (cname = "table_size")]
			public int tableSize;

			[CCode (cname = "int_hashtable_new")]
			public IntHashtable(int size);
			[CCode (cname = "int_hashtable_hash")]
			int hash(string key);
			[CCode (cname = "int_hashtable_delete")]
			void delete();
			[CCode (cname = "int_hashtable_set")]
			void set(string key, int value);
			[CCode (cname = "int_hashtable_get")]
			int get(string key);
		}		

		[Compact, CCode (cname = "spline", cprefix="", free_function = "override_free")]
		public class Spline {
			[CCode (cname = "num_points")]
			public int numPoints;
			public float y0d;
			public float ynd;
			public float x0d;
			public float xnd;
			public float x[20];
			public float y[20];
			public float yd[20];
			public float xd[20];

			[CCode (cname = "spline_new")]
			public Spline();
			[CCode (cname = "spline_delete")]
			public void delete();
			[CCode (cname = "spline_add_point")]
			public void addPoint(Vector2 p);
			[CCode (cname = "spline_get_point")]
			public Vector2 getPoint(int i);
			[CCode (cname = "spline_set_point")]
			public void setPoint(int i, Vector2 p);
			[CCode (cname = "spline_update")]
			public void update();
			[CCode (cname = "spline_print")]
			public void print();
			[CCode (cname = "spline_get_x")]
			public float getX(float y);
			[CCode (cname = "spline_get_y")]
			public float getY(float x);
			[CCode (cname = "spline_get_x_between")]
			public float getXBetween(int low, int high, float y);
			[CCode (cname = "spline_get_y_between")]
			public float getYBetween(int low, int high, float x);
		}

		[Compact, CCode (cname = "color_curves", cprefix="", free_function = "override_free")]
		public class ColorCurves {
			[CCode (cname = "rgb_spline")]
			public Spline rgb_spline;
			[CCode (cname = "r_spline")]
			public Spline r_spline;
			[CCode (cname = "g_spline")]
			public Spline g_spline;
			[CCode (cname = "b_spline")]
			public Spline b_spline;
			[CCode (cname = "a_spline")]
			public Spline a_spline;

			[CCode (cname = "color_curves_load")]
			public ColorCurves(string filename);
			[CCode (cname = "color_curves_delete")]
			void delete();
			[CCode (cname = "color_curves_write_lut")]
			void writeLut(string filename);
			[CCode (cname = "color_curves_map")]
			Vector3 map(Vector3 v);
		}		

		[Compact, CCode (cname = "vertex_list", cprefix="", free_function = "override_free")]
		public class VertexList {
			[CCode (cname = "num_items")]
			public int numItems;
			[CCode (cname = "num_slots")]
			public int numSlots;
			[CCode (array_length = false)]
			public Vertex[] items; 

			[CCode (cname = "vertex_list_new")]
			public VertexList();
			[CCode (cname = "vertex_list_delete")]
			public void delete();
			[CCode (cname = "vertex_list_push_back")]
			public void pushBack(Vertex item);
			[CCode (cname = "vertex_list_pop_baxk")]
			public Vertex popBack();
			[CCode (cname = "vertex_list_get")]
			public Vertex get(int index);
			[CCode (cname = "vertex_list_set")]
			public void set(int index, Vertex item);
			[CCode (cname = "vertex_list_clear")]
			public void clear();
		}		
		
		[Compact, CCode (cname = "vertex_bucket", cprefix="", free_function = "override_free")]
		public class VertexBucket {
			VertexList keys;
			IntList values;
		}		

		[Compact, CCode (cname = "vertex_hashtable", cprefix="", free_function = "override_free")]
		public class VertexHashtable {
			public VertexBucket items;
			[CCode (cname = "table_size")]
			public int tableSize;

			[CCode (cname = "vertex_hashtable_new")]
			public VertexHashtable(int size);
			[CCode (cname = "vertex_hash")]
			public static int hash(VertexHashtable ht, Vertex v);
			[CCode (cname = "vertex_delete")]
			void delete();
			[CCode (cname = "vertex_set")]
			void set(Vertex key, int value);
			[CCode (cname = "vertex_get")]
			int get(Vertex key);
		}		
	}

	namespace Rendering 
	{
		[CCode (cname = "int", cprefix = "RENDERER_MAX_")]
		public enum RendererMax {
			LIGHTS, DYN_LIGHTS
		}
		[CCode (cname = "int", cprefix = "RO_TYPE_")]
		public enum RoType {
			AXIS, STATIC, INSTANCE, ANIMATED, PARTICLES, LIGHT, LANDSCAPE,
			PAINT, SPHERE, ELLIPSOID, CMESH, FRUSTRUM, PLANE, LINE, POINT
		}
		public const float TIME_SUNRISE;
		public const float TIME_MORNING;
		public const float TIME_MIDDAY;
		public const float TIME_EVENING;
		public const float TIME_SUNSET;
		public const float TIME_MIDNIGHT;
		
		[Compact, CCode (cname = "sky", cprefix="", free_function = "override_free")]
		public class Sky {
			public float time;
			public uint32 seed;
			[CCode (cname = "cloud_mesh")]
			public AssetHandle cloudMesh[14];
			[CCode (cname = "cloud_tex")]
			public AssetHandle cloudTex[14];
			[CCode (cname = "cloud_opacity")]
			public float cloudOpacity[14];
			[CCode (cname = "sun_sprite")]
			public AssetHandle sunSprite;
			[CCode (cname = "sun_tex")]
			public AssetHandle sunTex;
			[CCode (cname = "moon_sprite")]
			public AssetHandle moonSprite;
			[CCode (cname = "moon_tex")]
			public AssetHandle moonTex;
			[CCode (cname = "stars_sprite")]
			public AssetHandle starsSprite;
			[CCode (cname = "stars_tex")]
			public AssetHandle starsTex;
			[CCode (cname = "is_day")]
			public bool isDay;
			public Vector3 wind;
			[CCode (cname = "world_sun")]
			public Matrix4 worldSun;
			[CCode (cname = "world_moon")]
			public Matrix4 worldMoon;
			[CCode (cname = "world_stars")]
			public Matrix4 worldStars;
			[CCode (cname = "moon_power")]
			public float moonPower;
			[CCode (cname = "moon_direction")]
			public Vector3 moonDirection;
			[CCode (cname = "moon_diffuse")]
			public Vector3 moonDiffuse;
			[CCode (cname = "moon_ambient")]
			public Vector3 moonAmbient;
			[CCode (cname = "moon_specular")]
			public Vector3 moonSpecular;
			[CCode (cname = "sun_power")]
			public float sunPower;
			[CCode (cname = "sun_direction")]
			public Vector3 sunDirection;
			[CCode (cname = "sun_diffuse")]
			public Vector3 sunDiffuse;
			[CCode (cname = "sun_ambient")]
			public Vector3 sunAmbient;
			[CCode (cname = "sun_specular")]
			public Vector3 sunSpecular;
			[CCode (cname = "sky_power")]
			public float skyPower;
			[CCode (cname = "sky_direction")]
			public Vector3 skyDirection;
			[CCode (cname = "sky_diffuse")]
			public Vector3 skyDiffuse;
			[CCode (cname = "sky_ambient")]
			public Vector3 skyAmbient;
			[CCode (cname = "sky_specular")]
			public Vector3 skySpecular;
			[CCode (cname = "ground_power")]
			public float groundPower;
			[CCode (cname = "ground_direction")]
			public Vector3 groundDirection;
			[CCode (cname = "ground_diffuse")]
			public Vector3 groundDiffuse;
			[CCode (cname = "ground_ambient")]
			public Vector3 groundAmbient;
			[CCode (cname = "ground_specular")]
			public Vector3 groundSpecular;
			[CCode (cname = "sky_new")]
			public Sky ();
			[CCode (cname = "sky_delete")]
			public void delete();
			[CCode (cname = "sky_update")]
			public void update(float t, uint32 seed);
		}

		[SimpleType, CCode (cname = "render_object", cprefix="", destroy_function = "")]
		public struct RenderObject {
			public RoType type;
			/* Geometry */
			public Matrix4 _axis;
			public Sphere _sphere;
			public Ellipsoid _ellipsoid;
			public Assets.CMesh colmesh; 
			public Matrix4 colworld; 
			public Frustum _frustum;
			public Plane _plane;
			[CCode (cname = "line_start")]
			public Vector3 lineStart; 
			[CCode (cname = "line_end")]
			public Vector3 lineEnd; 
			[CCode (cname = "line_color")]
			public Vector3 lineColor; 
			[CCode (cname = "line_thickness")]
			public float lineThickness;
			[CCode (cname = "point_pos")]
			public Vector3 pointPos; 
			[CCode (cname = "point_color")]
			public Vector3 pointColor; 
			[CCode (cname = "point_size")]
			public float pointSize; 
			/* CObjects */
			public entities.StaticObject _static_object;
			public entities.InstanceCObject _instance_object;
			public entities.AnimatedObject _animated_object;
			public entities.Landscape _landscape;
			public entities.Particles _particles;
			
			/* UI */
			public entities.Light _light;
			[CCode (cname = "paint_axis")]
			public Matrix4 paintAxis; 
			[CCode (cname = "paint_radius")]
			public float paintRadius; 

			[CCode (cname = "render_object_static")]
			public static RenderObject static(entities.StaticObject s);
			[CCode (cname = "render_object_instance")]
			public static RenderObject instance(entities.InstanceCObject s);
			[CCode (cname = "render_object_animated")]
			public static RenderObject animated(entities.AnimatedObject a);
			[CCode (cname = "render_object_particles")]
			public static RenderObject particles(entities.Particles p);
			[CCode (cname = "render_object_light")]
			public static RenderObject light(entities.Light l);
			[CCode (cname = "render_object_axis")]
			public static RenderObject axis(Matrix4 a);
			[CCode (cname = "render_object_sphere")]
			public static RenderObject sphere(Sphere s);
			[CCode (cname = "render_object_ellipsoid")]
			public static RenderObject ellipsoid(Ellipsoid e);
			[CCode (cname = "render_object_frustum")]
			public static RenderObject frustum(Frustum f);
			[CCode (cname = "render_object_plane")]
			public static RenderObject plane(Plane p);
			[CCode (cname = "render_object_cmesh")]
			public static RenderObject cmesh(Assets.CMesh cm, Matrix4 world);
			[CCode (cname = "render_object_landscape")]
			public static RenderObject landscape(entities.Landscape l);
			[CCode (cname = "render_object_paint")]
			public static RenderObject paint(Matrix4 paint_axis, float paint_radius);
			[CCode (cname = "render_object_line")]
			public static RenderObject line(Vector3 start, Vector3 end, Vector3 color, float thickness);
			[CCode (cname = "render_object_point")]
			public static RenderObject point(Vector3 pos, Vector3 color, float size);
		}

		[Compact, CCode (cname = "renderer", cprefix="", free_function = "override_free")]
		public class Renderer {
			/* Options */
			public AssetHandle options;
			/* Camera */
			public Camera camera;
			/* Lights */
			[CCode (cname = "dyn_lights_num")]
			public int dynLightsNum;
			[CCode (cname = "dyn_lights")]
			public entities.Light dynLight[13];
			/* Sky */
			public Sky sky;
			/* Materials */
			[CCode (cname = "mat_static")]
			public AssetHandle matStatic;
			[CCode (cname = "mat_skin")]
			public AssetHandle matSkin;
			[CCode (cname = "mat_instance")]
			public AssetHandle matInstance;
			[CCode (cname = "mat_animated")]
			public AssetHandle matAnimated;
			[CCode (cname = "mat_vegetation")]
			public AssetHandle matVegetation;
			[CCode (cname = "mat_terrain")]
			public AssetHandle matTerrain;
			[CCode (cname = "mat_clear")]
			public AssetHandle matClear;
			[CCode (cname = "mat_ui")]
			public AssetHandle matUi;
			[CCode (cname = "mat_ssao")]
			public AssetHandle matSsao;
			[CCode (cname = "mat_compose")]
			public AssetHandle matCompose;
			[CCode (cname = "mat_tonemap")]
			public AssetHandle matTonemap;
			[CCode (cname = "mat_post0")]
			public AssetHandle matPost0;
			[CCode (cname = "mat_post1")]
			public AssetHandle matPost1;
			[CCode (cname = "matSkydome")]
			public AssetHandle mat_skydome;
			[CCode (cname = "matDepth")]
			public AssetHandle mat_depth;
			[CCode (cname = "matDepthIns")]
			public AssetHandle mat_depth_ins;
			[CCode (cname = "mat_depth_ani")]
			public AssetHandle matDepthAni;
			[CCode (cname = "mat_depth_veg")]
			public AssetHandle matDepthVeg;
			[CCode (cname = "mat_depth_ter")]
			public AssetHandle matDepthTer;
			[CCode (cname = "matSun")]
			public AssetHandle mat_sun;
			[CCode (cname = "mat_clouds")]
			public AssetHandle matClouds;
			[CCode (cname = "mat_particles")]
			public AssetHandle matParticles;
			[CCode (cname = "mat_sea")]
			public AssetHandle mat_sea;
			/* Meshes */
			[CCode (cname = "mesh_skydome")]
			public AssetHandle meshSkydome;
			[CCode (cname = "mesh_sphere")]
			public AssetHandle meshSphere;
			[CCode (cname = "mesh_sea")]
			public AssetHandle meshSea;
			/* Textures */
			[CCode (cname = "tex_color_correction")]
			public AssetHandle texColorCorrection;
			[CCode (cname = "tex_random")]
			public AssetHandle texRandom;
			[CCode (cname = "tex_random_perlin")]
			public AssetHandle texRandomPerlin;
			[CCode (cname = "tex_environment")]
			public AssetHandle texEnvironment;
			[CCode (cname = "tex_vignetting")]
			public AssetHandle texVignetting;
			[CCode (cname = "tex_sea_bump0")]
			public AssetHandle texSeaBump0;
			[CCode (cname = "tex_sea_bump1")]
			public AssetHandle texSeaBump1;
			[CCode (cname = "tex_sea_bump2")]
			public AssetHandle texSeaBump2;
			[CCode (cname = "tex_sea_bump3")]
			public AssetHandle texSeaBump3;
			[CCode (cname = "tex_sea_env")]
			public AssetHandle texSeaEnv;
			[CCode (cname = "tex_cube_sea")]
			public AssetHandle texCubeSea;
			[CCode (cname = "tex_cube_field")]
			public AssetHandle texCubeField;
			[CCode (cname = "tex_white")]
			public AssetHandle texWhite;
			[CCode (cname = "tex_grey")]
			public AssetHandle texGrey;
			[CCode (cname = "tex_skin_lookup")]
			public AssetHandle texSkinLookup;
			/* Buffers */
			public uint gfbo;
			[CCode (cname = "gdepth_buffer")]
			public uint gdepthBuffer;
			[CCode (cname = "gdiffuse_buffer")]
			public uint gdiffuseBuffer;
			[CCode (cname = "gnormals_buffer")]
			public uint gnormalsBuffer;

			[CCode (cname = "gdiffuse_texture")]
			public uint gdiffuseTexture;
			[CCode (cname = "gnormals_texture")]
			public uint gnormalsTexture;
			[CCode (cname = "gdepth_texture")]
			public uint gdepthTexture;

			[CCode (cname = "ssao_fbo")]
			public uint ssaoFbo;
			[CCode (cname = "ssao_buffer")]
			public uint ssaoBuffer;
			[CCode (cname = "ssao_texture")]
			public uint ssaoTexture;

			[CCode (cname = "hdr_fbo")]
			public uint hdrFbo;
			[CCode (cname = "hdr_buffer")]
			public uint hdrBuffer;
			[CCode (cname = "hdr_texture")]
			public uint hdrTexture;

			[CCode (cname = "ldr_front_fbo")]
			public uint ldrFrontFbo;
			[CCode (cname = "ldr_front_buffer")]
			public uint ldrFrontBuffer;
			[CCode (cname = "ldr_front_texture")]
			public uint ldrFrontTexture;

			[CCode (cname = "ldr_back_fbo")]
			public uint ldrBackFbo;
			[CCode (cname = "ldr_back_buffer")]
			public uint ldrBackBuffer;
			[CCode (cname = "ldr_back_texture")]
			public uint ldrBackTexture;

			[CCode (cname = "shadows_fbo")]
			public uint shadowsFbo[3];
			[CCode (cname = "shadows_buffer")]
			public uint shadowsBuffer[3];
			[CCode (cname = "shadows_texture")]
			public uint shadowsTexture[3];

			/* Shadows */
			[CCode (cname = "shadows_start")]
			public float shadowsStart[3];
			[CCode (cname = "shadows_end")]
			public float shadowsEnd[3];
			[CCode (cname = "shadows_widths")]
			public int shadowsWidths[3];
			[CCode (cname = "shadows_heights")]
			public int shadowsHeights[3];

			/* Variables */
			public int seed;
			public float glitch;
			public float time;
			[CCode (cname = "time_of_day")]
			public float timeOfDay;
			public float exposure;
			[CCode (cname = "exposure_speed")]
			public float exposureSpeed;
			[CCode (cname = "exposure_target")]
			public float exposureTarget;
			[CCode (cname = "skydome_enabled")]
			public bool skydomeEnabled;
			[CCode (cname = "sea_enabled")]
			public bool seaEnabled;

			/* CObjects */
			[CCode (cname = "render_objects_num")]
			public int renderObjectsNum;
			[CCode (array_length = false, cname = "render_objects")]
			public RenderObject[] renderObjects;

			/* Preprocessed */

			[CCode (cname = "camera_view")]
			public Matrix4  cameraView;
			[CCode (cname = "camera_proj")]
			public Matrix4  cameraProj;
			[CCode (cname = "camera_inv_view")]
			public Matrix4  cameraInvView;
			[CCode (cname = "camera_inv_proj")]
			public Matrix4  cameraInvProj;
			[CCode (cname = "camera_near")]
			public float cameraNear;
			[CCode (cname = "camera_far")]
			public float cameraFar;
			[CCode (cname = "camera_frustum")]
			public Box cameraFrustum;

			[CCode (cname = "shadow_view")]
			public Matrix4  shadowView[3];
			[CCode (cname = "shadow_proj")]
			public Matrix4  shadowProj[3];
			[CCode (cname = "shadow_near")]
			public float shadowNear[3];
			[CCode (cname = "shadow_far")]
			public float shadowFar[3];
			[CCode (cname = "shadow_frustum")]
			public Box shadowFrustum[3];
			[CCode (cname = "renderer_new")]
			public Renderer (AssetHandle options);
			[CCode (cname = "renderer_delete")]
			public void delete();
			[CCode (cname = "renderer_set_camera")]
			public void setCamera(Camera cam);
			[CCode (cname = "renderer_set_color_correction")]
			public void setColorCorrection(AssetHandle t);
			[CCode (cname = "renderer_set_vignetting")]
			public void setVignetting(AssetHandle v);
			[CCode (cname = "renderer_set_glitch")]
			public void setGlitch(float glitch);
			[CCode (cname = "renderer_set_skydome_enabled")]
			public void setSkydomeEnabled(bool enabled);
			[CCode (cname = "renderer_set_sea_enabled")]
			public void setSeaEnabled(bool enabled);
			[CCode (cname = "renderer_set_tod")]
			public void setTod(float tod, int seed);
			[CCode (cname = "renderer_add")]
			public void add(RenderObject ro);
			[CCode (cname = "renderer_add_dyn_light")]
			public void addDynLight(entities.Light l);
			[CCode (cname = "renderer_render")]
			public void render();
		}
	}

	namespace entities 
	{
		[Compact, CCode (cname = "particles", cprefix="", free_function = "override_free")]
		public class Particles {
			public Vector3 position;
			public Quaternion rotation;
			public Vector3 scale;
			public AssetHandle effect;
			public float rate;
			public int count;
			[CCode (array_length = false)]
			public bool[]  actives;
			[CCode (array_length = false)]
			public float[] seeds;
			[CCode (array_length = false)]
			public float[] times;
			[CCode (array_length = false)]
			public float[] rotations;
			[CCode (array_length = false)]
			public Vector3[]  scales;
			[CCode (array_length = false)]
			public Vector4[]  colors;
			[CCode (array_length = false)]
			public Vector3[]  positions;
			[CCode (array_length = false)]
			public Vector3[]  velocities;
			[CCode (cname = "vertex_buff")]
			public uint vertexBuff;
			[CCode (array_length = false, cname = "vertexData")]
			public float[] vertex_data;

			[CCode (cname = "particles_new")]
			public Particles ();
			[CCode (cname = "particles_delete")]
			public void delete();
			[CCode (cname = "particles_set_effect")]
			public void setEffect(AssetHandle effect);
			[CCode (cname = "particles_update")]
			public void update(float timestep, Camera cam);
		}

		[Compact, CCode (cname = "landscape_blobtree", cprefix="", free_function = "override_free")]
		public class LandscapeBlobtree {
			public Sphere bound;
			[CCode (cname = "is_leaf")]
			public bool isLeaf;
			[CCode (cname = "chunk_index")]
			public int chunkIndex;
			public LandscapeBlobtree child0;
			public LandscapeBlobtree child1;
			public LandscapeBlobtree child2;
			public LandscapeBlobtree child3;
			[CCode (cname = "landscape_blobtree_new")]
			public LandscapeBlobtree (Landscape ls);
			[CCode (cname = "landscape_blobtree_delete")]
			public void delete();
			[CCode (cname = "landscape_blobtree_generate")]
			public static void generate(Landscape* l);
		}

		[Compact, CCode (cname = "landscape", cprefix="", free_function = "override_free")]
		public class Landscape {
			public AssetHandle heightmap;
			public AssetHandle attribmap;
			public Assets.Image attribimage;
			public float scale;
			[CCode (cname = "size_x")]
			public float sizeX;
			[CCode (cname = "size_y")]
			public float sizeY;
			public LandscapeBlobtree blobtree;
			public AssetHandle ground0;
			public AssetHandle ground1;
			public AssetHandle ground2;
			public AssetHandle ground3;
			[CCode (cname = "ground0_nm")]
			public AssetHandle ground0Nm;
			[CCode (cname = "ground1_nm")]
			public AssetHandle ground1Nm;
			[CCode (cname = "ground2_nm")]
			public AssetHandle ground2Nm;
			[CCode (cname = "ground3_nm")]
			public AssetHandle ground3Nm;

			[CCode (cname = "landscape_new")]
			public Landscape();
			[CCode (cname = "landscape_delete")]
			public void delete();
			[CCode (cname = "landscape_world")]
			Matrix4  world();
			[CCode (cname = "landscape_world_normal")]
			Matrix3  worldNormal();
			[CCode (cname = "landscape_height")]
			float height(Vector2 pos);
			[CCode (cname = "landscape_normal")]
			Vector3  normal(Vector2 pos);
			[CCode (cname = "landscape_axis")]
			Matrix3  axis(Vector2 pos);
			[CCode (cname = "landscape_paint_height")]
			void paintHeight(Vector2 pos, float radius, float value, float opacity);
			[CCode (cname = "landscape_paint_color")]
			void paintColor(Vector2 pos, float radius, int type, float opacity);
			[CCode (cname = "landscape_chunks", array_length = false)]
			void chunks(Vector2 pos, ref Assets.TerrainChunk[] chunks_out);
		}


		[Compact, CCode (cname = "light", cprefix="", free_function = "override_free")]
		public class Light {
			[CCode (cname = "position")]
			public Vector3 _position;
			public Vector3 target;
			
			[CCode (cname = "diffuse_color")]
			public Vector3 diffuseColor;
			[CCode (cname = "specular_color")]
			public Vector3 specularColor;
			[CCode (cname = "ambient_color")]
			public Vector3 ambientColor;
			
			public float power;
			public float falloff;
			
			public bool enabled;
			[CCode (cname = "cast_shadows")]
			public bool castShadows;
			
			[CCode (cname = "type")]
			public int _type;
			
			/* Shadow Mapping */
			[CCode (cname = "shadow_color")]
			public Vector3 shadowColor;
			[CCode (cname = "shadow_map_width")]
			public int shadowMapWidth;
			[CCode (cname = "shadow_map_height")]
			public int shadowMapHeight;
			
			/* Orthographic Shadow Mapping */
			public bool orthographic;
			[CCode (cname = "ortho_width")]
			public float orthoWidth;
			[CCode (cname = "ortho_height")]
			public float orthoHeight;
			
			/* Projection Shadow Mapping */
			public float fov;
			[CCode (cname = "aspect_ratio")]
			public float aspectRatio;
			
			[CCode (cname = "light_new")]
			public Light();
			[CCode (cname = "light_position")]
			public static Light position(Vector3 position);
			[CCode (cname = "light_type")]
			public static Light type(Vector3 position, int type);
			[CCode (cname = "light_delete")]
			public void delete();
			[CCode (cname = "light_set_type")]
			public void setType(int type);
			[CCode (cname = "light_direction")]
			public Vector3 direction();
			[CCode (cname = "light_view_matrix")]
			public Matrix4 viewMatrix();
			[CCode (cname = "light_proj_matrix")]
			public Matrix4 projMatrix();
		}


		[Compact, CCode (cname = "static_object", cprefix="", free_function = "override_free")]
		public class StaticObject {
			public Vector3 position;
			public Vector3 scale;
			public Quaternion rotation;
			public bool active;
			[CCode (cname = "recieve_shadows")]
			public bool recieveShadows;
			[CCode (cname = "cast_shadows")]
			public bool castShadows;
			public AssetHandle renderable;
			[CCode (cname = "collision_body")]
			public AssetHandle collisionBody;

			[CCode (cname = "static_object_new")]
			public StaticObject();
			[CCode (cname = "static_object_delete")]
			public void delete();
			[CCode (cname = "static_object_world")]
			public Matrix4 world();
			[CCode (cname = "static_object_world_normal")]
			public Matrix3 worldNormal();

		}

		[Compact, CCode (cname = "animated_object", cprefix="", free_function = "override_free")]
		public class AnimatedObject {
			public Vector3 position;
			public Vector3 scale;
			public Quaternion rotation;
			[CCode (cname = "animation_time")]
			public float animationTime;
			public AssetHandle renderable;
			public AssetHandle animation;
			public AssetHandle skeleton;
			public Assets.Frame pose;
			
			[CCode (cname = "animated_object_new")]
			public AnimatedObject();
			[CCode (cname = "animated_object_delete")]
			public void delete();
			[CCode (cname = "animated_object_load_skeleton")]
			public void loadSkeleton(AssetHandle ah);
			[CCode (cname = "animated_object_update")]
			public void update(float timestep);
		}

		[Compact, CCode (cname = "physics_object", cprefix="", free_function = "override_free")]
		public class PhysicsCObject {
			public Vector3 position;
			public Vector3 scale;
			public Quaternion rotation;
			public Vector3 velocity;
			[CCode (cname = "angular_velocity")]
			public Quaternion angularVelocity;
			public Vector3 acceleration;
			[CCode (cname = "angular_acceleration")]
			public Quaternion angularAcceleration;
			[CCode (cname = "previous_position")]
			public Vector3 previousPosition;
			public float elasticity;
			public float friction;
			public bool active;
			[CCode (cname = "recieve_shadows")]
			public bool recieveShadows;
			[CCode (cname = "cast_shadows")] 
			public bool castShadows;
			public AssetHandle renderable;
			//asset_hndl collision_body;

			[CCode (cname = "physics_object_new")]
			public PhysicsCObject();
			[CCode (cname = "physics_object_delete")]
			void delete();
			[CCode (cname = "physics_object_collide_static")]
			void collideStatic(StaticObject so, float timestep);
			[CCode (cname = "physics_object_update")]
			void update(float timestep);
		}

		
		[SimpleType, CCode (cname = "instance_data", cprefix="")]
		public class InstanceData {
			public Vector3 position;
			public Vector3 scale;
			public Quaternion rotation;
			public Matrix4 world;
			[CCode (cname = "world_normal")] 
			public Matrix3 worldNormal;
		}


		[Compact, CCode (cname = "instance_object", cprefix="", free_function = "override_free")]
		public class InstanceCObject {
			[CCode (cname = "num_instances")] 
			public int numInstances;
			[CCode (array_length = false)]
			public InstanceData[] instances;
			[CCode (cname = "world_buffer")] 
			public uint worldBuffer;
			public Sphere bound;
			public AssetHandle renderable;
			[CCode (cname = "collision_body")] 
			public AssetHandle collisionBody;
			
			[CCode (cname = "instance_object_new")]
			public InstanceCObject();
			[CCode (cname = "instance_object_delete")]
			public void delete();
			[CCode (cname = "instance_object_update")]
			public void update();
			[CCode (cname = "instance_object_add_instance")]
			public void addInstance(Vector3 position, Vector3 scale, Quaternion rotation);
			[CCode (cname = "instance_object_rem_instance")]
			public void remInstance(int i);
			[CCode (cname = "instance_object_world")]
			public Matrix4 world(int i);
			[CCode (cname = "instance_object_world_normal")]
			public Matrix3 worldNormal(int i);
		}	
	}

	namespace UI 
	{

		public enum TextAlign 
		{
			[CCode (cname = "TEXT_ALIGN_LEFT")]
			Left,
			[CCode (cname = "TEXT_ALIGN_RIGHT")]
			Right,
			[CCode (cname = "TEXT_ALIGN_CENTER")]
			Center,
			[CCode (cname = "TEXT_ALIGN_TOP")]
			Top,
			[CCode (cname = "TEXT_ALIGN_BOTTOM")]
			Bottom
		}

		[CCode (has_target = false)]
		public delegate void OnTextSelect(Text entry);
		[CCode (has_target = false)]
		public delegate void OnOptionSelect(Option entry);

		[Compact, CCode (cname = "ui_button", cprefix="", free_function = "override_free")]	
		public class Button {
			public Rectangle back;
			public Text label;
			[CCode (cname = "up_color")]
			public Vector4 upColor;
			[CCode (cname = "down_color")]
			public Vector4 downColor;
			public OnClick onclick;
			[CCode (cname = "onclick_data")]
			public IntPtr onclickData;
			public bool active;
			public bool enabled;
			public bool pressed;

			public static Button Create(string fmt, ...) {
				return (Button)(new UIElem(fmt, Entity.Register("ui_button", sizeof(Button))));
			} 

			[CCode (cname = "ui_button_new")]
			public Button (string fmt, ...);

			[CCode (cname = "ui_elem_get")]
			public static Button Get(string fmt);
			[CCode (cname = "ui_button_delete")]
			public void Delete();
			[CCode (cname = "ui_button_move")]
			public void Move(Vector2 pos);
			[CCode (cname = "ui_button_resize")]
			public void Resize(Vector2 size);
			[CCode (cname = "ui_button_set_label")]
			public void SetLabel(string label);
			[CCode (cname = "ui_button_set_label_color")]
			public void SetLabelColor(Vector4 color);
			[CCode (cname = "ui_button_set_font")]
			public void SetFont(AssetHandle f);
			[CCode (cname = "ui_button_set_onclick")]
			public void SetOnclick(OnClick onclick);
			[CCode (cname = "ui_button_set_onclick_data")]
			public void SetOnclickData(IntPtr data);
			[CCode (cname = "ui_button_set_active")]
			public void SetActive(bool active);
			[CCode (cname = "ui_button_set_enabled")]
			public void SetEnabled(bool enabled);
			[CCode (cname = "ui_button_set_texture")]
			public void SetTexture(AssetHandle tex, int width, int height, bool tile);
			[CCode (cname = "ui_button_disable")]
			public void Disable();
			[CCode (cname = "ui_button_enable")]
			public void Enable();
			[CCode (cname = "ui_button_position")]
			public Vector2 Position();
			[CCode (cname = "ui_button_size")]
			public Vector2 Size();
			[CCode (cname = "ui_button_event")]
			public void Event(Sdl.Event e);
			[CCode (cname = "ui_button_update")]
			public void Update();
			[CCode (cname = "ui_button_render")]
			public void Render();
			[CCode (cname = "ui_button_contains_point")]
			public bool ContainsPoint(Vector2 pos);
		}

		[CCode (cname = "ui_button_onclick", instance_pos = 0.1, has_target = false)]
		public delegate void OnClick(Button entry, IntPtr data);

		[Compact, CCode (cname = "ui_browser", cprefix="", free_function = "override_free")]
		public class Browser {
			public Rectangle outer;
			public Listbox inner;
			public URI directory;
			public bool active;

			[CCode (cname = "ui_browser_new")]
			public Browser();

			public static int type { get { return Entity.Register("ui_browser", sizeof(Browser)); } }
			public static Browser create(string fmt, ...) {
      			return (Browser)(new UIElem(fmt, type));
			} 
			[CCode (cname = "ui_browser_delete")]
			public void delete();
			[CCode (cname = "ui_browser_chdir")]
			public void chdir(URI dir);
			[CCode (cname = "ui_browser_event")]
			public void event(Sdl.Event e);
			[CCode (cname = "ui_browser_update")]
			public void update();
			[CCode (cname = "ui_browser_render")]
			public void render();
		}

		[Compact, CCode (cname = "ui_dialog", cprefix="", free_function = "override_free")]
		public class Dialog {
			public Button back;
			public Text title;
			public Text contents;
			[CCode (cname = "single_button")]
			public bool singleButton;
			public Button left;
			public Button right;

			[CCode (cname = "ui_dialog_new")]
			public Dialog();
			public static int type { get { return Entity.Register("ui_dialog", sizeof(Dialog)); } }
			public static Dialog create(string fmt, ...) {
				return (Dialog)(new UIElem(fmt, type));
			} 
			[CCode (cname = "ui_dialog_delete")]
			public void delete();
			[CCode (cname = "ui_dialog_set_single_button")]
			public void setSingleButton(bool single);
			[CCode (cname = "ui_dialog_set_title")]
			public void setTitle(string title);
			[CCode (cname = "ui_dialog_set_contents")]
			public void setContents(string contents);
			[CCode (cname = "ui_dialog_set_button_left")]
			public void setButtonLeft(string left, OnClick onleft);
			[CCode (cname = "ui_dialog_set_button_right")]
			public void setButtonRight(string right, OnClick onright);
			[CCode (cname = "ui_dialog_set_font")]
			public void setFont(AssetHandle fnt);
			[CCode (cname = "ui_dialog_event")]
			public void event(Sdl.Event e);
			[CCode (cname = "ui_dialog_update")]
			public void update();
			[CCode (cname = "ui_dialog_render")]
			public void render();
		}

		[Compact, CCode (cname = "ui_option", cprefix="", free_function = "override_free")]
		public class Option {
			public Button label;
			[CCode (cname = "num_options")]
			public int numOptions;
			[CCode (array_length = false)]
			public Button[] options;
			public bool active;
			public int selected;
			public OnOptionSelect onselect;

			[CCode (cname = "ui_option_new")]
			public Option();
			public static int type { get { return Entity.Register("ui_option", sizeof(Option)); } }
			public static Option create(string fmt, ...) {
				return (Option)(new UIElem(fmt, type));
			} 
			[CCode (cname = "ui_option_delete")]
			public void delete();
			[CCode (cname = "ui_option_set_active")]
			public void setActive(bool active);
			[CCode (cname = "ui_option_move")]
			public void move(Vector2 position);
			[CCode (cname = "ui_option_set_options", array_length = false)]
			public void setOptions(string label, int num, string[] values);
			[CCode (cname = "ui_option_get_selected")]
			public int  getSelected();
			[CCode (cname = "ui_option_set_selected")]
			public void setSelected(int selected);
			[CCode (cname = "ui_option_set_onselect")]
			public void setOnselect(OnOptionSelect onselect);
			[CCode (cname = "ui_option_deactivate")]
			public void deactivate();
			[CCode (cname = "ui_option_activate")]
			public void activate();
			[CCode (cname = "ui_option_event")]
			public void event(Sdl.Event e);
			[CCode (cname = "ui_option_update")]
			public void update();
			[CCode (cname = "ui_option_render")]
			public void render();
		}

		[Compact, CCode (cname = "ui_slider", cprefix="", free_function = "override_free")]
		public class Slider {
			public Button label;
			public Rectangle slot;
			public Rectangle bar;  
			public bool pressed;
			public bool active;
			public float amount;
			[CCode (cname = "ui_slider_new")]
			public Slider();
			public static int type { get { return Entity.Register("ui_slider", sizeof(Slider)); } }
			public static Slider create(string fmt, ...) {
				return (Slider)(new UIElem(fmt, type));
			} 
			[CCode (cname = "ui_slider_delete")]
			public void delete();
		}

		[Compact, CCode (cname = "ui_spinner", cprefix="", free_function = "override_free")]
		public class Spinner {
			[CCode (cname = "ui_spinner_new")]
			public Spinner();
			public static int type { get { return Entity.Register("ui_spinner", sizeof(Spinner)); } }
			public static Spinner create(string fmt, ...) {
				return (Spinner)(new UIElem(fmt, type));
			} 
			[CCode (cname = "ui_spinner_delete")]
			public void delete();
			[CCode (cname = "ui_spinner_set_label")]
			public void setLabel(string label);
			[CCode (cname = "ui_spinner_move")]
			public void move(Vector2 position);
			[CCode (cname = "ui_spinner_set_amount")]
			public void setAmount(float amount);
			[CCode (cname = "ui_spinner_get_amount")]
			public float getAmount();
			[CCode (cname = "ui_spinner_set_active")]
			public void setActive(bool active);
			[CCode (cname = "ui_spinner_deactivate")]
			public void deactivate();
			[CCode (cname = "ui_spinner_activate")]
			public void activate();
			[CCode (cname = "ui_spinner_event")]
			public void event(Sdl.Event e);
			[CCode (cname = "ui_spinner_update")]
			public void update();
			[CCode (cname = "ui_spinner_render")]
			public void render();
		}

		[Compact, CCode (cname = "ui_style", cprefix="", free_function = "override_free")]
		public class Style {
			/* Box */
			[CCode (cname = "box_back_image")]
			public URI boxBackImage;
			[CCode (cname = "box_back_width")]
			public int   boxBackWidth;
			[CCode (cname = "box_back_height")]
			public int   boxBackHeight;
			[CCode (cname = "box_back_tile")]
			public bool  boxBackTile;
			[CCode (cname = "box_back_border_size")]
			public int   boxBackBorderSize;
			[CCode (cname = "box_back_border_color")]
			public Vector4  boxBackBorderColor;
			[CCode (cname = "box_glitch")]
			public float boxGlitch;
			[CCode (cname = "box_blend_src")]
			public int   boxBlendSrc;
			[CCode (cname = "box_blend_dst")]
			public int   boxBlendDst;
			[CCode (cname = "box_text_color")]
			public Vector4 boxTextColor;
			[CCode (cname = "box_label_color")]
			public Vector4 boxLabelColor;
			[CCode (cname = "box_text_halign")]
			public int  boxTextHalign;
			[CCode (cname = "box_text_valign")]
			public int  boxTextValign;
			[CCode (cname = "box_up_color")]
			public Vector4 boxUpColor;
			[CCode (cname = "box_down_color")]
			public Vector4 boxDownColor;
			[CCode (cname = "box_inset_color")]
			public Vector4 boxInsetColor;
			/* Text  */
			[CCode (cname = "text_font")]
			public URI textFont;
			[CCode (cname = "text_color")]
			public Vector4  textColor;
			[CCode (cname = "text_scale")]
			public Vector2  textScale;
			/* Spinner */
			[CCode (cname = "spinner_image")]
			public URI spinnerImage;
			[CCode (cname = "spinner_speed")]
			public float spinnerSpeed;			
		}

		[Compact, CCode (cname = "ui_textbox", cprefix="", free_function = "override_free")]
		public class Textbox {
			public Rectangle outer;
			public Rectangle inner;
			public Text contents;
			public Text label;
			public bool password;
			[CCode (cname = "max_chars")]
			public int maxChars;
			public bool selected;
			public bool active;
			public bool enabled;			

			[CCode (cname = "ui_textbox_new")]
			public Textbox();
			public static int type { get { return Entity.Register("ui_textbox", sizeof(Textbox)); } }
			public static Textbox create(string fmt, ...) {
				return (Textbox)(new UIElem(fmt, type));
			} 
			[CCode (cname = "ui_textbox_delete")]
			public void delete();
			[CCode (cname = "ui_textbox_set_password")]
			public void setPassword(bool password);
			[CCode (cname = "ui_textbox_set_max_chars")]
			public void setMaxChars(int l);
			[CCode (cname = "ui_textbox_addchar")]
			public void addchar(char c);
			[CCode (cname = "ui_textbox_rmchar")]
			public void rmchar();
			[CCode (cname = "ui_textbox_move")]
			public void move(Vector2 pos);
			[CCode (cname = "ui_textbox_resize")]
			public void resize(Vector2 size);
			[CCode (cname = "ui_textbox_set_font")]
			public void setFont(AssetHandle f);
			[CCode (cname = "ui_textbox_set_label")]
			public void setLabel(string label);
			[CCode (cname = "ui_textbox_set_contents")]
			public void setContents(string label);
			[CCode (cname = "ui_textbox_set_alignment")]
			public void setAlignment(int halign, int valign);
			[CCode (cname = "ui_textbox_disable")]
			public void disable();
			[CCode (cname = "ui_textbox_enable")]
			public void enable();
			[CCode (cname = "ui_textbox_event")]
			public void event(Sdl.Event e);
			[CCode (cname = "ui_textbox_update")]
			public void update();
			[CCode (cname = "ui_textbox_render")]
			public void render();
			[CCode (cname = "ui_textbox_contains_point")]
			public bool containsPoint(Vector2 p);
		}

		[Compact, CCode (cname = "ui_toast", cprefix="", free_function = "override_free")]
		public class Toast {
			public Text label;  
			public float opacity;
			public bool active;

			[CCode (cname = "ui_toast_new")]
			public Toast();
			public static int type { get { return Entity.Register("ui_toast", sizeof(Toast)); } }
			public static Toast create(string fmt, ...) {
				return (Toast)(new UIElem(fmt, type));
			} 
			[CCode (cname = "ui_toast_delete")]
			public void delete();
			[CCode (cname = "ui_toast_popup")]
			public void popup(string fmt, ...);
			[CCode (cname = "ui_toast_set_label")]
			public void setLabel(string label);
			[CCode (cname = "ui_toast_set_font")]
			public void setFont(AssetHandle f);
			[CCode (cname = "ui_toast_event")]
			public void event(Sdl.Event e);
			[CCode (cname = "ui_toast_update")]
			public void update();
			[CCode (cname = "ui_toast_render")]
			public void render();
						
		}

		[Compact, CCode (cname = "ui_listbox", cprefix="", free_function = "override_free")]
		public class Listbox {
			public Rectangle back;
			public int scroll;  
			[CCode (cname = "num_items")]
			public int numItems;
			[CCode (array_length = false)]
			public Text[] items;
			public bool active;
			public OnTextSelect onselect;

			[CCode (cname = "ui_listbox_new")]
			public Listbox();
			public static int type { get { return Entity.Register("ui_listbox", sizeof(Listbox)); } }
			public static Listbox create(string fmt, ...) {
				return (Listbox)(new UIElem(fmt, type));
			} 
			[CCode (cname = "ui_listbox_delete")]
			public void delete();
			[CCode (cname = "ui_listbox_clear")]
			public void clear();
			[CCode (cname = "ui_listbox_add_item")]
			public Text addItem(string item);
			[CCode (cname = "ui_listbox_move")]
			public void move(Vector2 pos);
			[CCode (cname = "ui_listbox_resize")]
			public void resize(Vector2 size);
			[CCode (cname = "ui_listbox_event")]
			public void event(Sdl.Event e);
			[CCode (cname = "ui_listbox_update")]
			public void update();
			[CCode (cname = "ui_listbox_render")]
			public void render();
			[CCode (cname = "ui_listbox_set_onselect")]
			public void setOnselect(OnTextSelect onselect);
		}

		[Compact, CCode (cname = "ui_text", cprefix="", free_function = "override_free")]
		public class Text {
			[CCode (cname = "string")]
			public string text;
			[CCode (cname = "positions_buffer")]
			public uint positionsBuffer;
			[CCode (cname = "texcoords_buffer")]
			public uint texcoordsBuffer;
			[CCode (cname = "colors_buffer")]
			public uint colorsBuffer;
			[CCode (cname = "num_positions")]
			public int numPositions;
			[CCode (cname = "num_texcoords")]
			public int numTexcoords;
			[CCode (cname = "top_left")]
			public Vector2 topLeft;
			[CCode (cname = "bottom_right")]
			public Vector2 bottomRight;
			/* public */
			public AssetHandle font;  
			public Vector2 position;
			public Vector2 scale;
			public Vector4 color;
			public int halign;
			public int valign;
			[CCode (cname = "line_spacing")]
			public float lineSpacing;
			[CCode (cname = "char_spacing")]
			public float charSpacing;
			public float rotation;
			[CCode (cname = "line_length")]
			public float lineLength;
			public bool active;

			[CCode (cname = "ui_text_new")]
			public Text();
			public static int type { get { return Entity.Register("ui_text", sizeof(Text)); } }
			public static Text create(string fmt, ...) {
				return (Text)(new UIElem(fmt, type));
			} 
			[CCode (cname = "ui_text_new_string")]
			public static Text fromString(string str);
			[CCode (cname = "ui_text_delete")]
			public void delete();
			[CCode (cname = "ui_text_move")]
			public void move(Vector2 pos);
			[CCode (cname = "ui_text_set_font")]
			public void setFont(AssetHandle font);
			[CCode (cname = "ui_text_set_color")]
			public void setColor(Vector4 color);
			[CCode (cname = "ui_text_set_scale")]
			public void setScale(Vector2 scale);
			[CCode (cname = "ui_text_align")]
			public void align(int halign, int valign);
			[CCode (cname = "ui_text_draw")]
			public void draw();
			[CCode (cname = "ui_text_draw_string")]
			public void drawString(string str);
			[CCode (cname = "ui_text_event")]
			public void event(Sdl.Event e);
			[CCode (cname = "ui_text_update")]
			public void update();
			[CCode (cname = "ui_text_render")]
			public void render();
			[CCode (cname = "ui_text_contains_point")]
			public bool containsPoint(Vector2 position);
		}

		[Compact, CCode (cname = "ui_rectangle", cprefix="")]
		public class Rectangle {
			[CCode (cname = "top_left")]
			public Vector2 topLeft;
			[CCode (cname = "bottom_right")]
			public Vector2 bottomRight;
			public Vector4 color;
			public AssetHandle texture;
			[CCode (cname = "texture_width")]
			public int textureWidth;
			[CCode (cname = "texture_height")]
			public int textureHeight;
			[CCode (cname = "texture_tile")]
			public bool textureTile;
			[CCode (cname = "border_size")]
			public float borderSize;
			[CCode (cname = "border_color")]
			public Vector4 borderColor;
			public float glitch;
			public float time;
			[CCode (cname = "blend_src")]
			public int blendSrc;
			[CCode (cname = "blend_dst")]
			public int blendDst;
			public bool active;

			[CCode (cname = "ui_rectangle_new")]
			public Rectangle();
			public static int type { get { return Entity.Register("ui_rectangle", sizeof(Rectangle)); } }
			public static Rectangle create(string fmt, ...) {
				return (Rectangle)(new UIElem(fmt, type));
			} 
			[CCode (cname = "ui_rectangle_delete")]
			public void delete();
			[CCode (cname = "ui_rectangle_event")]
			public void event(Sdl.Event e);
			[CCode (cname = "ui_rectangle_update")]
			public void update();
			[CCode (cname = "ui_rectangle_render")]
			public void render();
			[CCode (cname = "ui_rectangle_move")]
			public void move(Vector2 pos);
			[CCode (cname = "ui_rectangle_resize")]
			public void resize(Vector2 size);
			[CCode (cname = "ui_rectangle_set_texture")]
			public void setTexture(AssetHandle tex, int width, int height, bool tile);
			[CCode (cname = "ui_rectangle_set_border")]
			public void setTorder(float size, Vector4 color);
			[CCode (cname = "ui_rectangle_set_color")]
			public void setColor(Vector4 color);
			[CCode (cname = "ui_rectangle_set_glitch")]
			public void setGlitch(float glitch);
			[CCode (cname = "ui_rectangle_center")]
			public Vector2 center();
			[CCode (cname = "ui_rectangle_contains_point")]
			public bool containsPoint(Vector2 pos);
			[CCode (cname = "ui_rectangle_blend")]
			public void blend(int blend_src, int blend_dst);
			[CCode (cname = "ui_rectangle_position")]
			public Vector2 position();
			[CCode (cname = "ui_rectangle_size")]
			public Vector2 size();
		}
	}
}
