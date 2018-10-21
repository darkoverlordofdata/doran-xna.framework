/* ******************************************************************************
 * Copyright 2018 darkoverlordofdata.
 * 
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *   http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 ******************************************************************************/
namespace ValaGame.OpenGL
{

    [Flags]
    internal enum ClearBufferMask
    {
        DepthBufferBit = 0x00000100,
        StencilBufferBit = 0x00000400,
        ColorBufferBit = 0x00004000,
    }

    internal enum TextureTarget
    {
        Texture2D = 0x0DE1,
        Texture3D = 0x806F,
        TextureCubeMap = 0x8513,
        TextureCubeMapPositiveX = 0x8515,
        TextureCubeMapPositiveY = 0x8517,
        TextureCubeMapPositiveZ = 0x8519,
        TextureCubeMapNegativeX = 0x8516,
        TextureCubeMapNegativeY = 0x8518,
        TextureCubeMapNegativeZ = 0x851A,
    }

    internal enum ErrorCode
    {
        NoError = 0,
        InvalidEnum = 1280,
        InvalidValue = 1281,
        InvalidOperation = 1282,
        StackOverflow = 1283,
        StackUnderflow = 1284,
        OutOfMemory = 1285,
        InvalidFramebuffer = 1286
    }

    internal enum BufferTarget
    {
        ArrayBuffer = 0x8892,
        ElementArrayBuffer = 0x8893,
    }
    
    internal enum BufferUsageHint
    {
        StreamDraw = 0x88E0,
        StaticDraw = 0x88E4,
    }

    internal enum DataType
    {
        Byte = 0x1400,
        UnsignedByte = 0x1401,
        Short = 0x1402,
        UnsignedShort = 0x1403,
        UnsignedInt = 0x1405,
        Float = 0x1406,
    }

    internal enum EnableCap 
    {
        PointSmooth = 0x0B10,
        LineSmooth = 0x0B20,
        CullFace = 0x0B44,
        Lighting = 0x0B50,
        ColorMaterial = 0x0B57,
        Fog = 0x0B60,
        DepthTest = 0x0B71,
        StencilTest = 0x0B90,
        Normalize = 0x0BA1,
        AlphaTest = 0x0BC0,
        Dither = 0x0BD0,
        Blend = 0x0BE2,
        ColorLogicOp = 0x0BF2,
        ScissorTest = 0x0C11,
        Texture2D = 0x0DE1,
        PolygonOffsetFill = 0x8037,
        RescaleNormal = 0x803A,
        VertexArray = 0x8074,
        NormalArray = 0x8075,
        ColorArray = 0x8076,
        TextureCoordArray = 0x8078,
        Multisample = 0x809D,
        SampleAlphaToCoverage = 0x809E,
        SampleAlphaToOne = 0x809F,
        SampleCoverage = 0x80A0,
        DebugOutputSynchronous = 0x8242,
        DebugOutput = 0x92E0,
    }

    public enum PrimitiveType
    {
        Lines = 0x0001,
        LineStrip = 0x0003,
        Triangles = 0x0004,
        TriangleStrip = 0x0005,
    }

    internal enum Mode
    {
        ModelView = 0x1700,
        Projection = 0x1701,
        Texture = 0x1702,
    }

    internal enum TextureParameterName
    {
        TextureMaxAnisotropyExt = 0x84FE,
        TextureBaseLevel = 0x813C,
        TextureMaxLevel = 0x813D,
        TextureMinFilter = 0x2801,
        TextureMagFilter = 0x2800,
        TextureWrapS = 0x2802,
        TextureWrapT = 0x2803,
        TextureBorderColor = 0x1004,
        TextureLodBias = 0x8501,
        TextureCompareMode = 0x884C,
        TextureCompareFunc = 0x884D,
        GenerateMipmap = 0x8191,
    }

    internal enum BlendingFactorSrc
    {
        Zero = 0,
        SrcColor = 0x0300,
        OneMinusSrcColor = 0x0301,
        SrcAlpha = 0x0302,
        OneMinusSrcAlpha = 0x0303,
        DstAlpha = 0x0304,
        OneMinusDstAlpha = 0x0305,
        DstColor = 0x0306,
        OneMinusDstColor = 0x0307,
        SrcAlphaSaturate = 0x0308,
        ConstantColor = 0x8001,
        OneMinusConstantColor = 0x8002,
        ConstantAlpha = 0x8003,
        OneMinusConstantAlpha = 0x8004,
        One = 1,
    }

    internal enum BlendingFactorDest
    {
        Zero = 0,
        SrcColor = 0x0300,
        OneMinusSrcColor = 0x0301,
        SrcAlpha = 0x0302,
        OneMinusSrcAlpha = 0x0303,
        DstAlpha = 0x0304,
        OneMinusDstAlpha = 0x0305,
        DstColor = 0x0306,
        OneMinusDstColor = 0x0307,
        SrcAlphaSaturate = 0x0308,
        ConstantColor = 0x8001,
        OneMinusConstantColor = 0x8002,
        ConstantAlpha = 0x8003,
        OneMinusConstantAlpha = 0x8004,
        One = 1,
    }

    internal enum TextureWrapMode
    {
        ClampToEdge = 0x812F,
        Repeat = 0x2901,
        MirroredRepeat = 0x8370,
        //GLES
        ClampToBorder = 0x812D,
    }

	internal enum TextureParameter 
	{
		Width = 0x1000,
		Height = 0x1001,
		RedSize = 0x805C,
		GreenSize = 0x805D,
		BlueSize = 0x805E,
	}

    internal enum GLString
    {
    /* Utility */
        Vendor = 0x1F00,
        Renderer = 0x1F01,
        Version = 0x1F02,
        Extensions = 0x1F03,

    }

    public class GL : Object
    {
        [CCode (has_target = false)]
        internal delegate ErrorCode GetErrorDelegate ();
        internal static GetErrorDelegate GetError;

        [CCode (has_target = false)]
        internal delegate void BindTextureDelegate (TextureTarget target, uint id);
        internal static BindTextureDelegate BindTexture;

        [CCode (has_target = false)]
        internal delegate void BindBufferDelegate (BufferTarget target, uint buffer);
        internal static BindBufferDelegate BindBuffer;

        [CCode (has_target = false)]
        internal delegate void ClearDelegate (ClearBufferMask mask);
        internal static ClearDelegate Clear;

        [CCode (has_target = false)]
        internal delegate void ClearColorDelegate (float red, float green, float blue, float alpha);
        internal static ClearColorDelegate ClearColor;

        [CCode (has_target = false)]
        internal delegate void GenBuffersDelegate (int count, uint *buffer);
        internal static GenBuffersDelegate GenBuffers;

        [CCode (has_target = false)]
        internal delegate void BufferDataDelegate (BufferTarget target, ulong size, void* data, BufferUsageHint usage);
        internal static BufferDataDelegate BufferData;

        [CCode (has_target = false)]
        internal delegate void BufferSubDataDelegate (BufferTarget target, int offset, ulong size, void *data);
        internal static BufferSubDataDelegate BufferSubData;
        
        [CCode (has_target = false)]
        internal delegate void DeleteBuffersDelegate (int count, uint* buffer);
        internal static DeleteBuffersDelegate DeleteBuffers;

        [CCode (has_target = false)]
        internal delegate void TexCoordPointerDelegate(int size, int type, int stride, void* ptr);
        internal static TexCoordPointerDelegate TexCoordPointer;

        [CCode (has_target = false)]
        internal delegate void VertexPointerDelegate(int size, int type, int stride, void* ptr);
        internal static VertexPointerDelegate VertexPointer;

        [CCode (has_target = false)]
        internal delegate void EnableClientStateDelegate(EnableCap cap);
        internal static EnableClientStateDelegate EnableClientState;

        [CCode (has_target = false)]
        internal delegate void DisableClientStateDelegate(EnableCap cap);
        internal static DisableClientStateDelegate DisableClientState;

        [CCode (has_target = false)]
        internal delegate void DrawElementsDelegate(PrimitiveType mode, int count, DataType type, void* indices);
        internal static DrawElementsDelegate DrawElements;

        [CCode (has_target = false)]
        internal delegate void BeginDelegate(PrimitiveType primitiveType);
        internal static BeginDelegate Begin;

        [CCode (has_target = false)]
        internal delegate void EndDelegate();
        internal static EndDelegate End;

        [CCode (has_target = false)]
        internal delegate void TexParameterIntDelegate (TextureTarget target, TextureParameterName name, int value);
        internal static TexParameterIntDelegate TexParameteri;

        [CCode (has_target = false)]
        internal delegate void DrawArraysDelegate (PrimitiveType primitiveType, int offset, int count);
        internal static DrawArraysDelegate DrawArrays;

        [CCode (has_target = false)]
        internal delegate void MatrixModeDelegate (Mode mode);
        internal static MatrixModeDelegate MatrixMode;

        [CCode (has_target = false)]
        internal delegate void PushMatrixDelegate ();
        internal static PushMatrixDelegate PushMatrix;

        [CCode (has_target = false)]
        internal delegate void PopMatrixDelegate ();
        internal static PopMatrixDelegate PopMatrix;

        [CCode (has_target = false)]
        internal delegate void LoadIdentityDelegate ();
        internal static LoadIdentityDelegate LoadIdentity;

        [CCode (has_target = false)]
        internal delegate void OrthoDelegate (double left, double right, double bottom, double top, double near_val, double far_val);
        internal static OrthoDelegate Ortho;

        [CCode (has_target = false)]
        internal delegate void FrustrumDelegate (double left, double right, double bottom, double top, double near_val, double far_val);
        internal static FrustrumDelegate Frustrum;

        [CCode (has_target = false)]
        internal delegate int EnableDelegate (EnableCap cap);
        internal static EnableDelegate Enable;

        [CCode (has_target = false)]
        internal delegate int DisableDelegate (EnableCap cap);
        internal static DisableDelegate Disable;

        [CCode (has_target = false)]
        internal delegate int BlendFuncDelegate (BlendingFactorSrc sfactor, BlendingFactorDest dfactor);
        internal static BlendFuncDelegate BlendFunc;

        [CCode (has_target = false)]
        internal delegate int Vertex3fDelegate (float x, float y, float z);
        internal static Vertex3fDelegate Vertex3f;

        [CCode (has_target = false)]
        internal delegate int TexCoord2fDelegate (float s, float t);
        internal static TexCoord2fDelegate TexCoord2f;

        [CCode (has_target = false)]
        internal delegate int GetTexLevelParameterivDelegate (TextureTarget target, int level, TextureParameter pname,[CCode (array_length = false)] int[] params);
        internal static GetTexLevelParameterivDelegate GetTexLevelParameteriv;

        [CCode (has_target = false)]
        internal delegate unowned string GetStringDelegate (GLString name);
        internal static GetStringDelegate GetString;


        internal static void LoadEntryPoints ()
        {
            GetError = LoadEntryPoint<GetErrorDelegate> ("glGetError");
            TexParameteri = LoadEntryPoint<TexParameterIntDelegate> ("glTexParameteri");
            Clear = LoadEntryPoint<ClearDelegate> ("glClear");
            ClearColor = LoadEntryPoint<ClearColorDelegate> ("glClearColor");
            BindTexture = LoadEntryPoint<BindTextureDelegate> ("glBindTexture");
            Enable = LoadEntryPoint<EnableDelegate> ("glEnable");
            Disable = LoadEntryPoint<DisableDelegate> ("glDisable");
            GenBuffers = LoadEntryPoint<GenBuffersDelegate> ("glGenBuffers");
            BufferData = LoadEntryPoint<BufferDataDelegate> ("glBufferData");
            BufferSubData = LoadEntryPoint<BufferSubDataDelegate> ("glBufferSubData");
            DeleteBuffers = LoadEntryPoint<DeleteBuffersDelegate> ("glDeleteBuffers");
            BindBuffer = LoadEntryPoint<BindBufferDelegate> ("glBindBuffer");
            DrawElements = LoadEntryPoint<DrawElementsDelegate> ("glDrawElements");
            DrawArrays = LoadEntryPoint<DrawArraysDelegate> ("glDrawArrays");

            Ortho = LoadEntryPoint<OrthoDelegate> ("glOrtho");
            Frustrum = LoadEntryPoint<FrustrumDelegate> ("glFrustrum");
            BlendFunc = LoadEntryPoint<BlendFuncDelegate> ("glBlendFunc");
            MatrixMode = LoadEntryPoint<MatrixModeDelegate> ("glMatrixMode");
            PushMatrix = LoadEntryPoint<PushMatrixDelegate> ("glPushMatrix");
            PopMatrix = LoadEntryPoint<PopMatrixDelegate> ("glPopMatrix");
            Vertex3f = LoadEntryPoint<Vertex3fDelegate> ("glVertex3f");
            TexCoord2f = LoadEntryPoint<TexCoord2fDelegate> ("glTexCoord2f");
            GetTexLevelParameteriv = LoadEntryPoint<GetTexLevelParameterivDelegate> ("glGetTexLevelParameteriv");
            LoadIdentity = LoadEntryPoint<LoadIdentityDelegate> ("glLoadIdentity");
            TexCoordPointer = LoadEntryPoint<TexCoordPointerDelegate> ("glTexCoordPointer");
            VertexPointer = LoadEntryPoint<VertexPointerDelegate> ("glVertexPointer");
            DisableClientState = LoadEntryPoint<DisableClientStateDelegate> ("glDisableClientState");
            EnableClientState = LoadEntryPoint<EnableClientStateDelegate> ("glEnableClientState");
            Begin = LoadEntryPoint<BeginDelegate>("glBegin");
            End = LoadEntryPoint<EndDelegate>("glEnd");
            GetString = LoadEntryPoint<GetStringDelegate> ("glGetString");
        }

        internal static T LoadEntryPoint<T>(string proc, bool throwIfNotFound = false)
        {
            try
            {
                var addr = Sdl.SDL_GL_GetProcAddress(proc);
                if (addr == null) return null;
                return (T)addr;
            }
            catch (Microsoft.Xna.Framework.Exception e)
            {
                if (throwIfNotFound)
                    throw new Microsoft.Xna.Framework.Exception.GLError("Unable to load "+proc);
                return null;
            }

        }

        // Extensions/Helpers...
        
        public static void Draw(
            Glm.Vec2 pos, 
            Glm.Vec2 size, 
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
            uint positionsBuffer, 
            uint texcoordsBuffer
            )
        {
            TexParameteri(TextureTarget.Texture2D, TextureParameterName.TextureWrapS, (int)TextureWrapMode.ClampToEdge);
            TexParameteri(TextureTarget.Texture2D, TextureParameterName.TextureWrapT, (int)TextureWrapMode.ClampToEdge);
            
            EnableClientState(EnableCap.VertexArray);
            EnableClientState(EnableCap.TextureCoordArray);
        
            BindBuffer(BufferTarget.ArrayBuffer, positionsBuffer);
            VertexPointer(3, DataType.Float, 0, (void*)0);
            
            BindBuffer(BufferTarget.ArrayBuffer, texcoordsBuffer);
            TexCoordPointer(2, DataType.Float, 0, (void*)0);
            
            DrawArrays(PrimitiveType.Triangles, 0, count * 6);

            BindBuffer(BufferTarget.ArrayBuffer, 0);
            DisableClientState(EnableCap.TextureCoordArray);  
            DisableClientState(EnableCap.VertexArray);
        }
        /**
         *  Set 2D Camera with Orthographic display
         *
         */
        public static void Use2DCamera(Microsoft.Xna.Framework.Graphics.OrthoCamera? ortho=null) 
        {
            ortho = ortho ?? Microsoft.Xna.Framework.Graphics.OrthoCamera.Default;

            MatrixMode(Mode.Projection);
            LoadIdentity();
            Ortho(ortho.Left, ortho.Right, ortho.Bottom, ortho.Top, ortho.Near, ortho.Far);
            MatrixMode(Mode.ModelView);
            LoadIdentity();
            Enable(EnableCap.Texture2D);
            Enable(EnableCap.Blend);
            BlendFunc(BlendingFactorSrc.SrcAlpha, BlendingFactorDest.OneMinusSrcAlpha);
        }
    }
}