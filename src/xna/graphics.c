#include "xna.h";

static SDL_Window* screen = NULL;
static SDL_GLContext* context = NULL; 

static int window_flags = 0;
static int window_multisamples = 0;
static int window_multisamplesbuffs = 0;
static int window_antialiasing = 0;

static void graphics_viewport_start() {
  
    screen = SDL_CreateWindow("Xna.Framework",
                            SDL_WINDOWPOS_UNDEFINED,
                            SDL_WINDOWPOS_UNDEFINED,
                            800, 600,
                            window_flags);

    if (screen == NULL) {
        error("Could not create SDL window: %s", SDL_GetError());
    }

    SDL_Surface* window_icon = SDL_LoadBMP("./assets/d16a.bmp");
    SDL_SetWindowIcon(screen, window_icon);
    SDL_FreeSurface(window_icon);
    
    SDL_GL_SetAttribute(SDL_GL_SHARE_WITH_CURRENT_CONTEXT, 1);
    context = SDL_GL_CreateContext(screen);
    
    if (context == NULL) {
        error("Could not create SDL context: %s", SDL_GetError());
    }
    
    SDL_GL_SetSwapInterval(1);
    glViewport(0, 0, 800, 600);
  
}

void graphics_init()
{
    int error = SDL_InitSubSystem(SDL_INIT_VIDEO);
    
    if (error == -1) {
        error("Cannot initialize SDL video!");
    }

    window_flags = SDL_WINDOW_OPENGL;
    window_multisamples = 4;
    window_multisamplesbuffs = 1;
    window_antialiasing = 1;
    
    graphics_viewport_start();
    
}

void graphics_finish() {
    SDL_GL_DeleteContext(context);
    SDL_DestroyWindow(screen);
}
