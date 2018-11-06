namespace Microsoft.Xna.Framework.Graphics
{
    public class SpriteShader : Shader
    {
        public string FragmentShader {
            owned get { return string.joinv("\n", fragmentShader); }
        }

        public string VertexShader {
            owned get { return string.joinv("\n", vertexShader); }
        }

        public SpriteShader()
        {
            Compile(VertexShader, FragmentShader);
        }
        const string[] fragmentShader = 
        {
            "in vec2 TexCoords;",
            "out vec4 color;",
            "",
            "uniform sampler2D image;",
            "uniform vec3 spriteColor;",
            "",
            "void main()",
            "{",
            "    color = vec4(spriteColor, 1.0) * texture(image, TexCoords);",
            "}"
        };
        const string[] vertexShader = 
        {
            "layout (location = 0) in vec4 vertex;",
            "",
            "out vec2 TexCoords;",
            "",
            "uniform mat4 model;",
            "uniform mat4 projection;",
            "",
            "void main()",
            "{",
            "    TexCoords = vertex.zw;",
            "    gl_Position = projection * model * vec4(vertex.xy, 0.0, 1.0);",
            "}"
        };
   
    }
}