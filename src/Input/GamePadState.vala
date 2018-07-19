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
    /// Represents specific information about the state of the controller,
    /// including the current state of buttons and sticks.
    /// 
    /// This is implemented as a partial struct to allow for individual platforms
    /// to offer additional data without separate state queries to GamePad.
    /// </summary>
    public struct GamePadState
    {
        /// <summary>
        /// The default initialized gamepad state.
        /// </summary>
        public static GamePadState Default; // = new GamePadState();

        /// <summary>
        /// Gets a value indicating if the controller is connected.
        /// </summary>
        /// <value><c>true</c> if it is connected; otherwise, <c>false</c>.</value>
        public bool IsConnected { get; internal set; }

        /// <summary>
        /// Gets the packet number associated with this state.
        /// </summary>
        /// <value>The packet number.</value>
        public int PacketNumber { get; internal set; }

        /// <summary>
        /// Gets a structure that identifies what buttons on the controller are pressed.
        /// </summary>
        /// <value>The buttons structure.</value>
        public GamePadButtons Buttons { get; internal set; }

        /// <summary>
        /// Gets a structure that identifies what directions of the directional pad on the controller are pressed.
        /// </summary>
        /// <value>The directional pad structure.</value>
        public GamePadDPad DPad { get; internal set; }

        /// <summary>
        /// Gets a structure that indicates the position of the controller sticks (thumbsticks).
        /// </summary>
        /// <value>The thumbsticks position.</value>
        public GamePadThumbSticks ThumbSticks { get; internal set; }

        /// <summary>
        /// Gets a structure that identifies the position of triggers on the controller.
        /// </summary>
        /// <value>Positions of the triggers.</value>
        public GamePadTriggers Triggers { get; internal set; }

        /// <summary>
        /// Initializes a new instance of the <see cref="T:Microsoft.Xna.Framework.Input.GamePadState"/> struct
        /// using the specified GamePadThumbSticks, GamePadTriggers, GamePadButtons, and GamePadDPad.
        /// </summary>
        /// <param name="thumbSticks">Initial thumbstick state.</param>
        /// <param name="triggers">Initial trigger state..</param>
        /// <param name="buttons">Initial button state.</param>
        /// <param name="dPad">Initial directional pad state.</param>
        public GamePadState(GamePadThumbSticks thumbSticks, GamePadTriggers triggers, GamePadButtons buttons, GamePadDPad dPad) 
        {
            ThumbSticks = thumbSticks;
            Triggers = triggers;
            Buttons = buttons;
            DPad = dPad;
            IsConnected = true;

            PlatformConstruct();
        }

        /// <summary>
        /// Initializes a new instance of the <see cref="T:Microsoft.Xna.Framework.Input.GamePadState"/> struct.
        /// using the specified stick, trigger, and button values.
        /// </summary>
        /// <param name="leftThumbStick">Left stick value. Each axis is clamped between −1.0 and 1.0.</param>
        /// <param name="rightThumbStick">Right stick value. Each axis is clamped between −1.0 and 1.0.</param>
        /// <param name="leftTrigger">Left trigger value. This value is clamped between 0.0 and 1.0.</param>
        /// <param name="rightTrigger">Right trigger value. This value is clamped between 0.0 and 1.0.</param>
        /// <param name="buttons"> Array or parameter list of Buttons to initialize as pressed.</param>
        // public GamePadState(Vector2 leftThumbStick, Vector2 rightThumbStick, float leftTrigger, float rightTrigger, Buttons buttons)
        //     : this(new GamePadThumbSticks(leftThumbStick, rightThumbStick), new GamePadTriggers(leftTrigger, rightTrigger), new GamePadButtons(buttons), new GamePadDPad(buttons))
        // {
        // }

        /// <summary>
        /// Define this method in platform partial classes to initialize default
        /// values for platform-specific fields.
        /// </summary>
        void PlatformConstruct(){}
  
        /// <summary>
        /// Gets the button mask along with 'virtual buttons' like LeftThumbstickLeft.
        /// </summary>
        private Buttons GetVirtualButtons ()
        {
            var result = Buttons._buttons;

            result |= ThumbSticks._virtualButtons;
            
            if (DPad.Down == ButtonState.Pressed)
                result |= Microsoft.Xna.Framework.Input.Buttons.DPadDown;
            if (DPad.Up == ButtonState.Pressed)
                result |= Microsoft.Xna.Framework.Input.Buttons.DPadUp;
            if (DPad.Left == ButtonState.Pressed)
                result |= Microsoft.Xna.Framework.Input.Buttons.DPadLeft;
            if (DPad.Right == ButtonState.Pressed)
                result |= Microsoft.Xna.Framework.Input.Buttons.DPadRight;

            return result;
        }

        /// <summary>
        /// Determines whether specified input device buttons are pressed in this GamePadState.
        /// </summary>
        /// <returns><c>true</c>, if button was pressed, <c>false</c> otherwise.</returns>
        /// <param name="button">Buttons to query. Specify a single button, or combine multiple buttons using a bitwise OR operation.</param>
        public bool IsButtonDown(Buttons button)
        {
            return (GetVirtualButtons() & button) == button;
        }

        /// <summary>
        /// Determines whether specified input device buttons are released (not pressed) in this GamePadState.
        /// </summary>
        /// <returns><c>true</c>, if button was released (not pressed), <c>false</c> otherwise.</returns>
        /// <param name="button">Buttons to query. Specify a single button, or combine multiple buttons using a bitwise OR operation.</param>
        public bool IsButtonUp(Buttons button)
        {
            return (GetVirtualButtons() & button) != button;
        }

        /// <summary>
        /// Determines whether the specified <see cref="object"/> is equal to the current <see cref="T:Microsoft.Xna.Framework.Input.GamePadState"/>.
        /// </summary>
        /// <param name="obj">The <see cref="object"/> to compare with the current <see cref="T:Microsoft.Xna.Framework.Input.GamePadState"/>.</param>
        /// <returns><c>true</c> if the specified <see cref="object"/> is equal to the current
        /// <see cref="T:Microsoft.Xna.Framework.Input.GamePadState"/>; otherwise, <c>false</c>.</returns>
        public bool Equals(GamePadState obj)
        {
            return (IsConnected == obj.IsConnected) &&
                (PacketNumber == obj.PacketNumber) &&
                (Buttons == obj.Buttons) &&
                (DPad == obj.DPad) &&
                (ThumbSticks == obj.ThumbSticks) &&
                (Triggers == obj.Triggers);
        }

        /// <summary>
        /// Serves as a hash function for a <see cref="T:Microsoft.Xna.Framework.Input.GamePadState"/> object.
        /// </summary>
        /// <returns>A hash code for this instance that is suitable for use in hashing algorithms and data structures such as a
        /// hash table.</returns>
        public int GetHashCode()
        {
            var hash = PacketNumber;
            hash = (hash * 397) ^ Buttons.GetHashCode();
            hash = (hash * 397) ^ DPad.GetHashCode();
            hash = (hash * 397) ^ ThumbSticks.GetHashCode();
            hash = (hash * 397) ^ Triggers.GetHashCode();
            return hash;
        }

        /// <summary>
        /// Returns a <see cref="T:System.String"/> that represents the current <see cref="T:Microsoft.Xna.Framework.Input.GamePadState"/>.
        /// </summary>
        /// <returns>A <see cref="T:System.String"/> that represents the current <see cref="T:Microsoft.Xna.Framework.Input.GamePadState"/>.</returns>
        public string ToString()
        {
            if (!IsConnected)
                return "[GamePadState: IsConnected = 0]";

            return string.joinv("", { @"[GamePadState: IsConnected=$IsConnected" ,
                   @", PacketNumber=$PacketNumber",
                   @", Buttons=$Buttons",
                   @", DPad=$DPad",
                   @", ThumbSticks=$ThumbSticks",
                   @", Triggers=$Triggers",
                   "]" });
        }
    }
}
