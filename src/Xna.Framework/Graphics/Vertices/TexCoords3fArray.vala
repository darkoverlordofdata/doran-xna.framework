namespace Microsoft.Xna.Framework.Graphics
{
    public class TexCoords3fArray : Object
    {
        public float[] data;
        public int count;
        public int size;

        public TexCoords3fArray(int size)
        {
            this.size = (int)sizeof(float) * 2 * 6 * size;
            count = 0;
            data = new float[2 * 6 * size];
        }

        public void Add(float x, float y)
        {
            data[count++] = x;
            data[count++] = y;
        }
    }        
}