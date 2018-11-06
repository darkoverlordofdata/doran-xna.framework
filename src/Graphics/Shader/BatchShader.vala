namespace Microsoft.Xna.Framework.Graphics
{
    public class BatchShader : Shader
    {
        public string FragmentShader {
            owned get { return string.joinv("\n", fragmentShader); }
        }

        public string VertexShader {
            owned get { return string.joinv("\n", vertexShader); }
        }

        public BatchShader()
        {
            Compile(VertexShader, FragmentShader);
        }

        const string[] fragmentShader = 
        {
            "in vec2 tex_pos;",
            "in vec4 tint;",
            "",
            "out vec4 color;",
            "",
            "uniform sampler2D tex;",
            "uniform float global_alpha;",
            "",
            "void main(void)",
            "{",
            "   color = vec4(tint.x, tint.y, tint.z, global_alpha * tint.w) * texture(tex, tex_pos);",
            "}"
        };
        const string[] vertexShader = 
        {
            "layout (location = 0) in vec4 position;",
            "layout (location = 1) in vec4 in_tint;",
            "",
            "out vec2 tex_pos;",
            "out vec4 tint;",
            "",
            "uniform mat4 projection;",
            "",
            "void main(void)",
            "{",
            "   gl_Position = projection * vec4(position.x, position.y, 0.0f, 1.0f);",
            "   tex_pos = vec2(position.z, position.w);",
            "   tint = in_tint;",
            "}"
        };
    }
}