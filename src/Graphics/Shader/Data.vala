namespace Microsoft.Xna.Framework.Shaders
{
    public class Source : Object
    {
        /**
        * FragmentShader - Batch
        */
        public const string FragmentShader = """
in vec2 tex_pos;
in vec4 tint;
out vec4 color;

uniform sampler2D tex;
uniform float global_alpha;

void main(void)
{
   color = vec4(tint.x, tint.y, tint.z, global_alpha * tint.w) * texture(tex, tex_pos);
}
""";

        /**
        * VertexShader - Batch
        */
        public const string BatchVertexShader = """
layout (location = 0) in vec4 position;
layout (location = 1) in vec4 in_tint;

out vec2 tex_pos;
out vec4 tint;

uniform mat4 projection;

void main(void)
{
   gl_Position = projection * vec4(position.x, position.y, 0.0f, 1.0f);
   tex_pos = vec2(position.z, position.w);
   tint = in_tint;
}
""";

    }


void __shim__0(){}

/**
 * FragmentShader - Batch
 */
public const string BatchFragmentShader = """
in vec2 tex_pos;
in vec4 tint;
out vec4 color;

uniform sampler2D tex;
uniform float global_alpha;

void main(void)
{
   color = vec4(tint.x, tint.y, tint.z, global_alpha * tint.w) * texture(tex, tex_pos);
}
""";

/**
 * VertexShader - Batch
 */
public const string BatchVertexShader = """
layout (location = 0) in vec4 position;
layout (location = 1) in vec4 in_tint;

out vec2 tex_pos;
out vec4 tint;

uniform mat4 projection;

void main(void)
{
   gl_Position = projection * vec4(position.x, position.y, 0.0f, 1.0f);
   tex_pos = vec2(position.z, position.w);
   tint = in_tint;
}
""";

/**
 * FragmentShader - Sprite
 */
public const string SpriteFragmentShader = """
in vec2 TexCoords;
out vec4 color;

uniform sampler2D image;
uniform vec3 spriteColor;

void main()
{
    color = vec4(spriteColor, 1.0) * texture(image, TexCoords);
}
""";


/**
 * VertexShader - Sprite
 */
public const string SpriteVertexShader = """
layout (location = 0) in vec4 vertex;

out vec2 TexCoords;

uniform mat4 model;
uniform mat4 projection;

void main()
{
    TexCoords = vertex.zw;
    gl_Position = projection * model * vec4(vertex.xy, 0.0, 1.0);
}
""";
}