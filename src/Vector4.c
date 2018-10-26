/**
 * Extend cglm for Vala
 * 
 * ref counted Compact vector/matrix 
 * classes for use with the cglm api
 */
#include <stddef.h>
#include <string.h>
#include "glm.h"


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

