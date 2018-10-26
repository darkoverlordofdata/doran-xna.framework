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
 * Vector3 constructor
 * 
 */
Vector3* glm_vec3_new(float x, float y, float z)
{
    Vector3* this = malloc(sizeof(Vector3));
    this->ref_count = 1;
    this->X = x;
    this->Y = y;
    this->Z = z;
    return this;
}

Vector3* glm_vec3_ref(Vector3* this) {
    this->ref_count++;
    return this;
}   

void  glm_vec3_unref(Vector3* this) {
    if (this->ref_count == 1) free(this);
    else this->ref_count--;
}

int glm_vec3_hash(Vector3* this) {
  return abs( rawcast(this->X) ^ rawcast(this->Y) ^ rawcast(this->Z) );
}

bool glm_vec3_equals(Vector3* this, Vector3* other) {
    if (this->X == other->X && this->Y == other->Y && this->Z == other->Z)
        return true;
    else
        return false;
}

