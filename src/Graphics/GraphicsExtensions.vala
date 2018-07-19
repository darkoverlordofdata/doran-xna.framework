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
    using System;
    using ValaGame.OpenGL;

    public class GraphicsExtensions : Object
    {
        public static void CheckGLError()
        {
            var errStr = "";
            var error = GL.GetError();
            switch(error)
            {
                case ErrorCode.NoError: errStr = "GL_NO_ERROR"; break;
                case ErrorCode.InvalidEnum: errStr = "GL_INVALID_ENUM"; break;
                case ErrorCode.InvalidValue: errStr = "GL_INVALID_VALUE"; break;
                case ErrorCode.InvalidOperation: errStr = "GL_INVALID_OPERATION"; break;
                case ErrorCode.StackOverflow: errStr = "GL_STACK_OVERFLOW"; break;
                case ErrorCode.StackUnderflow: errStr = "GL_STACK_UNDERFLOW"; break;
                case ErrorCode.OutOfMemory: errStr = "GL_OUT_OF_MEMORY"; break;
                default: errStr = "GL_UNKNOWN_ERROR";break;			
            }
            //Console.WriteLine(error);
            if (error != ErrorCode.NoError && error != ErrorCode.InvalidOperation)
                throw new Exception.GLError("GL.GetError() returned (%d) - %s ", (int)error, errStr);
        }
    }

}
