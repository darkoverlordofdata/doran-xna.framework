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
    using System.Collections.Generic;

    /// <summary> 
    /// Allows interaction with joysticks. Unlike <see cref="GamePad"/> the number of Buttons/Axes/DPads is not limited.
    /// </summary>
    public class Joystick : Object
    {
        public static bool HasFlag(Sdl.Joystick.Hat flag, Sdl.Joystick.Hat bit)
        {
            return (((uint)flag & (uint)bit) != 0);
        }
        public static void Initialize()
        {
            Joysticks = new Dictionary<int, IntPtr>();
        }

        internal static Dictionary<int, IntPtr> Joysticks;
        /// <summary>
        /// Gets a value indicating whether the current platform supports reading raw joystick data.
        /// </summary>
        /// <value><c>true</c> if the current platform supports reading raw joystick data; otherwise, <c>false</c>.</value>
        public static bool IsSupported
        {
            get { return PlatformIsSupported; }
        }

        /// <summary>
        /// Gets the capabilites of the joystick.
        /// </summary>
        /// <param name="index">Index of the joystick you want to access.</param>
        /// <returns>The capabilites of the joystick.</returns>
        public static JoystickCapabilities GetCapabilities(int index)
        {
            return PlatformGetCapabilities(index);
        }

        /// <summary>
        /// Gets the current state of the joystick.
        /// </summary>
        /// <param name="index">Index of the joystick you want to access.</param>
        /// <returns>The state of the joystick.</returns>
        public static JoystickState GetState(int index)
        {
            return PlatformGetState(index);
        }

        internal static void AddDevice(int deviceId)
        {
            var jdevice = Sdl.Joystick.Open(deviceId);
            var id = 0;

            while (Joysticks.ContainsKey(id))
                id++;

            Joysticks.set(id, jdevice);

            if (Sdl.GameController.IsGameController(deviceId) == 1)
                GamePad.AddDevice(deviceId);
        }

        internal static void RemoveDevice(int instanceid)
        {
            var entry = Joysticks.map_iterator ();
            for (var has_next = entry.next (); has_next; has_next = entry.next ())
            {
                if (Sdl.Joystick.InstanceID(entry.get_value()) == instanceid)
                {
                    Sdl.Joystick.Close(Joysticks[entry.get_key()]);
                    Joysticks.Remove(entry.get_key());
                    break;
                }
            }

            // foreach (var entry in Joysticks.entries)
            // {
            //     if (Sdl.Joystick.InstanceID(entry.value) == instanceid)
            //     {
            //         Sdl.Joystick.Close(Joysticks[entry.key]);
            //         Joysticks.unset(entry.key);
            //         break;
            //     }
            // }
        }

        internal static void CloseDevices()
        {
            GamePad.CloseDevices();

            var entry = Joysticks.map_iterator ();
            for (var has_next = entry.next (); has_next; has_next = entry.next ())
            {
                Sdl.Joystick.Close(entry.get_value());
            }
            // foreach (var entry in Joysticks.entries)
            //     Sdl.Joystick.Close(entry.value);

            Joysticks.Clear ();
        }

        private const bool PlatformIsSupported = true;

        private static JoystickCapabilities PlatformGetCapabilities(int index)
        {
            if (!Joysticks.ContainsKey(index))
                return new JoystickCapabilities()
                {
                    IsConnected = false,
                    Identifier = "",
                    IsGamepad = false,
                    AxisCount = 0,
                    ButtonCount = 0,
                    HatCount = 0
                };

            var jdevice = Joysticks[index];
            return new JoystickCapabilities()
            {
                IsConnected = true,
                Identifier = Sdl.Joystick.GetGUID(jdevice).to_string(),
                IsGamepad = (Sdl.GameController.IsGameController(index) == 1),
                AxisCount = Sdl.Joystick.NumAxes(jdevice),
                ButtonCount = Sdl.Joystick.NumButtons(jdevice),
                HatCount = Sdl.Joystick.NumHats(jdevice)
            };
        }

        private static JoystickState PlatformGetState(int index)
        {
            if (!Joysticks.ContainsKey(index))
                return new JoystickState()
                {
                    IsConnected = false,
                    Axes = new int[0],
                    Buttons = new ButtonState[0],
                    Hats = new JoystickHat[0]
                };

            var jcap = PlatformGetCapabilities(index);
            var jdevice = Joysticks[index];

            var axes = new int[jcap.AxisCount];
            for (var i = 0; i < axes.length; i++)
                axes[i] = Sdl.Joystick.GetAxis(jdevice, i);

            var buttons = new ButtonState[jcap.ButtonCount];
            for (var i = 0; i < buttons.length; i++)
                buttons[i] = (Sdl.Joystick.GetButton(jdevice, i) == 0) ? ButtonState.Released : ButtonState.Pressed;

            var hats = new JoystickHat[jcap.HatCount];
            for (var i = 0; i < hats.length; i++)
            {
                var hatstate = Sdl.Joystick.GetHat(jdevice, i);

                hats[i] = new JoystickHat()
                {
                    Up = HasFlag(hatstate, Sdl.Joystick.Hat.Up) ? ButtonState.Pressed : ButtonState.Released,
                    Down = HasFlag(hatstate, Sdl.Joystick.Hat.Down) ? ButtonState.Pressed : ButtonState.Released,
                    Left = HasFlag(hatstate, Sdl.Joystick.Hat.Left) ? ButtonState.Pressed : ButtonState.Released,
                    Right = HasFlag(hatstate, Sdl.Joystick.Hat.Right) ? ButtonState.Pressed : ButtonState.Released
                    // Up = hatstate.HasFlag(Sdl.Joystick.Hat.Up) ? ButtonState.Pressed : ButtonState.Released,
                    // Down = hatstate.HasFlag(Sdl.Joystick.Hat.Down) ? ButtonState.Pressed : ButtonState.Released,
                    // Left = hatstate.HasFlag(Sdl.Joystick.Hat.Left) ? ButtonState.Pressed : ButtonState.Released,
                    // Right = hatstate.HasFlag(Sdl.Joystick.Hat.Right) ? ButtonState.Pressed : ButtonState.Released
                };
            }

            return new JoystickState()
            {
                IsConnected = true,
                Axes = axes,
                Buttons = buttons,
                Hats = hats
            };
        }
    }
}
