/**
 * Extend cglm for Vala
 * 
 * ref counted Compact vector/matrix 
 * classes for use with the cglm api
 */
#include <stddef.h>
#include <string.h>
#include "glm.h"

static int rawcast(float x) {
  union {
    float f;
    int i;
  } u;
  u.f = x;
  return u.i;
}

/**
 * Constants:
 */
const Vector4* glm_vec4_zero_const  = _glm_vec4_zero;
const Vector4* glm_vec4_one_const   = _glm_vec4_one;

/**
 * Vector4 constructor
 * 
 */
Vector4* glm_vec4_new(float w, float x, float y, float z)
{
    Vector4* this = malloc(sizeof(Vector4));
    this->ref_count = 1;
    this->X = x;
    this->Y = y;
    this->Z = z;
    this->W = w;
    return this;
}

Vector4* glm_vec4_ref(Vector4* this) {
    this->ref_count++;
    return this;
}   

void  glm_vec4_unref(Vector4* this) {
    if (this->ref_count == 1) free(this);
    else this->ref_count--;
}

int glm_vec4_hash(Vector4* this) {
  return abs( rawcast(this->W) ^ rawcast(this->X) ^ rawcast(this->Y) ^ rawcast(this->Z) );
}

bool glm_vec4_equals(Vector4* this, Vector4* other) {
    if (this->W == other->W && this->X == other->X && this->Y == other->Y && this->Z == other->Z)
        return true;
    else
        return false;
}