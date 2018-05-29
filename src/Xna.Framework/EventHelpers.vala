
using System;

namespace Microsoft.Xna.Framework
{
    /**
     * Provides helper methods to make it easier
     * to safely raise events.
     */
    internal class EventHelpers
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
