/*
The MIT License (MIT)

Vector Math for ValaGame

Copyright (c) 2018 Bruce Davidspn <darkoverlordofdata@gmail.com>
Copyright (c) Recep Aslantas.

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

#if (__EMSCRIPTEN__) /** Use the right header for the platform */
[CCode (cprefix = "", lower_case_cprefix ="", cheader_filename="GLES3/gl3.h")]
#else
#endif
namespace GLES3
{
}
[Version (since = "0.4.9")] // cglm v0.4.9
[CCode (cprefix = "", lower_case_cprefix = "", cheader_filename = "glm.h")]
namespace Microsoft.Xna.Framework 
{
	/**
	 * Vector2
	 */
	[Compact, CCode (ref_function = "glm_vec2_ref", unref_function = "glm_vec2_unref")]
	public class Vector2 
	{ 
		public float X; // same as data[0]
		public float Y; // same as data[1]
		public float data[2];

		[CCode (cname = "glm_vec2_new")]
		public Vector2(float x = 0f, float y = 0f);
		[CCode (cname = "glm_vec2_print")]
		public void Print(GLib.FileStream ostream = GLib.stdout);
		[CCode (cname = "glm_vec2_hash")]
		public int GetHashCode();
		[CCode (cname = "glm_vec2_equals")]
		public bool Equals(Vector2 other);
		[CCode (cname = "glm_vec2_len2")]
		public float LengthSquared();
		[CCode (cname = "glm_vec2_len")]
		public float Length();

		public Vector2 Sub(Vector2 other)
		{
			glm_vec2_sub(this, other, this);
			return this;
		}

		public Vector2 Mul(Vector2 other)
		{
			glm_vec2_mul(this, other, this);
			return this;
		}

		public Vector2 Multiply(float f)
		{
			glm_vec2_scale(this, f, this);
			return this;
		}

		public Vector2 Normalize()
		{
			glm_vec2_normalize(this);
			return this;
		}

		public string to_string()
		{
			return @"{X:$X, Y:$Y}";
		}

	}
	
	/**
	 * Vector3
	 */
	[Compact, CCode (ref_function = "glm_vec3_ref", unref_function = "glm_vec3_unref")]
	public class Vector3 
	{ 
		public float X; // same as data[0]
		public float Y; // same as data[1]
		public float Z; // same as data[2]
		public float data[3];

		[CCode (cname = "glm_vec3_new")]
		public Vector3(float x = 0f, float y = 0f, float z = 0f);

		public Vector3.FromVector4(Vector4 value)
		{
			glm_vec3(value, this);
		}
		[CCode (cname = "glm_vec3_print")]
		public void Print(GLib.FileStream ostream = GLib.stdout);
		[CCode (cname = "glm_vec3_hash")]
		public int GetHashCode();
		[CCode (cname = "glm_vec3_equals")]
		public bool Equals(Vector3 other);

		public string to_string()
		{
			return @"{X:$X, Y:$Y, Z:$Z}";
		}

	}

	/**
	 * Vector4
	 */
	[Compact, CCode (ref_function = "glm_vec4_ref", unref_function = "glm_vec4_unref")]
	public class Vector4 
	{ 
		public float W; // same as data[0]
		public float X; // same as data[1]
		public float Y; // same as data[2]
		public float Z; // same as data[3]
		public float data[4];

		[CCode (cname = "glm_vec4_new")]
		public Vector4(float w = 0f, float x = 0f, float y = 0f, float z = 0f);

		public Vector4.FromVector3(Vector3 value, float last)
		{
			glm_vec4(value, last, this);
		}
		[CCode (cname = "glm_vec4_print")]
		public void Print(GLib.FileStream ostream = GLib.stdout);
	}

	/**
	 * Quaternion
	 */
	[Compact, CCode (ref_function = "glm_quat_ref", unref_function = "glm_quat_unref")]
	public class Quaternion 
	{ 
		public float W; // same as data[0]
		public float X; // same as data[1]
		public float Y; // same as data[2]
		public float Z; // same as data[3]
		public float data[4];

		[CCode (cname = "glm_quat_new")]
		public Quaternion();
		[CCode (cname = "glm_quat_print")]
		public void Print(GLib.FileStream ostream = GLib.stdout);
	}


	/**
	 * Matrix
	 */
	[Compact, CCode (ref_function = "glm_mat4_ref", unref_function = "glm_mat4_unref")]
	public class Matrix 
	{ 
		public float M11;
		public float M12;
		public float M13;
		public float M14;
		public float M21;
		public float M22;
		public float M23;
		public float M24;
		public float M31;
		public float M32;
		public float M33;
		public float M34;
		public float M41;
		public float M42;
		public float M43;
		public float M44;

		public float[] data[4];

		[CCode (cname = "glm_mat4_new")]
		public Matrix(float value = 1f);
		[CCode (cname = "glm_mat4_print")]
		public void Print(GLib.FileStream ostream = GLib.stdout);

		public Matrix Multiply(Matrix other)
		{
			glm_mat4_mul(this, other, this);
			return this;
		}
		public Matrix Invert()
		{
			glm_mat4_inv(this, this);
			return this;
		}
	}

	public void  glm_cross(Vector3 a, Vector3 b, Vector3 d);
	public float glm_dot(Vector3 a, Vector3 b);
	public void  glm_normalize(Vector3 v);
	public void  glm_normalize_to(Vector3 v, Vector3 dest);
	public int 	 glm_sign(int val);
	public float glm_signf(float val);
	public float glm_rad(float deg);
	public float glm_deg(float rad);
	public void  glm_make_rad(float* deg);
	public void  glm_make_deg(float* rad);
	public float glm_pow2(float X);
	public float glm_min(float a, float b);
	public float glm_max(float a, float b);
	public float glm_clamp(float val, float minVal, float maxVal);
	public float glm_clamp_to(float val);
	public float glm_lerp(float from, float to, float t);
	public bool  glm_eq(float a, float b);
	public float glm_percent(float from, float to, float current);
	public float glm_percentc(float from, float to, float current);
	public float glm_quatv(Quaternion q, float angle, Vector3 axis);
	public float glm_unprojecti(Vector3 pos, Matrix invMat, Vector4 vp, Vector3 dest);
	public float glm_unproject(Vector3 pos, Matrix m, Vector4 vp, Vector3 dest);
	public float glm_project(Vector3 pos, Matrix m, Vector4 vp, Vector3 dest);
	public void  glm_translate(Matrix m, Vector3 v);
	public void  glm_translate_to(Matrix m, Vector3 v, Matrix dest);
	public void  glm_translate_x(Matrix m, float x);
	public void  glm_translate_y(Matrix m, float y);
	public void  glm_translate_z(Matrix m, float z);
	public void  glm_translate_make(Matrix m, Vector3 v);
	public void  glm_scale_to(Matrix m, Vector3 v, Matrix dest);
	public void  glm_scale_make(Matrix m, Vector3 v);
	public void  glm_scale(Matrix m, Vector3 v);
	public void  glm_scale_uni(Matrix m, float s);
	public void  glm_rotate_x(Matrix m, float angle, Matrix dest);
	public void  glm_rotate_y(Matrix m, float angle, Matrix dest);
	public void  glm_rotate_z(Matrix m, float angle, Matrix dest);
	public void  glm_rotate_make(Matrix m, float angle, Vector3 axis);
	public void  glm_rotate(Matrix m, float angle, Vector3 axis);
	public void  glm_rotate_at(Matrix m, Vector3 pivot, float angle, Vector3 axis);
	public void  glm_rotate_atm(Matrix m, Vector3 pivot, float angle, Vector3 axis);
	public void  glm_decompose_scalev(float* m, float* s);
	public bool  glm_uniscaled(Matrix m, Vector3 s);
	public void  glm_decompose_rs(Matrix m, Matrix r, Vector3 s);	
	public void  glm_decompose(Matrix m, Matrix t, Matrix r, Vector3 s);
	public void  glm_perspective(float fovy, float aspect, float nearVal, float farVal, Matrix dest);
	public void  glm_lookat(Vector3 eye, Vector3 center, Vector3 up, Matrix dest);

	public void  glm_mat4_print(Matrix matrix, GLib.FileStream ostream);
	public void  glm_mat4_identity(Matrix mat);
	public void  glm_mat4_mul(Matrix m1, Matrix m2, Matrix dest);
	public void  glm_mat4_mulN(Matrix matrices, uint len, Matrix dest);
	public void  glm_mat4_mulv(Matrix m, Vector4 v, Vector4 dest);
	public void  glm_mat4_quat(Matrix m, Quaternion dest);
	public void  glm_mat4_mulv3(Matrix m, Vector3 v, float last, Vector3 dest);
	public void  glm_mat4_transpose_to(Matrix m, Matrix dest);
	public void  glm_mat4_transpose(Matrix m);
	public void  glm_mat4_scale_p(Matrix m, float s);
	public void  glm_mat4_scale(Matrix m, float s);
	public float glm_mat4_det(Matrix m);
	public void  glm_mat4_inv(Matrix mat, Matrix dest);
	public void  glm_mat4_inv_fast(Matrix mat, Matrix dest);
	public void  glm_mat4_swap_col(Matrix mat, int col1, int col2);
	public void  glm_mat4_swap_row(Matrix mat, int row1, int row2);


	public void  glm_quat(Quaternion q, float angle, float x, float y, float z);
	public void  glm_versor_print(Quaternion versor, GLib.FileStream ostream);
	public void  glm_quat_identity(Quaternion q);
	public void  glm_quat_identity_array(Quaternion q, size_t count);
	public void  glm_quat_init(Quaternion q, float x, float y, float z, float w);
	public float glm_quat_norm(Quaternion q);
	public void  glm_quat_normalize_to(Quaternion q, Quaternion dest);
	public void  glm_quat_normalize(Quaternion q);
	public float glm_quat_dot(Quaternion p, Quaternion q);
	public void  glm_quat_conjugate(Quaternion q, Quaternion dest);
	public void  glm_quat_inv(Quaternion q, Quaternion dest);
	public void  glm_quat_add(Quaternion p, Quaternion q, Quaternion dest);
	public void  glm_quat_sub(Quaternion p, Quaternion q, Quaternion dest);
	public float glm_quat_real(Quaternion q);
	public void  glm_quat_imag(Quaternion q, Vector3 dest);
	public void  glm_quat_imagn(Quaternion q, Vector3 dest);
	public float glm_quat_imagnlen(Quaternion q);
	public float glm_quat_angle(Quaternion q);
	public void  glm_quat_axis(Quaternion q, Quaternion dest);
	public void  glm_quat_mul(Quaternion p, Quaternion q, Quaternion dest);
	public void  glm_quat_mat4(Quaternion q, Matrix dest);
	public void  glm_quat_mat4t(Quaternion q, Matrix dest);
	public void  glm_quat_lerp(Quaternion from, Quaternion to, float t, Quaternion dest);
	public void  glm_quat_slerp(Quaternion from, Quaternion to, float t, Quaternion dest);
	public void  glm_quat_look(Quaternion eye, Quaternion ori, Quaternion dest);
	public void  glm_quat_for(Quaternion dir, Quaternion fwd, Quaternion up, Quaternion dest);
	public void  glm_quat_forp(Quaternion from, Quaternion to, Quaternion fwd, Quaternion up, Quaternion dest);
	public void  glm_quat_rotatev(Quaternion q, Quaternion v, Quaternion dest);
	public void  glm_quat_rotate(Matrix m, Quaternion q, Matrix dest);
	public void  glm_quat_rotate_at(Matrix m, Quaternion q, Vector3 pivot);
	public void  glm_quat_rotate_atm(Matrix m, Quaternion q, Vector3 pivot);

	public void  glm_vec2_sub(Vector2 a, Vector2 b, Vector2 dest);
	public void  glm_vec2_scale(Vector2 a, float f, Vector2 dest);
	public float glm_vec2_len(Vector2 a);
	public float glm_vec2_len2(Vector2 a);
	public void  glm_vec2_normalize(Vector2 a);
	public void  glm_vec2_mul(Vector2 a, Vector2 b, Vector2 dest);

	public void  glm_vec3(Vector4 v4, Vector3 dest);
	public void  glm_vec3_print(Vector3 vec, GLib.FileStream ostream);
	public void  glm_vec_copy(Vector3 src, Vector3 dest);
	public void  glm_vec_zero(Vector3 v);
	public void  glm_vec_one(Vector3 v);
	public float glm_vec_dot(Vector3 a, Vector3 b);
	public void  glm_vec_cross(Vector3 a, Vector3 b, Vector3 d);
	public float glm_vec_norm2(Vector3 v);
	public float glm_vec_norm(Vector3 v);
	public void  glm_vec_add(Vector3 a, Vector3 b, Vector3 dest);
	public void  glm_vec_adds(Vector3 v, float s, Vector3 dest);
	public void  glm_vec_sub(Vector3 a, Vector3 b, Vector3 dest);
	public void  glm_vec_subs(Vector3 v, float s, Vector3 dest);
	public void  glm_vec_mul(Vector3 a, Vector3 b, Vector3 dest);
	public void  glm_vec_scale(Vector3 v, float s, Vector3 dest);
	public void  glm_vec_scale_as(Vector3 v, float s, Vector3 dest);
	public void  glm_vec_div(Vector3 a, Vector3 b, Vector3 dest);
	public void  glm_vec_divs(Vector3 v, float s, Vector3 dest);
	public void  glm_vec_addadd(Vector3 a, Vector3 b, Vector3 dest);
	public void  glm_vec_subadd(Vector3 a, Vector3 b, Vector3 dest);
	public void  glm_vec_muladd(Vector3 a, Vector3 b, Vector3 dest);
	public void  glm_vec_muladds(Vector3 a, float s, Vector3 dest);
	public void  glm_vec_flipsign(Vector3 v);
	public void  glm_vec_flipsign_to(Vector3 v, Vector3 dest);
	public void  glm_vec_inv(Vector3 v);
	public void  glm_vec_normalize(Vector3 v);
	public void  glm_vec_normalize_to(Vector3 v, Vector3 dest);
	public float glm_vec_angle(Vector3 v1, Vector3 v2);
	public void  glm_vec_rotate(Vector3 v, float angle, Vector3 axis);
	public void  glm_vec_rotate_m4(Matrix m, float v, Vector3 dest);
	public void  glm_vec_proj(Vector3 a, Vector3 b, Vector3 dest);
	public void  glm_vec_center(Vector3 v1, Vector3 v2, Vector3 dest);
	public float glm_vec_distance2(Vector3 v1, Vector3 v2);
	public float glm_vec_distance(Vector3 v1, Vector3 v2);
	public void  glm_vec_maxv(Vector3 v1, Vector3 v2, Vector3 dest);
	public void  glm_vec_minv(Vector3 v1, Vector3 v2, Vector3 dest);
	public void  glm_vec_ortho(Vector3 v, Vector3 dest);
	public void  glm_vec_clamp(Vector3 v, float minVal, float maxVal);
	public void  glm_vec_mulv(Vector3 a, Vector3 b, Vector3 d);
	public void  glm_vec_broadcast(float val, Vector3 d);
	public bool  glm_vec_eq(Vector3 v, float val);
	public bool  glm_vec_eq_eps(Vector3 v, float val);
	public bool  glm_vec_eq_all(Vector3 v);
	public bool  glm_vec_eqv(Vector3 v1, Vector3 v2);
	public bool  glm_vec_eqv_eps(Vector3 v1, Vector3 v2);
	public float glm_vec_max(Vector3 v);
	public float glm_vec_min(Vector3 v);
	public bool  glm_vec_isnan(Vector3 v);
	public bool  glm_vec_isinf(Vector3 v);
	public bool  glm_vec_isvalid(Vector3 v);
	public void  glm_vec_sign(Vector3 v, Vector3 dest);
	public void  glm_vec_sqrt(Vector3 v, Vector3 dest);

	public void  glm_vec4(Vector3 v3, float last, Vector4 dest);
	public void  glm_vec4_print(Vector4 vec, GLib.FileStream ostream);
	public void  glm_vec4_copy3(Vector4 a, Vector3 dest);
	public void  glm_vec4_ucopy(Vector4 a, Vector4 dest);
	public void  glm_vec4_zero(Vector4 v);
	public void  glm_vec4_one(Vector4 v);
	public float glm_vec4_dot(Vector4 a, Vector4 b);
	public float glm_vec4_norm2(Vector4 v);
	public void  glm_vec4_norm(Vector4 v);
	public void  glm_vec4_add(Vector4 a, Vector4 b, Vector4 dest);
	public void  glm_vec4_adds(Vector4 v, float s, Vector4 dest);
	public void  glm_vec4_sub(Vector4 a, Vector4 b, Vector4 dest);
	public void  glm_vec4_subs(Vector4 v, float s, Vector4 dest);
	public void  glm_vec4_mul(Vector4 a, Vector4 b, Vector4 dest);
	public void  glm_vec4_scale(Vector4 v, float s, Vector4 dest);
	public void  glm_vec4_scale_as(Vector4 v, float s, Vector4 dest);
	public void  glm_vec4_div(Vector4 a, Vector4 b, Vector4 dest);
	public void  glm_vec4_divs(Vector4 v, float s, Vector4 dest);
	public void  glm_vec4_addadd(Vector4 a, Vector4 b, Vector4 dest);
	public void  glm_vec4_subadd(Vector4 a, Vector4 b, Vector4 dest);
	public void  glm_vec4_muladd(Vector4 a, Vector4 b, Vector4 dest);
	public void  glm_vec4_muladds(Vector4 v, float s, Vector4 dest);
	public void  glm_vec4_flipsign(Vector4 v);
	public void  glm_vec4_flipsign_to(Vector4 v, Vector4 dest);
	public void  glm_vec4_inv(Vector4 v);
	public void  glm_vec4_inv_to(Vector4 v, Vector4 dest);
	public void  glm_vec4_normalize_to(Vector4 vec, Vector4 dest);
	public void  glm_vec4_normalize(Vector4 v);
	public float glm_vec4_distance(Vector4 v1, Vector4 v2);
	public void  glm_vec4_maxv(Vector4 v1, Vector4 v2, Vector4 dest);
	public void  glm_vec4_minv(Vector4 v1, Vector4 v2, Vector4 dest);
	public void  glm_vec4_clamp(Vector4 v, float minVal, float maxVal);
	public void  glm_vec4_lerp(Vector4 from, Vector4 to, float t, Vector4 dest);
	public void  glm_vec4_broadcast(float val, Vector4 d);
	public bool  glm_vec4_eq(Vector4 v, float val);
	public bool  glm_vec4_eq_eps(Vector4 v, float val);
	public bool  glm_vec4_eq_all(Vector4 v);
	public bool  glm_vec4_eqv(Vector4 v1, Vector4 v2);
	public bool  glm_vec4_eqv_eps(Vector4 v1, Vector4 v2);
	public float glm_vec4_max(Vector4 v);
	public float glm_vec4_min(Vector4 v);
	public bool  glm_vec4_isnan(Vector4 v);
	public bool  glm_vec4_isinf(Vector4 v);
	public bool  glm_vec4_isvalid(Vector4 v);
	public void  glm_vec4_sign(Vector4 v, Vector4 dest);
	public void  glm_vec4_sqrt(Vector4 v, Vector4 dest);

	//------------------------------------------------------------------
	[CCode (cname = "glm_translate")]
	public void  glm_translatef(Matrix m, 
		[CCode (array_length = false)]float[] v);

	[CCode (cname = "glm_rotate")]
	public void  glm_rotatef(Matrix m, float angle, 
		[CCode (array_length = false)]float[] axis);


	[CCode (cname = "glm_vec_copy")]
	public void  glm_vec_copyf(float* src, Vector3 dest);

	
}
