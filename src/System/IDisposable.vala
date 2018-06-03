namespace System 
{

    public interface IDisposable : Object 
    {
        public abstract void Dispose();
    }

    public interface IComparable<T> : Object 
    {
        public abstract int CompareTo(T other);
    }
    
    public class WeakReference
    {
        weak Object target;
        public WeakReference(Object target)
        {
            this.target = target;
        }
    }

    public interface IServiceProvider : Object
    {
 	    public abstract T GetService<T>(); 
    }

}