/*******************************************************************
** This code is part of Breakout.
**
** Breakout is free software: you can redistribute it and/or modify
** it under the terms of the CC BY 4.0 license as published by
** Creative Commons, either version 4 of the License, or (at your
** option) any later version.
******************************************************************/
namespace Microsoft.Xna.Framework.Graphics
{
    using System;
    using System.IO;
    using ValaGame.OpenGL;

    // General purpsoe shader object. Compiles from file, generates
    // compile/link-time error messages and hosts several utility 
    // functions for easy management.
    public class Shader : Object
    {
        // State
        public uint ID; 
        public int Version;
        public string Profile;
        // Constructor
        public Shader(int version=300, string profile="es")
        {
            /** 
            * Create a new shader
            * Use version 300 es for emscripten
            */
            Version = version;
            Profile = profile;
        }
        // Sets the current shader as active
        public Shader Use()
        {
            GL.UseProgram(ID);
            return this;
        }
        // Compiles the shader from given source code
        // Note: geometry source code is optional 
        public void Compile(string vertexSource, string fragmentSource, string? geometrySource = null) 
        {
            uint sVertex, sFragment, gShader = 0;
            string[] source;
            int[] length;
            var version = VERSION.printf(Version, Profile);

            // print("%s\n%s\n%s\n", version, HEADER, vertexSource);

            // Vertex Shader
            source = { version, HEADER, vertexSource };
            length = { version.length, HEADER.length, vertexSource.length };
            sVertex = GL.CreateShader(ShaderType.VertexShader);
            GL.ShaderSource(sVertex, source.length, source, length);
            GL.CompileShader(sVertex);
            checkCompileErrors(sVertex, ShaderType.VertexShader);
            // Fragment Shader

            // print("%s\n%s\n%s\n", version, HEADER, fragmentSource);
            source = { version, HEADER, fragmentSource };
            length = { version.length, HEADER.length, fragmentSource.length };
            sFragment = GL.CreateShader(ShaderType.FragmentShader);
            GL.ShaderSource(sFragment, source.length, source, length);
            GL.CompileShader(sFragment);
            checkCompileErrors(sFragment, ShaderType.FragmentShader);
            // If geometry shader source code is given, also compile geometry shader
            if (geometrySource != null)
            {
                source = { version, HEADER, geometrySource };
                length = { version.length, HEADER.length, geometrySource.length };
                gShader = GL.CreateShader(ShaderType.GeometryShader);
                GL.ShaderSource(gShader, source.length, source, length);
                GL.CompileShader(gShader);
                checkCompileErrors(gShader, ShaderType.GeometryShader);
            }
            // Shader Program
            this.ID = GL.CreateProgram();
            GL.AttachShader(this.ID, sVertex);
            GL.AttachShader(this.ID, sFragment);
            if (geometrySource != null)
                GL.AttachShader(this.ID, gShader);
            GL.LinkProgram(this.ID);
            checkCompileErrors(this.ID, ShaderType.Program);
            // Delete the shaders as they're linked into our program now and no longer necessery
            GL.DeleteShader(sVertex);
            GL.DeleteShader(sFragment);
            if (geometrySource != null)
                GL.DeleteShader(gShader);

        }
        // Utility functions
        public void SetFloat(string name, float value, bool useShader = false)
        {
            if (useShader == true)
                Use();
            GL.Uniform1f(GL.GetUniformLocation(ID, name), value); 

        }
        public void SetInteger(string name, int value, bool useShader = false)
        {
            if (useShader == true)
                Use();
            GL.Uniform1i(GL.GetUniformLocation(ID, name), value); 

        }
        public void SetVector2f(string name, float x, float y, bool useShader = false)
        {
            if (useShader == true)
                Use();
            GL.Uniform2f(GL.GetUniformLocation(ID, name), x, y); 

        }
        public void SetVector2(string name, Vector2 value, bool useShader = false)
        {
            if (useShader == true)
                Use();
            GL.Uniform2fv(GL.GetUniformLocation(ID, name), 1, value); 

        }
        public void SetVector3f(string name, float x, float y, float z, bool useShader = false)
        {
            if (useShader == true)
                Use();
            GL.Uniform3f(GL.GetUniformLocation(ID, name), x, y, z); 

        }
        public void SetVector3(string name, Vector3 value, bool useShader = false)
        {
            if (useShader == true)
                Use();
            GL.Uniform3fv(GL.GetUniformLocation(ID, name), 1, value); 

        }
        public void SetVector4f(string name, float x, float y, float z, float w, bool useShader = false)
        {
            if (useShader == true)
                Use();
            GL.Uniform4f(GL.GetUniformLocation(ID, name), x, y, z, w); 

        }
        public void SetVector4(string name, Vector4 value, bool useShader = false)
        {
            if (useShader == true)
                Use();
            GL.Uniform4fv(GL.GetUniformLocation(ID, name), 1, value); 

        }
        public void SetMatrix(string name, Matrix matrix, bool useShader = false)
        {
            if (useShader == true)
                Use();
            GL.UniformMatrix4fv(GL.GetUniformLocation(ID, name), 1, false, matrix);

        }

        // Checks if compilation or linking failed and if so, print the error logs
        void checkCompileErrors(uint shader, ShaderType type)
        {
            int success = Bool.False;
            char infoLog[1024];

            if (type != -1)
            {
                GL.GetShaderiv(shader, ShaderParameter.CompileStatus, &success);
                if (success != Bool.True)
                {
                    GL.GetShaderInfoLog(shader, 1024, null, infoLog);
                    print("Error %s compiling %s\n-- --------------------------------------------------- --\n", (string)infoLog, type.to_string());
                }
            }
            else
            {
                GL.GetProgramiv(shader, GetProgramParameterName.LinkStatus, &success);
                if (success != Bool.True)
                {
                    GL.GetProgramInfoLog(shader, 1024, null, infoLog);
                    print("Error %s linking %s\n-- --------------------------------------------------- --\n", (string)infoLog, type.to_string());
                }
            }
        }

        public const string VERSION = "#version %d %s";
        public const string HEADER = """
#
#ifdef GL_ES
precision mediump float;
#endif
""";
    }
}