// not really linq...

namespace System.Linq
{
    public static G[] ListToArray<G>(List<G> _keys)
    {
        G[] keys = new G[_keys.length()];
        int i = 0;
        _keys.foreach((k) => { keys[i++] = k; });
        return keys;
    }

}

