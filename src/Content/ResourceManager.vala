/*******************************************************************
** This code is part of Breakout.
**
** Breakout is free software: you can redistribute it and/or modify
** it under the terms of the CC BY 4.0 license as published by
** Creative Commons, either version 4 of the License, or (at your
** option) any later version.
******************************************************************/
namespace Microsoft.Xna.Framework.Content
{
    // using Stb;
    using System;
    using System.IO;
    using System.Collections.Generic;
    using ValaGame.OpenGL;
    using Microsoft.Xna.Framework.Graphics;

    // A static singleton ResourceManager class that hosts several
    // functions to load Textures and Shaders. Each loaded texture
    // and/or shader is also stored for future reference by string
    // handles. All functions and resources are static and no 
    // public constructor is defined.
    public class ResourceManager : Object
    {
        // Resource storage
        static Dictionary<string, Shader> Shaders = new Dictionary<string, Shader>();
        static Dictionary<string, Texture2D> Textures = new Dictionary<string, Texture2D>();

        static string Root = "assets/";
        static bool First = true;
        static int Version;
        static string Profile;

        public static void SetRoot(string path)
        {
            Root = path;
        }
        /**
        * Initialize the resource manager singleton dictionaries
        *
        * @param   version to use for shaders
        * @param   profile to use for shaders
        */
        public ResourceManager(int version=300, string profile="es") 
        {
            First = false;
            Version = version;
            Profile = profile;

        } // to initialize the static objects

        public static SpriteBatch CreateSpriteBatch(int width, int height)
        {
            if (First) 
            {
                new ResourceManager();
                Shaders["sprite"] = new BatchShader();
            }
            var shader = GetShader("sprite");
            var batch = new SpriteBatch(shader, width, height);
            batch.Create();
            return batch;
        }
        
        public static SpriteBatch2D CreateSpriteBatch2D(GraphicsDeviceManager graphics)
        {
            if (First) 
            {
                new ResourceManager();
                Shaders["sprite"] = new BatchShader();
            }
            var shader = GetShader("sprite");
            //var batch = 
            return new SpriteBatch2D(graphics.GraphicsDevice, shader);
            // batch.Create();
            // return batch;
        }

        public static SpriteRenderer CreateRenderer(int width, int height)
        {

            if (First) 
            {
                new ResourceManager();
                // Load the default sprite shaders
                // var vertexCode = string.joinv("\n", SpriteRenderer.VertexShader);
                // var fragmentCode = string.joinv("\n", SpriteRenderer.FragmentShader);
                // Shader shader = new Shader(Version, Profile);
                // shader.Compile(vertexCode, fragmentCode);
                // Shaders["sprite"] = shader;
                Shaders["sprite"] = new SpriteShader();
            }
            Matrix projection = new Matrix();
            glm_mat4_identity(projection);
            glm_ortho(0f, (float)width, (float)height, 0f, -1f, 1f, projection);
            var shader = GetShader("sprite");
            shader.Use(); 
            shader.SetMatrix("projection", projection);    //  uniform mat4 projection;
            shader.SetInteger("image", 0);                  //  uniform sampler2D image;
            return new SpriteRenderer(shader);
        }
        
        // Loads (and generates) a shader program from file loading vertex, fragment (and geometry) shader's source code. If gShaderFile is not nullptr, it also loads a geometry shader
        public static Shader LoadShader(string vShaderFile, string fShaderFile, string gShaderFile, string name)
        {
            Shaders[name] = loadShaderFromFile(vShaderFile, fShaderFile, gShaderFile);
            return Shaders[name];
        }
        // Retrieves a stored sader
        public static Shader GetShader(string name)
        {
            return Shaders[name];
        }
        // Loads (and generates) a texture from file
        public static Texture2D LoadTexture(string file, bool alpha, string name)
        {
            Textures[name] = loadTextureFromFile(file, alpha);
            return Textures[name];
        }
        // Retrieves a stored texture
        public static Texture2D GetTexture(string name)
        {
            return Textures[name];
        }
        // Properly de-allocates all loaded resources
        public static void Clear()
        {
            // (Properly) delete all shaders	
            foreach (var iter in Shaders.Keys)
                GL.DeleteProgram(Shaders[iter].ID);
            // (Properly) delete all textures
            foreach (var iter in Textures.Keys)
                GL.DeleteTextures(1, &Textures[iter].Handle);

        }

        // Loads and generates a shader from file
        static Shader loadShaderFromFile(string vShaderFile, string fShaderFile, string gShaderFile = null)
        {
            // 1. Retrieve the vertex/fragment source code from filePath
            string? vertexCode = null;
            string? fragmentCode = null;
            string? geometryCode = null;
            try
            {
                vertexCode = readTextFile(vShaderFile); 
                fragmentCode = readTextFile(fShaderFile);
                // If geometry shader path is present, also load a geometry shader
                if (gShaderFile != null)
                    geometryCode = readTextFile(gShaderFile);
            }
            catch (Exception e)
            {
                print("ERROR::SHADER: Failed to read shader files\n");
            }
            // 2. Now create shader object from source code
            Shader shader = new Shader(Version, Profile);
            shader.Compile(vertexCode, fragmentCode, geometryCode);
            return shader;

        }

        // Loads a single texture from file
        static Texture2D loadTextureFromFile(string file, bool alpha)
        {
            // Create Texture object
            Texture2D texture = new Texture2D();
            texture.SetData(Root+file);
            return texture;

        }

        static string? readTextFile(string path)
        {
            string? line = null;
            string? text = "";
            var frag_file = new FileHandle(Root+path);
            var frag_reader = new BufferedReader(
                                new InputStreamReader(
                                    new FileInputStream.FromFile(frag_file.file)));

            do 
            {
                line = frag_reader.ReadLine();
                text = text + line+"\n";
            } while (line != null);
            return text;
        }

    }
}