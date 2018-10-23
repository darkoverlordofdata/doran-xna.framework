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

    internal enum TextureMinFilter
    {
        LinearMipmapNearest = 0x2701,
        NearestMipmapLinear = 0x2702,
        LinearMipmapLinear = 0x2703,
        Linear = 0x2601,
        NearestMipmapNearest = 0x2700,
        Nearest = 0x2600,
    }

    internal enum TextureMagFilter
    {
        Linear = 0x2601,
        Nearest = 0x2600,
    }

    internal enum PixelInternalFormat
    {
        Rgba = 0x1908,
        Rgb = 0x1907,
        Rgba4 = 0x8056,
        Luminance = 0x1909,
        CompressedRgbS3tcDxt1Ext = 0x83F0,
        CompressedSrgbS3tcDxt1Ext = 0x8C4C,
        CompressedRgbaS3tcDxt1Ext = 0x83F1,
        CompressedRgbaS3tcDxt3Ext = 0x83F2,
        CompressedSrgbAlphaS3tcDxt3Ext = 0x8C4E,
        CompressedRgbaS3tcDxt5Ext = 0x83F3,
        CompressedSrgbAlphaS3tcDxt5Ext = 0x8C4F,
        R32f = 0x822E,
        Rg16f = 0x822F,
        Rgba16f = 0x881A,
        R16f = 0x822D,
        Rg32f = 0x8230,
        Rgba32f = 0x8814,
        Rg8i = 0x8237,
        Rgba8i = 0x8D8E,
        Rg16ui = 0x823A,
        Rgba16ui = 0x8D76,
        Rgb10A2ui = 0x906F,
        Rgba16 = 0x805B,
        // PVRTC
        CompressedRgbPvrtc2Bppv1Img = 0x8C01,
        CompressedRgbPvrtc4Bppv1Img = 0x8C00,
        CompressedRgbaPvrtc2Bppv1Img = 0x8C03,
        CompressedRgbaPvrtc4Bppv1Img = 0x8C02,
        // ATITC
        AtcRgbaExplicitAlphaAmd = 0x8C93,
        AtcRgbaInterpolatedAlphaAmd = 0x87EE,
        // ETC1
        Etc1 = 0x8D64,
        Srgb = 0x8C40,

    }

    internal enum PixelFormat
    {
        Rgba = 0x1908,
        Rgb = 0x1907,
        Luminance = 0x1909,
        CompressedTextureFormats = 0x86A3,
        Red = 0x1903,
        Rg = 0x8227,
    }


    internal enum PixelType
    {
        UnsignedByte = 0x1401,
        UnsignedShort565 = 0x8363,
        UnsignedShort4444 = 0x8033,
        UnsignedShort5551 = 0x8034,
        Float = 0x1406,
        HalfFloat = 0x140B,
        HalfFloatOES = 0x8D61,
        Byte = 0x1400,
        UnsignedShort = 0x1403,
        UnsignedInt1010102 = 0x8036,
    }

    internal enum GenerateMipmapTarget
    {
        Texture1D = 0x0DE0,
        Texture2D = 0x0DE1,
        Texture3D = 0x806F,
        TextureCubeMap = 0x8513,
        Texture1DArray = 0x8C18,
        Texture2DArray = 0x8C1A,
        Texture2DMultisample = 0x9100,
        Texture2DMultisampleArray = 0x9102,
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

        [CCode (has_target = false)]
        internal delegate unowned void ViewportDelegate (int x, int y, int w, int h);
        internal static ViewportDelegate Viewport;

        [CCode (has_target = false)]
        internal delegate unowned void GenTexturesDelegate (int count, ref int id);
        internal static GenTexturesDelegate GenTextures;

        [CCode (has_target = false)]
        internal delegate unowned void TexImage2DDelegate (TextureTarget target, int level, PixelInternalFormat internalFormat,
            int width, int height, int border, PixelFormat format, PixelType pixelType, IntPtr data);
        internal static TexImage2DDelegate TexImage2D;

        [CCode (has_target = false)]
        internal delegate unowned void GenerateMipmapDelegate (GenerateMipmapTarget target);
        internal static GenerateMipmapDelegate GenerateMipmap;

        internal static void LoadEntryPoints ()
        {
            GenerateMipmap = LoadEntryPoint<GenerateMipmapDelegate> ("glGenerateMipmap");
            TexImage2D = LoadEntryPoint<TexImage2DDelegate> ("glTexImage2D");
            GenTextures = LoadEntryPoint<GenTexturesDelegate> ("glGenTextures");
            Viewport = LoadEntryPoint<ViewportDelegate> ("glViewport");
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
            catch (Exception e)
            {
                if (throwIfNotFound)
                    throw new Exception.EntryPointNotFound("Unable to load "+proc);
                return null;
            }

        }

        internal static GraphicsContext CreateContext (WindowInfo info)
        {
            print("== CreateContext ==\n");
            return new GraphicsContext(info);
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