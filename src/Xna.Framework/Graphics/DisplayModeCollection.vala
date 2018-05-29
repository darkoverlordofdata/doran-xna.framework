using Gee;
using System;

namespace Microsoft.Xna.Framework.Graphics
{
    public class DisplayModeCollection : Object // IEnumerable<DisplayMode>
    {
        //  private readonly List<DisplayMode> _modes;

        //  public IEnumerable<DisplayMode> this[SurfaceFormat format]
        //  {
        //      get 
        //      {
        //          var list = new List<DisplayMode>();
        //          foreach (var mode in _modes)
        //          {
        //              if (mode.Format == format)
        //                  list.Add(mode);
        //          }
        //          return list;
        //      }
        //  }

        //  public IEnumerator<DisplayMode> GetEnumerator()
        //  {
        //      return _modes.GetEnumerator();
        //  }

        //  IEnumerator IEnumerable.GetEnumerator()
        //  {
        //      return _modes.GetEnumerator();
        //  }
        
        //  internal DisplayModeCollection(List<DisplayMode> modes) 
        //  {
        //      // Sort the modes in a consistent way that happens
        //      // to match XNA behavior on some graphics devices.

        //      modes.Sort(delegate(DisplayMode a, DisplayMode b)
        //      {
        //          if (a == b) 
        //              return 0;
        //          if (a.Format <= b.Format && a.Width <= b.Width && a.Height <= b.Height) 
        //              return -1;
        //          return 1;
        //      });

        //      _modes = modes;
        //  }
    }
}