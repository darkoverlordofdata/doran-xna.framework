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
    /// <summary>
    /// A struct that represents the current stick (thumbstick) states for the controller.
    /// </summary>
    public struct GamePadThumbSticks
    {
#if DIRECTX && !WINDOWS_UAP
        // XInput Xbox 360 Controller dead zones
        // Dead zones are slighty different between left and right sticks, this may come from Microsoft usability tests
        private const float leftThumbDeadZone = SharpDX.XInput.Gamepad.LeftThumbDeadZone / (float)short.MaxValue;
        private const float rightThumbDeadZone = SharpDX.XInput.Gamepad.RightThumbDeadZone / (float)short.MaxValue;
#else
        // Default & SDL Xbox 360 Controller dead zones
        // Based on the XInput constants
        private const float leftThumbDeadZone = 0.24f;
        private const float rightThumbDeadZone = 0.265f;
#endif

        internal Buttons _virtualButtons;
        private Vector2 _left;
        private Vector2 _right;

        /// <summary>
        /// Gets a value indicating the position of the left stick (thumbstick). 
        /// </summary>
        /// <value>A <see cref="Vector2"/> indicating the current position of the left stick (thumbstick).</value>
        public Vector2 Left
        {
            get { return _left; }
        }

        /// <summary>
        /// Gets a value indicating the position of the right stick (thumbstick). 
        /// </summary>
        /// <value>A <see cref="Vector2"/> indicating the current position of the right stick (thumbstick).</value>
        public Vector2 Right
        {
            get { return _right; }
        }

        // public GamePadThumbSticks(Vector2 leftPosition, Vector2 rightPosition)
        //     : this(leftPosition, rightPosition, GamePadDeadZone.None)
        // {
            
        // }

        public GamePadThumbSticks(Vector2 leftPosition, Vector2 rightPosition, GamePadDeadZone deadZoneMode=GamePadDeadZone.None)
        {
            // XNA applies dead zones before rounding/clamping values. The public ctor does not allow this because the dead zone must be known before

            // Apply dead zone
            switch (deadZoneMode)
            {
                case GamePadDeadZone.None:
                    _left = leftPosition;
                    _right = rightPosition;
                    break;
                case GamePadDeadZone.IndependentAxes:
                    _left = ExcludeIndependentAxesDeadZone(leftPosition, leftThumbDeadZone);
                    _right = ExcludeIndependentAxesDeadZone(rightPosition, rightThumbDeadZone);
                    break;
                case GamePadDeadZone.Circular:
                    _left = ExcludeCircularDeadZone(leftPosition, leftThumbDeadZone);
                    _right = ExcludeCircularDeadZone(rightPosition, rightThumbDeadZone);
                    break;
            }

            // Apply clamp
            if (deadZoneMode == GamePadDeadZone.Circular)
            {
                if (_left.LengthSquared() > 1f)
                    _left.Normalize();
                if (_right.LengthSquared() > 1f)
                    _right.Normalize();
            }
            else
            {
                _left = new Vector2(MathHelper.Clampf(Left.X, -1f, 1f), MathHelper.Clampf(Left.Y, -1f, 1f));
                _right = new Vector2(MathHelper.Clampf(Right.X, -1f, 1f), MathHelper.Clampf(Right.Y, -1f, 1f));
            }

            // VirtualButtons should always behave like deadzone is IndependentAxes. 
            // This is consistent with XNA behaviour and generally most convenient (e.g. for menu navigation)
            _virtualButtons = 0;

            if (leftPosition.X < -leftThumbDeadZone)
                _virtualButtons |= Buttons.LeftThumbstickLeft;
            else if (leftPosition.X > leftThumbDeadZone)
                _virtualButtons |= Buttons.LeftThumbstickRight;

            if (leftPosition.Y < -leftThumbDeadZone)
                _virtualButtons |= Buttons.LeftThumbstickDown;
            else if (leftPosition.Y > leftThumbDeadZone)
                _virtualButtons |= Buttons.LeftThumbstickUp;

            if (rightPosition.X < -rightThumbDeadZone)
                _virtualButtons |= Buttons.RightThumbstickLeft;
            else if (rightPosition.X > rightThumbDeadZone)
                _virtualButtons |= Buttons.RightThumbstickRight;

            if (rightPosition.Y < -rightThumbDeadZone)
                _virtualButtons |= Buttons.RightThumbstickDown;
            else if (rightPosition.Y > rightThumbDeadZone)
                _virtualButtons |= Buttons.RightThumbstickUp;
        }

        private Vector2 ExcludeIndependentAxesDeadZone(Vector2 value, float deadZone)
        {
            return new Vector2(ExcludeAxisDeadZone(value.X, deadZone), ExcludeAxisDeadZone(value.Y, deadZone));
        }

        private float ExcludeAxisDeadZone(float value, float deadZone)
        {
            if (value < -deadZone)
                value += deadZone;
            else if (value > deadZone)
                value -= deadZone;
            else
                return 0f;
            return value / (1f - deadZone);
        }

        private Vector2 ExcludeCircularDeadZone(Vector2 value, float deadZone)
        {
            var originalLength = value.Length();
            if (originalLength <= deadZone)
                return Vector2.Zero;
            var newLength = (originalLength - deadZone) / (1f - deadZone);
            return value.Multiply(newLength / originalLength);
        }

        /// <summary>
        /// Returns a value indicating whether this instance is equal to a specified object.
        /// </summary>
        /// <param name="obj">An object to compare to this instance.</param>
        /// <returns>true if <paramref name="obj"/> is a <see cref="GamePadThumbSticks"/> and has the same value as this instance; otherwise, false.</returns>
        public bool Equals(GamePadThumbSticks obj)
        {
            return (Left == Left) && (obj.Right == obj.Right);
        }

        /// <summary>
        /// Serves as a hash function for a <see cref="T:Microsoft.Xna.Framework.Input.GamePadThumbSticks"/> object.
        /// </summary>
        /// <returns>A hash code for this instance that is suitable for use in hashing algorithms and data structures such as a
        /// hash table.</returns>
        public int GetHashCode()
        {
            return (Left.GetHashCode() * 397) ^ Right.GetHashCode();
        }

        /// <summary>
        /// Returns a <see cref="T:System.String"/> that represents the current <see cref="T:Microsoft.Xna.Framework.Input.GamePadThumbSticks"/>.
        /// </summary>
        /// <returns>A <see cref="T:System.String"/> that represents the current <see cref="T:Microsoft.Xna.Framework.Input.GamePadThumbSticks"/>.</returns>
        public string to_string()
        {
            return @"[GamePadThumbSticks: Left=$Left, Right=$Right]";
        }
    }
}
