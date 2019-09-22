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
namespace Sdl
{
    public static int Major;
    public static int Minor;
    public static int Patch;
    const int SDL_WINDOWPOS_UNDEFINED = -1;

    public class XnaInit : Object
    {
        public IntPtr Screen;
        public IntPtr Context;
        public int WindowFlags = 0;
        public int WindowMultisamples = 0;
        public int WindowMultisamplesbuffs = 0;
        public int WindowAntialiasing = 0;

        public void Init()
        {
            int error = InitSubSystem(InitFlags.Video);
            if (error == -1) {
                print("Cannot initialize SDL video!");
            }
            WindowFlags = Window.State.OpenGL;
            WindowMultisamples = 4;
            WindowMultisamplesbuffs = 1;
            WindowAntialiasing = 1;
            GraphicsViewportStart();
        }

        public void GraphicsViewportStart()
        {
            Screen = Window.Create("Xna.Framework",
                                    SDL_WINDOWPOS_UNDEFINED,
                                    SDL_WINDOWPOS_UNDEFINED,
                                    800, 600,
                                    WindowFlags);

            if (Screen.IsNull()) {
                print("Could not create SDL window: %s", SDL_GetError());
            }

            Sdl.Surface windowIcon = LoadBMP("./assets/d16a.bmp");
            Window.SetIcon(Screen, windowIcon);
            // FreeSurface(windowIcon);
            
            GL.SetAttribute(GL.Attribute.ShareWithCurrentContext, 1);
            Context = GL.CreateContext(Screen);
            
            if (Context == null) {
                print("Could not create SDL Context: %s", SDL_GetError());
            }
            print("ValaGame.OpenGL.GL.LoadEntryPoints();");
            ValaGame.OpenGL.GL.LoadEntryPoints();
            print("GL.SetSwapInterval(1);");       
            GL.SetSwapInterval(1);
            print("ValaGame.OpenGL.GL.Viewport(0, 0, 800, 600);");
            ValaGame.OpenGL.GL.Viewport(0, 0, 800, 600);
            print("GraphicsViewportStart - return");
        }
        
        public void Finish() 
        {
            GL.DeleteContext(Context);
            Window.Destroy(Screen);
        }
    }
}
