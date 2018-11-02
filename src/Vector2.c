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
const Vector2* glm_vec2_zero_const  = _glm_vec2_zero;
const Vector2* glm_vec2_one_const   = _glm_vec2_one;

/**
 * Vector2 constructor
 * 
 */
Vector2* glm_vec2_new(float x, float y)
{
    Vector2* this = malloc(sizeof(Vector2));
    this->ref_count = 1;
    this->X = x;
    this->Y = y;
    return this;
}

Vector2* glm_vec2_ref(Vector2* this) {
    this->ref_count++;
    return this;
}

void  glm_vec2_unref(Vector2* this) {
    if (this->ref_count == 1) free(this);
    else this->ref_count--;
}

int glm_vec2_hash(Vector2* this) {
  return abs( rawcast(this->X) ^ rawcast(this->Y) );
}

bool glm_vec2_equals(Vector2* this, Vector2* other) {
    if (this->X == other->X && this->Y == other->Y)
        return true;
    else
        return false;
}

void glm_vec2_sub(Vector2* this, Vector2* other, Vector2* dest) {
    dest->X = this->X - other->X;
    dest->Y = this->Y - other->Y;
}

void glm_vec2_scale(Vector2* this, float scale, Vector2* dest) {
    dest->X = this->X * scale;
    dest->Y = this->Y * scale;
}

float glm_vec2_len(Vector2* this)
{
    return sqrtf(this->X * this->X + this->Y * this->Y);
}
float glm_vec2_len2(Vector2* this)
{
    return this->X * this->X + this->Y * this->Y;
}
void glm_vec2_normalize(Vector2* this)
{
    float len = glm_vec2_len(this);
    this->X /= len;
    this->Y /= len;
}
