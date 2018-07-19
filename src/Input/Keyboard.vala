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
namespace Microsoft.Xna.Framework.Input
{
    using System;

    /// <summary>
    /// Allows getting keystrokes from keyboard.
    /// </summary>
	public class Keyboard : Object
	{
        static System.Collections.Generic.List<Keys> _keys;
        /// <summary>
        /// Returns the current keyboard state.
        /// </summary>
        /// <returns>Current keyboard state.</returns>
		public static KeyboardState GetState()
		{
            return PlatformGetState();
		}
		
        /// <summary>
        /// Returns the current keyboard state for a given player.
        /// </summary>
        /// <param name="playerIndex">Player index of the keyboard.</param>
        /// <returns>Current keyboard state.</returns>
        // [Obsolete("Use GetState() instead. In future versions this method can be removed.")]
        // public static KeyboardState GetState(PlayerIndex playerIndex)
		// {
        //     return PlatformGetState();
		// }

        private static KeyboardState PlatformGetState()
        {
            var modifiers = Sdl.Keyboard.GetModState();
            return new KeyboardState(_keys.ToArray(),
                                     (modifiers & Sdl.Keyboard.Keymod.CapsLock) == Sdl.Keyboard.Keymod.CapsLock,
                                     (modifiers & Sdl.Keyboard.Keymod.NumLock) == Sdl.Keyboard.Keymod.NumLock);
        }

        internal static void SetKeys(System.Collections.Generic.List<Keys> keys)
        {
            _keys = keys;
        }

	}
}
