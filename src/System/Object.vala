/*============================================================
**
** Class:  Object
**
**
** Object is the root class for all objects.  This class
** defines only the basics.
**
** 
===========================================================*/
public delegate string ToStringDelegate();

// namespace System 
// { // make global to hide GLib.Object
public class Object : GLib.Object
{
    // Returns a String which represents the object instance.  The default
    // for an object is to return the fully qualified name of the class.
    // 
    public virtual string ToString()
    {
        return get_type().name();
    }

    // Returns a boolean indicating if the passed in object obj is 
    // Equal to this.  Equality is defined as object equality for reference
    // types and bitwise equality for value types using a loader trick to
    // replace Equals with EqualsValue for value types).
    //     
    public virtual bool Equals(Object? other)
    {
        return this == other;
    }

    public static bool InstanceEquals(Object? objA, Object? objB)
    {
        if (objA==objB) {
            return true;
        }
        if (objA==null || objB==null) {
            return false;
        }
        return objA.Equals(objB);
    }

    public static bool ReferenceEquals(Object? objA, Object? objB)
    {
        return objA == objB;
    }

    // GetHashCode is intended to serve as a hash function for this object.
    // Based on the contents of the object, the hash function will return a suitable
    // value with a relatively random distribution over the various inputs.
    //
    // The default implementation returns the address for this instance.
    // Calling it on the same object multiple times will return the same value, so
    // it will technically meet the needs of a hash function, but it's less than ideal.
    // Objects (& especially value classes) should override this method.
    // 
    public virtual int GetHashCode()
    {
        return (int)this;
    }


    public virtual string to_string()
    {
        return ToString();
    }



}

// }