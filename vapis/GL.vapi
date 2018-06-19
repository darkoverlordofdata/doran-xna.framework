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
[CCode (cprefix = "", lower_case_cprefix = "", cheader_filename="SDL2/SDL_opengl.h")]
namespace GL
{

	[CCode (cname="GLenum")]
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
	[CCode (cname="GLint")]
	public struct GLintptr : int { }
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
	[CCode (cname = "GLenum")]
	public enum DataType 
	{
		[CCode (cname = "GL_BYTE")] 
		Byte,
		[CCode (cname = "GL_UNSIGNED_BYTE")]
		UnsignedByte, 
		[CCode (cname = "GL_SHORT")] 
		Short,
		[CCode (cname = "GL_UNSIGNED_SHORT")] 
		UnsignedShort, 
		[CCode (cname = "GL_INT")] 
		Int, 
		[CCode (cname = "GL_UNSIGNED_INT")] 
		UnsignedInt, 
		[CCode (cname = "GL_FLOAT")] 
		Float,
		[CCode (cname = "GL_2_BYTES")] 
		GL2Bytes,
		[CCode (cname = "GL_3_BYTES")] 
		GL3Bytes,
		[CCode (cname = "GL_4_BYTES")] 
		GL4Bytes,
		[CCode (cname = "GL_DOUBLE")] 
		Double
	}

	[CCode (cname = "GLenum")]
	public enum PrimitiveType
	{
		[CCode (cname = "GL_POINTS")] 
		Points,
		[CCode (cname = "GL_LINES")] 
		Lines,
		[CCode (cname = "GL_LINE_LOOP")] 
		LineLoop,
		[CCode (cname = "GL_LINE_STRIP")] 
		LineStrip,
		[CCode (cname = "GL_TRIANGLES")] 
		Triangles,
		[CCode (cname = "GL_TRIANGLE_STRIP")] 
		TriangleStrip,
		[CCode (cname = "GL_TRIANGLE_FAN")] 
		TriangleFan,
		[CCode (cname = "GL_QUADS")] 
		Quads,
		[CCode (cname = "GL_QUAD_STRIP")] 
		QuadStrips,
		[CCode (cname = "GL_POLYGON")] 
		Polygon
	}


	[CCode (cname = "GLenum")]
	public enum TextureTarget
	{
		[CCode (cname = "GL_TEXTURE_2D")] 
		Texture2D,
		[CCode (cname = "GL_TEXTURE_3D")] 
		Texture3D
		
	}

	// Vertex Arrays
	[CCode (cname = "GLenum")]
	public enum EnableCap
	{
		[CCode (cname = "GL_VERTEX_ARRAY")] 
		VertexArray,
		[CCode (cname = "GL_NORMAL_ARRAY")] 
		NormalArray,
		[CCode (cname = "GL_COLOR_ARRAY")] 
		ColorArray,
		[CCode (cname = "GL_INDEX_ARRAY")] 
		IndexArray,
		[CCode (cname = "GL_TEXTURE_COORD_ARRAY")] 
		TextureCoordArray,
		[CCode (cname = "GL_BLEND")] 
		Blend
		


	}
	
	// Matrix Mode
	[CCode (cname = "GLenum")]
	public enum GLMode
	{
		[CCode (cname = "GL_MATRIX_MODE")] 
		MatrixMode,
		[CCode (cname = "GL_MODELVIEW")] 
		ModelView,
		[CCode (cname = "GL_PROJECTION")] 
		Projection,
		[CCode (cname = "GL_TEXTURE")] 
		Texture
	}		
	
	// // Blending
	[CCode (cname = "GLenum")]
    public enum BlendingFactorSrc
    {
		[CCode (cname = "GL_ZERO")]
		Zero,
		[CCode (cname = "GL_SRC_COLOR")]
        SrcColor,
		[CCode (cname = "GL_ONE_MINUS_SRC_COLOR")]
        OneMinusSrcColor,
		[CCode (cname = "GL_SRC_ALPHA")]
        SrcAlpha,
		[CCode (cname = "GL_ONE_MINUS_SRC_ALPHA")]
        OneMinusSrcAlpha,
		[CCode (cname = "GL_DST_ALPHA")]
        DstAlpha,
		[CCode (cname = "GL_ONE_MINUS_DST_ALPHA")]
        OneMinusDstAlpha,
		[CCode (cname = "GL_DST_COLOR")]
        DstColor,
		[CCode (cname = "GL_ONE_MINUS_DST_COLOR")]
        OneMinusDstColor,
		[CCode (cname = "GL_SRC_ALPHA_SATURATE")]
        SrcAlphaSaturate,
		[CCode (cname = "GL_CONSTANT_COLOR")]
        ConstantColor,
		[CCode (cname = "GL_ONE_MINUS_CONSTANT_COLOR")]
        OneMinusConstantColor,
		[CCode (cname = "GL_CONSTANT_ALPHA")]
        ConstantAlpha,
		[CCode (cname = "GL_ONE_MINUS_CONSTANT_ALPHA")]
        OneMinusConstantAlpha,
		[CCode (cname = "GL_ONE")]
        One
    }

	[CCode (cname = "GLenum")]
    public enum BlendingFactorDest
    {
		[CCode (cname = "GL_ZERO")]
		Zero,
		[CCode (cname = "GL_SRC_COLOR")]
        SrcColor,
		[CCode (cname = "GL_ONE_MINUS_SRC_COLOR")]
        OneMinusSrcColor,
		[CCode (cname = "GL_SRC_ALPHA")]
        SrcAlpha,
		[CCode (cname = "GL_ONE_MINUS_SRC_ALPHA")]
        OneMinusSrcAlpha,
		[CCode (cname = "GL_DST_ALPHA")]
        DstAlpha,
		[CCode (cname = "GL_ONE_MINUS_DST_ALPHA")]
        OneMinusDstAlpha,
		[CCode (cname = "GL_DST_COLOR")]
        DstColor,
		[CCode (cname = "GL_ONE_MINUS_DST_COLOR")]
        OneMinusDstColor,
		[CCode (cname = "GL_SRC_ALPHA_SATURATE")]
        SrcAlphaSaturate,
		[CCode (cname = "GL_CONSTANT_COLOR")]
        ConstantColor,
		[CCode (cname = "GL_ONE_MINUS_CONSTANT_COLOR")]
        OneMinusConstantColor,
		[CCode (cname = "GL_CONSTANT_ALPHA")]
        ConstantAlpha,
		[CCode (cname = "GL_ONE_MINUS_CONSTANT_ALPHA")]
        OneMinusConstantAlpha,
		[CCode (cname = "GL_ONE")]
        One
    }
	
	
	[CCode (cname = "GLenum")]
    public enum TextureParameterName
	{
		[CCode (cname = "GL_TEXTURE_WRAP_S")] 
		TextureWrapS,
		[CCode (cname = "GL_TEXTURE_WRAP_T")] 
		TextureWrapT

	}

	[CCode (cname = "GLenum")]
	public enum TextureParameter 
	{
		[CCode (cname = "GL_TEXTURE_WIDTH")] 
		Width,
		[CCode (cname = "GL_TEXTURE_HEIGHT")] 
		Height,
		[CCode (cname = "GL_TEXTURE_RED_SIZE")] 
		RedSize,
		[CCode (cname = "GL_TEXTURE_GREEN_SIZE")] 
		GreenSize,
		[CCode (cname = "GL_TEXTURE_BLUE_SIZE")] 
		BlueSize,
	}

	[CCode (cname = "GLenum")]
	public enum ErrorCode 
	{
		[CCode (cname = "GL_NO_ERROR")] 
		NoError,
		[CCode (cname = "GL_INVALID_ENUM")] 
		InvalidEnum,
		[CCode (cname = "GL_INVALID_VALUE")] 
		InvalidValue,
		[CCode (cname = "GL_INVALID_OPERATION")] 
		InvalidOperation,
		[CCode (cname = "GL_STACK_OVERFLOW")] 
		StackOverflow,
		[CCode (cname = "GL_STACK_UNDERFLOW")] 
		StackUnderflow,
		[CCode (cname = "GL_OUT_OF_MEMORY")] 
		OutOfMemory
	}

	// OpenGL 1.2
	[CCode (cname = "GLenum")]
	internal enum TextureWrapMode
	{
		[CCode (cname = "GL_CLAMP_TO_EDGE")]
		ClampToEdge,
		[CCode (cname = "GL_CLAMP_TO_BORDER")]
		ClampToBorder,
		[CCode (cname = "GL_MIRRORED_REPEAT")]
		MirroredRepeat,
		[CCode (cname = "GL_REPEAT")]
		Repeat
	}
	// Miscellaneous
	[CCode (cname = "glClearIndex")]
	public static void ClearIndex (GLfloat c);
	[CCode (cname = "glClearColor")]
	public static void ClearColor (GLclampf red, GLclampf green, GLclampf blue, GLclampf alpha);
	[CCode (cname = "glClear")]
	public static void Clear (GLbitfield mask);
	[CCode (cname = "glIndexMask")]
	public static void IndexMask (GLuint mask);
	[CCode (cname = "glColorMask")]
	public static void ColorMask (GLboolean red, GLboolean green, GLboolean blue, GLboolean alpha);
	[CCode (cname = "glAlphaFunc")]
	public static void AlphaFunc (GLenu func, GLclampf @ref);
	[CCode (cname = "glBlendFunc")]
	public static void BlendFunc (GLenu sfactor, GLenu dfactor);
	[CCode (cname = "glEnable")]
	public static void Enable (GLenu cap);
	[CCode (cname = "glDisable")]
	public static void Disable (GLenu cap);
	[CCode (cname = "glDrawElements")]
	public static void DrawElements (GLenu mode, GLsizei count, GLenu type, GLvoid* indices);
	[CCode (cname = "glEnableClientState")]
	public static void EnableClientState (GLenu cap);
	[CCode (cname = "glDisableClientState")]
	public static void DisableClientState (GLenu cap);
	[CCode (cname = "glGetError")]
	public static ErrorCode GetError ();

	// Transformation
	[CCode (cname = "glMatrixMode")]
	public static void MatrixMode (GLenu mode);
	[CCode (cname = "glOrtho")]
	public static void Ortho (GLdouble left, GLdouble right, GLdouble bottom, GLdouble top, GLdouble near_val, GLdouble far_val);
	[CCode (cname = "glPushMatrix")]
	public static void PushMatrix ();
	[CCode (cname = "glPopMatrix")]
	public static void PopMatrix ();
	[CCode (cname = "glLoadIdentity")]
	public static void LoadIdentity ();

	// Drawing Functions
	[CCode (cname = "glBegin")]
	public static void Begin (GLenu mode);
	[CCode (cname = "glEnd")]
	public static void End ();
	[CCode (cname = "glVertex3f")]
	public static void Vertex3f (GLfloat x, GLfloat y, GLfloat z);
	[CCode (cname = "glTexCoord2f")]
	public static void TexCoord2f (GLfloat s, GLfloat t);
	// Vertex Arrays  (1.1)
	[CCode (cname = "glVertexPointer")]
	public static void VertexPointer (GLint size, GLenu type, GLsizei stride, GLvoid* ptr);
	[CCode (cname = "glTexCoordPointer")]
	public static void TexCoordPointer (GLint size, GLenu type, GLsizei stride, GLvoid* ptr);
	[CCode (cname = "glDrawArrays")]
	public static void DrawArrays (GLenu mode, GLint first, GLsizei count);


	// Texture mapping
	[CCode (cname = "glTexParameteri")]
	public static void TexParameteri (GLenu target, GLenu pname, GLint param);
	[CCode (cname = "glGetTexLevelParameteriv")]
	public static void GetTexLevelParameteriv (GLenu target, GLint level, GLenu pname,[CCode (array_length = false)]  GLint[] params);

	// 1.1 functions
	[CCode (cname = "glBindTexture")]
	public static void BindTexture (GLenu target, GLuint texture);

	// Corange SDL_local.h values
	
	[CCode (cname="GLchar")]
	public struct GLchar : char { }
	[CCode (cname="GLsizeiptr")]
	public struct GLsizeiptr : size_t { }

	[CCode (cname = "glGenBuffers")]
	public static void GenBuffers( GLsizei n, GLuint* buffers );
	[CCode (cname = "glDeleteBuffers")]
	public static void DeleteBuffers( GLsizei n, GLuint* buffers );
	[CCode (cname = "glBindBuffer")]
	public static void BindBuffer( GLenu target, GLuint buffer );
	[CCode (cname = "glBufferData")]
	public static void BufferData( GLenu target, GLsizeiptr size, GLvoid* data, GLenu usage );
	// [CCode (cname = "glBufferSubData")]
	// public static void BufferSubData( GLenu target, GLintptr offset, GLsizeiptr size, void *data);
	
	[CCode (cname = "GLenum")]
	public enum BufferTarget
	{
		[CCode (cname = "GL_ARRAY_BUFFER")] 
		ArrayBuffer,
		[CCode (cname = "GL_ELEMENT_ARRAY_BUFFER")] 
		ElementArrayBuffer,
		
	}
	
	[CCode (cname = "GLenum")]
	public enum BufferUsageHint
	{
		[CCode (cname = "GL_STATIC_DRAW")] 
		StaticDraw,
		[CCode (cname = "GL_STREAM_DRAW")] 
		StreamDraw,
		[CCode (cname = "GL_DYNAMIC_DRAW")] 
		DynamicDraw,
		
	}

	public const GLenu GL_STATIC_DRAW; //0x88E4
	public static void Draw(
		Microsoft.Xna.Framework.Vector2 pos, 
		Microsoft.Xna.Framework.Vector2 size, 
		bool reverse = false)
	{
		
		Begin(PrimitiveType.Triangles);
		if (reverse)
		{
			// BR - bottom right
			TexCoord2f(1, 1); Vertex3f(pos.X, pos.Y+size.Y, 0);
			// BL - bottom left
			TexCoord2f(1, 0); Vertex3f(pos.X, pos.Y, 0);
			// TL - top left
			TexCoord2f(0, 0); Vertex3f(pos.X+size.X, pos.Y, 0);
			
			// BR - bottom right
			TexCoord2f(1, 1); Vertex3f(pos.X, pos.Y+size.Y, 0);
			// TR - top right
			TexCoord2f(0, 1); Vertex3f(pos.X+size.X, pos.Y+size.Y, 0);
			// TL - top left
			TexCoord2f(0, 0); Vertex3f(pos.X+size.X, pos.Y, 0);
		}
		else
		{
			// TR - top right
			TexCoord2f(0, 1); Vertex3f(pos.X, pos.Y+size.Y, 0);
			// TL - top left
			TexCoord2f(0, 0); Vertex3f(pos.X, pos.Y, 0);
			// BL - bottom left
			TexCoord2f(1, 0); Vertex3f(pos.X+size.X, pos.Y, 0);
			
			// TR - top right
			TexCoord2f(0, 1); Vertex3f(pos.X, pos.Y+size.Y, 0);
			// BR - bottom right
			TexCoord2f(1, 1); Vertex3f(pos.X+size.X, pos.Y+size.Y, 0);
			// BL - bottom left
			TexCoord2f(1, 0); Vertex3f(pos.X+size.X, pos.Y, 0);
		}
		End();
	}

	public static void DrawUserArrays(
		int count, 
		GLuint positionsBuffer, 
		GLuint texcoordsBuffer
		)
	{
		TexParameteri(TextureTarget.Texture2D, TextureParameterName.TextureWrapS, (GLint)TextureWrapMode.ClampToEdge);
		TexParameteri(TextureTarget.Texture2D, TextureParameterName.TextureWrapT, (GLint)TextureWrapMode.ClampToEdge);
		
		EnableClientState(EnableCap.VertexArray);
		EnableClientState(EnableCap.TextureCoordArray);
	
		BindBuffer(BufferTarget.ArrayBuffer, positionsBuffer);
		VertexPointer(3, DataType.Float, 0, (GLvoid*)0);
		
		BindBuffer(BufferTarget.ArrayBuffer, texcoordsBuffer);
		TexCoordPointer(2, DataType.Float, 0, (GLvoid*)0);
		
		DrawArrays(PrimitiveType.Triangles, 0, count * 6);

		BindBuffer(BufferTarget.ArrayBuffer, 0);
		DisableClientState(EnableCap.TextureCoordArray);  
		DisableClientState(EnableCap.VertexArray);
	}

	public static int PushState(Microsoft.Xna.Framework.Vector2? camera=null, GLdouble nearVal=-1, GLdouble farVal=1) 
	{
		MatrixMode(GLMode.Projection);
		PushMatrix();
		LoadIdentity();
		
		if (camera == null) {
		  	Ortho(0, 

				Microsoft.Xna.Framework.corange_graphics_viewport_width(), 
				0, 
				Microsoft.Xna.Framework.corange_graphics_viewport_height(), 
				nearVal, farVal);
		} else {
		  	Ortho(camera.X - Microsoft.Xna.Framework.corange_graphics_viewport_width() / 2, 
				  camera.X + Microsoft.Xna.Framework.corange_graphics_viewport_width() / 2,
				 -camera.Y + Microsoft.Xna.Framework.corange_graphics_viewport_height() / 2,
				 -camera.Y - Microsoft.Xna.Framework.corange_graphics_viewport_height() / 2,
				 nearVal, farVal);
		}
		
		MatrixMode(GLMode.ModelView);
		PushMatrix();
		LoadIdentity();
		
		Enable(TextureTarget.Texture2D);
		
		Enable(EnableCap.Blend);
		BlendFunc(BlendingFactorSrc.SrcAlpha, BlendingFactorDest.OneMinusSrcAlpha);
		return 0;
	  
	}
	  
	  
	public static void PopState() 
	{
		Disable(EnableCap.Blend);
		Disable(TextureTarget.Texture2D);  
		
		MatrixMode(GLMode.Projection);
		PopMatrix();
		
		MatrixMode(GLMode.ModelView);
		PopMatrix();
	}
}

