
namespace Microsoft.Xna.Framework 
{

    public struct Vector2 
    {
        public float X;
        public float Y;

        public Vector2(float x, float y) {
            this.X = x;
            this.Y = y;
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

        public Vector2 Add(Vector2 other) {
            return Vector2(X + other.X, Y + other.Y);
        }

        public Vector2 Sub(Vector2 other) {
            return Vector2(X - other.X, Y - other.Y);
        }

        public Vector2 Mul(Vector2 other) {
            return Vector2(X * other.X, Y * other.Y);
        }

        public Vector2 Div(Vector2 other) {
            return Vector2(X / other.X, Y / other.Y);
        }

        public bool Equal(Vector2 other) {
            return (X == other.X) && (Y == other.Y);
        }

        public Vector2 Scale(float factor) {
            return Vector2(X * factor, Y * factor);
        }

        public string to_string() {
            return @"{X: $X, Y: $Y}";
        }

        public string ToString() {
            return to_string();
        }
    }
}