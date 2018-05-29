using System;
using GL;

namespace Microsoft.Xna.Framework.Graphics
{
    public class GraphicsExtensions
    {
        public static void CheckGLError()
        {
           var error = GL.GetError();
            //Console.WriteLine(error);
            if (error != ErrorCode.NoError)
                throw new Exceptions.GLException("GL.GetError() returned " + error.to_string());
        }

    }
}
