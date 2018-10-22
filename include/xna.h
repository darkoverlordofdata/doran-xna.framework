#ifndef _XNA_H_
#define _XNA_H_

/* Standard includes */
#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <string.h>
#include <dirent.h>
#include <assert.h>
#include <math.h>
#include <time.h>
#include <signal.h>
#include <float.h>
/* SDL includes */
#include <SDL2/SDL.h>
#include <SDL2/SDL_opengl.h>
#include <SDL2/SDL_rwops.h>
#include <SDL2/SDL_mixer.h>
// #include <SDL2/SDL_net.h>
// #include "SDL2/SDL_local.h"

char error_buf[2048];
char error_str[2048];

char warning_buf[2048];
char warning_str[2048];

char debug_buf[2048];
char debug_str[2048];

#define __FILENAME__ (strrchr(__FILE__, '/') ? strrchr(__FILE__, '/') + 1 : __FILE__)

#define error(MSG, ...) { \
  sprintf(error_str, "[ERROR] (%s:%s:%i) ", __FILENAME__, __func__, __LINE__); \
  sprintf(error_buf, MSG, ##__VA_ARGS__); strcat(error_str, error_buf); \
  printf("%s\n", error_str); }
  
#define warning(MSG, ...) { \
  sprintf(warning_str, "[WARNING] (%s:%s:%i) ", __FILENAME__, __func__, __LINE__); \
  sprintf(warning_buf, MSG, ##__VA_ARGS__); strcat(warning_str, warning_buf); \
  printf("%s\n", warning_str); }

#define debug(MSG, ...) { \
  sprintf(debug_str, "[DEBUG] (%s:%s:%i) ", __FILENAME__, __func__, __LINE__); \
  sprintf(debug_buf, MSG, ##__VA_ARGS__); strcat(debug_str, debug_buf); \
  printf("%s\n", debug_str); }

void xna_init();
void xna_finish();

void graphics_init();
void audio_init();
void joystick_init();
void net_init();

void graphics_finish();
void audio_finish();
void joystick_finish();
void net_finish();


#endif // _XNA_H_