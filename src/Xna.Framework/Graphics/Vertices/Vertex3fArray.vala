namespace Microsoft.Xna.Framework.Graphics
{
    public class Vertex3fArray : Object
    {
        public float[] data;
        public int count;
        public int size;

        public Vertex3fArray(int size)
        {
            this.size = (int)sizeof(float) * 3 * 6 * size;
            count = 0;
            data = new float[3 * 6 * size];
        }

        public void Add(float x, float y, float z)
        {
            data[count++] = x;
            data[count++] = y;
            data[count++] = z;
        }
    }
}