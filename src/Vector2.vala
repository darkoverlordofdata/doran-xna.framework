
namespace Microsoft.Xna.Framework 
{

    public struct Vector2 
    {
        public float x;
        public float y;

        public Vector2(float x, float y) {
            this.x = x;
            this.y = y;
        }

        public static Vector2 Zero() {
            return Vector2(0, 0);
        }

        public static Vector2 One() {
            return Vector2(1, 1);
        }

        public static Vector2 UnitX() {
            return Vector2(1, 0);
        }

        public static Vector2 UnitY() {
            return Vector2(0, 1);
        }

        public Vector2 add(Vector2 other) {
            return Vector2(x + other.x, y + other.y);
        }

        public Vector2 sub(Vector2 other) {
            return Vector2(x - other.x, y - other.y);
        }

        public Vector2 mul(Vector2 other) {
            return Vector2(x * other.x, y * other.y);
        }

        public Vector2 div(Vector2 other) {
            return Vector2(x / other.x, y / other.y);
        }

        public bool equal(Vector2 other) {
            return (x == other.x) && (y == other.y);
        }

        public Vector2 scale(float factor) {
            return Vector2(x * factor, y * factor);
        }

        public string to_string() {
            return @"{x: $x, y: $y}";
        }

    }


}