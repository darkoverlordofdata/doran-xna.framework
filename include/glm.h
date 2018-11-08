/*
 * Copyright 2018 (c), Bruce Davidson.
 *
 * MIT License (MIT), http://opensource.org/licenses/MIT
 */
#ifndef _GLM_H_
#define _GLM_H_
/**
 * Vector/Matrix types for use with Vala
 */
#include "cglm/cglm.h"

/*
** Vector2 - x, y
*/
typedef struct Vector2 Vector2;
struct Vector2
{
    union {
        vec2 data;      /* the opaque typedef from cglm */
        struct {
            float X;    /* x coordinate */
            float Y;    /* y coordinate */
        };
    };
    int ref_count;      /* vala compact class reference counter */
};

typedef struct Vector3 Vector3;
struct Vector3
{
    union {
        vec3 data;
        struct {
            float X;
            float Y;
            float Z;
        };
    };
    int ref_count;
};


typedef struct Vector4 Vector4;
struct Vector4
{
    union {
        vec4 data;
        struct {
            float W;
            float X;
            float Y;
            float Z;
        };
    };
    int ref_count;
};

typedef struct Quaternion Quaternion;
struct Quaternion 
{
    union {
        vec4 data;
        struct {
            float W;
            float X;
            float Y;
            float Z;
        };
    };
    int ref_count;
};

typedef struct Matrix Matrix;
struct Matrix
{
    union {
        float data[16];    
        struct {
            float M11;
            float M12;
            float M13;
            float M14;   
            float M21;
            float M22;
            float M23;
            float M24;   
            float M31;
            float M32;
            float M33;
            float M34;   
            float M41;
            float M42;
            float M43;
            float M44;   
        };
    };
    int ref_count;
};



/**
 * Constants:
 */
static const vec2 _glm_vec2_zero    = { 0.0f, 0.0f };
static const vec2 _glm_vec2_one     = { 1.0f, 1.0f };
static const vec3 _glm_vec3_zero    = GLM_VEC3_ZERO_INIT; //{ 0.0f, 0.0f, 0.0f };
static const vec3 _glm_vec3_one     = GLM_VEC3_ONE_INIT; //{ 1.0f, 1.0f, 1.0f };
static const vec3 _glm_vec3_yup     = {0.0f, 1.0f, 0.0f};
static const vec3 _glm_vec3_zup     = {0.0f, 0.0f, 1.0f};
static const vec3 _glm_vec3_xup     = {1.0f, 0.0f, 0.0f};
static const vec4 _glm_vec4_zero    = GLM_VEC4_ZERO_INIT; //{ 0.0f, 0.0f, 0.0f, 0.0f };
static const vec4 _glm_vec4_one     = GLM_VEC4_ONE_INIT; //{ 1.0f, 1.0f, 1.0f, 1.0f };
static const mat3 _glm_mat3_id      = GLM_MAT3_IDENTITY_INIT;
static const mat3 _glm_mat3_zero    = GLM_MAT3_ZERO_INIT;


const Vector2* glm_vec2_zero_const;
const Vector2* glm_vec2_one_const;
const Vector3* glm_vec3_zero_const;
const Vector3* glm_vec3_one_const;
const Vector3* glm_vec3_yup_const;
const Vector3* glm_vec3_zup_const;
const Vector3* glm_vec3_xup_const;
const Vector4* glm_vec4_zero_const;
const Vector4* glm_vec4_one_const;

/**
 * Api extension
 */
Vector2* glm_vec2_new(float x, float y);
Vector2* glm_vec2_ref(Vector2* this);
void  glm_vec2_unref(Vector2* this);
int   glm_vec2_hash(Vector2* this);
bool  glm_vec2_equals(Vector2* this, Vector2* other);
void  glm_vec2_sub(Vector2* this, Vector2* other, Vector2* dest);
void  glm_vec2_scale(Vector2* this, float scale, Vector2* dest);
float glm_vec2_len(Vector2* this);
float glm_vec2_len2(Vector2* this);
void  glm_vec2_normalize(Vector2* this);


Vector3* glm_vec3_new(float x, float y, float z);
Vector3* glm_vec3_ref(Vector3* this);
void  glm_vec3_unref(Vector3* this);
int   glm_vec3_hash(Vector3* this);
bool  glm_vec3_equals(Vector3* this, Vector3* other);

Vector4* glm_vec4_new(float w, float x, float y, float z);
Vector4* glm_vec4_ref(Vector4* this);
void  glm_vec4_unref(Vector4* this);
int   glm_vec4_hash(Vector4* this);
bool  glm_vec4_equals(Vector4* this, Vector4* other);

Quaternion* glm_quat_new();
Quaternion* glm_quat_ref(Quaternion* this);
void  glm_quat_unref(Quaternion* this);

Matrix* glm_mat4_new(float value);
Matrix* glm_mat4_ref(Matrix* this);
void  glm_mat4_unref(Matrix* this);

#endif // _GLM_H_
