/*
 * Copyright 2018 (c), Bruce Davidson.
 *
 * MIT License (MIT), http://opensource.org/licenses/MIT
 */
#ifndef _EMSCRIPTEN_H_
#define _EMSCRIPTEN_H_

/**
 * Wee need this for SDL_GL_GetProcAddress
 */
void* emscripten_GetProcAddress(const char *name_);

#endif // _EMSCRIPTEN_H_
