/* ******************************************************************************
 * Copyright 2018 darkoverlordofdata.
 * 
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *   http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 ******************************************************************************/
namespace Microsoft.Xna.Framework
{
    using System;
    using System.Collections.Generic;
    using System.Diagnostics;
    // using Microsoft.Xna.Framework.Audio;
    using Microsoft.Xna.Framework.Content;
    using Microsoft.Xna.Framework.Graphics;
    // using Microsoft.Xna.Framework.Input.Touch;
    #if (__EMSCRIPTEN__)
    using Emscripten;
    #endif

    /*******************************************************************
    ** This code is part of Breakout.
    **
    ** Breakout is free software: you can redistribute it and/or modify
    ** it under the terms of the CC BY 4.0 license as published by
    ** Creative Commons, either version 4 of the License, or (at your
    ** option) any later version.
    ******************************************************************/


    // Container object for holding all state relevant for a single
    // game object entity. Each object in the game likely needs the
    // minimal of state as described within GameObject.
    public abstract class GameObject : Object
    {
        // Object state
        public Vector2 Position;
        public Vector2 Size;
        public Vector2 Velocity;
        public Vector3 Color;
        public float Rotation;
        public bool IsSolid;
        public bool Destroyed;
        // Render state
        public Texture2D? Sprite;	

        public GameObject(
            Vector2 pos, 
            Vector2 size, 
            Texture2D sprite, 
            Vector3 color = new Vector3(1f, 1f, 1f), 
            Vector2 velocity = new Vector2(0f, 0f))
        {
            Position = pos;
            Size = size;
            Velocity = velocity;
            Color = color;
            Rotation = 0f;
            Sprite = sprite;
            IsSolid = false;
            Destroyed = false;
        }
        
        // Draw sprite
        public abstract void Draw(SpriteRenderer renderer);
    }
}