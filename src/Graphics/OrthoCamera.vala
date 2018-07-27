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
namespace Microsoft.Xna.Framework.Graphics
{
    public class OrthoCamera : Object
    {
        float X;
        float Y;
        float Height;
        float Width;

        public float Left;
        public float Right;
        public float Bottom;
        public float Top;
        public float Near;
        public float Far;

        public static OrthoCamera Default;
            
        public static void Initialize()
        {
            int w;
            int h;
            Sdl.Window.GetSize(Sdl.GetCurrentWindow(), out w, out h);
            Default = new OrthoCamera(w, h);                
        }

        public OrthoCamera(float width, float height)
        {
            X = width/2;
            Y = -height/2;
            Width = width;
            Height = height;
            Update();
        }

        public void Update()
        {
            int w = (int)Width;
            int h = (int)Height;

            w /= 2;
            h /= 2;

            Left = X-w;
            Right = X+w; 
            Bottom = -Y+h; 
            Top = -Y-h; 
            Near = -1;
            Far = 1;
        }

        public void MoveTo(int x, int y)
        {
            X = x;
            Y = -y;
            Update();
        }
    }
}
