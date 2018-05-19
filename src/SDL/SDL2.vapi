/*
The MIT License (MIT)
Copyright (c) <2018> DarkOverlordOfData <SDL2.0 vapi>

modeled on Xna.Framework/SDL/SDL2.cs

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

	[SimpleType]
	public struct Guid
	{
		int32 Data1;
		int16 Data2;
		int16 Data3;
		uint8 Data4[8];
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
		public Sdl.Joystick.DeviceEvent Joystick;
		[CCode (cname = "cdevice")]
		public Sdl.GameController.DeviceEvent Controller;
	}

	[SimpleType, CCode (cname = "SDL_Point", cheader_filename = "SDL2/SDL_rect.h")]
	public struct Point {
		[CCode (cname = "x")]
		public int X;
		[CCode (cname = "y")]
		public int Y;
	}

	[SimpleType, CCode (cname = "SDL_Rect", cheader_filename = "SDL2/SDL_rect.h")]
	public struct Rectangle : Point
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

	private GLib.IntPtr GetErrorPtr(GLib.IntPtr pointer)
    {
		if (pointer == GLib.IntPtr.Zero)
			GLib.stdout.printf(SDL_GetError());
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
			[CCode (cname = "SDL_WINDOW_FULLSCREEN_DESKTOP")] 
			FullscreenDesktop,
			[CCode (cname = "SDL_WINDOW_OPENGL")] 
			Opengl,
			[CCode (cname = "SDL_WINDOW_SHOWN")] 
			Shown,
			[CCode (cname = "SDL_WINDOW_HIDDEN")] 
			Hidden,
			[CCode (cname = "SDL_WINDOW_BORDERLESS")] 
			Borderless
		}

		[SimpleType, CCode (cname = "SDL_WindowEvent", cheader_filename = "SDL2/SDL_events.h")]
		public struct Event : CommonEvent
		{
			[CCode (cname = "windowID")]
			public uint32 WindowID;
			[CCode (cname = "eventID")]
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
			return GetErrorPtr(SDL_CreateWindow(title, x, y, w, h, flags));
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
		public static void SetBordered (GLib.IntPtr window, bool bordered);

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
		private static int SDL_GetDisplayBounds (int displayIndex, out Rectangle rect);

        public static void GetBounds(int displayIndex, out Rectangle rect)
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
		public static unowned string? GetDisplayName ();

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
		public static int Copy (GLib.IntPtr renderer, GLib.IntPtr texture, Rectangle? srcrect=null, Rectangle? dstrect=null);

		[CCode (cname = "SDL_RenderCopyEx")]
		public static int CopyEx (GLib.IntPtr renderer, GLib.IntPtr texture, Rectangle? srcrect, Rectangle? dstrect, double angle, Point? center, int flip);

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
            return GetErrorPtr(SDL_GL_CreateContext(window));
        }

		[CCode (cname = "SDL_GL_DeleteContext")]
        public static void DeleteContext(GLib.IntPtr context);
		
		[CCode (cname = "SDL_GL_GetCurrentContext")]
		private static GLib.IntPtr SDL_GL_GetCurrentContext ();

		public static GLib.IntPtr GetCurrentContext()
        {
            return GetErrorPtr(SDL_GL_GetCurrentContext());
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

		[SimpleType, CCode (cname = "SDL_MouseButtonEvent", cheader_filename = "SDL2/SDL_events.h")]
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
		
		[SimpleType, CCode (cname = "SDL_MouseButtonEvent", cheader_filename = "SDL2/SDL_events.h")]
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

        public static GLib.IntPtr createColorCursor(GLib.IntPtr surface, int x, int y)
        {
            return GetErrorPtr(SDL_CreateColorCursor(surface, x, y));
        }

		[CCode (cname = "SDL_CreateSystemCursor")]
		private static GLib.IntPtr SDL_CreateSystemCursor (SystemCursor id);
        public static GLib.IntPtr createSystemCursor(SystemCursor id)
        {
            return GetErrorPtr(SDL_CreateSystemCursor(id));
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
			[CCode (cname = "text")]
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
			[CCode (cname = "text")]
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
            return GetErrorPtr(SDL_JoystickFromInstanceID(joyid));
        }

		[CCode (cname = "SDL_JoystickGetAxis")]
		public static int16 GetAxis (GLib.IntPtr joystick, int axis);

		[CCode (cname = "SDL_JoystickGetButton")]
		public static uint8 GetButton (GLib.IntPtr joystick, int button);

		[CCode (cname = "SDL_JoystickGetGUID")]
		public static Guid GetGuid(GLib.IntPtr joystick);

		[CCode (cname = "SDL_JoystickGetHat")]
		public static Hat GetHat (GLib.IntPtr joystick, int hat);

		[CCode (cname = "SDL_JoystickInstanceID")]
		public static int InstanceId (GLib.IntPtr joystick);

		[CCode (cname = "SDL_JoystickOpen")]
		private static GLib.IntPtr SDL_JoystickOpen (int device_index);

        public static GLib.IntPtr Open(int deviceIndex)
        {
            return GetErrorPtr(SDL_JoystickOpen(deviceIndex));
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
            return GetErrorPtr(SDL_GameControllerFromInstanceID(joyid));
        }

		[CCode (cname = "SDL_GameControllerGetAxis")]
		public static int16 GetAxis (GLib.IntPtr gamecontroller, Axis axis);
	
		[CCode (cname = "SDL_GameControllerGetButton")]
		public static uint8 GetButton (GLib.IntPtr gamecontroller, Button button);

		[CCode (cname = "SDL_GameControllerGetJoystick")]
		private static GLib.IntPtr SDL_GameControllerGetJoystick(GLib.IntPtr gamecontroller);

        public static GLib.IntPtr GetJoystick(GLib.IntPtr gamecontroller)
        {
            return GetErrorPtr(SDL_GameControllerGetJoystick(gamecontroller));
        }

		[CCode (cname = "SDL_IsGameController")]
		public static uint8 IsGameController (int joystickIndex);

		[CCode (cname = "SDL_GameControllerMapping")]
		public static string? GetMapping (GLib.IntPtr gamecontroller);


		[CCode (cname = "SDL_GameControllerOpen")]
		private static GLib.IntPtr SDL_GameControllerOpen (int joystickIndex);
	
        public static GLib.IntPtr Open(int joystickIndex)
        {
            return GetErrorPtr(SDL_GameControllerOpen(joystickIndex));
        }

		[CCode (cname = "SDL_GameControllerName")]
		public static string? GetName(GLib.IntPtr gamecontroller);

	}

    public class Haptic
	{

		[CCode (cname = "SDL_HAPTIC_LEFTRIGHT")]
		public const uint32 LeftRight;


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
		public static int EffectSupported (GLib.IntPtr haptic, Effect effect);

		[CCode (cname = "SDL_JoystickIsHaptic", cheader_filename = "SDL2/SDL_haptic.h")]
		public static int IsHaptic (GLib.IntPtr joystick);
	
		[CCode (cname = "SDL_HapticNewEffect")]
		private static int SDL_HapticNewEffect (GLib.IntPtr haptic, ref Effect effect);
		
        public static void NewEffect(GLib.IntPtr haptic, ref Effect effect)
        {
            GetErrorInt(SDL_HapticNewEffect(haptic, ref effect));
		}
		
		[CCode (cname = "SDL_HapticOpen")]
		public static GLib.IntPtr open (int device_index);
		
		[CCode (cname = "SDL_HapticOpenfromJoystick")]
		private static GLib.IntPtr SDL_HapticOpenfromJoystick (GLib.IntPtr joystick);
		
        public static GLib.IntPtr OpenFromJoystick(GLib.IntPtr joystick)
        {
            return GetErrorPtr(SDL_HapticOpenfromJoystick(joystick));
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
