/*
The MIT License (MIT)

Copyright (c) <2018> <xna.framework vapi>

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

/* gl.vapi
 *
 * Copyright (C) 2008  Matias De la Puente
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.

 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.

 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301  USA
 *
 * Author:
 * 	Matias De la Puente <mfpuente.ar@gmail.com>
 */
[CCode (cprefix = "", lower_case_cprefix = "", cheader_filename="SDL2/SDL_opengl.h,SDL2/SDL_local.h")]
namespace GL
{

	[CCode (cname="GLenu")]
	public struct GLenu : uint { }
	[CCode (cname="GLboolean")]
	public struct GLboolean : bool { }
	[CCode (cname="GLbitfield")]
	public struct GLbitfield : uint { }
	[CCode (cname="GLvoid")]
	public struct GLvoid { }
	[CCode (cname="GLbyte")]
	public struct GLbyte : char { }
	[CCode (cname="GLshort")]
	public struct GLshort : short { }
	[CCode (cname="GLint")]
	public struct GLint : int { }
	[CCode (cname="GLubyte")]
	public struct GLubyte : uchar { }
	[CCode (cname="GLushort")]
	public struct GLushort : ushort { }
	[CCode (cname="GLuint")]
	public struct GLuint : uint { }
	[CCode (cname="GLsizei")]
	public struct GLsizei : int { }
	[CCode (cname="GLfloat")]
	[FloatingType (rank = 1)]
	public struct GLfloat : float { }
	[CCode (cname="GLclampf")]
	[FloatingType (rank = 1)]
	public struct GLclampf : float { }
	[CCode (cname="GLdouble")]
	[FloatingType (rank = 2)]
	public struct GLdouble : double { }
	[CCode (cname="GLclampd")]
	[FloatingType (rank = 2)]
	public struct GLclampd : double { }
	
	
	// Data Types
	public const GLenu GL_BYTE;
	public const GLenu GL_UNSIGNED_BYTE;
	public const GLenu GL_SHORT;
	public const GLenu GL_UNSIGNED_SHORT;
	public const GLenu GL_INT;
	public const GLenu GL_UNSIGNED_INT;
	public const GLenu GL_FLOAT;
	public const GLenu GL_2_BYTES;
	public const GLenu GL_3_BYTES;
	public const GLenu GL_4_BYTES;
	public const GLenu GL_DOUBLE;
	
	// Primitives
	public const GLenu GL_POINTS;
	public const GLenu GL_LINES;
	public const GLenu GL_LINE_LOOP;
	public const GLenu GL_LINE_STRIP;
	public const GLenu GL_TRIANGLES;
	public const GLenu GL_TRIANGLE_STRIP;
	public const GLenu GL_TRIANGLE_FAN;
	public const GLenu GL_QUADS;
	public const GLenu GL_QUAD_STRIP;
	public const GLenu GL_POLYGON;
	
	// Vertex Arrays
	public const GLenu GL_VERTEX_ARRAY;
	public const GLenu GL_NORMAL_ARRAY;
	public const GLenu GL_COLOR_ARRAY;
	public const GLenu GL_INDEX_ARRAY;
	public const GLenu GL_TEXTURE_COORD_ARRAY;
	public const GLenu GL_EDGE_FLAG_ARRAY;
	public const GLenu GL_VERTEX_ARRAY_SIZE;
	public const GLenu GL_VERTEX_ARRAY_TYPE;
	public const GLenu GL_VERTEX_ARRAY_STRIDE;
	public const GLenu GL_NORMAL_ARRAY_TYPE;
	public const GLenu GL_NORMAL_ARRAY_STRIDE;
	public const GLenu GL_COLOR_ARRAY_SIZE;
	public const GLenu GL_COLOR_ARRAY_TYPE;
	public const GLenu GL_COLOR_ARRAY_STRIDE;
	public const GLenu GL_INDEX_ARRAY_TYPE;
	public const GLenu GL_INDEX_ARRAY_STRIDE;
	public const GLenu GL_TEXTURE_COORD_ARRAY_SIZE;
	public const GLenu GL_TEXTURE_COORD_ARRAY_TYPE;
	public const GLenu GL_TEXTURE_COORD_ARRAY_STRIDE;
	public const GLenu GL_EDGE_FLAG_ARRAY_STRIDE;
	public const GLenu GL_VERTEX_ARRAY_POINTER;
	public const GLenu GL_NORMAL_ARRAY_POINTER;
	public const GLenu GL_COLOR_ARRAY_POINTER;
	public const GLenu GL_INDEX_ARRAY_POINTER;
	public const GLenu GL_TEXTURE_COORD_ARRAY_POINTER;
	public const GLenu GL_EDGE_FLAG_ARRAY_POINTER;
	public const GLenu GL_V2F;
	public const GLenu GL_V3F;
	public const GLenu GL_C4UB_V2F;
	public const GLenu GL_C4UB_V3F;
	public const GLenu GL_C3F_V3F;
	public const GLenu GL_N3F_V3F;
	public const GLenu GL_C4F_N3F_V3F;
	public const GLenu GL_T2F_V3F;
	public const GLenu GL_T4F_V4F;
	public const GLenu GL_T2F_C4UB_V3F;
	public const GLenu GL_T2F_C3F_V3F;
	public const GLenu GL_T2F_N3F_V3F;
	public const GLenu GL_T2F_C4F_N3F_V3F;
	public const GLenu GL_T4F_C4F_N3F_V4F;
	
	// Matrix Mode
	public const GLenu GL_MATRIX_MODE;
	public const GLenu GL_MODELVIEW;
	public const GLenu GL_PROJECTION;
	public const GLenu GL_TEXTURE;
	
	// Points
	public const GLenu GL_POINT_SMOOTH;
	public const GLenu GL_POINT_SIZE;
	public const GLenu GL_POINT_SIZE_GRANULARITY;
	public const GLenu GL_POINT_SIZE_RANGE;
	
	// Lines
	public const GLenu GL_LINE_SMOOTH;
	public const GLenu GL_LINE_STIPPLE;
	public const GLenu GL_LINE_STIPPLE_PATTERN;
	public const GLenu GL_LINE_STIPPLE_REPEAT;
	public const GLenu GL_LINE_WIDTH;
	public const GLenu GL_LINE_WIDTH_GRANULARITY;
	public const GLenu GL_LINE_WIDTH_RANGE;
	
	// Polygons
	public const GLenu GL_POINT;
	public const GLenu GL_LINE;
	public const GLenu GL_FILL;
	public const GLenu GL_CW;
	public const GLenu GL_CCW;
	public const GLenu GL_FRONT;
	public const GLenu GL_BACK;
	public const GLenu GL_POLYGON_MODE;
	public const GLenu GL_POLYGON_SMOOTH;
	public const GLenu GL_POLYGON_STIPPLE;
	public const GLenu GL_EDGE_FLAG;
	public const GLenu GL_CULL_FACE;
	public const GLenu GL_CULL_FACE_MODE;
	public const GLenu GL_FRONT_FACE;
	public const GLenu GL_POLYGON_OFFSET_FACTOR;
	public const GLenu GL_POLYGON_OFFSET_UNITS;
	public const GLenu GL_POLYGON_OFFSET_POINT;
	public const GLenu GL_POLYGON_OFFSET_LINE;
	public const GLenu GL_POLYGON_OFFSET_FILL;
	
	// Display Lists
	public const GLenu GL_COMPILE;
	public const GLenu GL_COMPILE_AND_EXECUTE;
	public const GLenu GL_LIST_BASE;
	public const GLenu GL_LIST_INDEX;
	public const GLenu GL_LIST_MODE;
	
	// Depth Buffer
	public const GLenu GL_NEVER;
	public const GLenu GL_LESS;
	public const GLenu GL_EQUAL;
	public const GLenu GL_LEQUAL;
	public const GLenu GL_GREATER;
	public const GLenu GL_NOTEQUAL;
	public const GLenu GL_GEQUAL;
	public const GLenu GL_ALWAYS;
	public const GLenu GL_DEPTH_TEST;
	public const GLenu GL_DEPTH_BITS;
	public const GLenu GL_DEPTH_CLEAR_VALUE;
	public const GLenu GL_DEPTH_FUNC;
	public const GLenu GL_DEPTH_RANGE;
	public const GLenu GL_DEPTH_WRITEMASK;
	public const GLenu GL_DEPTH_COMPONENT;
	
	// Lighting
	public const GLenu GL_LIGHTING;
	public const GLenu GL_LIGHT0;
	public const GLenu GL_LIGHT1;
	public const GLenu GL_LIGHT2;
	public const GLenu GL_LIGHT3;
	public const GLenu GL_LIGHT4;
	public const GLenu GL_LIGHT5;
	public const GLenu GL_LIGHT6;
	public const GLenu GL_LIGHT7;
	public const GLenu GL_SPOT_EXPONENT;
	public const GLenu GL_SPOT_CUTOFF;
	public const GLenu GL_CONSTANT_ATTENUATION;
	public const GLenu GL_LINEAR_ATTENUATION;
	public const GLenu GL_QUADRATIC_ATTENUATION;
	public const GLenu GL_AMBIENT;
	public const GLenu GL_DIFFUSE;
	public const GLenu GL_SPECULAR;
	public const GLenu GL_SHININESS;
	public const GLenu GL_EMISSION;
	public const GLenu GL_POSITION;
	public const GLenu GL_SPOT_DIRECTION;
	public const GLenu GL_AMBIENT_AND_DIFFUSE;
	public const GLenu GL_COLOR_INDEXES;
	public const GLenu GL_LIGHT_MODEL_TWO_SIDE;
	public const GLenu GL_LIGHT_MODEL_LOCAL_VIEWER;
	public const GLenu GL_LIGHT_MODEL_AMBIENT;
	public const GLenu GL_FRONT_AND_BACK;
	public const GLenu GL_SHADE_MODEL;
	public const GLenu GL_FLAT;
	public const GLenu GL_SMOOTH;
	public const GLenu GL_COLOR_MATERIAL;
	public const GLenu GL_COLOR_MATERIAL_FACE;
	public const GLenu GL_COLOR_MATERIAL_PARAMETER;
	public const GLenu GL_NORMALIZE;
	
	// User Clipping Planes
	public const GLenu GL_CLIP_PLANE0;
	public const GLenu GL_CLIP_PLANE1;
	public const GLenu GL_CLIP_PLANE2;
	public const GLenu GL_CLIP_PLANE3;
	public const GLenu GL_CLIP_PLANE4;
	public const GLenu GL_CLIP_PLANE5;
	
	// Accumulation Buffer
	public const GLenu GL_ACCUM_RED_BITS;
	public const GLenu GL_ACCUM_GREEN_BITS;
	public const GLenu GL_ACCUM_BLUE_BITS;
	public const GLenu GL_ACCUM_ALPHA_BITS;
	public const GLenu GL_ACCUM_CLEAR_VALUE;
	public const GLenu GL_ACCUM;
	public const GLenu GL_ADD;
	public const GLenu GL_LOAD;
	public const GLenu GL_MULT;
	public const GLenu GL_RETURN;
	
	// Alpha Testing
	public const GLenu GL_ALPHA_TEST;
	public const GLenu GL_ALPHA_TEST_REF;
	public const GLenu GL_ALPHA_TEST_FUNC;
	
	// Blending
	public const GLenu GL_BLEND;
	public const GLenu GL_BLEND_SRC;
	public const GLenu GL_BLEND_DST;
	public const GLenu GL_ZERO;
	public const GLenu GL_ONE;
	public const GLenu GL_SRC_COLOR;
	public const GLenu GL_ONE_MINUS_SRC_COLOR;
	public const GLenu GL_SRC_ALPHA;
	public const GLenu GL_ONE_MINUS_SRC_ALPHA;
	public const GLenu GL_DST_ALPHA;
	public const GLenu GL_ONE_MINUS_DST_ALPHA;
	public const GLenu GL_DST_COLOR;
	public const GLenu GL_ONE_MINUS_DST_COLOR;
	public const GLenu GL_SRC_ALPHA_SATURATE;
	
	// Render Mode
	public const GLenu GL_FEEDBACK;
	public const GLenu GL_RENDER;
	public const GLenu GL_SELECT;
	
	// Feedback
	public const GLenu GL_2D;
	public const GLenu GL_3D;
	public const GLenu GL_3D_COLOR;
	public const GLenu GL_3D_COLOR_TEXTURE;
	public const GLenu GL_4D_COLOR_TEXTURE;
	public const GLenu GL_POINT_TOKEN;
	public const GLenu GL_LINE_TOKEN;
	public const GLenu GL_LINE_RESET_TOKEN;
	public const GLenu GL_POLYGON_TOKEN;
	public const GLenu GL_BITMAP_TOKEN;
	public const GLenu GL_DRAW_PIXEL_TOKEN;
	public const GLenu GL_COPY_PIXEL_TOKEN;
	public const GLenu GL_PASS_THROUGH_TOKEN;
	public const GLenu GL_FEEDBACK_BUFFER_POINTER;
	public const GLenu GL_FEEDBACK_BUFFER_SIZE;
	public const GLenu GL_FEEDBACK_BUFFER_TYPE;
	
	// Selection Buffer
	public const GLenu GL_SELECTION_BUFFER_POINTER;
	public const GLenu GL_SELECTION_BUFFER_SIZE;
	
	// Fog
	public const GLenu GL_FOG;
	public const GLenu GL_FOG_MODE;
	public const GLenu GL_FOG_DENSITY;
	public const GLenu GL_FOG_COLOR;
	public const GLenu GL_FOG_INDEX;
	public const GLenu GL_FOG_START;
	public const GLenu GL_FOG_END;
	public const GLenu GL_LINEAR;
	public const GLenu GL_EXP;
	public const GLenu GL_EXP2;
	
	// Logic Ops
	public const GLenu GL_LOGIC_OP;
	public const GLenu GL_INDEX_LOGIC_OP;
	public const GLenu GL_COLOR_LOGIC_OP;
	public const GLenu GL_LOGIC_OP_MODE;
	public const GLenu GL_CLEAR;
	public const GLenu GL_SET;
	public const GLenu GL_COPY;
	public const GLenu GL_COPY_INVERTED;
	public const GLenu GL_NOOP;
	public const GLenu GL_INVERT;
	public const GLenu GL_AND;
	public const GLenu GL_NAND;
	public const GLenu GL_OR;
	public const GLenu GL_NOR;
	public const GLenu GL_XOR;
	public const GLenu GL_EQUIV;
	public const GLenu GL_AND_REVERSE;
	public const GLenu GL_AND_INVERTED;
	public const GLenu GL_OR_REVERSE;
	public const GLenu GL_OR_INVERTED;
	
	// Stencil
	public const GLenu GL_STENCIL_BITS;
	public const GLenu GL_STENCIL_TEST;
	public const GLenu GL_STENCIL_CLEAR_VALUE;
	public const GLenu GL_STENCIL_FUNC;
	public const GLenu GL_STENCIL_VALUE_MASK;
	public const GLenu GL_STENCIL_FAIL;
	public const GLenu GL_STENCIL_PASS_DEPTH_FAIL;
	public const GLenu GL_STENCIL_PASS_DEPTH_PASS;
	public const GLenu GL_STENCIL_REF;
	public const GLenu GL_STENCIL_WRITEMASK;
	public const GLenu GL_STENCIL_INDEX;
	public const GLenu GL_KEEP;
	public const GLenu GL_REPLACE;
	public const GLenu GL_INCR;
	public const GLenu GL_DECR;
	
	// Buffers, Pixel Drawing/Reading
	public const GLenu GL_NONE;
	public const GLenu GL_LEFT;
	public const GLenu GL_RIGHT;
	public const GLenu GL_FRONT_LEFT;
	public const GLenu GL_FRONT_RIGHT;
	public const GLenu GL_BACK_LEFT;
	public const GLenu GL_BACK_RIGHT;
	public const GLenu GL_AUX0;
	public const GLenu GL_AUX1;
	public const GLenu GL_AUX2;
	public const GLenu GL_AUX3;
	public const GLenu GL_COLOR_INDEX;
	public const GLenu GL_RED;
	public const GLenu GL_GREEN;
	public const GLenu GL_BLUE;
	public const GLenu GL_ALPHA;
	public const GLenu GL_LUMINANCE;
	public const GLenu GL_LUMINANCE_ALPHA;
	public const GLenu GL_ALPHA_BITS;
	public const GLenu GL_RED_BITS;
	public const GLenu GL_GREEN_BITS;
	public const GLenu GL_BLUE_BITS;
	public const GLenu GL_INDEX_BITS;
	public const GLenu GL_SUBPIXEL_BITS;
	public const GLenu GL_AUX_BUFFERS;
	public const GLenu GL_READ_BUFFER;
	public const GLenu GL_DRAW_BUFFER;
	public const GLenu GL_DOUBLEBUFFER;
	public const GLenu GL_STEREO;
	public const GLenu GL_BITMAP;
	public const GLenu GL_COLOR;
	public const GLenu GL_DEPTH;
	public const GLenu GL_STENCIL;
	public const GLenu GL_DITHER;
	public const GLenu GL_RGB;
	public const GLenu GL_RGBA;
	
	// Implementation Limits
	public const GLenu GL_MAX_LIST_NESTING;
	public const GLenu GL_MAX_EVAL_ORDER;
	public const GLenu GL_MAX_LIGHTS;
	public const GLenu GL_MAX_CLIP_PLANES;
	public const GLenu GL_MAX_TEXTURE_SIZE;
	public const GLenu GL_MAX_PIXEL_MAP_TABLE;
	public const GLenu GL_MAX_ATTRIB_STACK_DEPTH;
	public const GLenu GL_MAX_MODELVIEW_STACK_DEPTH;
	public const GLenu GL_MAX_NAME_STACK_DEPTH;
	public const GLenu GL_MAX_PROJECTION_STACK_DEPTH;
	public const GLenu GL_MAX_TEXTURE_STACK_DEPTH;
	public const GLenu GL_MAX_VIEWPORT_DIMS;
	public const GLenu GL_MAX_CLIENT_ATTRIB_STACK_DEPTH;
	
	// Gets
	public const GLenu GL_ATTRIB_STACK_DEPTH;
	public const GLenu GL_CLIENT_ATTRIB_STACK_DEPTH;
	public const GLenu GL_COLOR_CLEAR_VALUE;
	public const GLenu GL_COLOR_WRITEMASK;
	public const GLenu GL_CURRENT_INDEX;
	public const GLenu GL_CURRENT_COLOR;
	public const GLenu GL_CURRENT_NORMAL;
	public const GLenu GL_CURRENT_RASTER_COLOR;
	public const GLenu GL_CURRENT_RASTER_DISTANCE;
	public const GLenu GL_CURRENT_RASTER_INDEX;
	public const GLenu GL_CURRENT_RASTER_POSITION;
	public const GLenu GL_CURRENT_RASTER_TEXTURE_COORDS;
	public const GLenu GL_CURRENT_RASTER_POSITION_VALID;
	public const GLenu GL_CURRENT_TEXTURE_COORDS;
	public const GLenu GL_INDEX_CLEAR_VALUE;
	public const GLenu GL_INDEX_MODE;
	public const GLenu GL_INDEX_WRITEMASK;
	public const GLenu GL_MODELVIEW_MATRIX;
	public const GLenu GL_MODELVIEW_STACK_DEPTH;
	public const GLenu GL_NAME_STACK_DEPTH;
	public const GLenu GL_PROJECTION_MATRIX;
	public const GLenu GL_PROJECTION_STACK_DEPTH;
	public const GLenu GL_RENDER_MODE;
	public const GLenu GL_RGBA_MODE;
	public const GLenu GL_TEXTURE_MATRIX;
	public const GLenu GL_TEXTURE_STACK_DEPTH;
	public const GLenu GL_VIEWPORT;
	
	// Evaluators
	public const GLenu GL_AUTO_NORMAL;
	public const GLenu GL_MAP1_COLOR_4;
	public const GLenu GL_MAP1_INDEX;
	public const GLenu GL_MAP1_NORMAL;
	public const GLenu GL_MAP1_TEXTURE_COORD_1;
	public const GLenu GL_MAP1_TEXTURE_COORD_2;
	public const GLenu GL_MAP1_TEXTURE_COORD_3;
	public const GLenu GL_MAP1_TEXTURE_COORD_4;
	public const GLenu GL_MAP1_VERTEX_3;
	public const GLenu GL_MAP1_VERTEX_4;
	public const GLenu GL_MAP2_COLOR_4;
	public const GLenu GL_MAP2_INDEX;
	public const GLenu GL_MAP2_NORMAL;
	public const GLenu GL_MAP2_TEXTURE_COORD_1;
	public const GLenu GL_MAP2_TEXTURE_COORD_2;
	public const GLenu GL_MAP2_TEXTURE_COORD_3;
	public const GLenu GL_MAP2_TEXTURE_COORD_4;
	public const GLenu GL_MAP2_VERTEX_3;
	public const GLenu GL_MAP2_VERTEX_4;
	public const GLenu GL_MAP1_GRID_DOMAIN;
	public const GLenu GL_MAP1_GRID_SEGMENTS;
	public const GLenu GL_MAP2_GRID_DOMAIN;
	public const GLenu GL_MAP2_GRID_SEGMENTS;
	public const GLenu GL_COEFF;
	public const GLenu GL_ORDER;
	public const GLenu GL_DOMAIN;
	
	// Hints
	public const GLenu GL_PERSPECTIVE_CORRECTION_HINT;
	public const GLenu GL_POINT_SMOOTH_HINT;
	public const GLenu GL_LINE_SMOOTH_HINT;
	public const GLenu GL_POLYGON_SMOOTH_HINT;
	public const GLenu GL_FOG_HINT;
	public const GLenu GL_DONT_CARE;
	public const GLenu GL_FASTEST;
	public const GLenu GL_NICEST;
	
	// Scissor box
	public const GLenu GL_SCISSOR_BOX;
	public const GLenu GL_SCISSOR_TEST;
	
	// Pixel Mode / Transfer
	public const GLenu GL_MAP_COLOR;
	public const GLenu GL_MAP_STENCIL;
	public const GLenu GL_INDEX_SHIFT;
	public const GLenu GL_INDEX_OFFSET;
	public const GLenu GL_RED_SCALE;
	public const GLenu GL_RED_BIAS;
	public const GLenu GL_GREEN_SCALE;
	public const GLenu GL_GREEN_BIAS;
	public const GLenu GL_BLUE_SCALE;
	public const GLenu GL_BLUE_BIAS;
	public const GLenu GL_ALPHA_SCALE;
	public const GLenu GL_ALPHA_BIAS;
	public const GLenu GL_DEPTH_SCALE;
	public const GLenu GL_DEPTH_BIAS;
	public const GLenu GL_PIXEL_MAP_S_TO_S_SIZE;
	public const GLenu GL_PIXEL_MAP_I_TO_I_SIZE;
	public const GLenu GL_PIXEL_MAP_I_TO_R_SIZE;
	public const GLenu GL_PIXEL_MAP_I_TO_G_SIZE;
	public const GLenu GL_PIXEL_MAP_I_TO_B_SIZE;
	public const GLenu GL_PIXEL_MAP_I_TO_A_SIZE;
	public const GLenu GL_PIXEL_MAP_R_TO_R_SIZE;
	public const GLenu GL_PIXEL_MAP_G_TO_G_SIZE;
	public const GLenu GL_PIXEL_MAP_B_TO_B_SIZE;
	public const GLenu GL_PIXEL_MAP_A_TO_A_SIZE;
	public const GLenu GL_PIXEL_MAP_S_TO_S;
	public const GLenu GL_PIXEL_MAP_I_TO_I;
	public const GLenu GL_PIXEL_MAP_I_TO_R;
	public const GLenu GL_PIXEL_MAP_I_TO_G;
	public const GLenu GL_PIXEL_MAP_I_TO_B;
	public const GLenu GL_PIXEL_MAP_I_TO_A;
	public const GLenu GL_PIXEL_MAP_R_TO_R;
	public const GLenu GL_PIXEL_MAP_G_TO_G;
	public const GLenu GL_PIXEL_MAP_B_TO_B;
	public const GLenu GL_PIXEL_MAP_A_TO_A;
	public const GLenu GL_PACK_ALIGNMENT;
	public const GLenu GL_PACK_LSB_FIRST;
	public const GLenu GL_PACK_ROW_LENGTH;
	public const GLenu GL_PACK_SKIP_PIXELS;
	public const GLenu GL_PACK_SKIP_ROWS;
	public const GLenu GL_PACK_SWAP_BYTES;
	public const GLenu GL_UNPACK_ALIGNMENT;
	public const GLenu GL_UNPACK_LSB_FIRST;
	public const GLenu GL_UNPACK_ROW_LENGTH;
	public const GLenu GL_UNPACK_SKIP_PIXELS;
	public const GLenu GL_UNPACK_SKIP_ROWS;
	public const GLenu GL_UNPACK_SWAP_BYTES;
	public const GLenu GL_ZOOM_X;
	public const GLenu GL_ZOOM_Y;
	
	// Texture Mapping
	public const GLenu GL_TEXTURE_ENV;
	public const GLenu GL_TEXTURE_ENV_MODE;
	public const GLenu GL_TEXTURE_1D;
	public const GLenu GL_TEXTURE_2D;
	public const GLenu GL_TEXTURE_WRAP_S;
	public const GLenu GL_TEXTURE_WRAP_T;
	public const GLenu GL_TEXTURE_MAG_FILTER;
	public const GLenu GL_TEXTURE_MIN_FILTER;
	public const GLenu GL_TEXTURE_ENV_COLOR;
	public const GLenu GL_TEXTURE_GEN_S;
	public const GLenu GL_TEXTURE_GEN_T;
	public const GLenu GL_TEXTURE_GEN_MODE;
	public const GLenu GL_TEXTURE_BORDER_COLOR;
	public const GLenu GL_TEXTURE_WIDTH;
	public const GLenu GL_TEXTURE_HEIGHT;
	public const GLenu GL_TEXTURE_BORDER;
	public const GLenu GL_TEXTURE_COMPONENTS;
	public const GLenu GL_TEXTURE_RED_SIZE;
	public const GLenu GL_TEXTURE_GREEN_SIZE;
	public const GLenu GL_TEXTURE_BLUE_SIZE;
	public const GLenu GL_TEXTURE_ALPHA_SIZE;
	public const GLenu GL_TEXTURE_LUMINANCE_SIZE;
	public const GLenu GL_TEXTURE_INTENSITY_SIZE;
	public const GLenu GL_NEAREST_MIPMAP_NEAREST;
	public const GLenu GL_NEAREST_MIPMAP_LINEAR;
	public const GLenu GL_LINEAR_MIPMAP_NEAREST;
	public const GLenu GL_LINEAR_MIPMAP_LINEAR;
	public const GLenu GL_OBJECT_LINEAR;
	public const GLenu GL_OBJECT_PLANE;
	public const GLenu GL_EYE_LINEAR;
	public const GLenu GL_EYE_PLANE;
	public const GLenu GL_SPHERE_MAP;
	public const GLenu GL_DECAL;
	public const GLenu GL_MODULATE;
	public const GLenu GL_NEAREST;
	public const GLenu GL_REPEAT;
	public const GLenu GL_CLAMP;
	public const GLenu GL_S;
	public const GLenu GL_T;
	public const GLenu GL_R;
	public const GLenu GL_Q;
	public const GLenu GL_TEXTURE_GEN_R;
	public const GLenu GL_TEXTURE_GEN_Q;
	
	// Utility
	public const GLenu GL_VENDOR;
	public const GLenu GL_RENDERER;
	public const GLenu GL_VERSION;
	public const GLenu GL_EXTENSIONS;
	
	// Errors
	public const GLenu GL_NO_ERROR;
	public const GLenu GL_INVALID_ENUM;
	public const GLenu GL_INVALID_VALUE;
	public const GLenu GL_INVALID_OPERATION;
	public const GLenu GL_STACK_OVERFLOW;
	public const GLenu GL_STACK_UNDERFLOW;
	public const GLenu GL_OUT_OF_MEMORY;
	
	// glPush/Pop Attrib Bits
	public const GLenu GL_CURRENT_BIT;
	public const GLenu GL_POINT_BIT;
	public const GLenu GL_LINE_BIT;
	public const GLenu GL_POLYGON_BIT;
	public const GLenu GL_POLYGON_STIPPLE_BIT;
	public const GLenu GL_PIXEL_MODE_BIT;
	public const GLenu GL_LIGHTING_BIT;
	public const GLenu GL_FOG_BIT;
	public const GLenu GL_DEPTH_BUFFER_BIT;
	public const GLenu GL_ACCUM_BUFFER_BIT;
	public const GLenu GL_STENCIL_BUFFER_BIT;
	public const GLenu GL_VIEWPORT_BIT;
	public const GLenu GL_TRANSFORM_BIT;
	public const GLenu GL_ENABLE_BIT;
	public const GLenu GL_COLOR_BUFFER_BIT;
	public const GLenu GL_HINT_BIT;
	public const GLenu GL_EVAL_BIT;
	public const GLenu GL_LIST_BIT;
	public const GLenu GL_TEXTURE_BIT;
	public const GLenu GL_SCISSOR_BIT;
	public const GLenu GL_ALL_ATTRIB_BITS;
	
	// OpenGL 1.1
	public const GLenu GL_PROXY_TEXTURE_1D;
	public const GLenu GL_PROXY_TEXTURE_2D;
	public const GLenu GL_TEXTURE_PRIORITY;
	public const GLenu GL_TEXTURE_RESIDENT;
	public const GLenu GL_TEXTURE_BINDING_1D;
	public const GLenu GL_TEXTURE_BINDING_2D;
	public const GLenu GL_TEXTURE_INTERNAL_FORMAT;
	public const GLenu GL_ALPHA4;
	public const GLenu GL_ALPHA8;
	public const GLenu GL_ALPHA12;
	public const GLenu GL_ALPHA16;
	public const GLenu GL_LUMINANCE4;
	public const GLenu GL_LUMINANCE8;
	public const GLenu GL_LUMINANCE12;
	public const GLenu GL_LUMINANCE16;
	public const GLenu GL_LUMINANCE4_ALPHA4;
	public const GLenu GL_LUMINANCE6_ALPHA2;
	public const GLenu GL_LUMINANCE8_ALPHA8;
	public const GLenu GL_LUMINANCE12_ALPHA4;
	public const GLenu GL_LUMINANCE12_ALPHA12;
	public const GLenu GL_LUMINANCE16_ALPHA16;
	public const GLenu GL_INTENSITY;
	public const GLenu GL_INTENSITY4;
	public const GLenu GL_INTENSITY8;
	public const GLenu GL_INTENSITY12;
	public const GLenu GL_INTENSITY16;
	public const GLenu GL_R3_G3_B2;
	public const GLenu GL_RGB4;
	public const GLenu GL_RGB5;
	public const GLenu GL_RGB8;
	public const GLenu GL_RGB10;
	public const GLenu GL_RGB12;
	public const GLenu GL_RGB16;
	public const GLenu GL_RGBA2;
	public const GLenu GL_RGBA4;
	public const GLenu GL_RGB5_A1;
	public const GLenu GL_RGBA8;
	public const GLenu GL_RGB10_A2;
	public const GLenu GL_RGBA12;
	public const GLenu GL_RGBA16;
	public const GLenu GL_CLIENT_PIXEL_STORE_BIT;
	public const GLenu GL_CLIENT_VERTEX_ARRAY_BIT;
	public const GLenu GL_ALL_CLIENT_ATTRIB_BITS;
	public const GLenu GL_CLIENT_ALL_ATTRIB_BITS;
	
	// OpenGL 1.2
	public const GLenu GL_RESCALE_NORMAL;
	public const GLenu GL_CLAMP_TO_EDGE;
	public const GLenu GL_MAX_ELEMENTS_VERTICES;
	public const GLenu GL_MAX_ELEMENTS_INDICES;
	public const GLenu GL_BGR;
	public const GLenu GL_BGRA;
	public const GLenu GL_UNSIGNED_BYTE_3_3_2;
	public const GLenu GL_UNSIGNED_BYTE_2_3_3_REV;
	public const GLenu GL_UNSIGNED_SHORT_5_6_5;
	public const GLenu GL_UNSIGNED_SHORT_5_6_5_REV;
	public const GLenu GL_UNSIGNED_SHORT_4_4_4_4;
	public const GLenu GL_UNSIGNED_SHORT_4_4_4_4_REV;
	public const GLenu GL_UNSIGNED_SHORT_5_5_5_1;
	public const GLenu GL_UNSIGNED_SHORT_1_5_5_5_REV;
	public const GLenu GL_UNSIGNED_INT_8_8_8_8;
	public const GLenu GL_UNSIGNED_INT_8_8_8_8_REV;
	public const GLenu GL_UNSIGNED_INT_10_10_10_2;
	public const GLenu GL_UNSIGNED_INT_2_10_10_10_REV;
	public const GLenu GL_LIGHT_MODEL_COLOR_CONTROL;
	public const GLenu GL_SINGLE_COLOR;
	public const GLenu GL_SEPARATE_SPECULAR_COLOR;
	public const GLenu GL_TEXTURE_MIN_LOD;
	public const GLenu GL_TEXTURE_MAX_LOD;
	public const GLenu GL_TEXTURE_BASE_LEVEL;
	public const GLenu GL_TEXTURE_MAX_LEVEL;
	public const GLenu GL_SMOOTH_POINT_SIZE_RANGE;
	public const GLenu GL_SMOOTH_POINT_SIZE_GRANULARITY;
	public const GLenu GL_SMOOTH_LINE_WIDTH_RANGE;
	public const GLenu GL_SMOOTH_LINE_WIDTH_GRANULARITY;
	public const GLenu GL_ALIASED_POINT_SIZE_RANGE;
	public const GLenu GL_ALIASED_LINE_WIDTH_RANGE;
	public const GLenu GL_PACK_SKIP_IMAGES;
	public const GLenu GL_PACK_IMAGE_HEIGHT;
	public const GLenu GL_UNPACK_SKIP_IMAGES;
	public const GLenu GL_UNPACK_IMAGE_HEIGHT;
	public const GLenu GL_TEXTURE_3D;
	public const GLenu GL_PROXY_TEXTURE_3D;
	public const GLenu GL_TEXTURE_DEPTH;
	public const GLenu GL_TEXTURE_WRAP_R;
	public const GLenu GL_MAX_3D_TEXTURE_SIZE;
	public const GLenu GL_TEXTURE_BINDING_3D;
	
	// GL_ARB_imaging
	public const GLenu GL_ARB_imaging;
	public const GLenu GL_CONSTANT_COLOR;
	public const GLenu GL_ONE_MINUS_CONSTANT_COLOR;
	public const GLenu GL_CONSTANT_ALPHA;
	public const GLenu GL_ONE_MINUS_CONSTANT_ALPHA;
	public const GLenu GL_COLOR_TABLE;
	public const GLenu GL_POST_CONVOLUTION_COLOR_TABLE;
	public const GLenu GL_POST_COLOR_MATRIX_COLOR_TABLE;
	public const GLenu GL_PROXY_COLOR_TABLE;
	public const GLenu GL_PROXY_POST_CONVOLUTION_COLOR_TABLE;
	public const GLenu GL_PROXY_POST_COLOR_MATRIX_COLOR_TABLE;
	public const GLenu GL_COLOR_TABLE_SCALE;
	public const GLenu GL_COLOR_TABLE_BIAS;
	public const GLenu GL_COLOR_TABLE_FORMAT;
	public const GLenu GL_COLOR_TABLE_WIDTH;
	public const GLenu GL_COLOR_TABLE_RED_SIZE;
	public const GLenu GL_COLOR_TABLE_GREEN_SIZE;
	public const GLenu GL_COLOR_TABLE_BLUE_SIZE;
	public const GLenu GL_COLOR_TABLE_ALPHA_SIZE;
	public const GLenu GL_COLOR_TABLE_LUMINANCE_SIZE;
	public const GLenu GL_COLOR_TABLE_INTENSITY_SIZE;
	public const GLenu GL_CONVOLUTION_1D;
	public const GLenu GL_CONVOLUTION_2D;
	public const GLenu GL_SEPARABLE_2D;
	public const GLenu GL_CONVOLUTION_BORDER_MODE;
	public const GLenu GL_CONVOLUTION_FILTER_SCALE;
	public const GLenu GL_CONVOLUTION_FILTER_BIAS;
	public const GLenu GL_REDUCE;
	public const GLenu GL_CONVOLUTION_FORMAT;
	public const GLenu GL_CONVOLUTION_WIDTH;
	public const GLenu GL_CONVOLUTION_HEIGHT;
	public const GLenu GL_MAX_CONVOLUTION_WIDTH;
	public const GLenu GL_MAX_CONVOLUTION_HEIGHT;
	public const GLenu GL_POST_CONVOLUTION_RED_SCALE;
	public const GLenu GL_POST_CONVOLUTION_GREEN_SCALE;
	public const GLenu GL_POST_CONVOLUTION_BLUE_SCALE;
	public const GLenu GL_POST_CONVOLUTION_ALPHA_SCALE;
	public const GLenu GL_POST_CONVOLUTION_RED_BIAS;
	public const GLenu GL_POST_CONVOLUTION_GREEN_BIAS;
	public const GLenu GL_POST_CONVOLUTION_BLUE_BIAS;
	public const GLenu GL_POST_CONVOLUTION_ALPHA_BIAS;
	public const GLenu GL_CONSTANT_BORDER;
	public const GLenu GL_REPLICATE_BORDER;
	public const GLenu GL_CONVOLUTION_BORDER_COLOR;
	public const GLenu GL_COLOR_MATRIX;
	public const GLenu GL_COLOR_MATRIX_STACK_DEPTH;
	public const GLenu GL_MAX_COLOR_MATRIX_STACK_DEPTH;
	public const GLenu GL_POST_COLOR_MATRIX_RED_SCALE;
	public const GLenu GL_POST_COLOR_MATRIX_GREEN_SCALE;
	public const GLenu GL_POST_COLOR_MATRIX_BLUE_SCALE;
	public const GLenu GL_POST_COLOR_MATRIX_ALPHA_SCALE;
	public const GLenu GL_POST_COLOR_MATRIX_RED_BIAS;
	public const GLenu GL_POST_COLOR_MATRIX_GREEN_BIAS;
	public const GLenu GL_POST_COLOR_MATRIX_BLUE_BIAS;
	public const GLenu GL_POST_COLOR_MATRIX_ALPHA_BIAS;
	public const GLenu GL_HISTOGRAM;
	public const GLenu GL_PROXY_HISTOGRAM;
	public const GLenu GL_HISTOGRAM_WIDTH;
	public const GLenu GL_HISTOGRAM_FORMAT;
	public const GLenu GL_HISTOGRAM_RED_SIZE;
	public const GLenu GL_HISTOGRAM_GREEN_SIZE;
	public const GLenu GL_HISTOGRAM_BLUE_SIZE;
	public const GLenu GL_HISTOGRAM_ALPHA_SIZE;
	public const GLenu GL_HISTOGRAM_LUMINANCE_SIZE;
	public const GLenu GL_HISTOGRAM_SINK;
	public const GLenu GL_MINMAX;
	public const GLenu GL_MINMAX_FORMAT;
	public const GLenu GL_MINMAX_SINK;
	public const GLenu GL_TABLE_TOO_LARGE;
	public const GLenu GL_BLEND_EQUATION;
	public const GLenu GL_MIN;
	public const GLenu GL_MAX;
	public const GLenu GL_FUNC_ADD;
	public const GLenu GL_FUNC_SUBTRACT;
	public const GLenu GL_FUNC_REVERSE_SUBTRACT;
	public const GLenu GL_BLEND_COLOR;
	
	// OpenGL 1.3
	public const GLenu GL_TEXTURE0;
	public const GLenu GL_TEXTURE1;
	public const GLenu GL_TEXTURE2;
	public const GLenu GL_TEXTURE3;
	public const GLenu GL_TEXTURE4;
	public const GLenu GL_TEXTURE5;
	public const GLenu GL_TEXTURE6;
	public const GLenu GL_TEXTURE7;
	public const GLenu GL_TEXTURE8;
	public const GLenu GL_TEXTURE9;
	public const GLenu GL_TEXTURE10;
	public const GLenu GL_TEXTURE11;
	public const GLenu GL_TEXTURE12;
	public const GLenu GL_TEXTURE13;
	public const GLenu GL_TEXTURE14;
	public const GLenu GL_TEXTURE15;
	public const GLenu GL_TEXTURE16;
	public const GLenu GL_TEXTURE17;
	public const GLenu GL_TEXTURE18;
	public const GLenu GL_TEXTURE19;
	public const GLenu GL_TEXTURE20;
	public const GLenu GL_TEXTURE21;
	public const GLenu GL_TEXTURE22;
	public const GLenu GL_TEXTURE23;
	public const GLenu GL_TEXTURE24;
	public const GLenu GL_TEXTURE25;
	public const GLenu GL_TEXTURE26;
	public const GLenu GL_TEXTURE27;
	public const GLenu GL_TEXTURE28;
	public const GLenu GL_TEXTURE29;
	public const GLenu GL_TEXTURE30;
	public const GLenu GL_TEXTURE31;
	public const GLenu GL_ACTIVE_TEXTURE;
	public const GLenu GL_CLIENT_ACTIVE_TEXTURE;
	public const GLenu GL_MAX_TEXTURE_UNITS;
	public const GLenu GL_NORMAL_MAP;
	public const GLenu GL_REFLECTION_MAP;
	public const GLenu GL_TEXTURE_CUBE_MAP;
	public const GLenu GL_TEXTURE_BINDING_CUBE_MAP;
	public const GLenu GL_TEXTURE_CUBE_MAP_POSITIVE_X;
	public const GLenu GL_TEXTURE_CUBE_MAP_NEGATIVE_X;
	public const GLenu GL_TEXTURE_CUBE_MAP_POSITIVE_Y;
	public const GLenu GL_TEXTURE_CUBE_MAP_NEGATIVE_Y;
	public const GLenu GL_TEXTURE_CUBE_MAP_POSITIVE_Z;
	public const GLenu GL_TEXTURE_CUBE_MAP_NEGATIVE_Z;
	public const GLenu GL_PROXY_TEXTURE_CUBE_MAP;
	public const GLenu GL_MAX_CUBE_MAP_TEXTURE_SIZE;
	public const GLenu GL_COMPRESSED_ALPHA;
	public const GLenu GL_COMPRESSED_LUMINANCE;
	public const GLenu GL_COMPRESSED_LUMINANCE_ALPHA;
	public const GLenu GL_COMPRESSED_INTENSITY;
	public const GLenu GL_COMPRESSED_RGB;
	public const GLenu GL_COMPRESSED_RGBA;
	public const GLenu GL_TEXTURE_COMPRESSION_HINT;
	public const GLenu GL_TEXTURE_COMPRESSED_IMAGE_SIZE;
	public const GLenu GL_TEXTURE_COMPRESSED;
	public const GLenu GL_NUM_COMPRESSED_TEXTURE_FORMATS;
	public const GLenu GL_COMPRESSED_TEXTURE_FORMATS;
	public const GLenu GL_MULTISAMPLE;
	public const GLenu GL_SAMPLE_ALPHA_TO_COVERAGE;
	public const GLenu GL_SAMPLE_ALPHA_TO_ONE;
	public const GLenu GL_SAMPLE_COVERAGE;
	public const GLenu GL_SAMPLE_BUFFERS;
	public const GLenu GL_SAMPLES;
	public const GLenu GL_SAMPLE_COVERAGE_VALUE;
	public const GLenu GL_SAMPLE_COVERAGE_INVERT;
	public const GLenu GL_MULTISAMPLE_BIT;
	public const GLenu GL_TRANSPOSE_MODELVIEW_MATRIX;
	public const GLenu GL_TRANSPOSE_PROJECTION_MATRIX;
	public const GLenu GL_TRANSPOSE_TEXTURE_MATRIX;
	public const GLenu GL_TRANSPOSE_COLOR_MATRIX;
	public const GLenu GL_COMBINE;
	public const GLenu GL_COMBINE_RGB;
	public const GLenu GL_COMBINE_ALPHA;
	public const GLenu GL_SOURCE0_RGB;
	public const GLenu GL_SOURCE1_RGB;
	public const GLenu GL_SOURCE2_RGB;
	public const GLenu GL_SOURCE0_ALPHA;
	public const GLenu GL_SOURCE1_ALPHA;
	public const GLenu GL_SOURCE2_ALPHA;
	public const GLenu GL_OPERAND0_RGB;
	public const GLenu GL_OPERAND1_RGB;
	public const GLenu GL_OPERAND2_RGB;
	public const GLenu GL_OPERAND0_ALPHA;
	public const GLenu GL_OPERAND1_ALPHA;
	public const GLenu GL_OPERAND2_ALPHA;
	public const GLenu GL_RGB_SCALE;
	public const GLenu GL_ADD_SIGNED;
	public const GLenu GL_INTERPOLATE;
	public const GLenu GL_SUBTRACT;
	public const GLenu GL_CONSTANT;
	public const GLenu GL_PRIMARY_COLOR;
	public const GLenu GL_PREVIOUS;
	public const GLenu GL_DOT3_RGB;
	public const GLenu GL_DOT3_RGBA;
	public const GLenu GL_CLAMP_TO_BORDER;
	
	// GL_ARB_multitexture (ARB extension 1 and OpenGL 1.2.1)
	public const GLenu GL_TEXTURE0_ARB;
	public const GLenu GL_TEXTURE1_ARB;
	public const GLenu GL_TEXTURE2_ARB;
	public const GLenu GL_TEXTURE3_ARB;
	public const GLenu GL_TEXTURE4_ARB;
	public const GLenu GL_TEXTURE5_ARB;
	public const GLenu GL_TEXTURE6_ARB;
	public const GLenu GL_TEXTURE7_ARB;
	public const GLenu GL_TEXTURE8_ARB;
	public const GLenu GL_TEXTURE9_ARB;
	public const GLenu GL_TEXTURE10_ARB;
	public const GLenu GL_TEXTURE11_ARB;
	public const GLenu GL_TEXTURE12_ARB;
	public const GLenu GL_TEXTURE13_ARB;
	public const GLenu GL_TEXTURE14_ARB;
	public const GLenu GL_TEXTURE15_ARB;
	public const GLenu GL_TEXTURE16_ARB;
	public const GLenu GL_TEXTURE17_ARB;
	public const GLenu GL_TEXTURE18_ARB;
	public const GLenu GL_TEXTURE19_ARB;
	public const GLenu GL_TEXTURE20_ARB;
	public const GLenu GL_TEXTURE21_ARB;
	public const GLenu GL_TEXTURE22_ARB;
	public const GLenu GL_TEXTURE23_ARB;
	public const GLenu GL_TEXTURE24_ARB;
	public const GLenu GL_TEXTURE25_ARB;
	public const GLenu GL_TEXTURE26_ARB;
	public const GLenu GL_TEXTURE27_ARB;
	public const GLenu GL_TEXTURE28_ARB;
	public const GLenu GL_TEXTURE29_ARB;
	public const GLenu GL_TEXTURE30_ARB;
	public const GLenu GL_TEXTURE31_ARB;
	public const GLenu GL_ACTIVE_TEXTURE_ARB;
	public const GLenu GL_CLIENT_ACTIVE_TEXTURE_ARB;
	public const GLenu GL_MAX_TEXTURE_UNITS_ARB;

	
	// Miscellaneous
	public static void glClearIndex (GLfloat c);
	[CCode (cname = "glClearColor")]
	public static void ClearColor (GLclampf red, GLclampf green, GLclampf blue, GLclampf alpha);
	// public static void glClear (GLbitfield mask);
	[CCode (cname = "glClear")]
	public static void Clear (GLbitfield mask);
	public static void glIndexMask (GLuint mask);
	public static void glColorMask (GLboolean red, GLboolean green, GLboolean blue, GLboolean alpha);
	public static void glAlphaFunc (GLenu func, GLclampf @ref);
	[CCode (cname = "glBlendFunc")]
	public static void BlendFunc (GLenu sfactor, GLenu dfactor);
	public static void glLogicOp (GLenu opcode);
	public static void glCullFace (GLenu mode);
	public static void glFrontFace (GLenu mode);
	public static void glPointSize (GLfloat size);
	public static void glLineWidth (GLfloat width);
	public static void glLineStipple (GLint factor, GLushort pattern);
	public static void glPolygonMode (GLenu face, GLenu mode);
	public static void glPolygonOffset (GLfloat factor, GLfloat units);
	public static void glPolygonStipple ([CCode (array_length = false)] GLubyte[] mask);
	public static void glGetPolygonStipple (out GLubyte mask);
	public static void glEdgeFlag (GLboolean flag);
	public static void glEdgeFlagv ([CCode (array_length = false)] GLboolean[] flag);
	public static void glScissor (GLint x, GLint y, GLsizei width, GLsizei height);
	public static void glClipPlane (GLenu plane, [CCode (array_length = false)] GLdouble[] equation);
	public static void glGetClipPlane (GLenu plane, [CCode (array_length = false)] GLdouble[] equation);
	public static void glDrawBuffer (GLenu mode);
	public static void glReadBuffer (GLenu mode);
	[CCode (cname = "glEnable")]
	public static void Enable (GLenu cap);
	[CCode (cname = "glDisable")]
	public static void Disable (GLenu cap);
	public static GLboolean glIsEnabled (GLenu cap);
	[CCode (cname = "glEnableClientState")]
	public static void EnableClientState (GLenu cap);
	[CCode (cname = "glDisableClientState")]
	public static void DisableClientState (GLenu cap);
	public static void glGetBooleanv (GLenu pname, [CCode (array_length = false)] GLboolean[] params);
	public static void glGetDoublev (GLenu pname, [CCode (array_length = false)] GLdouble[] params);
	public static void glGetFloatv (GLenu pname, [CCode (array_length = false)] GLfloat[] params);
	public static void glGetIntegerv (GLenu pname, [CCode (array_length = false)] GLint[] params);
	public static void glPushAttrib (GLbitfield mask);
	public static void glPopAttrib ();
	public static void glPushClientAttrib (GLbitfield mask);
	public static void glPopClientAttrib ();
	public static GLint glRenderMode (GLenu mode);
	public static GLenu glGetError ();
	public static unowned string glGetString (GLenu name);
	public static void glFinish ();
	public static void glFlush ();
	public static void glHint (GLenu target, GLenu mode);

	// Depth Buffer
	public static void glClearDepth (GLclampd depth);
	public static void glDepthFunc (GLenu func);
	public static void glDepthMask (GLboolean flag);
	public static void glDepthRange (GLclampd near_val, GLclampd far_val);

	// Accumulation Buffer
	public static void glClearAccum (GLfloat red, GLfloat green, GLfloat blue, GLfloat alpha);
	public static void glAccum (GLenu op, GLfloat @value);

	// Transformation
	[CCode (cname = "glMatrixMode")]
	public static void MatrixMode (GLenu mode);
	[CCode (cname = "glOrtho")]
	public static void Ortho (GLdouble left, GLdouble right, GLdouble bottom, GLdouble top, GLdouble near_val, GLdouble far_val);
	public static void glFrustum (GLdouble left, GLdouble right, GLdouble bottom, GLdouble top, GLdouble near_val, GLdouble far_val);
	public static void glViewport (GLint x, GLint y, GLsizei width, GLsizei height);
	[CCode (cname = "glPushMatrix")]
	public static void PushMatrix ();
	[CCode (cname = "glPopMatrix")]
	public static void PopMatrix ();
	[CCode (cname = "glLoadIdentity")]
	public static void LoadIdentity ();
	public static void glLoadMatrixd ([CCode (array_length = false)] GLdouble[] m);
	public static void glLoadMatrixf ([CCode (array_length = false)] GLfloat[] m);
	public static void glMultMatrixd ([CCode (array_length = false)] GLdouble[] m);
	public static void glMultMatrixf ([CCode (array_length = false)] GLfloat[] m);
	public static void glRotated (GLdouble angle, GLdouble x, GLdouble y, GLdouble z);
	public static void glRotatef (GLfloat angle, GLfloat x, GLfloat y, GLfloat z);
	public static void glScaled (GLdouble x, GLdouble y, GLdouble z);
	public static void glScalef (GLfloat x, GLfloat y, GLfloat z);
	public static void glTranslated (GLdouble x, GLdouble y, GLdouble z);
	public static void glTranslatef (GLfloat x, GLfloat y, GLfloat z);

	// Display Lists
	public static GLboolean glIsList (GLuint list);
	public static void glDeleteLists (GLuint list, GLsizei range);
	public static GLuint glGenLists (GLsizei range);
	public static void glNewList (GLuint list, GLenu mode);
	public static void glEndList ();
	public static void glCallList (GLuint list);
	public static void glCallLists (GLsizei n, GLenu type, [CCode (array_length = false)] GLvoid[] lists);
	public static void glListBase (GLuint @base);

	// Drawing Functions
	[CCode (cname = "glBegin")]
	public static void Begin (GLenu mode);
	[CCode (cname = "glEnd")]
	public static void End ();
	public static void glVertex2d (GLdouble x, GLdouble y);
	public static void glVertex2f (GLfloat x, GLfloat y);
	public static void glVertex2i (GLint x, GLint y);
	public static void glVertex2s (GLshort x, GLshort y);
	public static void glVertex3d (GLdouble x, GLdouble y, GLdouble z);
	[CCode (cname = "glVertex3f")]
	public static void Vertex3f (GLfloat x, GLfloat y, GLfloat z);
	public static void glVertex3i (GLint x, GLint y, GLint z);
	public static void glVertex3s (GLshort x, GLshort y, GLshort z);
	public static void glVertex4d (GLdouble x, GLdouble y, GLdouble z, GLdouble w);
	public static void glVertex4f (GLfloat x, GLfloat y, GLfloat z, GLfloat w);
	public static void glVertex4i (GLint x, GLint y, GLint z, GLint w);
	public static void glVertex4s (GLshort x, GLshort y, GLshort z, GLshort w);
	public static void glVertex2dv ([CCode (array_length = false)] GLdouble[] v);
	public static void glVertex2fv ([CCode (array_length = false)] GLfloat[] v);
	public static void glVertex2iv ([CCode (array_length = false)] GLint[] v);
	public static void glVertex2sv ([CCode (array_length = false)] GLshort[] v);
	public static void glVertex3dv ([CCode (array_length = false)] GLdouble[] v);
	public static void glVertex3fv ([CCode (array_length = false)] GLfloat[] v);
	public static void glVertex3iv ([CCode (array_length = false)] GLint[] v);
	public static void glVertex3sv ([CCode (array_length = false)] GLshort[] v);
	public static void glVertex4dv ([CCode (array_length = false)] GLdouble[] v);
	public static void glVertex4fv ([CCode (array_length = false)] GLfloat[] v);
	public static void glVertex4iv ([CCode (array_length = false)] GLint[] v);
	public static void glVertex4sv ([CCode (array_length = false)] GLshort[] v);
	public static void glNormal3b (GLbyte nx, GLbyte ny, GLbyte nz);
	public static void glNormal3d (GLdouble nx, GLdouble ny, GLdouble nz);
	public static void glNormal3f (GLfloat nx, GLfloat ny, GLfloat nz);
	public static void glNormal3i (GLint nx, GLint ny, GLint nz);
	public static void glNormal3s (GLshort nx, GLshort ny, GLshort nz);
	public static void glNormal3bv ([CCode (array_length = false)] GLbyte[] v);
	public static void glNormal3dv ([CCode (array_length = false)] GLdouble[] v);
	public static void glNormal3fv ([CCode (array_length = false)] GLfloat[] v);
	public static void glNormal3iv ([CCode (array_length = false)] GLint[] v);
	public static void glNormal3sv ([CCode (array_length = false)] GLshort[] v);
	public static void glIndexd (GLdouble c);
	public static void glIndexf (GLfloat c);
	public static void glIndexi (GLint c);
	public static void glIndexs (GLshort c);
	public static void glIndexub (GLubyte c);
	public static void glIndexdv ([CCode (array_length = false)] GLdouble[] c);
	public static void glIndexfv ([CCode (array_length = false)] GLfloat[] c);
	public static void glIndexiv ([CCode (array_length = false)] GLint[] c);
	public static void glIndexsv ([CCode (array_length = false)] GLshort[] c);
	public static void glIndexubv ([CCode (array_length = false)] GLubyte[] c);
	public static void glColor3b (GLbyte red, GLbyte green, GLbyte blue);
	public static void glColor3d (GLdouble red, GLdouble green, GLdouble blue);
	public static void glColor3f (GLfloat red, GLfloat green, GLfloat blue);
	public static void glColor3i (GLint red, GLint green, GLint blue);
	public static void glColor3s (GLshort red, GLshort green, GLshort blue);
	public static void glColor3ub (GLubyte red, GLubyte green, GLubyte blue);
	public static void glColor3ui (GLuint red, GLuint green, GLuint blue);
	public static void glColor3us (GLushort red, GLushort green, GLushort blue);
	public static void glColor4b (GLbyte red, GLbyte green, GLbyte blue, GLbyte alpha);
	public static void glColor4d (GLdouble red, GLdouble green, GLdouble blue, GLdouble alpha);
	public static void glColor4f (GLfloat red, GLfloat green, GLfloat blue, GLfloat alpha);
	public static void glColor4i (GLint red, GLint green, GLint blue, GLint alpha);
	public static void glColor4s (GLshort red, GLshort green, GLshort blue, GLshort alpha);
	public static void glColor4ub (GLubyte red, GLubyte green, GLubyte blue, GLubyte alpha);
	public static void glColor4ui (GLuint red, GLuint green, GLuint blue, GLuint alpha);
	public static void glColor4us (GLushort red, GLushort green, GLushort blue, GLushort alpha);
	public static void glColor3bv ([CCode (array_length = false)] GLbyte[] v);
	public static void glColor3dv ([CCode (array_length = false)] GLdouble[] v);
	public static void glColor3fv ([CCode (array_length = false)] GLfloat[] v);
	public static void glColor3iv ([CCode (array_length = false)] GLint[] v);
	public static void glColor3sv ([CCode (array_length = false)] GLshort[] v);
	public static void glColor3ubv ([CCode (array_length = false)] GLubyte[] v);
	public static void glColor3uiv ([CCode (array_length = false)] GLuint[] v);
	public static void glColor3usv ([CCode (array_length = false)] GLushort[] v);
	public static void glColor4bv ([CCode (array_length = false)] GLbyte[] v);
	public static void glColor4dv ([CCode (array_length = false)] GLdouble[] v);
	public static void glColor4fv ([CCode (array_length = false)] GLfloat[] v);
	public static void glColor4iv ([CCode (array_length = false)] GLint[] v);
	public static void glColor4sv ([CCode (array_length = false)] GLshort[] v);
	public static void glColor4ubv ([CCode (array_length = false)] GLubyte[] v);
	public static void glColor4uiv ([CCode (array_length = false)] GLuint[] v);
	public static void glColor4usv ([CCode (array_length = false)] GLushort[] v);
	public static void glTexCoord1d (GLdouble s);
	public static void glTexCoord1f (GLfloat s);
	public static void glTexCoord1i (GLint s);
	public static void glTexCoord1s (GLshort s);
	public static void glTexCoord2d (GLdouble s, GLdouble t);
	[CCode (cname = "glTexCoord2f")]
	public static void TexCoord2f (GLfloat s, GLfloat t);
	public static void glTexCoord2i (GLint s, GLint t);
	public static void glTexCoord2s (GLshort s, GLshort t);
	public static void glTexCoord3d (GLdouble s, GLdouble t, GLdouble r);
	public static void glTexCoord3f (GLfloat s, GLfloat t, GLfloat r);
	public static void glTexCoord3i (GLint s, GLint t, GLint r);
	public static void glTexCoord3s (GLshort s, GLshort t, GLshort r);
	public static void glTexCoord4d (GLdouble s, GLdouble t, GLdouble r, GLdouble q);
	public static void glTexCoord4f (GLfloat s, GLfloat t, GLfloat r, GLfloat q);
	public static void glTexCoord4i (GLint s, GLint t, GLint r, GLint q);
	public static void glTexCoord4s (GLshort s, GLshort t, GLshort r, GLshort q);
	public static void glTexCoord1dv ([CCode (array_length = false)] GLdouble[] v);
	public static void glTexCoord1fv ([CCode (array_length = false)] GLfloat[] v);
	public static void glTexCoord1iv ([CCode (array_length = false)] GLint[] v);
	public static void glTexCoord1sv ([CCode (array_length = false)] GLshort[] v);
	public static void glTexCoord2dv ([CCode (array_length = false)] GLdouble[] v);
	public static void glTexCoord2fv ([CCode (array_length = false)] GLfloat[] v);
	public static void glTexCoord2iv ([CCode (array_length = false)] GLint[] v);
	public static void glTexCoord2sv ([CCode (array_length = false)] GLshort[] v);
	public static void glTexCoord3dv ([CCode (array_length = false)] GLdouble[] v);
	public static void glTexCoord3fv ([CCode (array_length = false)] GLfloat[] v);
	public static void glTexCoord3iv ([CCode (array_length = false)] GLint[] v);
	public static void glTexCoord3sv ([CCode (array_length = false)] GLshort[] v);
	public static void glTexCoord4dv ([CCode (array_length = false)] GLdouble[] v);
	public static void glTexCoord4fv ([CCode (array_length = false)] GLfloat[] v);
	public static void glTexCoord4iv ([CCode (array_length = false)] GLint[] v);
	public static void glTexCoord4sv ([CCode (array_length = false)] GLshort[] v);
	public static void glRasterPos2d (GLdouble x, GLdouble y);
	public static void glRasterPos2f (GLfloat x, GLfloat y);
	public static void glRasterPos2i (GLint x, GLint y);
	public static void glRasterPos2s (GLshort x, GLshort y);
	public static void glRasterPos3d (GLdouble x, GLdouble y, GLdouble z);
	public static void glRasterPos3f (GLfloat x, GLfloat y, GLfloat z);
	public static void glRasterPos3i (GLint x, GLint y, GLint z);
	public static void glRasterPos3s (GLshort x, GLshort y, GLshort z);
	public static void glRasterPos4d (GLdouble x, GLdouble y, GLdouble z, GLdouble w);
	public static void glRasterPos4f (GLfloat x, GLfloat y, GLfloat z, GLfloat w);
	public static void glRasterPos4i (GLint x, GLint y, GLint z, GLint w);
	public static void glRasterPos4s (GLshort x, GLshort y, GLshort z, GLshort w);
	public static void glRasterPos2dv ([CCode (array_length = false)] GLdouble[] v);
	public static void glRasterPos2fv ([CCode (array_length = false)] GLfloat[] v);
	public static void glRasterPos2iv ([CCode (array_length = false)] GLint[] v);
	public static void glRasterPos2sv ([CCode (array_length = false)] GLshort[] v);
	public static void glRasterPos3dv ([CCode (array_length = false)] GLdouble[] v);
	public static void glRasterPos3fv ([CCode (array_length = false)] GLfloat[] v);
	public static void glRasterPos3iv ([CCode (array_length = false)] GLint[] v);
	public static void glRasterPos3sv ([CCode (array_length = false)] GLshort[] v);
	public static void glRasterPos4dv ([CCode (array_length = false)] GLdouble[] v);
	public static void glRasterPos4fv ([CCode (array_length = false)] GLfloat[] v);
	public static void glRasterPos4iv ([CCode (array_length = false)] GLint[] v);
	public static void glRasterPos4sv ([CCode (array_length = false)] GLshort[] v);
	public static void glRectd (GLdouble x1, GLdouble y1, GLdouble x2, GLdouble y2);
	public static void glRectf (GLfloat x1, GLfloat y1, GLfloat x2, GLfloat y2);
	public static void glRecti (GLint x1, GLint y1, GLint x2, GLint y2);
	public static void glRects (GLshort x1, GLshort y1, GLshort x2, GLshort y2);
	public static void glRectdv ([CCode (array_length = false)] GLdouble[] v1, [CCode (array_length = false)] GLdouble[] v2);
	public static void glRectfv ([CCode (array_length = false)] GLfloat[] v1, [CCode (array_length = false)] GLfloat[] v2);
	public static void glRectiv ([CCode (array_length = false)] GLint[] v1, [CCode (array_length = false)] GLint[] v2);
	public static void glRectsv ([CCode (array_length = false)] GLshort[] v1, [CCode (array_length = false)] GLshort[] v2);

	// Vertex Arrays  (1.1)
	[CCode (cname = "glVertexPointer")]
	public static void VertexPointer (GLint size, GLenu type, GLsizei stride, GLvoid* ptr);
	public static void glNormalPointer (GLenu type, GLsizei stride, GLvoid* ptr);
	public static void glColorPointer (GLint size, GLenu type, GLsizei stride, GLvoid* ptr);
	public static void glIndexPointer (GLenu type, GLsizei stride, GLvoid* ptr);
	[CCode (cname = "glTexCoordPointer")]
	public static void TexCoordPointer (GLint size, GLenu type, GLsizei stride, GLvoid* ptr);
	public static void glEdgeFlagPointer (GLsizei stride, GLvoid* ptr);
	public static void glGetPointerv (GLenu pname, GLvoid** params); 
	public static void glArrayElement (GLint i);
	[CCode (cname = "glDrawArrays")]
	public static void DrawArrays (GLenu mode, GLint first, GLsizei count);
	public static void glDrawElements (GLenu mode, GLsizei count, GLenu type, GLvoid* indices);
	public static void glInterleavedArrays (GLenu format, GLsizei stride, GLvoid* pointer);

	// Lighting
	public static void glShadeModel (GLenu mode);
	public static void glLightf (GLenu light, GLenu pname, GLfloat param);
	public static void glLighti (GLenu light, GLenu pname, GLint param);
	public static void glLightfv (GLenu light, GLenu pname, [CCode (array_length = false)] GLfloat[] params);
	public static void glLightiv (GLenu light, GLenu pname, [CCode (array_length = false)] GLint[] params);
	public static void glGetLightfv (GLenu light, GLenu pname, [CCode (array_length = false)] GLfloat[] params);
	public static void glGetLightiv (GLenu light, GLenu pname, [CCode (array_length = false)] GLint[] params);
	public static void glLightModelf (GLenu pname, GLfloat param);
	public static void glLightModeli (GLenu pname, GLint param);
	public static void glLightModelfv (GLenu pname, [CCode (array_length = false)] GLfloat[] params);
	public static void glLightModeliv (GLenu pname, [CCode (array_length = false)] GLint[] params);
	public static void glMaterialf (GLenu face, GLenu pname, GLfloat param);
	public static void glMateriali (GLenu face, GLenu pname, GLint param);
	public static void glMaterialfv (GLenu face, GLenu pname, [CCode (array_length = false)] GLfloat[] params);
	public static void glMaterialiv (GLenu face, GLenu pname, [CCode (array_length = false)] GLint[] params);
	public static void glGetMaterialfv (GLenu face, GLenu pname, [CCode (array_length = false)] GLfloat[] params);
	public static void glGetMaterialiv (GLenu face, GLenu pname, [CCode (array_length = false)] GLint[] params);
	public static void glColorMaterial (GLenu face, GLenu mode);

	// Raster functions
	public static void glPixelZoom (GLfloat xfactor, GLfloat yfactor);
	public static void glPixelStoref (GLenu pname, GLfloat param);
	public static void glPixelStorei (GLenu pname, GLint param);
	public static void glPixelTransferf (GLenu pname, GLfloat param);
	public static void glPixelTransferi (GLenu pname, GLint param);
	public static void glPixelMapfv (GLenu map, GLsizei mapsize, [CCode (array_length = false)] GLfloat[] values);
	public static void glPixelMapuiv (GLenu map, GLsizei mapsize, [CCode (array_length = false)] GLuint[] values);
	public static void glPixelMapusv (GLenu map, GLsizei mapsize, [CCode (array_length = false)] GLushort[] values);
	public static void glGetPixelMapfv (GLenu map, [CCode (array_length = false)] GLfloat[] values);
	public static void glGetPixelMapuiv (GLenu map, [CCode (array_length = false)] GLuint[] values);
	public static void glGetPixelMapusv (GLenu map, [CCode (array_length = false)] GLushort[] values);
	public static void glBitmap (GLsizei width, GLsizei height, GLfloat xorig, GLfloat yorig, GLfloat xmove, GLfloat ymove, GLubyte* bitmap);
	public static void glReadPixels (GLint x, GLint y, GLsizei width, GLsizei height, GLenu format, GLenu type, GLvoid* pixels);
	public static void glDrawPixels (GLsizei width, GLsizei height, GLenu format, GLenu type, GLvoid* pixels);
	public static void glCopyPixels (GLint x, GLint y, GLsizei width, GLsizei height, GLenu type);

	// Stenciling
	public static void glStencilFunc (GLenu func, GLint @ref, GLuint mask);
	public static void glStencilMask (GLuint mask);
	public static void glStencilOp (GLenu fail, GLenu zfail, GLenu zpass);
	public static void glClearStencil (GLint s);

	// Texture mapping
	public static void glTexGend (GLenu coord, GLenu pname, GLdouble param);
	public static void glTexGenf (GLenu coord, GLenu pname, GLfloat param);
	public static void glTexGeni (GLenu coord, GLenu pname, GLint param);
	public static void glTexGendv (GLenu coord, GLenu pname, [CCode (array_length = false)] GLdouble[] params);
	public static void glTexGenfv (GLenu coord, GLenu pname, [CCode (array_length = false)] GLfloat[] params);
	public static void glTexGeniv (GLenu coord, GLenu pname, [CCode (array_length = false)] GLint[] params);
	public static void glGetTexGendv (GLenu coord, GLenu pname, [CCode (array_length = false)] GLdouble[] params);
	public static void glGetTexGenfv (GLenu coord, GLenu pname, [CCode (array_length = false)] GLfloat[] params);
	public static void glGetTexGeniv (GLenu coord, GLenu pname, [CCode (array_length = false)] GLint[] params);
	public static void glTexEnvf (GLenu target, GLenu pname, GLfloat param);
	public static void glTexEnvi (GLenu target, GLenu pname, GLint param);
	public static void glTexEnvfv (GLenu target, GLenu pname, [CCode (array_length = false)] GLfloat[] params);
	public static void glTexEnviv (GLenu target, GLenu pname, [CCode (array_length = false)] GLint[] params);
	public static void glGetTexEnvfv (GLenu target, GLenu pname, [CCode (array_length = false)] GLfloat[] params);
	public static void glGetTexEnviv (GLenu target, GLenu pname, [CCode (array_length = false)] GLint[] params);
	public static void glTexParameterf (GLenu target, GLenu pname, GLfloat param);
	[CCode (cname = "glTexParameteri")]
	public static void TexParameteri (GLenu target, GLenu pname, GLint param);
	public static void glTexParameterfv (GLenu target, GLenu pname, [CCode (array_length = false)] GLfloat[] params);
	public static void glTexParameteriv (GLenu target, GLenu pname, [CCode (array_length = false)] GLint[] params);
	public static void glGetTexParameterfv (GLenu target, GLenu pname, [CCode (array_length = false)] GLfloat[] params);
	public static void glGetTexParameteriv (GLenu target, GLenu pname, [CCode (array_length = false)] GLint[] params);
	public static void glGetTexLevelParameterfv (GLenu target, GLint level, [CCode (array_length = false)] GLenu pname, GLfloat[] params);
	public static void glGetTexLevelParameteriv (GLenu target, GLint level, GLenu pname,[CCode (array_length = false)]  GLint[] params);
	public static void glTexImage1D (GLenu target, GLint level, GLint internalFormat, GLsizei width, GLint border, GLenu format, GLenu type, GLvoid* pixels);
	public static void glTexImage2D (GLenu target, GLint level, GLint internalFormat, GLsizei width, GLsizei height, GLint border, GLenu format, GLenu type, GLvoid* pixels);
	public static void glGetTexImage (GLenu target, GLint level, GLenu format, GLenu type, GLvoid* pixels);

	// 1.1 functions
	public static void glGenTextures (GLsizei n, [CCode (array_length = false)] GLuint[] textures);
	public static void glDeleteTextures (GLsizei n, [CCode (array_length = false)] GLuint[] textures);
	[CCode (cname = "glBindTexture")]
	public static void BindTexture (GLenu target, GLuint texture);
	public static void glPrioritizeTextures (GLsizei n, [CCode (array_length = false)] GLuint[] textures, [CCode (array_length = false)] GLclampf[] priorities);
	public static GLboolean glAreTexturesResident (GLsizei n, [CCode (array_length = false)] GLuint[] textures, [CCode (array_length = false)] GLboolean[] residences);
	public static GLboolean glIsTexture (GLuint texture);
	public static void glTexSubImage1D (GLenu target, GLint level, GLint xoffset, GLsizei width, GLenu format, GLenu type, GLvoid* pixels);
	public static void glTexSubImage2D (GLenu target, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenu format, GLenu type, GLvoid* pixels);
	public static void glCopyTexImage1D (GLenu target, GLint level, GLenu internalformat, GLint x, GLint y, GLsizei width, GLint border);
	public static void glCopyTexImage2D (GLenu target, GLint level, GLenu internalformat, GLint x, GLint y, GLsizei width, GLsizei height, GLint border);
	public static void glCopyTexSubImage1D (GLenu target, GLint level, GLint xoffset, GLint x, GLint y, GLsizei width);
	public static void glCopyTexSubImage2D (GLenu target, GLint level, GLint xoffset, GLint yoffset, GLint x, GLint y, GLsizei width, GLsizei height);

	// Evaluators
	public static void glMap1d (GLenu target, GLdouble u1, GLdouble u2, GLint stride, GLint order, [CCode (array_length = false)] GLdouble[] points);
	public static void glMap1f (GLenu target, GLfloat u1, GLfloat u2, GLint stride, GLint order, [CCode (array_length = false)] GLfloat[] points);
	public static void glMap2d (GLenu target, GLdouble u1, GLdouble u2, GLint ustride, GLint uorder, GLdouble v1, GLdouble v2, GLint vstride, GLint vorder,[CCode (array_length = false)]  GLdouble[] points);
	public static void glMap2f (GLenu target, GLfloat u1, GLfloat u2, GLint ustride, GLint uorder, GLfloat v1, GLfloat v2, GLint vstride, GLint vorder, [CCode (array_length = false)] GLfloat[] points);
	public static void glGetMapdv (GLenu target, GLenu query, [CCode (array_length = false)] GLdouble[] v);
	public static void glGetMapfv (GLenu target, GLenu query, [CCode (array_length = false)] GLfloat[] v);
	public static void glGetMapiv (GLenu target, GLenu query, [CCode (array_length = false)] GLint[] v);
	public static void glEvalCoord1d (GLdouble u);
	public static void glEvalCoord1f (GLfloat u);
	public static void glEvalCoord1dv ([CCode (array_length = false)] GLdouble[] u);
	public static void glEvalCoord1fv ([CCode (array_length = false)] GLfloat[] u);
	public static void glEvalCoord2d (GLdouble u, GLdouble v);
	public static void glEvalCoord2f (GLfloat u, GLfloat v);
	public static void glEvalCoord2dv ([CCode (array_length = false)] GLdouble[] u);
	public static void glEvalCoord2fv ([CCode (array_length = false)] GLfloat[] u);
	public static void glMapGrid1d (GLint un, GLdouble u1, GLdouble u2);
	public static void glMapGrid1f (GLint un, GLfloat u1, GLfloat u2);
	public static void glMapGrid2d (GLint un, GLdouble u1, GLdouble u2, GLint vn, GLdouble v1, GLdouble v2);
	public static void glMapGrid2f (GLint un, GLfloat u1, GLfloat u2, GLint vn, GLfloat v1, GLfloat v2);
	public static void glEvalPoint1 (GLint i);
	public static void glEvalPoint2 (GLint i, GLint j);
	public static void glEvalMesh1 (GLenu mode, GLint i1, GLint i2);
	public static void glEvalMesh2 (GLenu mode, GLint i1, GLint i2, GLint j1, GLint j2);

	// Fog
	public static void glFogf (GLenu pname, GLfloat param);
	public static void glFogi (GLenu pname, GLint param);
	public static void glFogfv (GLenu pname, [CCode (array_length = false)] GLfloat[] params);
	public static void glFogiv (GLenu pname, [CCode (array_length = false)] GLint[] params);

	// Selection and Feedback
	public static void glFeedbackBuffer (GLsizei size, GLenu type, [CCode (array_length = false)] GLfloat[] buffer);
	public static void glPassThrough (GLfloat token);
	public static void glSelectBuffer (GLsizei size, [CCode (array_length = false)] GLuint[] buffer);
	public static void glInitNames ();
	public static void glLoadName (GLuint name);
	public static void glPushName (GLuint name);
	public static void glPopName ();
	
	// OpenGL 1.2
	public static void glDrawRangeElements (GLenu mode, GLuint start, GLuint end, GLsizei count, GLenu type, GLvoid* indices);
	public static void glTexImage3D (GLenu target, GLint level, GLint internalFormat, GLsizei width, GLsizei height, GLsizei depth, GLint border, GLenu format, GLenu type, GLvoid* pixels);
	public static void glTexSubImage3D (GLenu target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenu format, GLenu type, GLvoid* pixels);
	public static void glCopyTexSubImage3D (GLenu target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLint x, GLint y, GLsizei width, GLsizei height);
	
	// GL_ARB_imaging
	public static void glColorTable (GLenu target, GLenu internalformat, GLsizei width, GLenu format, GLenu type, GLvoid* table);
	public static void glColorSubTable (GLenu target, GLsizei start, GLsizei count, GLenu format, GLenu type, GLvoid* data);
	public static void glColorTableParameteriv (GLenu target, GLenu pname, [CCode (array_length = false)] GLint[] params);
	public static void glColorTableParameterfv (GLenu target, GLenu pname, [CCode (array_length = false)] GLfloat[] params);
	public static void glCopyColorSubTable (GLenu target, GLsizei start, GLint x, GLint y, GLsizei width);
	public static void glCopyColorTable (GLenu target, GLenu internalformat, GLint x, GLint y, GLsizei width);
	public static void glGetColorTable (GLenu target, GLenu format, GLenu type, out GLvoid table);
	public static void glGetColorTableParameterfv (GLenu target, GLenu pname, out GLfloat params);
	public static void glGetColorTableParameteriv (GLenu target, GLenu pname, out GLint params);
	public static void glBlendEquation (GLenu mode);
	public static void glBlendColor (GLclampf red, GLclampf green, GLclampf blue, GLclampf alpha);
	public static void glHistogram (GLenu target, GLsizei width, GLenu internalformat, GLboolean sink);
	public static void glResetHistogram (GLenu target);
	public static void glGetHistogram (GLenu target, GLboolean reset, GLenu format, GLenu type, out GLvoid values);
	public static void glGetHistogramParameterfv (GLenu target, GLenu pname, out GLfloat params);
	public static void glGetHistogramParameteriv (GLenu target, GLenu pname, out GLint params);
	public static void glMinmax (GLenu target, GLenu internalformat, GLboolean sink);
	public static void glResetMinmax (GLenu target);
	public static void glGetMinmax (GLenu target, GLboolean reset, GLenu format, GLenu types, out GLvoid values);
	public static void glGetMinmaxParameterfv (GLenu target, GLenu pname, [CCode (array_length = false)] GLfloat[] params);
	public static void glGetMinmaxParameteriv (GLenu target, GLenu pname, [CCode (array_length = false)] GLint[] params);
	public static void glConvolutionFilter1D (GLenu target, GLenu internalformat, GLsizei width, GLenu format, GLenu type, GLvoid* image);
	public static void glConvolutionFilter2D (GLenu target, GLenu internalformat, GLsizei width, GLsizei height, GLenu format, GLenu type, GLvoid* image);
	public static void glConvolutionParameterf (GLenu target, GLenu pname, GLfloat params);
	public static void glConvolutionParameterfv (GLenu target, GLenu pname, [CCode (array_length = false)] GLfloat[] params);
	public static void glConvolutionParameteri (GLenu target, GLenu pname, GLint params);
	public static void glConvolutionParameteriv (GLenu target, GLenu pname, [CCode (array_length = false)] GLint[] params);
	public static void glCopyConvolutionFilter1D (GLenu target, GLenu internalformat, GLint x, GLint y, GLsizei width);
	public static void glCopyConvolutionFilter2D (GLenu target, GLenu internalformat, GLint x, GLint y, GLsizei width, GLsizei height);
	public static void glGetConvolutionFilter (GLenu target, GLenu format, GLenu type, GLvoid *image);
	public static void glGetConvolutionParameterfv (GLenu target, GLenu pname, [CCode (array_length = false)] GLfloat[] params);
	public static void glGetConvolutionParameteriv (GLenu target, GLenu pname, [CCode (array_length = false)] GLint[] params);
	public static void glSeparableFilter2D (GLenu target, GLenu internalformat, GLsizei width, GLsizei height, GLenu format, GLenu type, GLvoid* row, GLvoid* column);
	public static void glGetSeparableFilter (GLenu target, GLenu format, GLenu type, out GLvoid row, out GLvoid column, out GLvoid span);

	//OpenGL 1.3
	public static void glActiveTexture (GLenu texture);
	public static void glClientActiveTexture (GLenu texture);
	public static void glCompressedTexImage1D (GLenu target, GLint level, GLenu internalformat, GLsizei width, GLint border, GLsizei imageSize, GLvoid* data);
	public static void glCompressedTexImage2D (GLenu target, GLint level, GLenu internalformat, GLsizei width, GLsizei height, GLint border, GLsizei imageSize, GLvoid* data);
	public static void glCompressedTexImage3D (GLenu target, GLint level, GLenu internalformat, GLsizei width, GLsizei height, GLsizei depth, GLint border, GLsizei imageSize, GLvoid* data);
	public static void glCompressedTexSubImage1D (GLenu target, GLint level, GLint xoffset, GLsizei width, GLenu format, GLsizei imageSize, GLvoid* data);
	public static void glCompressedTexSubImage2D (GLenu target, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenu format, GLsizei imageSize, GLvoid* data);
	public static void glCompressedTexSubImage3D (GLenu target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenu format, GLsizei imageSize, GLvoid* data);
	public static void glGetCompressedTexImage (GLenu target, GLint lod, out GLvoid img);
	public static void glMultiTexCoord1d (GLenu target, GLdouble s);
	public static void glMultiTexCoord1dv (GLenu target, [CCode (array_length = false)] GLdouble[] v);
	public static void glMultiTexCoord1f (GLenu target, GLfloat s);
	public static void glMultiTexCoord1fv (GLenu target, [CCode (array_length = false)] GLfloat[] v);
	public static void glMultiTexCoord1i (GLenu target, GLint s);
	public static void glMultiTexCoord1iv (GLenu target, [CCode (array_length = false)] GLint[] v);
	public static void glMultiTexCoord1s (GLenu target, GLshort s);
	public static void glMultiTexCoord1sv (GLenu target, [CCode (array_length = false)] GLshort[] v);
	public static void glMultiTexCoord2d (GLenu target, GLdouble s, GLdouble t);
	public static void glMultiTexCoord2dv (GLenu target, [CCode (array_length = false)] GLdouble[] v);
	public static void glMultiTexCoord2f (GLenu target, GLfloat s, GLfloat t);
	public static void glMultiTexCoord2fv (GLenu target, [CCode (array_length = false)] GLfloat[] v);
	public static void glMultiTexCoord2i (GLenu target, GLint s, GLint t);
	public static void glMultiTexCoord2iv (GLenu target, [CCode (array_length = false)] GLint[] v);
	public static void glMultiTexCoord2s (GLenu target, GLshort s, GLshort t);
	public static void glMultiTexCoord2sv (GLenu target, [CCode (array_length = false)] GLshort[] v);
	public static void glMultiTexCoord3d (GLenu target, GLdouble s, GLdouble t, GLdouble r);
	public static void glMultiTexCoord3dv (GLenu target, [CCode (array_length = false)] GLdouble[] v);
	public static void glMultiTexCoord3f (GLenu target, GLfloat s, GLfloat t, GLfloat r);
	public static void glMultiTexCoord3fv (GLenu target, [CCode (array_length = false)] GLfloat[] v);
	public static void glMultiTexCoord3i (GLenu target, GLint s, GLint t, GLint r);
	public static void glMultiTexCoord3iv (GLenu target, [CCode (array_length = false)] GLint[] v);
	public static void glMultiTexCoord3s (GLenu target, GLshort s, GLshort t, GLshort r);
	public static void glMultiTexCoord3sv (GLenu target, [CCode (array_length = false)] GLshort[] v);
	public static void glMultiTexCoord4d (GLenu target, GLdouble s, GLdouble t, GLdouble r, GLdouble q);
	public static void glMultiTexCoord4dv (GLenu target, [CCode (array_length = false)] GLdouble[] v);
	public static void glMultiTexCoord4f (GLenu target, GLfloat s, GLfloat t, GLfloat r, GLfloat q);
	public static void glMultiTexCoord4fv (GLenu target, [CCode (array_length = false)] GLfloat[] v);
	public static void glMultiTexCoord4i (GLenu target, GLint s, GLint t, GLint r, GLint q);
	public static void glMultiTexCoord4iv (GLenu target, [CCode (array_length = false)] GLint[] v);
	public static void glMultiTexCoord4s (GLenu target, GLshort s, GLshort t, GLshort r, GLshort q);
	public static void glMultiTexCoord4sv (GLenu target, [CCode (array_length = false)] GLshort[] v);
	public static void glLoadTransposeMatrixd ([CCode (array_length = false)] GLdouble[] m);
	public static void glLoadTransposeMatrixf ([CCode (array_length = false)] GLfloat[] m);
	public static void glMultTransposeMatrixd ([CCode (array_length = false)] GLdouble[] m);
	public static void glMultTransposeMatrixf ([CCode (array_length = false)] GLfloat[] m);
	public static void glSampleCoverage (GLclampf @value, GLboolean invert);
	
	// GL_ARB_multitexture (ARB extension 1 and OpenGL 1.2.1)
	public static void glActiveTextureARB (GLenu texture);
	public static void glClientActiveTextureARB (GLenu texture);
	public static void glMultiTexCoord1dARB (GLenu target, GLdouble s);
	public static void glMultiTexCoord1dvARB (GLenu target, [CCode (array_length = false)] GLdouble[] v);
	public static void glMultiTexCoord1fARB (GLenu target, GLfloat s);
	public static void glMultiTexCoord1fvARB (GLenu target, [CCode (array_length = false)] GLfloat[] v);
	public static void glMultiTexCoord1iARB (GLenu target, GLint s);
	public static void glMultiTexCoord1ivARB (GLenu target, [CCode (array_length = false)] GLint[] v);
	public static void glMultiTexCoord1sARB (GLenu target, GLshort s);
	public static void glMultiTexCoord1svARB (GLenu target, [CCode (array_length = false)] GLshort[] v);
	public static void glMultiTexCoord2dARB (GLenu target, GLdouble s, GLdouble t);
	public static void glMultiTexCoord2dvARB (GLenu target, [CCode (array_length = false)] GLdouble[] v);
	public static void glMultiTexCoord2fARB (GLenu target, GLfloat s, GLfloat t);
	public static void glMultiTexCoord2fvARB (GLenu target, [CCode (array_length = false)] GLfloat[] v);
	public static void glMultiTexCoord2iARB (GLenu target, GLint s, GLint t);
	public static void glMultiTexCoord2ivARB (GLenu target, [CCode (array_length = false)] GLint[] v);
	public static void glMultiTexCoord2sARB (GLenu target, GLshort s, GLshort t);
	public static void glMultiTexCoord2svARB (GLenu target, [CCode (array_length = false)] GLshort[] v);
	public static void glMultiTexCoord3dARB (GLenu target, GLdouble s, GLdouble t, GLdouble r);
	public static void glMultiTexCoord3dvARB (GLenu target, [CCode (array_length = false)] GLdouble[] v);
	public static void glMultiTexCoord3fARB (GLenu target, GLfloat s, GLfloat t, GLfloat r);
	public static void glMultiTexCoord3fvARB (GLenu target, [CCode (array_length = false)] GLfloat[] v);
	public static void glMultiTexCoord3iARB (GLenu target, GLint s, GLint t, GLint r);
	public static void glMultiTexCoord3ivARB (GLenu target, [CCode (array_length = false)] GLint[] v);
	public static void glMultiTexCoord3sARB (GLenu target, GLshort s, GLshort t, GLshort r);
	public static void glMultiTexCoord3svARB (GLenu target, [CCode (array_length = false)] GLshort[] v);
	public static void glMultiTexCoord4dARB (GLenu target, GLdouble s, GLdouble t, GLdouble r, GLdouble q);
	public static void glMultiTexCoord4dvARB (GLenu target, [CCode (array_length = false)] GLdouble[] v);
	public static void glMultiTexCoord4fARB (GLenu target, GLfloat s, GLfloat t, GLfloat r, GLfloat q);
	public static void glMultiTexCoord4fvARB (GLenu target, [CCode (array_length = false)] GLfloat[] v);
	public static void glMultiTexCoord4iARB (GLenu target, GLint s, GLint t, GLint r, GLint q);
	public static void glMultiTexCoord4ivARB (GLenu target, [CCode (array_length = false)] GLint[] v);
	public static void glMultiTexCoord4sARB (GLenu target, GLshort s, GLshort t, GLshort r, GLshort q);
	public static void glMultiTexCoord4svARB (GLenu target, [CCode (array_length = false)] GLshort[] v);


	// Corange SDL_local.h values
	
	[CCode (cname="GLchar")]
	public struct GLchar : char { }
	[CCode (cname="GLsizeiptr")]
	public struct GLsizeiptr : size_t { }

	public static GLuint glCreateShader( GLenu type );
	public static GLuint glCreateProgram( );
	public static void glShaderSource( GLuint shader, GLsizei count, GLchar** string, GLint* length );
	public static void glCompileShader( GLuint shader );
	public static void glGetShaderInfoLog( GLuint shader, GLsizei bufsize,GLsizei* length, GLchar* infolog );
	public static void glAttachShader( GLuint program, GLuint shader );
	public static void glLinkProgram( GLuint program );
	public static void glGetProgramInfoLog( GLuint program, GLsizei bufsize,GLsizei* length, GLchar* infolog );
	public static GLboolean glIsProgram( GLuint program );
	public static GLboolean glIsShader( GLuint shader );
	public static void glGetAttachedShaders(GLuint program, GLsizei maxCount, GLsizei* count, GLuint* shaders);
	public static GLint glGetUniformLocation( GLuint program, GLchar* name );
	//  public static void glActiveTexture( GLenu texture );
	public static void glUniform1f( GLint location, GLfloat x );
	public static void glUniform1i( GLint location, GLint x );
	public static void glDeleteShader( GLuint shader );
	public static void glDeleteProgram( GLuint program );
	public static void glUseProgram( GLuint program );
	public static void glVertexAttribPointer( GLuint indx, GLint size, GLenu type,GLboolean normalized, GLsizei stride, GLvoid* ptr );
	public static void glVertexAttribDivisor( GLuint indx, GLuint divisor );
	public static void glEnableVertexAttribArray( GLuint index );
	public static void glDisableVertexAttribArray( GLuint index );
	public static void glUniform2f( GLint location, GLfloat x, GLfloat y);
	public static void glUniform3f( GLint location, GLfloat x, GLfloat y, GLfloat z);
	public static void glUniform4f( GLint location, GLfloat x, GLfloat y, GLfloat z, GLfloat w );
	public static void glUniformMatrix3fv( GLint location, GLsizei count,GLboolean transpose, GLfloat* value );
	public static void glUniformMatrix4fv( GLint location, GLsizei count,GLboolean transpose, GLfloat* value );
	public static void glUniform1fv( GLint location, GLsizei count, GLfloat* value );
	public static void glUniform2fv( GLint location, GLsizei count, GLfloat* value );
	public static void glUniform3fv( GLint location, GLsizei count, GLfloat* value );
	public static void glUniform4fv( GLint location, GLsizei count, GLfloat* value );
	public static void glGetShaderiv( GLuint shader, GLenu pname, GLint* params );
	public static void glGetProgramiv( GLuint program, GLenu pname, GLint* params );
	public static void glProgramParameteri( GLuint program, GLenu pname, GLint value );
	public static void glBindAttribLocation( GLuint program, GLuint index, GLchar* name );
	public static void glGenFramebuffers( GLsizei n, GLuint* ids );
	public static void glBindFramebuffer( GLenu target, GLuint framebuffer );
	public static void glBlitFramebuffer( GLint srcX0, GLint srcY0, GLint srcX1, GLint srcY1, GLint dstX0, GLint dstY0, GLint dstX1, GLint dstY1, GLbitfield mask, GLenu filter);
	public static void glFramebufferTexture( GLenu target, GLenu attachment, GLuint texture, GLint level );
	public static void glFramebufferTexture2D( GLenu target, GLenu attachment, GLenu textarget, GLuint texture, GLint level );
	public static void glDeleteFramebuffers( GLsizei n, GLuint* framebuffers );
	public static GLenu glCheckFramebufferStatus( GLenu target );

	[CCode (cname = "glGenBuffers")]
	public static void GenBuffers( GLsizei n, GLuint* buffers );
	public static void glGenRenderbuffers( GLsizei n, GLuint* buffers );
	[CCode (cname = "glDeleteBuffers")]
	public static void DeleteBuffers( GLsizei n, GLuint* buffers );
	public static void glDeleteRenderbuffers( GLsizei n, GLuint* buffers );
	[CCode (cname = "glBindBuffer")]
	public static void BindBuffer( GLenu target, GLuint buffer );
	public static void glBindRenderbuffer( GLenu target, GLuint buffer );
	[CCode (cname = "glBufferData")]
	public static void BufferData( GLenu target, GLsizeiptr size, GLvoid* data, GLenu usage );
	//  public static void glGetBufferSubData( GLenu target, GLintptr offset, GLsizeiptr size, GLvoid* data);
	public static void glGetBufferSubData( GLenu target, GLint* offset, GLsizeiptr size, GLvoid* data);
	public static void glFramebufferRenderbuffer( GLenu target, GLenu attachment, GLenu renderbuffertarget, GLuint renderbuffer );
	public static GLint glGetAttribLocation( GLuint program, GLchar* name );
	public static void glRenderbufferStorage( GLenu target, GLenu format, GLsizei width, GLsizei height);
	public static void glRenderbufferStorageMultisample( GLenu target, GLuint samples, GLenu format, GLsizei width, GLsizei height);
	public static void GLDRAWglDrawBuffersBUFFERS(GLsizei n, GLenu* buffers);
	public static void glGenerateMipmap(GLenu target);
	//  public static void glCompressedTexImage2D(GLenu target, GLint level, GLenu format, GLsizei width, GLsizei height, GLint border, GLsizei imagesize, GLvoid* data);
	//  public static void glTexImage3D(GLenu target, GLint level, GLint internalFormat, GLsizei width, GLsizei height, GLsizei depth, GLint border, GLenu format, GLenu type, GLvoid* data);
	public static void glDrawElementsInstanced(GLenu mode, GLsizei count, GLenu type, void* indicies, GLsizei primcount);
	public static void glPatchParameteri(GLenu pname, GLint value);
	public static void glPatchParameterfv(GLenu pname, GLfloat* values);
	
	public static void glBrokenExtension();

	//  public const GLenu GL_TABLE_TOO_LARGE; //0x8031
	public const GLenu GL_INVALID_FRAMEBUFFER_OPERATION; //0x0506
	
	public const GLenu GL_SHADING_LANGUAGE_VERSION; //0x8B8C
	
	public const GLenu GL_VERTEX_SHADER; //0x8B31
	public const GLenu GL_FRAGMENT_SHADER; //0x8B30
	public const GLenu GL_GEOMETRY_SHADER; //0x8DD9
	public const GLenu GL_COMPILE_STATUS; //0x8B81
	public const GLenu GL_LINK_STATUS; //0x8B82
	
	public const GLenu GL_GEOMETRY_VERTICES_OUT; //0x8DDA
	public const GLenu GL_GEOMETRY_INPUT_TYPE; //0x8DDB
	public const GLenu GL_GEOMETRY_OUTPUT_TYPE; //0x8DDC
	public const GLenu GL_MAX_GEOMETRY_OUTPUT_VERTICES; //0x8DE0
	public const GLenu GL_MAX_GEOMETRY_TOTAL_OUTPUT_COMPONENTS; //0x8DE1
	
	public const GLenu GL_FRAMEBUFFER; //0x8D40
	public const GLenu GL_RENDERBUFFER; //0x8D41
	public const GLenu GL_READ_FRAMEBUFFER; //0x8CA8
	public const GLenu GL_DRAW_FRAMEBUFFER; //0x8CA9
	public const GLenu GL_ARRAY_BUFFER; //0x8892
	public const GLenu GL_ELEMENT_ARRAY_BUFFER; //0x8893
	
	public const GLenu GL_FRAMEBUFFER_COMPLETE; //0x8CD5
	public const GLenu GL_FRAMEBUFFER_UNDEFINED; //0x8219
	public const GLenu GL_FRAMEBUFFER_INCOMPLETE_ATTACHMENT; //0x8CD6
	public const GLenu GL_FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT; //0x8CD7
	public const GLenu GL_FRAMEBUFFER_INCOMPLETE_DRAW_BUFFER; //0x8CDB
	public const GLenu GL_FRAMEBUFFER_INCOMPLETE_READ_BUFFER; //0x8CDC
	public const GLenu GL_FRAMEBUFFER_UNSUPPORTED; //0x8CDD
	public const GLenu GL_FRAMEBUFFER_INCOMPLETE_MULTISAMPLE; //0x8D56
	public const GLenu GL_FRAMEBUFFER_INCOMPLETE_LAYER_TARGETS; //0x8DA8
	
	public const GLenu GL_STATIC_DRAW; //0x88E4
	public const GLenu GL_DYNAMIC_COPY; //0x88EA
	
	public const GLenu GL_MAX_COLOR_ATTACHMENTS; //0x8CDF
	public const GLenu GL_COLOR_ATTACHMENT0; //0x8CE0
	public const GLenu GL_COLOR_ATTACHMENT1; //0x8CE1
	public const GLenu GL_COLOR_ATTACHMENT2; //0x8CE2
	public const GLenu GL_COLOR_ATTACHMENT3; //0x8CE3
	public const GLenu GL_COLOR_ATTACHMENT4; //0x8CE4
	public const GLenu GL_COLOR_ATTACHMENT5; //0x8CE5
	public const GLenu GL_COLOR_ATTACHMENT6; //0x8CE6
	public const GLenu GL_COLOR_ATTACHMENT7; //0x8CE7
	public const GLenu GL_COLOR_ATTACHMENT8; //0x8CE8
	public const GLenu GL_COLOR_ATTACHMENT9; //0x8CE9
	public const GLenu GL_COLOR_ATTACHMENT10; //0x8CEA
	public const GLenu GL_COLOR_ATTACHMENT11; //0x8CEB
	public const GLenu GL_COLOR_ATTACHMENT12; //0x8CEC
	public const GLenu GL_COLOR_ATTACHMENT13; //0x8CED
	public const GLenu GL_COLOR_ATTACHMENT14; //0x8CEE
	public const GLenu GL_COLOR_ATTACHMENT15; //0x8CEF
	public const GLenu GL_DEPTH_ATTACHMENT; //0x8D00
	public const GLenu GL_STENCIL_ATTACHMENT; //0x8D20
	
	public const GLenu GL_RGBA32F; //0x8814
	public const GLenu GL_RGBA16F; //0x881A
	//  public const GLenu GL_BGRA; //0x80E1
	//  public const GLenu GL_BGR; //0x80E0
	public const GLenu GL_COMPRESSED_RGBA_S3TC_DXT1; //0x83F1
	public const GLenu GL_COMPRESSED_RGBA_S3TC_DXT3; //0x83F2
	public const GLenu GL_COMPRESSED_RGBA_S3TC_DXT5; //0x83F3
	
	//  public const GLenu GL_UNSIGNED_SHORT_1_5_5_5_REV; //0x8366
	//  public const GLenu GL_UNSIGNED_SHORT_5_6_5; //0x8363
	public const GLenu GL_DEPTH_COMPONENT24; //0x81A6
	
	//  public const GLenu GL_CLAMP_TO_EDGE; //0x812F
	//  public const GLenu GL_TEXTURE_WRAP_R; //0x8072
	public const GLenu GL_MIRRORED_REPEAT; //0x8370
	//  public const GLenu GL_TEXTURE_DEPTH; //0x8071
	public const GLenu GL_TEXTURE_MAX_ANISOTROPY; //0x84FE
	public const GLenu GL_MAX_TEXTURE_MAX_ANISOTROPY; //0x84FF
	public const GLenu GL_GENERATE_MIPMAP; //0x8191
	//  public const GLenu GL_TEXTURE_MAX_LEVEL; //0x813D
	
	//  public const GLenu GL_TEXTURE0; //0x84C0
	//  public const GLenu GL_TEXTURE_3D; //0x806F
	public const GLenu GL_TEXTURE_CUBE_MAP_SEAMLESS; //0x884F
	
	//  public const GLenu GL_MULTISAMPLE; //0x809D
	
	public const GLenu GL_TESS_CONTROL_SHADER; //0x8E88
	public const GLenu GL_TESS_EVALUATION_SHADER; //0x8E87
	public const GLenu GL_PATCH_VERTICES; //0x8E72

	public static void Draw(
		Microsoft.Xna.Framework.Vector2 pos, 
		Microsoft.Xna.Framework.Vector2 size, 
		bool reverse = false)
	{
		Begin(GL_TRIANGLES);
		if (reverse)
		{
			TexCoord2f(1, 1); Vertex3f(pos.X, pos.Y+size.Y, 0);
			TexCoord2f(1, 0); Vertex3f(pos.X, pos.Y, 0);
			TexCoord2f(0, 0); Vertex3f(pos.X+size.X, pos.Y, 0);
			
			TexCoord2f(1, 1); Vertex3f(pos.X, pos.Y+size.Y, 0);
			TexCoord2f(0, 1); Vertex3f(pos.X+size.X, pos.Y+size.Y, 0);
			TexCoord2f(0, 0); Vertex3f(pos.X+size.X, pos.Y, 0);
		}
		else
		{
			// bottom left
			TexCoord2f(0, 1); Vertex3f(pos.X, pos.Y+size.Y, 0);
			// top left
			TexCoord2f(0, 0); Vertex3f(pos.X, pos.Y, 0);
			// top right
			TexCoord2f(1, 0); Vertex3f(pos.X+size.X, pos.Y, 0);
			
			// bottom left
			TexCoord2f(0, 1); Vertex3f(pos.X, pos.Y+size.Y, 0);
			// bottom right
			TexCoord2f(1, 1); Vertex3f(pos.X+size.X, pos.Y+size.Y, 0);
			// top right
			TexCoord2f(1, 0); Vertex3f(pos.X+size.X, pos.Y, 0);
		}
		End();
	}

	public static void DrawBuffers(
		int count, 
		GLuint positionsBuffer, 
		GLuint texcoordsBuffer
		)
	{
		TexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, (GLint)GL_CLAMP_TO_EDGE);
		TexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, (GLint)GL_CLAMP_TO_EDGE);
		
		EnableClientState(GL_VERTEX_ARRAY);
		EnableClientState(GL_TEXTURE_COORD_ARRAY);
	
		BindBuffer(GL_ARRAY_BUFFER, positionsBuffer);
		VertexPointer(3, GL_FLOAT, 0, (GLvoid*)0);
		
		BindBuffer(GL_ARRAY_BUFFER, texcoordsBuffer);
		TexCoordPointer(2, GL_FLOAT, 0, (GLvoid*)0);
		
		DrawArrays(GL_TRIANGLES, 0, count * 6);
		
		BindBuffer(GL_ARRAY_BUFFER, 0);
		DisableClientState(GL_TEXTURE_COORD_ARRAY);  
		DisableClientState(GL_VERTEX_ARRAY);
	}

	public static int PushState(Microsoft.Xna.Framework.Vector2? camera=null, GLdouble nearVal=-1, GLdouble farVal=1) 
	{
		MatrixMode(GL_PROJECTION);
		PushMatrix();
		LoadIdentity();
		
		if (camera == null) {
		  	Ortho(0, 
				Microsoft.Xna.Framework.Corange.Width, 
				0, 
				Microsoft.Xna.Framework.Corange.Height, 
				nearVal, farVal);
		} else {
		  	Ortho(camera.X - Microsoft.Xna.Framework.Corange.Width / 2, 
				camera.X + Microsoft.Xna.Framework.Corange.Width / 2,
				-camera.Y + Microsoft.Xna.Framework.Corange.Height / 2,
				-camera.Y - Microsoft.Xna.Framework.Corange.Height / 2,
				nearVal, farVal);
		}
		
		MatrixMode(GL_MODELVIEW);
		PushMatrix();
		LoadIdentity();
		
		Enable(GL_TEXTURE_2D);
		
		Enable(GL_BLEND);
		BlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
		return 0;
	  
	}
	  
	public static void PopState() 
	{
		Disable(GL_BLEND);
		Disable(GL_TEXTURE_2D);  
		
		MatrixMode(GL_PROJECTION);
		PopMatrix();
		
		MatrixMode(GL_MODELVIEW);
		PopMatrix();
	}
}

[Version (since = "0.8.0")]
[CCode (cprefix = "", lower_case_cprefix = "", cheader_filename = "corange.h")]
namespace Microsoft.Xna.Framework {

	[CCode (cname = "override_free")]
	public static void override_free(void* o) {}
	
	[CCode (cname = "override_free")]
	public static void ref_function(void* o) {}

	[CCode (cname = "override_free")]
	public static void unref_function(void* o) {}

	public static void corange_init(string core_assets_path);
	public static void corange_finish();

	[SimpleType, CCode (cname = "type_id")]
	public struct TypeId : int {}

	// base pseudo class for void* based objects
	[SimpleType, CCode (cname = "CObject")]
	public struct CObject {}

	[SimpleType, CCode (cname = "CObject")]
	public struct Component { }


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
			return (string)this.ptr;
		}
		public unowned string ToString() {
			return (string)this.ptr;
		}
	}
	
	[SimpleType, CCode (cname = "asset_hndl", cprefix="")]
	public struct AssetHandle 
	{
		private URI path;
		private CObject ptr;
		private uint32 timestamp;

		[CCode (cname = "asset_hndl_new")]
		public AssetHandle(URI path);
		[CCode (cname = "asset_hndl_null")]
		public static AssetHandle Null();
		[CCode (cname = "asset_hndl_new_load")]
		public static AssetHandle Load(URI path);
		[CCode (cname = "asset_hndl_new_ptr")]
		public static AssetHandle AssetPtr(CObject as);
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

	public Asset* asset_hndl_ptr(ref AssetHandle ah);

	public void asset_cache_flush();
	public void asset_init();
	public void asset_finish();
	public void asset_add_path_variable(URI variable, URI mapping);
	public URI asset_map_filename(URI filename);
	public URI asset_unmap_filename(URI filename);

	public void file_load(URI filename);
	public void file_unload(URI filename);
	public void file_reload(URI filename);
	public bool file_isloaded(URI path);
	public bool file_exists(URI path);
	
	public void folder_load(URI folder);
	public void folder_unload(URI folder);
	public void folder_reload(URI folder);
	public void folder_load_recursive(URI folder);
		
	[CCode (has_target = false)]
	public delegate Entity AssetLoader(string filenanme);
	[CCode (has_target = false)]
	public delegate void AssetDeleter(Entity asset);
	
	public CObject asset_get_load(URI path);
	[CCode (cname = "asset_get")]
	public CObject asset_get(URI path);
	[CCode (cname = "asset_get_as_type")]
	public CObject asset_get_as(URI path, TypeId type);
	public void asset_reload_type_id(TypeId type);
	public void asset_reload_all();
	[CCode(cname = "asset_handler_cast")]
	public void asset_handler(int type, string extension, AssetLoader funca, AssetDeleter funcd);
	public unowned string asset_ptr_path(CObject asset);
	public unowned string asset_ptr_typename(CObject asset);

	[SimpleType, CCode (cname = "CObject", cprefix="")]
	public struct Sound 
	{
		[CCode (cname = "audio_sound_play")]
		public static void Play(CObject s, int loops=0);
		[CCode (cname = "audio_sound_pause")]
		public static void Pause();
		[CCode (cname = "audio_sound_resume")]
		public static void Resume();
		[CCode (cname = "audio_sound_stop")]
		public static void Stop();
	}
	
	[SimpleType, CCode (cname = "CObject", cprefix="")]
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
	public void audio_init();
	public void audio_finish();

	public int audio_sound_play(CObject s, int loops);
	public void audio_sound_pause(int channel);
	public void audio_sound_resume(int channel);
	public void audio_sound_stop(int channel);

	public void audio_music_play(Assets.Music m);
	public void audio_music_pause();
	public void audio_music_resume();
	public void audio_music_stop();

	public void audio_music_set_volume(float volume);
	public float audio_music_get_volume();

	[CCode (has_target = false)]
	public delegate Entity ElemNew();

	[CCode (has_target = false)]
	public delegate void ElemDel(Entity entity);


	[SimpleType, CCode (cname = "CObject", cprefix="")]
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
		public static CObject Load(URI path);
		[CCode (cname = "asset_get")]
		public static CObject Get(URI path);
		[CCode (cname = "asset_get_as_type")]
		public static CObject As(URI path, TypeId type);
		[CCode (cname = "asset_reload_type_id")]
		public static void ReloadTypeId(TypeId type);
		[CCode (cname = "asset_reload_all")]
		public static void ReloadAll();
		[CCode(cname = "asset_handler_cast")]
		public static void Handler(int type, string extension, AssetLoader funca, AssetDeleter funcd);
		[CCode (cname = "asset_ptr_path")]
		public static unowned string PtrPath(CObject asset);
		[CCode (cname = "asset_ptr_typename")]
		public static unowned string PtrTypename(CObject asset);
	}

	[SimpleType, CCode (cname = "CObject", cprefix="")]
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
		public static unowned string Name(CObject* e);
		[CCode (cname = "entity_delete")]
		public static void Delete(char* fmt, ...);
		[CCode (cname = "entity_type_count_type_id")]
		public static int Count(TypeId id);
		// [CCode (cname = "entities_get_type_id")]
		// public static void Array(CObject* result, out int count, TypeId id);

		[CCode (cname = "type_find")]
		public static int Register(string type, size_t size);

	}

	[SimpleType, CCode (cname = "CObject", cprefix="")]
	public struct EntityManager //Entities 
	{
		[CCode (cname = "entities_new_type_id")]
		public static void Create(string name_format, int count, TypeId id);
		public static int Get(CObject* result, TypeId id)
		{
			int count;
			entities_get(result, out count, id);
			return count;

		}
		// [CCode (cname = "entities_get_type_id")]
		// public static void Get(CObject* result, out int count, TypeId id);
	
	}

	[CCode (cname = "entity_handler_cast")]
	public void entity_handler(int TypeId, ElemNew entity_new, ElemDel entity_del);

	[CCode (cname = "entity_new_type_id")]
	public CObject entity_new(string fmt, TypeId id, ...);
	
	[CCode (cname = "entities_new_type_id")]
	public void entities_new(string name_format, int count, TypeId id);

	[CCode (cname = "entities_get_type_id")]
	public void entities_get(CObject* result, out int count, TypeId id);

	[CCode (cname = "entity_get")]
	public CObject entity_get(string fmt, ...);

	[CCode (cname = "entity_get_as_type_id")]
	public CObject entity_get_as(string fmt, TypeId id, ...);

	[CCode (cname = "entity_name")]
	public unowned string entity_name(CObject* e);

	[CCode (cname = "entity_delete")]
	public void entity_delete(char* fmt, ...);

	[CCode (cname = "entity_type_count_type_id")]
	public int entity_type_count(TypeId id);

	[CCode (has_target = false)]
	public delegate void ErrorFunc (string message);

	[CCode (has_target = false)]
	public delegate void WarnFunc (string message);
	
	[CCode (has_target = false)]
	public delegate void DebugFunc (string message);

	public void at_error(ErrorFunc func);
	public void at_warning(WarnFunc func);
	public void at_debug(DebugFunc func);

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

 	public void timestamp(string outs);
	public void frame_begin();
	public void frame_end();
	public double frame_rate();
	public double frame_time();
	public unowned string frame_rate_string();
	public int rawcast(float x);
	public float max(float x, float y);
	public float min(float x, float y);
	public float clamp(float x, float bottom, float top);
	public bool between(float x, float bottom, float top);
	public bool between_or(float x, float bottom, float top);
	public float saturate(float x);
	public float lerp(float p1, float p2, float amount);
	public float smoothstep(float p1, float p2, float amount);
	public float smootherstep(float p1, float p2, float amount);
	public float cosine_interp(float p1, float p2, float amount);
	public float nearest_interp(float p1, float p2, float amount);
	public float cubic_interp(float p1, float p2, float p3, float p4, float amount);
	public float binearest_interp(float tl, float tr, float bl, float br, float x_amount, float y_amount);
	public float bilinear_interp(float tl, float tr, float bl, float br, float x_amount, float y_amount);
	public float bicosine_interp(float tl, float tr, float bl, float br, float x_amount, float y_amount);
	public float bismoothstep_interp(float tl, float tr, float bl, float br, float x_amount, float y_amount);
	public float bismootherstep_interp(float tl, float tr, float bl, float br, float x_amount, float y_amount);

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

	public Vector3 triangle_tangent(Vertex v1, Vertex v2, Vertex v3);
	public Vector3 triangle_binormal(Vertex v1, Vertex v2, Vertex v3);
	public Vector3 triangle_normal(Vertex v1, Vertex v2, Vertex v3);
	public Vector3 triangle_random_position(Vertex v1, Vertex v2, Vertex v3);
	public float triangle_area(Vertex v1, Vertex v2, Vertex v3);
	
	public float triangle_difference_u(Vertex v1, Vertex v2, Vertex v3);
	public float triangle_difference_v(Vertex v1, Vertex v2, Vertex v3);
	
	public Vertex triangle_random_position_interpolation(Vertex v1, Vertex v2, Vertex v3);
	
	public float tween_approach(float curr, float target, float timestep, float steepness);
	public float tween_linear(float curr, float target, float timestep, float max);
	
	public Vector3 vec3_tween_approach(Vector3 curr, Vector3 target, float timestep, float steepness);
	public Vector3 vec3_tween_linear(Vector3 curr, Vector3 target, float timestep, float max);
	
	public static void graphics_set_vsync(bool vsync);
	public static void graphics_set_multisamples(int samples);
	public static void graphics_set_fullscreen(bool fullscreen);
	public static void graphics_set_antialiasing(int quality);
	public static GLib.IntPtr graphics_context_new();
	public static void graphics_context_delete(GLib.IntPtr context);
	public static void graphics_context_current(GLib.IntPtr context);
	public static int graphics_get_multisamples();
	public static bool graphics_get_fullscreen();
	public static int graphics_get_antialiasing();
	public static void graphics_viewport_set_title(string title);
	public static void graphics_viewport_set_icon(URI icon);
	public static void graphics_viewport_set_position(int x, int y);
	public static void graphics_viewport_set_size(int w, int h);
	public static void graphics_viewport_screenshot();
	public static string graphics_viewport_title();
	public static int graphics_viewport_height();
	public static int graphics_viewport_width();
	public static double graphics_viewport_ratio();
	public static void graphics_set_cursor_hidden(bool hidden);
	public static bool graphics_get_cursor_hidden();
	public static void graphics_swap();

	
	[SimpleType, CCode (cname = "audio")]
	public struct Audio : uint64 {
		public static void init();
		public static void finish();
		
		public int play(int loops);
		public static void pause(int channel);
		public static void resume(int channel);
		public static void stop(int channel);
		
	}

	//  [SimpleType, CCode (cname = "music")]
	//  public struct Music : uint64 {
	//  	public static Music mp3_load_file(string filename);
	//  	public static Music ogg_load_file(string filename);
	//  	public void delete();
	//  	public void play();
	//  	public static void pause();
	//  	public static void resume();
	//  	public static void stop();
		
	//  	public static void set_volume(float volume);
	//  	public static float get_volume();
	//  }

	//  [SimpleType, CCode (cname = "sound")]
	//  public struct Sound : uint64 {
	//  	public static Sound wav_load_file(string filename);
	//  	public void delete();
		
	//  	public int play();
	//  	public int play_looped(int loops);
		
	//  	public int play_at(Vector3 pos, Vector3 cam_pos, Vector3 cam_dir);
	//  	public int play_at_looped(Vector3 pos, Vector3 cam_pos, Vector3 cam_dir, int loops);
	//  }

	// [CCode (cname = "MAX_STICKS")]
	// public const int MAX_STICKS;

	// [SimpleType, CCode (cname = "joystick")]
	// public struct Joystick {
	// 	public static void init();
	// 	public static void finish();
		
	// 	public static int count();
	// 	public static CObject get(int i);
	// }
	
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

	//  collision (*colfunc)(CObject x, vec3* pos, vec3* vel)

	[CCode (has_target = false)]
	public delegate Collision ColFunc (CObject obj, ref Vector3 pos, ref Vector3 vel);
	
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
		public static void collisionResponseSlide(CObject obj, ref Vector3 pos, ref Vector3 vel, ColFunc func);
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
	
	namespace Assets {

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
			public GL.GLuint blendSrc;
			[CCode (cname = "blend_dst")]
			public GL.GLuint blendDst;
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
			public GL.GLuint shader;

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
			GL.GLuint handle();
		}

		[Compact, CCode (cname = "shader_program", cprefix="", free_function = "override_free")]
		public class ShaderProgram {
			public GL.GLuint shader;

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
			public GL.GLuint handle();
			[CCode (cname = "shader_program_get_attribute")]
			public GL.GLint getAttribute(string name);
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
			public void setTextureId(string name, int index, GL.GLint t);
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
			public GL.GLuint vertexVbo;
			[CCode (cname = "triangle_vbo")]
			public GL.GLuint triangleVbo;
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
			public GL.GLuint vertexBuffer;
			[CCode (cname = "num_indicies")]
			public int numIndicies[7];
			[CCode (cname = "index_buffers")]
			public GL.GLuint indexBuffers[7];
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
			public GL.GLuint _handle;
			[CCode (cname = "type")]
			public GL.GLenu _type;
			[CCode (cname = "texture_new")]
			public Texture();
			[CCode (cname = "texture_new_handle")]
			public static Texture new_handle(GL.GLuint h);
			[CCode (cname = "texture_delete")]
			public void delete();
			[CCode (cname = "texture_handle")]
			public GL.GLuint handle();
			public static GL.GLuint GL(string path) {
				return ((Texture)Asset.Get(URI(path))).handle();
			}			
			[CCode (cname = "texture_type")]
			public GL.GLenu type();
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

	namespace Data {
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
			public Bucket(string s, CObject item);
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
			public CObject popBack();
			[CCode (cname = "list_pop_at")]
			public CObject popAt(int index);
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

	namespace Rendering {
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
			public GL.GLuint gfbo;
			[CCode (cname = "gdepth_buffer")]
			public GL.GLuint gdepthBuffer;
			[CCode (cname = "gdiffuse_buffer")]
			public GL.GLuint gdiffuseBuffer;
			[CCode (cname = "gnormals_buffer")]
			public GL.GLuint gnormalsBuffer;

			[CCode (cname = "gdiffuse_texture")]
			public GL.GLuint gdiffuseTexture;
			[CCode (cname = "gnormals_texture")]
			public GL.GLuint gnormalsTexture;
			[CCode (cname = "gdepth_texture")]
			public GL.GLuint gdepthTexture;

			[CCode (cname = "ssao_fbo")]
			public GL.GLuint ssaoFbo;
			[CCode (cname = "ssao_buffer")]
			public GL.GLuint ssaoBuffer;
			[CCode (cname = "ssao_texture")]
			public GL.GLuint ssaoTexture;

			[CCode (cname = "hdr_fbo")]
			public GL.GLuint hdrFbo;
			[CCode (cname = "hdr_buffer")]
			public GL.GLuint hdrBuffer;
			[CCode (cname = "hdr_texture")]
			public GL.GLuint hdrTexture;

			[CCode (cname = "ldr_front_fbo")]
			public GL.GLuint ldrFrontFbo;
			[CCode (cname = "ldr_front_buffer")]
			public GL.GLuint ldrFrontBuffer;
			[CCode (cname = "ldr_front_texture")]
			public GL.GLuint ldrFrontTexture;

			[CCode (cname = "ldr_back_fbo")]
			public GL.GLuint ldrBackFbo;
			[CCode (cname = "ldr_back_buffer")]
			public GL.GLuint ldrBackBuffer;
			[CCode (cname = "ldr_back_texture")]
			public GL.GLuint ldrBackTexture;

			[CCode (cname = "shadows_fbo")]
			public GL.GLuint shadowsFbo[3];
			[CCode (cname = "shadows_buffer")]
			public GL.GLuint shadowsBuffer[3];
			[CCode (cname = "shadows_texture")]
			public GL.GLuint shadowsTexture[3];

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

	namespace entities {
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
			public GL.GLuint vertexBuff;
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
			public GL.GLuint worldBuffer;
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

	namespace UI {

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
			public CObject onclickData;
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
			public void SetOnclickData(CObject data);
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
		public delegate void OnClick(Button entry, CObject data);

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
			public GL.GLuint positionsBuffer;
			[CCode (cname = "texcoords_buffer")]
			public GL.GLuint texcoordsBuffer;
			[CCode (cname = "colors_buffer")]
			public GL.GLuint colorsBuffer;
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
			public GL.GLenu blendSrc;
			[CCode (cname = "blend_dst")]
			public GL.GLenu blendDst;
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
			public void blend(GL.GLenu blend_src, GL.GLenu blend_dst);
			[CCode (cname = "ui_rectangle_position")]
			public Vector2 position();
			[CCode (cname = "ui_rectangle_size")]
			public Vector2 size();
		}
	}
}
/**
The MIT License (MIT)
Copyright (c) <2018> DarkOverlordOfData <SDL2.0 vapi>

@see Xna.Framework/SDL/SDL2.cs

*/
namespace GLib 
{
	/** Use P/Invoke semantics */
	[Compact, CCode (cname="gconstpointer", ref_function = "", unref_function = "")]
	public class IntPtr 
	{ 
		public static IntPtr Zero { get { return (IntPtr)0; } }
		public static int Size { get { return (int)sizeof(IntPtr); } }
	}

}
[CCode (cheader_filename = "SDL2/SDL.h")]
namespace Sdl 
{

	private unowned string GetString(GLib.IntPtr handle)
	{
		if (handle == GLib.IntPtr.Zero) return "";

		var ptr = (char*)handle;
        while (*ptr != 0)
			ptr++;
			
		var len = ptr - (char*)handle;
		var bytes = new char[len];
		return (string) GLib.Memory.copy(bytes, handle, len);
	} 

	[SimpleType, CCode (cname = "SDL_JoystickGUID")]
	public struct Guid
	{
		[CCode (cname = "data", has_length = false)]
		public uint8 Data[16];

		public string to_string()
		{
			return "%02x%02x%02x%02x-%02x%02x-%02x%02x-%02x%02x-%02x%02x%02x%02x%02x%02x".printf(
				Data[0], Data[1], Data[2], Data[3], Data[4], Data[5], Data[6], Data[7],
				Data[8], Data[9], Data[10], Data[11], Data[12], Data[13], Data[14], Data[15]);
		}
	}
	  
	[Flags]
	public enum InitFlags 
	{
		[CCode (cname = "SDL_INIT_VIDEO")]
		Video,
		[CCode (cname = "SDL_INIT_JOYSTICK")]
		Joystick,
		[CCode (cname = "SDL_INIT_HAPTIC")]
		Haptic,
		[CCode (cname = "SDL_INIT_GAMECONTROLLER")]
		GameController
	}


	[CCode (cname = "SDL_EventType", cheader_filename = "SDL2/SDL_events.h")]
	public enum EventType 
	{
		[CCode (cname = "SDL_FIRSTEVENT")]
		First, 
		[CCode (cname = "SDL_QUIT")]
		Quit,

		[CCode (cname = "SDL_WINDOWEVENT")]
        WindowEvent,
		[CCode (cname = "SDL_SYSWMEVENT")]
        SysWM,

		[CCode (cname = "SDL_KEYDOWN")]
        KeyDown,
		[CCode (cname = "SDL_KEYUP")]
        KeyUp,
		[CCode (cname = "SDL_TEXTEDITING")]
        TextEditing,
		[CCode (cname = "SDL_TEXTINPUT")]
        TextInput,

		[CCode (cname = "SDL_MOUSEMOTION")]
        MouseMotion,
		[CCode (cname = "SDL_MOUSEBUTTONDOWN")]
        MouseButtonDown,
		[CCode (cname = "SDL_MOUSEBUTTONUP")]
        MouseButtonup,
		[CCode (cname = "SDL_MOUSEWHEEL")]
        MouseWheel,

		[CCode (cname = "SDL_JOYAXISMOTION")]
        JoyAxisMotion,
		[CCode (cname = "SDL_JOYBALLMOTION")]
        JoyBallMotion,
		[CCode (cname = "SDL_JOYHATMOTION")]
        JoyHatMotion,
		[CCode (cname = "SDL_JOYBUTTONDOWN")]
        JoyButtonDown,
		[CCode (cname = "SDL_JOYBUTTONUP")]
        JoyButtonUp,
		[CCode (cname = "SDL_JOYDEVICEADDED")]
        JoyDeviceAdded,
		[CCode (cname = "SDL_JOYDEVICEREMOVED")]
        JoyDeviceRemoved,

		[CCode (cname = "SDL_CONTROLLERAXISMOTION")]
        ControllerAxisMotion,
		[CCode (cname = "SDL_CONTROLLERBUTTONDOWN")]
        ControllerButtonDown,
		[CCode (cname = "SDL_CONTROLLERBUTTONUP")]
        ControllerButtonUp,
		[CCode (cname = "SDL_CONTROLLERDEVICEADDED")]
        ControllerDeviceAdded,
		[CCode (cname = "SDL_CONTROLLERDEVICEREMOVED")]
        ControllerDeviceRemoved,
		[CCode (cname = "SDL_CONTROLLERDEVICEREMAPPED")]
        ControllerDeviceRemapped,

		[CCode (cname = "SDL_FINGERDOWN")]
        FingerDown,
		[CCode (cname = "SDL_FINGERUP")]
        FingerUp,
		[CCode (cname = "SDL_FINGERMOTION")]
        FingerMotion,

		[CCode (cname = "SDL_DOLLARGESTURE")]
        DollarGesture,
		[CCode (cname = "SDL_DOLLARRECORD")]
        DollarRecord,
		[CCode (cname = "SDL_MULTIGESTURE")]
        MultiGesture,

		[CCode (cname = "SDL_CLIPBOARDUPDATE")]
        ClipboardUpdate,

		[CCode (cname = "SDL_DROPFILE")]
        DropFile,

		[CCode (cname = "SDL_AUDIODEVICEADDED")]
        AudioDeviceAdded,
		[CCode (cname = "SDL_AUDIODEVICEREMOVED")]
        AudioDeviceRemoved,

		[CCode (cname = "SDL_RENDER_TARGETS_RESET")]
        RenderTargetsReset,
		[CCode (cname = "SDL_RENDER_DEVICE_RESET")]
        RenderDeviceReset,

		[CCode (cname = "SDL_USEREVENT")]
        UserEvent,

		[CCode (cname = "SDL_LASTEVENT")]
        Last

	}

	[SimpleType, CCode (cname = "SDL_CommonEvent", cheader_filename = "SDL2/SDL_events.h")]
	public struct CommonEvent  
	{
		[CCode (cname = "type")]
		public Sdl.EventType Type;
		[CCode (cname = "timestamp")]
		public uint32 Timestamp;
	}


	[CCode (cname = "SDL_eventaction", cheader_filename = "SDL2/SDL_events.h")]
	public enum EventAction 
	{
		[CCode (cname = "SDL_ADDEVENT")]
		AddEvent, 
		[CCode (cname = "SDL_PEEKEVENT")]
		PeekEvent, 
		[CCode (cname = "SDL_GETEVENT")]
		GetEvent
	}

	[SimpleType, CCode (cname = "SDL_Event", cheader_filename = "SDL2/SDL_events.h")]
	public struct Event 
	{
		[CCode (cname = "type")]
		public Sdl.EventType Type;
		[CCode (cname = "window")]
		public Sdl.Window.Event Window;
		[CCode (cname = "key")]
		public Sdl.Keyboard.Event Key;
		[CCode (cname = "motion")]
		public Sdl.Mouse.MotionEvent Motion;
		[CCode (cname = "edit")]
		public Sdl.Keyboard.TextEditingEvent Edit;
		[CCode (cname = "text")]
		public Sdl.Keyboard.TextInputEvent Text;
		[CCode (cname = "wheel")]
		public Sdl.Mouse.WheelEvent Wheel;
		[CCode (cname = "jdevice")]
		public Sdl.Joystick.DeviceEvent JoystickDevice;
		[CCode (cname = "cdevice")]
		public Sdl.GameController.DeviceEvent ControllerDevice;
	}

	[SimpleType, CCode (cname = "SDL_Point", cheader_filename = "SDL2/SDL_rect.h")]
	public struct Point {
		[CCode (cname = "x")]
		public int X;
		[CCode (cname = "y")]
		public int Y;
	}

	[SimpleType, CCode (cname = "SDL_Rect", cheader_filename = "SDL2/SDL_rect.h")]
	public struct Rect : Point
	{
		[CCode (cname = "w")]
		public int Width;
		[CCode (cname = "h")]
		public int Height;
	}

	[SimpleType, CCode (cname = "SDL_version", cheader_filename = "SDL2/SDL_version.h")]
	public struct Version 
	{
		[CCode (cname = "major")]
		public uint8 Major;
		[CCode (cname = "minor")]
		public uint8 Minor;
		[CCode (cname = "patch")]
		public uint8 Patch;
	}

	[CCode (cname = "SDL_RWops")]
	public struct RWops
	{
		[CCode (cname = "type")]
		public uint32 Type;
	}
	
	[CCode (cname = "SDL_Init")]
	private static int SDL_Init(int flags);
	
	public static int Init(int flags) {
		GetErrorInt(SDL_Init(flags));
	}
		

	[CCode (cname = "SDL_GL_GetCurrentWindow")]
	public static GLib.IntPtr GetCurrentWindow ();

	[CCode (cname = "SDL_DisableScreenSaver")]
	public static void DisableScreenSaver ();

	[CCode (cname = "SDL_GetVersion")]
	public static void GetVersion (out Version v);

	[CCode (cname = "SDL_PollEvent")]
	public static int PollEvent (out Sdl.Event ev);

	[CCode (cname = "SDL_PumpEvents")]
	public static void PumpEvents ();

	[CCode (cname = "SDL_PeepEvents")]
	public static void PeepEvents (Sdl.Event[] events, EventAction action,
		uint32 minType, uint32 maxType);

	[CCode (cname = "SDL_CreateRGBSurfaceFrom")]
	public GLib.IntPtr CreateRGBSurfaceFrom (GLib.IntPtr pixels, int width, int height, int depth,
		int pitch, uint32 rMask, uint32 gMask, uint32 bMask, uint32 aMask);

	[CCode (cname = "SDL_FreeSurface")]
		public void FreeSurface(GLib.IntPtr surface);

	[CCode (cname = "SDL_GetError")]
	public static unowned string SDL_GetError ();

	//  private string getErrorStr()
	//  {
	//  	return GetString(SDL_GetError());
	//  }

    private int GetErrorInt(int value)
    {
        if (value < 0)
			GLib.stdout.printf(SDL_GetError());
		return value;
	}

	private GLib.IntPtr GetErrorPtr(string name, GLib.IntPtr? pointer)
    {
		if (pointer == GLib.IntPtr.Zero)
			GLib.stdout.printf("%s: %s\n", name, SDL_GetError());
		return pointer;
	}
	
	[CCode (cname = "SDL_ClearError")]
    public static extern void ClearError();
	
	[CCode (cname = "SDL_GetHint", cheader_filename = "SDL2/SDL_hints.h")]
	public static unowned string GetHint (string name);

	[CCode (cname = "SDL_LoadBMP_RW")]
	public GLib.IntPtr LoadBMP_RW (GLib.IntPtr src, int freesrc = 0);

	[CCode (cname = "SDL_Quit")]
	public static void Quit ();

	[CCode (cname = "SDL_RWFromMem")]
	public static RWops* RWFromMem (void* mem, int size);

	[CCode (cname = "SDL_RWFromFile")]
	public static RWops* RWFromFile (string file, string mode);

	[CCode (cname = "SDL_RWread")]
	public static size_t RWread (RWops* rw, void* ptr, size_t size, size_t maxnum);
	
	[CCode (cname = "SDL_SetHint", cheader_filename = "SDL2/SDL_hints.h")]
	public static bool SetHint (string name, string hintValue);

	[CCode (cname = "SDL_GetPerformanceFrequency")]
	public static uint64 GetPerformanceFrequency();

	[CCode (cname = "SDL_GetPerformanceCounter")]
	public static uint64 GetPerformanceCounter();
			
	[CCode (cname = "SDL_Delay")]
	public static void Delay(uint32 ms);
			
	

	[CCode (cname = "SDL_Window", cheader_filename = "SDL2/SDL_video.h")]
	public class Window 
	{
		[CCode (cname = "SDL_WINDOWPOS_UNDEFINED_MASK")]
		public static const uint8 PosUndefined;

		[CCode (cname = "SDL_WINDOWPOS_CENTERED_MASK")]
		public static const uint8 PosCentered;

		[CCode (cname = "SDL_WindowEventID", cheader_filename = "SDL2/SDL_events.h")]
		public enum EventId 
		{
			[CCode (cname = "SDL_WINDOWEVENT_NONE")]
			None, 
			[CCode (cname = "SDL_WINDOWEVENT_SHOWN")]
            Shown,
			[CCode (cname = "SDL_WINDOWEVENT_HIDDEN")]
            Hidden,
			[CCode (cname = "SDL_WINDOWEVENT_EXPOSED")]
            Exposed,
			[CCode (cname = "SDL_WINDOWEVENT_MOVED")]
            Moved,
			[CCode (cname = "SDL_WINDOWEVENT_RESIZED")]
            Resized,
			[CCode (cname = "SDL_WINDOWEVENT_SIZE_CHANGED")]
            SizeChanged,
			[CCode (cname = "SDL_WINDOWEVENT_MINIMIZED")]
            Minimized,
			[CCode (cname = "SDL_WINDOWEVENT_MAXIMIZED")]
            Maximized,
			[CCode (cname = "SDL_WINDOWEVENT_RESTORED")]
            Restored,
			[CCode (cname = "SDL_WINDOWEVENT_ENTER")]
            Enter,
			[CCode (cname = "SDL_WINDOWEVENT_LEAVE")]
            Leave,
			[CCode (cname = "SDL_WINDOWEVENT_FOCUS_GAINED")]
            FocusGained,
			[CCode (cname = "SDL_WINDOWEVENT_FOCUS_LOST")]
            FocusLost,
			[CCode (cname = "SDL_WINDOWEVENT_CLOSE")]
            Close,
		}

		[Flags, CCode (cname = "SDL_WindowFlags", cheader_filename = "SDL2/SDL_video.h")]
		public enum State 
		{
			[CCode (cname = "SDL_WINDOW_FULLSCREEN")] 
			Fullscreen,
			[CCode (cname = "SDL_WINDOW_OPENGL")] 
			OpenGL,
			[CCode (cname = "SDL_WINDOW_SHOWN")] 
			Shown,
			[CCode (cname = "SDL_WINDOW_HIDDEN")] 
			Hidden,
			[CCode (cname = "SDL_WINDOW_BORDERLESS")] 
			Borderless,
			[CCode (cname = "SDL_WINDOW_RESIZABLE")] 
			Resizable,
			[CCode (cname = "SDL_WINDOW_MINIMIZED")] 
			Minimized,
			[CCode (cname = "SDL_WINDOW_MAXIMIZED")] 
			Maximized,
			[CCode (cname = "SDL_WINDOW_GRABBED")] 
			Grabbed,
			[CCode (cname = "SDL_WINDOW_INPUT_FOCUS")] 
			InputFocus,
			[CCode (cname = "SDL_WINDOW_MOUSE_FOCUS")] 
			MouseFocus,
			[CCode (cname = "SDL_WINDOW_FULLSCREEN_DESKTOP")] 
			FullscreenDesktop,
			[CCode (cname = "SDL_WINDOW_FOREIGN")] 
			Foreign,
			[CCode (cname = "SDL_WINDOW_ALLOW_HIGH_DPI")] 
			AllowHighDPI,
			[CCode (cname = "SDL_WINDOW_MOUSE_CAPTURE")] 
			MouseCapture
		}

		[SimpleType, CCode (cname = "SDL_WindowEvent", cheader_filename = "SDL2/SDL_events.h")]
		public struct Event : CommonEvent
		{
			[CCode (cname = "windowID")]
			public uint32 WindowID;
			[CCode (cname = "event")]
			public EventId EventID;
			[CCode (cname = "data1")]
			public int32 Data1;
			[CCode (cname = "data2")]
			public int32 Data2;
		}

		[CCode (cname = " SDL_SYSWM_TYPE", cheader_filename = "SDL2/SDL_syswm.h")]
		public enum SysWMType 
		{
			[CCode (cname = "SDL_SYSWM_UNKNOWN")] 
            Unknow,
			[CCode (cname = "SDL_SYSWM_WINDOWS")] 
            Windows,
			[CCode (cname = "SDL_SYSWM_X11")] 
			X11, 
			[CCode (cname = "SDL_SYSWM_DIRECTFB")] 
            Directfb,
			[CCode (cname = "SDL_SYSWM_COCOA")] 
            Cocoa,
			[CCode (cname = "SDL_SYSWM_UIKIT")] 
            UiKit,
			[CCode (cname = "SDL_SYSWM_WAYLAND")] 
            Wayland,
			[CCode (cname = "SDL_SYSWM_MIR")] 
            Mir,
			[CCode (cname = "SDL_SYSWM_WINRT")] 
            WinRt,
			[CCode (cname = "SDL_SYSWM_ANDROID")] 
            Android
		}
		
		[CCode (cname = "SDL_SysWMinfo", cheader_filename = "SDL2/SDL_syswm.h")]
		public struct SDL_SysWMinfo 
		{
			[CCode (cname = "version")]
			public Sdl.Version Version;
			[CCode (cname = "subsystem")]
			public SysWMType Subsystem;
			[CCode (cname = "window")]
			public GLib.IntPtr Window;
		}

		[CCode (cname = "SDL_CreateWindow")]
		private static GLib.IntPtr SDL_CreateWindow (string title, int x, int y, int w, int h, uint32 flags);

		public static GLib.IntPtr Create(string title, int x, int y, int w, int h, uint32 flags) 
		{
			return GetErrorPtr("SDL_CreateWindow", SDL_CreateWindow(title, x, y, w, h, flags));
		}

		[CCode (cname = "SDL_DestroyWindow")]
        public static void Destroy(GLib.IntPtr window);
		
		[CCode (cname = "SDL_GetWindowDisplayIndex")]
        private static int SDL_GetWindowDisplayIndex(GLib.IntPtr window);
		
        public static int GetDisplayIndex(GLib.IntPtr window)
        {
            return GetErrorInt(SDL_GetWindowDisplayIndex(window));
        }

		[CCode (cname = "SDL_GetWindowFlags")]
		public static uint32 GetWindowFlags (GLib.IntPtr window);
	
		[CCode (cname = "SDL_SetWindowIcon")]
		public static void SetIcon (GLib.IntPtr window, GLib.IntPtr icon);

		[CCode (cname = "SDL_GetWindowPosition")]
		public static void GetPosition (GLib.IntPtr window, out int x, out int y);
		
		[CCode (cname = "SDL_GetWindowSize")]
		public static void GetSize (GLib.IntPtr window, out int w, out int h);
		
		[CCode (cname = "SDL_SetWindowBordered")]
		public static void SetBordered (GLib.IntPtr window, bool int);

		[CCode (cname = "SDL_SetWindowFullscreen")]
		private static int SDL_SetWindowFullscreen (GLib.IntPtr window, int flags);

        public static void SetFullscreen(GLib.IntPtr window, int flags)
        {
            GetErrorInt(SDL_SetWindowFullscreen(window, flags));
        }

		[CCode (cname = "SDL_SetWindowPosition")]
		public static void SetPosition (GLib.IntPtr window, int x, int y);
	
		[CCode (cname = "SDL_SetWindowResizable")]
		public static void SetResizable (GLib.IntPtr window, bool resizable);
	
		[CCode (cname = "SDL_SetWindowSize")]
		public static void SetSize (GLib.IntPtr window, int w, int h);

		[CCode (cname = "SDL_SetWindowTitle")]
		public static void SetTitle (GLib.IntPtr window, string title);

		[CCode (cname = "SDL_ShowWindow")]
		public static void Show (GLib.IntPtr window);

		[CCode (cname = "SDL_GetWindowWMInfo", cheader_filename = "SDL2/SDL_syswm.h")]
		public bool GetWindowWMInfo (GLib.IntPtr window, ref SDL_SysWMinfo sysWMinfo);

        [CCode (cname = "SDL_GetWindowBordersSize")]
        public static int GetBorderSize(GLib.IntPtr window, out int top, out int left, out int right, out int bottom);
		
	}

	public class Display 
	{
		[CCode (cname = "SDL_DisplayMode", cheader_filename = "SDL2/SDL_video.h")]
		public struct Mode 
		{
			[CCode (cname = "format")]
			public uint Format;
			[CCode (cname = "w")]
			public int Width;
			[CCode (cname = "h")]
			public int Height;
			[CCode (cname = "refresh_rate")]
			public int RefreshRate;
			[CCode (cname = "driverdata")]
			public GLib.IntPtr DriverData;
		}
	
		[CCode (cname = "SDL_GetDisplayBounds")]
		private static int SDL_GetDisplayBounds (int displayIndex, out Rect rect);

        public static void GetBounds(int displayIndex, out Rect rect)
        {
            GetErrorInt(SDL_GetDisplayBounds(displayIndex, out rect));
		}
		
		[CCode (cname = "SDL_GetCurrentDisplayMode")]
		private static int SDL_GetCurrentDisplayMode (int displayIndex, out Mode mode);

		public static void GetCurrentDisplayMode(int displayIndex, out Mode mode)
        {
            GetErrorInt(SDL_GetCurrentDisplayMode(displayIndex, out mode));
        }

		[CCode (cname = "SDL_GetDisplayMode")]
		private static int SDL_GetDisplayMode (int displayIndex, int modeIndex, out Mode mode);

		public static void GetDisplayMode(int displayIndex, int modeIndex, out Mode mode)
        {
            GetErrorInt(SDL_GetDisplayMode(displayIndex, modeIndex, out mode));
        }

		[CCode (cname = "SDL_GetClosestDisplayMode")]
		private static int SDL_GetClosestDisplayMode (int displayIndex, int modeIndex, out Mode mode);

        public static void GetClosestDisplayMode(int displayIndex, int modeIndex, out Mode mode)
        {
            GetErrorInt(SDL_GetDisplayMode(displayIndex, modeIndex, out mode));
        }

		[CCode (cname = "SDL_GetDisplayName")]
		public static unowned string? GetDisplayName (int index);

		[CCode (cname = "SDL_GetNumDisplayModes")]
		private static int SDL_GetNumDisplayModes (int displayIndex);

		public static int GetNumDisplayModes(int displayIndex)
        {
            return GetErrorInt(SDL_GetNumDisplayModes(displayIndex));
		}

		[CCode (cname = "SDL_GetNumVideoDisplays")]
		private static int SDL_GetNumVideoDisplays ();
		
        public static int GetNumVideoDisplays()
        {
            return GetErrorInt(SDL_GetNumVideoDisplays());
        }
	
		[CCode (cname = "SDL_GetWindowDisplayIndex")]
		private static int SDL_GetWindowDisplayIndex (GLib.IntPtr window);
	
        public static int GetWindowDisplayIndex(GLib.IntPtr window)
        {
            return GetErrorInt(SDL_GetWindowDisplayIndex(window));
        }
	}

	[CCode (cname = "SDL_Renderer", cheader_filename = "SDL2/SDL_render.h")]
	public class Renderer 
	{
		[CCode (cname = "SDL_CreateRenderer")]
		public static GLib.IntPtr Create (GLib.IntPtr window, int index, uint32 flags);
		[Flags, CCode (cname = "SDL_RendererFlags", cheader_filename = "SDL2/SDL_render.h")]
		public enum Flags 
		{
			[CCode (cname = "SDL_RENDERER_SOFTWARE")] 
			Software, 
			[CCode (cname = "SDL_RENDERER_ACCELERATED")] 
			Accelerated,
			[CCode (cname = "SDL_RENDERER_PRESENTVSYNC")] 
			PresentVsync, 
			[CCode (cname = "SDL_RENDERER_TARGETTEXTURE")] 
			TargetTexture
		}


		[CCode (cname = "SDL_CreateTextureFromSurface")]
		public static GLib.IntPtr TextureFromSurface (GLib.IntPtr renderer, GLib.IntPtr surface);

		[CCode (cname = "SDL_RenderCopy")]
		public static int Copy (GLib.IntPtr renderer, GLib.IntPtr texture, Rect? srcrect=null, Rect? dstrect=null);

		[CCode (cname = "SDL_RenderCopyEx")]
		public static int CopyEx (GLib.IntPtr renderer, GLib.IntPtr texture, Rect? srcrect, Rect? dstrect, double angle, Point? center, int flip);

		[CCode (cname = "SDL_RenderPresent")]
		public static void Present (GLib.IntPtr renderer);

	}
	
	public class GL 
	{
		[CCode (cname = "SDL_GLattr", cheader_filename = "SDL2/SDL_video.h")]
		public enum Attribute
		{
			[CCode (cname = "SDL_GL_RED_SIZE")]
			RedSize, 
			[CCode (cname = "SDL_GL_GREEN_SIZE")] 
            GreenSize,
			[CCode (cname = "SDL_GL_BLUE_SIZE")] 
            BlueSize,
			[CCode (cname = "SDL_GL_ALPHA_SIZE")]
            AlphaSize,
			[CCode (cname = "SDL_GL_BUFFER_SIZE")] 
            BufferSize,
			[CCode (cname = "SDL_GL_DOUBLEBUFFER")] 
            DoubleBuffer,
			[CCode (cname = "SDL_GL_DEPTH_SIZE")] 
            DepthSize,
			[CCode (cname = "SDL_GL_STENCIL_SIZE")]
            StencilSize,
			[CCode (cname = "SDL_GL_ACCUM_RED_SIZE")] 
            AccumRedSize,
			[CCode (cname = "SDL_GL_ACCUM_GREEN_SIZE")] 
            AccumGreenSize,
			[CCode (cname = "SDL_GL_ACCUM_BLUE_SIZE")]
            AccumBlueSize,
			[CCode (cname = "SDL_GL_ACCUM_ALPHA_SIZE")] 
            AccumAlphaSize,
			[CCode (cname = "SDL_GL_STEREO")] 
            Stereo,
			[CCode (cname = "SDL_GL_MULTISAMPLEBUFFERS")]
            MultiSampleBuffers,
			[CCode (cname = "SDL_GL_MULTISAMPLESAMPLES")] 
            MultiSampleSamples,
			[CCode (cname = "SDL_GL_ACCELERATED_VISUAL")]
            AcceleratedVisual,
			[CCode (cname = "SDL_GL_RETAINED_BACKING")]
            RetainedBacking,
			[CCode (cname = "SDL_GL_CONTEXT_MAJOR_VERSION")] 
            ContextMajorVersion,
			[CCode (cname = "SDL_GL_CONTEXT_MINOR_VERSION")]
            ContextMinorVersion,
			[CCode (cname = "SDL_GL_CONTEXT_EGL")]
            ContextEgl,
			[CCode (cname = "SDL_GL_CONTEXT_FLAGS")] 
            ContextFlags,
			[CCode (cname = "SDL_GL_CONTEXT_PROFILE_MASK")]
            ContextProfileMask,
			[CCode (cname = "SDL_GL_SHARE_WITH_CURRENT_CONTEXT")] 
            ShareWithCurrentContext,
			[CCode (cname = "SDL_GL_FRAMEBUFFER_SRGB_CAPABLE")]
            FramebufferSRGBCapable,
			[CCode (cname = "SDL_GL_CONTEXT_RELEASE_BEHAVIOR")]
            ContextReleaseBehaviour
		}

		[CCode (cname = "SDL_GL_CreateContext")]
		private static GLib.IntPtr SDL_GL_CreateContext (GLib.IntPtr window);

        public static GLib.IntPtr CreateContext(GLib.IntPtr window)
        {
            return GetErrorPtr("SDL_GL_CreateContext", SDL_GL_CreateContext(window));
        }

		[CCode (cname = "SDL_GL_DeleteContext")]
        public static void DeleteContext(GLib.IntPtr context);
		
		[CCode (cname = "SDL_GL_GetCurrentContext")]
		private static GLib.IntPtr SDL_GL_GetCurrentContext ();

		public static GLib.IntPtr GetCurrentContext()
        {
            return GetErrorPtr("SDL_GL_GetCurrentContext", SDL_GL_GetCurrentContext());
		}

		[CCode (cname = "SDL_GL_GetSwapInterval")]
		public static int GetSwapInterval ();
	
		[CCode (cname = "SDL_GL_MakeCurrent")]
		public static int MakeCurrent (GLib.IntPtr window, GLib.IntPtr context);

		[CCode (cname = "SDL_GL_SetAttribute")]
		private static int SDL_GL_SetAttribute (Attribute attr, int val);

        public static int SetAttribute(Attribute attr, int value)
        {
            return GetErrorInt(SDL_GL_SetAttribute(attr, value));
        }
		
		[CCode (cname = "SDL_GL_SetSwapInterval")]
		public static int SetSwapInterval (int interval);

		[CCode (cname = "SDL_GL_SwapWindow")]
		public static void SwapWindow (GLib.IntPtr window);

	}

	public class Mouse
	{
		[CCode (cname = "Uint8")]
		public enum Button 
		{
			[CCode (cname = "SDL_BUTTON_LEFT")]
			Left,
			[CCode (cname = "SDL_BUTTON_MIDDLE")]
			Middle,
			[CCode (cname = "SDL_BUTTON_RIGHT")]
			Right,
			[CCode (cname = "SDL_BUTTON_X1MASK")]
			X1Mask,
			[CCode (cname = "SDL_BUTTON_X2MASK")]
			X2Mask
		}

		[CCode (cname = "SDL_SystemCursor", cheader_filename = "SDL2/SDL_mouse.h")]
		public enum SystemCursor 
		{
			[CCode (cname = "SDL_SYSTEM_CURSOR_ARROW")]
            Arrow,
			[CCode (cname = "SDL_SYSTEM_CURSOR_IBEAM")] 
            IBeam,
			[CCode (cname = "SDL_SYSTEM_CURSOR_WAIT")] 
            Wait,
			[CCode (cname = "SDL_SYSTEM_CURSOR_CROSSHAIR")] 
            Crosshair,
			[CCode (cname = "SDL_SYSTEM_CURSOR_WAITARROW")] 
            WaitArrow,
			[CCode (cname = "SDL_SYSTEM_CURSOR_SIZENWSE")]
            SizeNWSE,
			[CCode (cname = "SDL_SYSTEM_CURSOR_SIZENESW")] 
            SizeNESW,
			[CCode (cname = "SDL_SYSTEM_CURSOR_SIZEWE")] 
            SizeWE,
			[CCode (cname = "SDL_SYSTEM_CURSOR_SIZENS")] 
            SizeNS,
			[CCode (cname = "SDL_SYSTEM_CURSOR_SIZEALL")] 
            SizeAll,
			[CCode (cname = "SDL_SYSTEM_CURSOR_NO")] 
            No,
			[CCode (cname = "SDL_SYSTEM_CURSOR_HAND")]
            Hand
		}

		[SimpleType, CCode (cname = "SDL_MouseMotionEvent", cheader_filename = "SDL2/SDL_events.h")]
		public struct MotionEvent : CommonEvent
		{
			[CCode (cname = "windowID")]
			public uint32 WindowID;
			[CCode (cname = "which")]
			public uint32 Which;
			[CCode (cname = "button")]
			public uint8 Button;
			[CCode (cname = "state")]
			public uint8 State;
			[CCode (cname = "clicks")]
			public uint8 Clicks;
			[CCode (cname = "padding1")]
			public uint8 Padding1;
			[CCode (cname = "x")]
			public int32 X;
			[CCode (cname = "y")]
			public int32 Y;
		}
		
		[SimpleType, CCode (cname = "SDL_MouseWheelEvent", cheader_filename = "SDL2/SDL_events.h")]
		public struct WheelEvent : CommonEvent
		{
			[CCode (cname = "windowID")]
			public uint32 WindowID;
			[CCode (cname = "which")]
			public uint32 Which;
			[CCode (cname = "x")]
			public int32 X;
			[CCode (cname = "y")]
			public int32 Y;
			[CCode (cname = "direction")]
			public uint32 Direction;
		}

		[CCode (cname = "SDL_CreateColorCursor")]
		private static GLib.IntPtr SDL_CreateColorCursor (GLib.IntPtr surface, int x, int y);

        public static GLib.IntPtr CreateColorCursor(GLib.IntPtr surface, int x, int y)
        {
            return GetErrorPtr("SDL_CreateColorCursor", SDL_CreateColorCursor(surface, x, y));
        }

		[CCode (cname = "SDL_CreateSystemCursor")]
		private static GLib.IntPtr SDL_CreateSystemCursor (SystemCursor id);
        public static GLib.IntPtr CreateSystemCursor(SystemCursor id)
        {
            return GetErrorPtr("SDL_CreateSystemCursor", SDL_CreateSystemCursor(id));
        }

		[CCode (cname = "SDL_FreeCursor")]
        public static void FreeCursor(GLib.IntPtr cursor);
		
		[CCode (cname = "SDL_GetMouseState")]
		public static Button GetState (out int x, out int y);

		[CCode (cname = "SDL_GetGlobalMouseState")]
		public static Button GetGlobalState (out int x, out int y);

		[CCode (cname = "SDL_SetCursor")]
        public static void SetCursor(GLib.IntPtr cursor);

		[CCode (cname = "SDL_ShowCursor")]
        public static int ShowCursor(int toggle);

		[CCode (cname = "SDL_WarpMouseInWindow")]
		public static void WarpInWindow (GLib.IntPtr window, int x, int y);
	
	}

	public class Keyboard
	{
		[SimpleType, CCode (cname = "SDL_Keysym", cheader_filename = "SDL2/SDL_keyboard.h")]
		public struct Keysym 
		{
			[CCode (cname = "scancode")]
			public int Scancode;
			[CCode (cname = "sym")]
			public int Sym;
			[CCode (cname = "mod")]
			public Keymod Mod;
			[CCode (cname = "unicode")]
			public uint32 Unicode;
		}

		[CCode (cname = "SDL_Keymod", cheader_filename = "SDL2/SDL_keyboard.h")]
		public enum Keymod 
		{
			[CCode (cname = "KMOD_NONE")]
            None,
			[CCode (cname = "KMOD_LSHIFT")] 
			LeftShift,
			[CCode (cname = "KMOD_RSHIFT")]
			RightShift,
			[CCode (cname = "KMOD_LCTRL")]
			LeftCtrl,
			[CCode (cname = "KMOD_RCTRL")]
			RightCtrl,
			[CCode (cname = "KMOD_LALT")]
			LeftAlt,
			[CCode (cname = "KMOD_RALT")]
			RightAlt,
			[CCode (cname = "KMOD_LGUI")]
			LeftGui,
			[CCode (cname = "KMOD_RGUI")]
			RightGui,
			[CCode (cname = "KMOD_NUM")]
			NumLock,
			[CCode (cname = "KMOD_CAPS")]
			CapsLock,
			[CCode (cname = "KMOD_MODE")]
			AltGr,
			[CCode (cname = "KMOD_RESERVED")]
			Reserved,
			[CCode (cname = "KMOD_CTRL")]
			Ctrl,
			[CCode (cname = "KMOD_SHIFT")]
			Shift,
			[CCode (cname = "KMOD_ALT")]
			Alt,
			[CCode (cname = "KMOD_GUI")]
			Gui
		}

		[SimpleType, CCode (cname = "SDL_KeyboardEvent", cheader_filename = "SDL2/SDL_events.h")]
		public struct Event : CommonEvent
		{
			[CCode (cname = "windowID")]
			public uint32 WindowID;
			[CCode (cname = "state")]
			public uint8 State;
			[CCode (cname = "repeat")]
			public uint8 Repeat;
			[CCode (cname = "padding2")]
			public uint8 Padding2;
			[CCode (cname = "padding3")]
			public uint8 Padding3;
			[CCode (cname = "keysym")]
            public Keysym Keysym;
		}

		[SimpleType, CCode (cname = "SDL_TextEditingEvent", cheader_filename = "SDL2/SDL_events.h")]
		public struct TextEditingEvent : CommonEvent
		{
			[CCode (cname = "WindowID")]
			public uint32 windowID;
			[CCode (cname = "text", array_null_terminated = true)]
            public char Text [32];
			[CCode (cname = "start")]
            public int Start;
			[CCode (cname = "length")]
            public int Length;

		}
		
		[SimpleType, CCode (cname = "SDL_TextInputEvent", cheader_filename = "SDL2/SDL_events.h")]
		public struct TextInputEvent : CommonEvent
		{
			[CCode (cname = "WindowID")]
			public uint32 windowID;
			[CCode (cname = "text", array_null_terminated = true )]
            public char Text [32];

		}

		[CCode (cname = "SDL_GetModState")]
        public static Keymod GetModState();
	
	}

    public class Joystick
    {
		[CCode (cname = "Uint8", cheader_filename = "SDL2/SDL_events.h")]
		public enum Hat 
		{
			[CCode (cname = "SDL_HAT_CENTERED")]
			Centered,
			[CCode (cname = "SDL_HAT_UP")]
			Up,
			[CCode (cname = "SDL_HAT_RIGHT")]
			Right,
			[CCode (cname = "SDL_HAT_DOWN")]
			Down,
			[CCode (cname = "SDL_HAT_LEFT")]
			Left
		}

		[SimpleType, CCode (cname = "SDL_JoyDeviceEvent", cheader_filename = "SDL2/SDL_events.h")]
		public struct DeviceEvent : CommonEvent
		{
			[CCode (cname = "windowID")]
			public uint32 WindowID;
			[CCode (cname = "which")]
			public int Which;
		}
				
		[CCode (cname = "SDL_JoystickClose")]
        public static void Close(GLib.IntPtr joystick);
		
		[CCode (cname = "SDL_JoystickFromInstanceID")]
		private static GLib.IntPtr SDL_JoystickFromInstanceID (int joyid);

        public static GLib.IntPtr FromInstanceID(int joyid)
        {
            return GetErrorPtr("SDL_JoystickFromInstanceID", SDL_JoystickFromInstanceID(joyid));
        }

		[CCode (cname = "SDL_JoystickGetAxis")]
		public static int16 GetAxis (GLib.IntPtr joystick, int axis);

		[CCode (cname = "SDL_JoystickGetButton")]
		public static uint8 GetButton (GLib.IntPtr joystick, int button);

		[CCode (cname = "SDL_JoystickGetGUID")]
		public static Guid GetGUID(GLib.IntPtr joystick);

		[CCode (cname = "SDL_JoystickGetHat")]
		public static Hat GetHat (GLib.IntPtr joystick, int hat);

		[CCode (cname = "SDL_JoystickInstanceID")]
		public static int InstanceID (GLib.IntPtr joystick);

		[CCode (cname = "SDL_JoystickOpen")]
		private static GLib.IntPtr SDL_JoystickOpen (int device_index);

        public static GLib.IntPtr Open(int deviceIndex)
        {
            return GetErrorPtr("SDL_JoystickOpen", SDL_JoystickOpen(deviceIndex));
        }

		[CCode (cname = "SDL_JoystickNumAxes")]
		private static int SDL_JoystickNumAxes (GLib.IntPtr joystick);

        public static int NumAxes(GLib.IntPtr joystick)
        {
            return GetErrorInt(SDL_JoystickNumAxes(joystick));
        }
		
		[CCode (cname = "SDL_JoystickNumButtons")]
		private static int SDL_JoystickNumButtons (GLib.IntPtr joystick);

        public static int NumButtons(GLib.IntPtr joystick)
        {
            return GetErrorInt(SDL_JoystickNumButtons(joystick));
        }

		[CCode (cname = "SDL_JoystickNumHats")]
		private static int SDL_JoystickNumHats (GLib.IntPtr joystick);

        public static int NumHats(GLib.IntPtr joystick)
        {
            return GetErrorInt(SDL_JoystickNumHats(joystick));
        }

		[CCode (cname = "SDL_NumJoysticks")]
		private static int SDL_NumJoysticks ();

        public static int NumJoysticks()
        {
            return GetErrorInt(SDL_NumJoysticks());
        }
		
	
	}

    public class GameController
	{
		[CCode (cheader_filename = "SDL2/SDL_gamecontroller.h")]
		public enum Axis 
		{
			[CCode (cname = "SDL_CONTROLLER_AXIS_INVALID")] 
            Invalid,
			[CCode (cname = "SDL_CONTROLLER_AXIS_LEFTX")]
            LeftX,
			[CCode (cname = "SDL_CONTROLLER_AXIS_LEFTY")]
            LeftY,
			[CCode (cname = "SDL_CONTROLLER_AXIS_RIGHTX")]
            RightX,
			[CCode (cname = "SDL_CONTROLLER_AXIS_RIGHTY")]
            RightY,
			[CCode (cname = "SDL_CONTROLLER_AXIS_TRIGGERLEFT")]
            TriggerLeft,
			[CCode (cname = "SDL_CONTROLLER_AXIS_TRIGGERRIGHT")]
            TriggerRight,
			[CCode (cname = "SDL_CONTROLLER_AXIS_MAX")]
            Max
		}

		[CCode (cheader_filename = "SDL2/SDL_gamecontroller.h")]
		public enum Button 
		{
			[CCode (cname = "SDL_CONTROLLER_BUTTON_INVALID")]
            Invalid,
			[CCode (cname = "SDL_CONTROLLER_BUTTON_A")]
            A,
			[CCode (cname = "SDL_CONTROLLER_BUTTON_B")]
            B,
			[CCode (cname = "SDL_CONTROLLER_BUTTON_X")]
            X,
			[CCode (cname = "SDL_CONTROLLER_BUTTON_Y")]
            Y,
			[CCode (cname = "SDL_CONTROLLER_BUTTON_BACK")]
            Back,
			[CCode (cname = "SDL_CONTROLLER_BUTTON_GUIDE")]
            Guide,
			[CCode (cname = "SDL_CONTROLLER_BUTTON_START")]
            Start,
			[CCode (cname = "SDL_CONTROLLER_BUTTON_LEFTSTICK")]
            LeftStick,
			[CCode (cname = "SDL_CONTROLLER_BUTTON_RIGHTSTICK")]
            RightStick,
			[CCode (cname = "SDL_CONTROLLER_BUTTON_LEFTSHOULDER")]
            LeftShoulder,
			[CCode (cname = "SDL_CONTROLLER_BUTTON_RIGHTSHOULDER")]
            RightShoulder,
			[CCode (cname = "SDL_CONTROLLER_BUTTON_DPAD_UP")]
            DpadUp,
			[CCode (cname = "SDL_CONTROLLER_BUTTON_DPAD_DOWN")]
            DpadDown,
			[CCode (cname = "SDL_CONTROLLER_BUTTON_DPAD_LEFT")]
            DpadLeft,
			[CCode (cname = "SDL_CONTROLLER_BUTTON_DPAD_RIGHT")]
            DpadRight,
			[CCode (cname = "SDL_CONTROLLER_BUTTON_MAX")]
            Max
		}

		[SimpleType, CCode (cname = "SDL_ControllerDeviceEvent", cheader_filename = "SDL2/SDL_events.h")]
		public struct DeviceEvent : CommonEvent
		{
			[CCode (cname = "which")]
			public int Which;
		}

		[CCode (cname = "SDL_GameControllerAddMapping")]
		public static int AddMapping (string mappingString);

		[CCode (cname = "SDL_GameControllerAddMappingsFromRW")]
		public static int AddMappingFromRw (GLib.IntPtr rw, int freerw = 1);

		[CCode (cname = "SDL_GameControllerClose")]
		public static void Close (GLib.IntPtr gamecontroller);

		[CCode (cname = "SDL_JoystickFromInstanceID")]
		private static GLib.IntPtr SDL_GameControllerFromInstanceID (int joyid);
	
        public static GLib.IntPtr FromInstanceID(int joyid)
        {
            return GetErrorPtr("SDL_JoystickFromInstanceID", SDL_GameControllerFromInstanceID(joyid));
        }

		[CCode (cname = "SDL_GameControllerGetAxis")]
		public static int16 GetAxis (GLib.IntPtr gamecontroller, Axis axis);
	
		[CCode (cname = "SDL_GameControllerGetButton")]
		public static uint8 GetButton (GLib.IntPtr gamecontroller, Button button);

		[CCode (cname = "SDL_GameControllerGetJoystick")]
		private static GLib.IntPtr SDL_GameControllerGetJoystick(GLib.IntPtr gamecontroller);

        public static GLib.IntPtr GetJoystick(GLib.IntPtr gamecontroller)
        {
            return GetErrorPtr("SDL_GameControllerGetJoystick", SDL_GameControllerGetJoystick(gamecontroller));
        }

		[CCode (cname = "SDL_IsGameController")]
		public static uint8 IsGameController (int joystickIndex);

		[CCode (cname = "SDL_GameControllerMapping")]
		public static string? GetMapping (GLib.IntPtr gamecontroller);


		[CCode (cname = "SDL_GameControllerOpen")]
		private static GLib.IntPtr SDL_GameControllerOpen (int joystickIndex);
	
        public static GLib.IntPtr Open(int joystickIndex)
        {
            return GetErrorPtr("SDL_GameControllerOpen", SDL_GameControllerOpen(joystickIndex));
        }

		[CCode (cname = "SDL_GameControllerName")]
		public static string? GetName(GLib.IntPtr gamecontroller);

	}

    public class Haptic
	{

		[CCode (cname = "SDL_HAPTIC_INFINITY")]
		public const uint Infinity;

		public enum EffectId 
		{
			[CCode (cname = "SDL_HAPTIC_LEFTRIGHT")]
			LeftRight
		}


		[CCode (cname = "SDL_HapticLeftRight", cheader_filename = "SDL2/SDL_haptic.h")]
		public struct Effect 
		{
			[CCode (cname = "type")]
			public uint32 Type;
			[CCode (cname = "length")]
			public uint32 Length;
			[CCode (cname = "large_magnitude")]
			public uint16 LargeMagnitude;
			[CCode (cname = "small_magnitude")]
			public uint16 SmallMagnitude;
		}

		[CCode (cname = "SDL_HapticClose")]
		public static void Close(GLib.IntPtr haptic);

		[CCode (cname = "SDL_HapticEffectSupported")]
		public static int EffectSupported (GLib.IntPtr haptic, ref Effect effect);

		[CCode (cname = "SDL_JoystickIsHaptic", cheader_filename = "SDL2/SDL_haptic.h")]
		public static int IsHaptic (GLib.IntPtr joystick);
	
		[CCode (cname = "SDL_HapticNewEffect")]
		private static int SDL_HapticNewEffect (GLib.IntPtr haptic, ref Effect effect);
		
        public static void NewEffect(GLib.IntPtr haptic, ref Effect effect)
        {
            GetErrorInt(SDL_HapticNewEffect(haptic, ref effect));
		}
		
		[CCode (cname = "SDL_HapticOpen")]
		public static GLib.IntPtr Open (int device_index);
		
		[CCode (cname = "SDL_HapticOpenfromJoystick")]
		private static GLib.IntPtr SDL_HapticOpenfromJoystick (GLib.IntPtr joystick);
		
        public static GLib.IntPtr OpenFromJoystick(GLib.IntPtr joystick)
        {
            return GetErrorPtr("SDL_HapticOpenfromJoystick", SDL_HapticOpenfromJoystick(joystick));
		}
		
		[CCode (cname = "SDL_HapticRumbleInit")]
		private static int SDL_HapticRumbleInit (GLib.IntPtr haptic);
		
        public static void RumbleInit(GLib.IntPtr haptic)
        {
            GetErrorInt(SDL_HapticRumbleInit(haptic));
		}
		
		[CCode (cname = "SDL_HapticRumblePlay")]
		private static int SDL_HapticRumblePlay (GLib.IntPtr haptic, float strength, uint length);

        public static void RumblePlay(GLib.IntPtr haptic, float strength, uint length)
        {
            GetErrorInt(SDL_HapticRumblePlay(haptic, strength, length));
		}
		
		[CCode (cname = "SDL_HapticRumbleSupported")]
		private static int SDL_HapticRumbleSupported (GLib.IntPtr haptic);

        public static int RumbleSupported(GLib.IntPtr haptic)
        {
            return GetErrorInt(SDL_HapticRumbleSupported(haptic));
        }
		
		[CCode (cname = "SDL_HapticRunEffect")]
		private static int SDL_HapticRunEffect (GLib.IntPtr haptic, int effect, uint iterations);
		
        public static void RunEffect(GLib.IntPtr haptic, int effect, uint iterations)
        {
            GetErrorInt(SDL_HapticRunEffect(haptic, effect, iterations));
		}
		
		[CCode (cname = "SDL_HapticStopAll")]
		private static int SDL_HapticStopAll (GLib.IntPtr haptic);

        public static void StopAll(GLib.IntPtr haptic)
        {
            GetErrorInt(SDL_HapticStopAll(haptic));
		}
		
		[CCode (cname = "SDL_HapticUpdateEffect")]
		private static int SDL_HapticUpdateEffect (GLib.IntPtr haptic, int effect, ref Effect data);
		
        public static void UpdateEffect(GLib.IntPtr haptic, int effect, ref Effect data)
        {
            GetErrorInt(SDL_HapticUpdateEffect(haptic, effect, ref data));
        }

	}

	[CCode (cheader_filename = "SDL2/SDL_image.h")]
	public class Image
	{
		[Flags, CCode (cname = "IMG_InitFlags")]
		public enum InitFlags {
			[CCode (cname = "IMG_INIT_JPG")]
			Jpg,
			[CCode (cname = "IMG_INIT_PNG")]
			Png,
			[CCode (cname = "IMG_INIT_TIF")]
			Tif,
			[CCode (cname = "IMG_INIT_WEBP")]
			Webp
		}
		[CCode (cname = "IMG_Init")]
		public static int Init (int flags);
	
		[CCode (cname = "IMG_Quit")]
		public static void Quit ();

		[CCode (cname = "IMG_Load")]
		public static GLib.IntPtr Load (string file);
	
		[CCode (cname = "IMG_Load_RW")]
		public static GLib.IntPtr LoadRw (GLib.IntPtr src, bool freesrc = false);
	
		[CCode (cname = "IMG_LoadTyped_RW")]
		public static GLib.IntPtr LoadRwTyped (GLib.IntPtr src, bool freesrc, string type);
	
		[CCode (cname = "IMG_LoadTexture")]
		public static GLib.IntPtr LoadTexture (GLib.IntPtr renderer, string file);
	
		[CCode (cname = "IMG_LoadTexture_RW")]
		public static GLib.IntPtr LoadTextureRw (GLib.IntPtr renderer, GLib.IntPtr src, bool freesrc = false);
	
		[CCode (cname = "IMG_LoadTextureTyped_RW")]
		public static GLib.IntPtr LoadTextureRwTyped (GLib.IntPtr renderer, GLib.IntPtr src, bool freesrc, string type);
	
		[CCode (cname = "IMG_InvertAlpha")]
		public static int invertAlpha (int on);
	
		[CCode (cname = "IMG_LoadCUR_RW")]
		public static GLib.IntPtr LoadCUR (GLib.IntPtr src);
	
		[CCode (cname = "IMG_LoadICO_RW")]
		public static GLib.IntPtr LoadICO (GLib.IntPtr src);
	
		[CCode (cname = "IMG_LoadBMP_RW")]
		public static GLib.IntPtr LoadBMP (GLib.IntPtr src);
	
		[CCode (cname = "IMG_LoadPNM_RW")]
		public static GLib.IntPtr LoadPNM (GLib.IntPtr src);
	
		[CCode (cname = "IMG_LoadXPM_RW")]
		public static GLib.IntPtr LoadXPM (GLib.IntPtr src);
	
		[CCode (cname = "IMG_LoadXCF_RW")]
		public static GLib.IntPtr LoadXCF (GLib.IntPtr src);
	
		[CCode (cname = "IMG_LoadPCX_RW")]
		public static GLib.IntPtr LoadPCX (GLib.IntPtr src);
	
		[CCode (cname = "IMG_LoadGIF_RW")]
		public static GLib.IntPtr LoadGIF (GLib.IntPtr src);
	
		[CCode (cname = "IMG_LoadJPG_RW")]
		public static GLib.IntPtr LoadJPG (GLib.IntPtr src);
	
		[CCode (cname = "IMG_LoadTIF_RW")]
		public static GLib.IntPtr LoadTIF (GLib.IntPtr src);
	
		[CCode (cname = "IMG_LoadPNG_RW")]
		public static GLib.IntPtr LoadPNG (GLib.IntPtr src);
	
		[CCode (cname = "IMG_LoadTGA_RW")]
		public static GLib.IntPtr LoadTGA (GLib.IntPtr src);
	
		[CCode (cname = "IMG_LoadLBM_RW")]
		public static GLib.IntPtr LoadLBM (GLib.IntPtr src);
	
		[CCode (cname = "IMG_LoadXV_RW")]
		public static GLib.IntPtr LoadXV (GLib.IntPtr src);
	
		[CCode (cname = "IMG_LoadWEBP_RW")]
		public static GLib.IntPtr LoadWEBP (GLib.IntPtr src);
	
		[CCode (cname = "IMG_ReadXPMFromArray")]
		public static GLib.IntPtr readXPM (string[] xpmdata);
	
		//!Info
	
		[CCode (cname = "IMG_isCUR")]
		public static bool IsCUR (GLib.IntPtr src);
	
		[CCode (cname = "IMG_isICO")]
		public static bool IsICO (GLib.IntPtr src);
	
		[CCode (cname = "IMG_isBMP")]
		public static bool IsBMP (GLib.IntPtr src);
	
		[CCode (cname = "IMG_isPNM")]
		public static bool IsPNM (GLib.IntPtr src);
	
		[CCode (cname = "IMG_isXPM")]
		public static bool IsXPM (GLib.IntPtr src);
	
		[CCode (cname = "IMG_isXCF")]
		public static bool IsXCF (GLib.IntPtr src);
	
		[CCode (cname = "IMG_isPCX")]
		public static bool IsPCX (GLib.IntPtr src);
	
		[CCode (cname = "IMG_isGIF")]
		public static bool IsGIF (GLib.IntPtr src);
	
		[CCode (cname = "IMG_isJPG")]
		public static bool IsJPG (GLib.IntPtr src);
	
		[CCode (cname = "IMG_isTIF")]
		public static bool IsTIF (GLib.IntPtr src);
	
		[CCode (cname = "IMG_isPNG")]
		public static bool IsPNG (GLib.IntPtr src);
	
		[CCode (cname = "IMG_isLBM")]
		public static bool IsLBM (GLib.IntPtr src);
	
		[CCode (cname = "IMG_isXV")]
		public static bool IsXV (GLib.IntPtr src);
	
		[CCode (cname = "IMG_isWEBP")]
		public static bool IsWEBP (GLib.IntPtr src);
			
	}
	
	[CCode (cheader_filename = "SDL2/SDL_ttf.h")]
	public class Ttf
	{
		[CCode (cname = "TTF_Init")]
		public static int Init ();

		[CCode (cname = "TTF_Quit")]
		public static void Quit ();

		[CCode (cname = "TTF_OpenFont")]
		public static GLib.IntPtr Open (string file, int ptsize);

		[CCode (cname = "TTF_OpenFontRW")]
		public static GLib.IntPtr OpenRw (GLib.IntPtr src, int freesrc = 0, int ptsize);

		
	}

	[CCode (cheader_filename = "SDL2/SDL_mixer.h")]
	public class Mixer
	{
		[CCode (cname = "Mix_OpenAudio")]
		public static int Init (int frequency, int format, int channels, int chunksize);
	
		[CCode (cname = "Mix_CloseAudio")]
		public static void Quit ();

		[CCode (cname = "Mix_LoadWAV_RW")]
		public static GLib.IntPtr OpenRw (GLib.IntPtr src, int freesrc = 0);

		[CCode (cname = "Mix_LoadWAV")]
		public static GLib.IntPtr Open (string file);

		[CCode (cname = "Mix_PlayChannel")]
		public static int Play (int channel, GLib.IntPtr chunk, int loops = 0);
		
	}

}			
