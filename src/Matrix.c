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
 * Matrix constructor
 * 
 */
Matrix* glm_mat4_new(float value)
{
    Matrix* this = malloc(sizeof(Matrix));
    this->ref_count = 1;

    if (value == 0.0f) {
        memset(this, 0, sizeof(Matrix));
    } else {
        glm_mat4_identity(this);
        if (value != 1.0f)
            glm_mat4_scale(this, value);
    }
    return this;
}

Matrix* glm_mat4_ref(Matrix* this) {
    this->ref_count++;
    return this;
}   

void  glm_mat4_unref(Matrix* this) {
    if (this->ref_count == 1) free(this);
    else this->ref_count--;
}
