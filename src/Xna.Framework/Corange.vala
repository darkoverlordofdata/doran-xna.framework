namespace Microsoft.Xna.Framework
{
    internal class Corange : Object
    {

        internal static void FrameBegin()
        {
            frame_begin();
        }

        internal static void FrameEnd()
        {
            frame_end();
        }

        internal static double FrameRate()
        {
            return frame_rate();
        }

        internal static double FrameTime()
        {
            return frame_time();
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
        
        internal static void GraphicsSetVsync(bool vsync)
        {
	        graphics_set_vsync(vsync);
        }

        internal static void GraphicsSetMultisamples(int samples)
        {
	        graphics_set_multisamples(samples);
        }

        internal static void GraphicsSetFullscreen(bool fullscreen)
        {
	        graphics_set_fullscreen(fullscreen);
        }

        internal static void GraphicsSetAntialiasing(int quality)
        {
	        graphics_set_antialiasing(quality);
        }

        internal static IntPtr GraphicsContextNew()
        {
	        return graphics_context_new();
        }

        internal static void GraphicsContextDelete(GLib.IntPtr context)
        {
	        graphics_context_delete(context);
        }

        internal static void GraphicsContextCurrent(GLib.IntPtr context)
        {
	        graphics_context_current(context);
        }

        internal static int GraphicsGetMultisamples()
        {
	        return graphics_get_multisamples();
        }

        internal static bool GraphicsGetFullscreen()
        {
	        return graphics_get_fullscreen();
        }

        internal static int GraphicsGetAntialiasing()
        {
	        return graphics_get_antialiasing();
        }

        internal static void GraphicsSetTitle(string title)
        {
            graphics_viewport_set_title(title);
        }

        internal static void GraphicsSetIcon(URI icon)
        {
            graphics_viewport_set_icon(icon);
        }

        internal static void GraphicsSetPosition(int x, int y)
        {
            graphics_viewport_set_position(x, y);
        }

        internal static void GraphicsSetSize(int width, int height)
        {
            graphics_viewport_set_size(width, height);
        }

        internal static void GraphicsScreenshot()
        {
	        graphics_viewport_screenshot();
        }
        
        internal static string GraphicsTitle()
        {
	        return graphics_viewport_title();
        }
        
        internal static int GraphicsHeight()
        {
	        return graphics_viewport_height();
        }

        internal static int GraphicsWidth()
        {
	        return graphics_viewport_width();
        }

        internal static double GraphicsRatio()
        {
	        return graphics_viewport_ratio();
        }

        internal static void GraphicsSetCursorHidden(bool hidden)
        {
	        graphics_set_cursor_hidden(hidden);
        }

        internal static bool GraphicsGetCursorHidden(bool hidden)
        {
	        return graphics_get_cursor_hidden();
        }

        internal static void GraphicsSwap()
        {
            graphics_swap(); 
        }


    }
}