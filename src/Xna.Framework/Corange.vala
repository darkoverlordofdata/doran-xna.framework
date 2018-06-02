namespace Microsoft.Xna.Framework
{
    internal class Corange : Object
    {
        internal static double FPS { get { return frame_rate(); } }
        internal static double Time { get { return frame_time(); } }
        internal static double Ratio { get { return graphics_viewport_ratio(); } }
        internal static int Height { get { return graphics_viewport_height(); } }
        internal static int Width { get { return graphics_viewport_width(); } }
        internal static string Title { owned get { return graphics_viewport_title(); } }

        internal static int Multisamples 
        { 
            get { return graphics_get_multisamples(); } 
            set { graphics_set_multisamples(value); }
        }

        internal static bool Fullscreen 
        { 
            get { return graphics_get_fullscreen(); } 
            set { graphics_set_fullscreen(value); }
        }

        internal static int Antialiasing 
        { 
            get { return graphics_get_antialiasing(); } 
            set { graphics_set_antialiasing(value); }
        }

        internal static bool CursorHidden 
        { 
            get { return graphics_get_cursor_hidden(); } 
            set { graphics_set_cursor_hidden(value); }
        }

        internal static void Begin()
        {
            frame_begin();
        }

        internal static void End()
        {
            frame_end();
        }

        internal static void Initialize(string assets)
        {
            corange_init(assets); 
        }

        internal static void Finish() 
        {
            corange_finish();
        }

        internal static void UIRender()
        {
            ui_render();
        }

        internal static void UIUpdate()
        {
            ui_update();
        }

        internal static void UIEvent(Sdl.Event ev)
        {
            ui_event(ev);
        }

        internal static IntPtr ContextNew()
        {
	        return graphics_context_new();
        }

        internal static void ContextDelete(GLib.IntPtr context)
        {
	        graphics_context_delete(context);
        }

        internal static void ContextCurrent(GLib.IntPtr context)
        {
	        graphics_context_current(context);
        }

        internal static void SetTitle(string title)
        {
            graphics_viewport_set_title(title);
        }

        internal static void SetIcon(URI icon)
        {
            graphics_viewport_set_icon(icon);
        }

        internal static void SetPosition(int x, int y)
        {
            graphics_viewport_set_position(x, y);
        }

        internal static void SetSize(int width, int height)
        {
            graphics_viewport_set_size(width, height);
        }

        internal static void SetVsync(bool vsync)
        {
	        graphics_set_vsync(vsync);
        }

        internal static void Screenshot()
        {
	        graphics_viewport_screenshot();
        }

        internal static void Swap()
        {
            graphics_swap(); 
        }
    }
}