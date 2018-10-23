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
 * Quaternion constructor
 * 
 */
Quaternion* glm_quat_new()
{
    Quaternion* this = malloc(sizeof(Quaternion));
    this->ref_count = 1;
    glm_quat_identity(this);
    return this;
}

Quaternion* glm_quat_ctor(float x, float y, float z, float w)
{
    Quaternion* this = malloc(sizeof(Quaternion));
    this->ref_count = 1;
    glm_quat_init(this, x, y, z, w);
    return this;
}

Quaternion* glm_quat_ref(Quaternion* this) {
    this->ref_count++;
    return this;
}   

void  glm_quat_unref(Quaternion* this) {
    if (this->ref_count == 1) free(this);
    else this->ref_count--;
}


