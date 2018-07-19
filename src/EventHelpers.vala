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
namespace Microsoft.Xna.Framework
{
    using System;

    /**
     * Provides helper methods to make it easier
     * to safely raise events.
     */
    internal class EventHelpers : Object
    {
        /**
         * Safely raises an event by storing a copy of the event's delegate
         * in the <paramref name="handler"/> parameter and checking it for
         * null before invoking it.
         *
         * <param name="sender">The object raising the event.</param>
         * <param name="handler"><see cref="EventHandler"/> to be invoked</param>
         * <param name="e">The <see cref="EventArgs"/> passed to <see cref="EventHandler"/></param>
         */
        internal static void Raise(Object sender, EventHandler handler, EventArgs e)
        {
            if (handler != null)
                handler.Dispatch(sender, e);
        }
    }
}
