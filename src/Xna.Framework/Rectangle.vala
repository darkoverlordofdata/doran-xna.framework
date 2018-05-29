
namespace Microsoft.Xna.Framework 
{
    /**
     * Describes a 2D-rectangle
     */
    public struct Rectangle 
    {
        public int X;
        public int Y;
        public int Width;
        public int Height;

        public Rectangle(int x, int y, int width, int height) {
            this.X = x;
            this.Y = y;
            this.Width = width;
            this.Height = height;
        }
    }
}