// MonoGame - Copyright (C) The MonoGame Team
// This file is subject to the terms and conditions defined in
// file 'LICENSE.txt', which is part of this source code package.

// using System.Text;

namespace Microsoft.Xna.Framework.Input
{
    /// <summary>
    /// Describes current joystick state.
    /// </summary>
    public struct JoystickState
    {
        public static bool SequenceEqual(int[] a, int[] b) 
        {
            if (a.length != b.length) return false;
            for (int i=0; i<a.length; i++)
            {
                if (a[i] != b[i]) return false;
            }
            return true;
        }
        /// <summary>
        /// Gets a value indicating whether the joystick is connected.
        /// </summary>
        /// <value><c>true</c> if the joystick is connected; otherwise, <c>false</c>.</value>
        public bool IsConnected { get; internal set; }

        /// <summary>
        /// Gets the joystick axis values.
        /// </summary>
        /// <value>An array list of ints that indicate axis values.</value>
        public int[] Axes { get; internal set; }

        /// <summary>
        /// Gets the joystick button values.
        /// </summary>
        /// <value>An array list of ButtonState that indicate button values.</value>
        public ButtonState[] Buttons { get; internal set; }

        /// <summary>
        /// Gets the joystick hat values.
        /// </summary>
        /// <value>An array list of <see cref="JoystickHat"/> that indicate hat values.</value>
        public JoystickHat[] Hats{ get; internal set; }

        /// <summary>
        /// Determines whether the specified <see cref="object"/> is equal to the current <see cref="T:Microsoft.Xna.Framework.Input.JoystickState"/>.
        /// </summary>
        /// <param name="obj">The <see cref="object"/> to compare with the current <see cref="T:Microsoft.Xna.Framework.Input.JoystickState"/>.</param>
        /// <returns><c>true</c> if the specified <see cref="object"/> is equal to the current
        /// <see cref="T:Microsoft.Xna.Framework.Input.JoystickState"/>; otherwise, <c>false</c>.</returns>
        public bool Equals(JoystickState obj)
        {
            return IsConnected == obj.IsConnected &&
                SequenceEqual(Axes, obj.Axes) && 
                SequenceEqual((int[])Buttons, (int[])obj.Buttons) && 
                SequenceEqual((int[])Hats, (int[])obj.Hats);
            // return IsConnected == obj.IsConnected &&
            //    Axes.SequenceEqual(obj.Axes) &&
            //    Buttons.SequenceEqual(obj.Buttons) &&
            //    Hats.SequenceEqual(obj.Hats);
        }

        /// <summary>
        /// Serves as a hash function for a <see cref="T:Microsoft.Xna.Framework.Input.JoystickState"/> object.
        /// </summary>
        /// <returns>A hash code for this instance that is suitable for use in hashing algorithms and data structures such as a
        /// hash table.</returns>
        public int GetHashCode()
        {
            var hash = 0;

            if (IsConnected)
            {
                foreach (var axis in Axes)
                    hash = (hash * 397) ^ axis;

                for (int i = 0; i < Buttons.length; i++)
                    hash = hash ^ ((int)Buttons[i] << (i % 32));

                foreach (var hat in Hats)
                    hash = (hash * 397) ^ hat.GetHashCode();
            }

            return hash;
        }

        /// <summary>
        /// Returns a <see cref="T:System.String"/> that represents the current <see cref="T:Microsoft.Xna.Framework.Input.JoystickState"/>.
        /// </summary>
        /// <returns>A <see cref="T:System.String"/> that represents the current <see cref="T:Microsoft.Xna.Framework.Input.JoystickState"/>.</returns>
        public string to_string()
        {
            var ret = new StringBuilder();//54 - 2 + Axes.length * 7 + Buttons.length + Hats.length * 5);
            ret.append("[JoystickState: IsConnected=" + (IsConnected ? "1" : "0"));

            if (IsConnected)
            {
                ret.append(", Axes=");
                foreach (var axis in Axes)
                    ret.append((axis > 0 ? "+" : "") + axis.to_string("00000") + " ");
                // ret.length--;

                ret.append(", Buttons=");
                foreach (var button in Buttons)
                    ret.append(((int)button).to_string());

                ret.append(", Hats=");
                foreach (var hat in Hats)
                    ret.append(hat.to_string() + " ");
                // ret.Length--;
            }

            ret.append("]");
            return ret.str;
        }
    }
}

