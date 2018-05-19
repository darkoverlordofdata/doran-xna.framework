namespace Microsoft.Xna.Framework 
{
    /**
     *  Describes a 2D-point.
     */
    public struct Point 
    {
        public int x;
        public int y;

        public Point(int x, int y) {
            this.x = x;
            this.y = y;
        }

        public static Point Zero() {
            return Point(0, 0);
        }

        public Point add(Point other) {
            return Point(x + other.x, y + other.y);
        }

        public Point sub(Point other) {
            return Point(x - other.x, y - other.y);
        }

        public Point mul(Point other) {
            return Point(x * other.x, y * other.y);
        }

        public Point div(Point other) {
            return Point(x / other.x, y / other.y);
        }

        public bool equal(Point other) {
            return (x == other.x) && (y == other.y);
        }

        public string to_string() {
            return @"{x: $x, y: $y}";
        }

        public Vector2 to_vector2() {
            return Vector2(x, y);
        }
    }


}