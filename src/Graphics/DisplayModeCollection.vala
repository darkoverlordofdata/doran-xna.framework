/* ******************************************************************************
 * Copyright 2018 darkoverlordofdata.
 * 
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *   http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 ******************************************************************************/
namespace Microsoft.Xna.Framework.Graphics
{
    using System;
    using System.Collections.Generic;

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