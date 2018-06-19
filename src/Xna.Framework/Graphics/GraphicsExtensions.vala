using System;
using ValaGame.OpenGL;

namespace Microsoft.Xna.Framework.Graphics
{
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
