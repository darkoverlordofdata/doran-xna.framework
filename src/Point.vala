namespace Microsoft.Xna.Framework 
{
    /**
     *  Describes a 2D-point.
     */
    public struct Point 
    {
        public int X;
        public int Y;

        public Point(int x, int y) {
            this.X = x;
            this.Y = y;
        }

        public static Point Zero() {
            return Point(0, 0);
        }

        public Point Add(Point other) {
            return Point(X + other.X, Y + other.Y);
        }

        public Point Sub(Point other) {
            return Point(X - other.X, Y - other.Y);
        }

        public Point Mul(Point other) {
            return Point(X * other.X, Y * other.Y);
        }

        public Point Div(Point other) {
            return Point(X / other.X, Y / other.Y);
        }

        public bool Equal(Point other) {
            return (X == other.X) && (Y == other.Y);
        }

        public string to_string() {
            return @"{X: $X, Y: $Y}";
        }

        public string ToString() {
            return to_string();
        }

        public Vector2 ToVector2() {
            return Vector2(X, Y);
        }
    }
}