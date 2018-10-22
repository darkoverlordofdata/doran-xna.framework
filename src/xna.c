/**
 * low level xna intergace to sdl / opengl
 */
#include "xna.h";

void xna_init() {
  /* Starting xna */
  debug("Starting xna...");

  /* Graphics Manager */
  debug("Creating Graphics Manager...");
  graphics_init();
  
//   /* Audio Manager */
//   debug("Creating Audio Manager...");
//   audio_init();
  
//   /* Joystick Manager */
//   debug("Creating Joystick Manager...");
//   joystick_init();
  
//   /* Network Manager */
//   debug("Creating Network Manager...");
//   net_init();
  
  debug("Finished!");

}

void xna_finish() 
{
//   net_finish();
//   joystick_finish();
//   audio_finish();
    graphics_finish();
    
    SDL_Quit();

}

void audio_init()
{

}
void joystick_init()
{

}
void net_init()
{

}
