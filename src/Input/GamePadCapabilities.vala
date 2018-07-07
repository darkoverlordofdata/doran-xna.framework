// MonoGame - Copyright (C) The MonoGame Team
// This file is subject to the terms and conditions defined in
// file 'LICENSE.txt', which is part of this source code package.

namespace Microsoft.Xna.Framework.Input
{
    /// <summary>
    /// A stuct that represents the controller capabilities.
    /// </summary>
    public struct GamePadCapabilities
    {
        /// <summary>
        /// Gets a value indicating if the controller is connected.
        /// </summary>
        /// <value><c>true</c> if it is connected; otherwise, <c>false</c>.</value>
        public bool IsConnected { get; internal set; }

        /// <summary>
        /// Gets the gamepad display name.
        /// 
        /// This property is not available in XNA.
        /// </summary>
        /// <value>String representing the display name of the gamepad.</value>
        public string DisplayName { get; internal set; }

        /// <summary>
        /// Gets the unique identifier of the gamepad.
        /// 
        /// This property is not available in XNA.
        /// </summary>
        /// <value>String representing the unique identifier of the gamepad.</value>
        public string Identifier { get; internal set; }

        /// <summary>
        /// Gets a value indicating whether the controller has the button A.
        /// </summary>
        /// <value><c>true</c> if it has the button A; otherwise, <c>false</c>.</value>
        public bool HasAButton { get; internal set; }

        /// <summary>
        /// Gets a value indicating whether the controller has the button Back.
        /// </summary>
        /// <value><c>true</c> if it has the button Back; otherwise, <c>false</c>.</value>
        public bool HasBackButton { get; internal set; }

        /// <summary>
        /// Gets a value indicating whether the controller has the button B.
        /// </summary>
        /// <value><c>true</c> if it has the button B; otherwise, <c>false</c>.</value>
        public bool HasBButton { get; internal set; }

        /// <summary>
        /// Gets a value indicating whether the controller has the directional pad down button.
        /// </summary>
        /// <value><c>true</c> if it has the directional pad down button; otherwise, <c>false</c>.</value>
        public bool HasDPadDownButton { get; internal set; }

        /// <summary>
        /// Gets a value indicating whether the controller has the directional pad left button.
        /// </summary>
        /// <value><c>true</c> if it has the directional pad left button; otherwise, <c>false</c>.</value>
        public bool HasDPadLeftButton { get; internal set; }

        /// <summary>
        /// Gets a value indicating whether the controller has the directional pad right button.
        /// </summary>
        /// <value><c>true</c> if it has the directional pad right button; otherwise, <c>false</c>.</value>
        public bool HasDPadRightButton { get; internal set; }

        /// <summary>
        /// Gets a value indicating whether the controller has the directional pad up button.
        /// </summary>
        /// <value><c>true</c> if it has the directional pad up button; otherwise, <c>false</c>.</value>
        public bool HasDPadUpButton { get; internal set; }

        /// <summary>
        /// Gets a value indicating whether the controller has the left shoulder button.
        /// </summary>
        /// <value><c>true</c> if it has the left shoulder button; otherwise, <c>false</c>.</value>
        public bool HasLeftShoulderButton { get; internal set; }

        /// <summary>
        /// Gets a value indicating whether the controller has the left stick button.
        /// </summary>
        /// <value><c>true</c> if it has the left stick button; otherwise, <c>false</c>.</value>
        public bool HasLeftStickButton { get; internal set; }

        /// <summary>
        /// Gets a value indicating whether the controller has the right shoulder button.
        /// </summary>
        /// <value><c>true</c> if it has the right shoulder button; otherwise, <c>false</c>.</value>
        public bool HasRightShoulderButton { get; internal set; }

        /// <summary>
        /// Gets a value indicating whether the controller has the right stick button.
        /// </summary>
        /// <value><c>true</c> if it has the right stick button; otherwise, <c>false</c>.</value>
        public bool HasRightStickButton { get; internal set; }

        /// <summary>
        /// Gets a value indicating whether the controller has the button Start.
        /// </summary>
        /// <value><c>true</c> if it has the button Start; otherwise, <c>false</c>.</value>
        public bool HasStartButton { get; internal set; }

        /// <summary>
        /// Gets a value indicating whether the controller has the button X.
        /// </summary>
        /// <value><c>true</c> if it has the button X; otherwise, <c>false</c>.</value>
        public bool HasXButton { get; internal set; }

        /// <summary>
        /// Gets a value indicating whether the controller has the button Y.
        /// </summary>
        /// <value><c>true</c> if it has the button Y; otherwise, <c>false</c>.</value>
        public bool HasYButton { get; internal set; }

        /// <summary>
        /// Gets a value indicating whether the controller has the guide button.
        /// </summary>
        /// <value><c>true</c> if it has the guide button; otherwise, <c>false</c>.</value>
        public bool HasBigButton { get; internal set; }

        /// <summary>
        /// Gets a value indicating whether the controller has X axis for the left stick (thumbstick) button.
        /// </summary>
        /// <value><c>true</c> if it has X axis for the left stick (thumbstick) button; otherwise, <c>false</c>.</value>
        public bool HasLeftXThumbStick { get; internal set; }

        /// <summary>
        /// Gets a value indicating whether the controller has Y axis for the left stick (thumbstick) button.
        /// </summary>
        /// <value><c>true</c> if it has Y axis for the left stick (thumbstick) button; otherwise, <c>false</c>.</value>
        public bool HasLeftYThumbStick { get; internal set; }

        /// <summary>
        /// Gets a value indicating whether the controller has X axis for the right stick (thumbstick) button.
        /// </summary>
        /// <value><c>true</c> if it has X axis for the right stick (thumbstick) button; otherwise, <c>false</c>.</value>
        public bool HasRightXThumbStick { get; internal set; }

        /// <summary>
        /// Gets a value indicating whether the controller has Y axis for the right stick (thumbstick) button.
        /// </summary>
        /// <value><c>true</c> if it has Y axis for the right stick (thumbstick) button; otherwise, <c>false</c>.</value>
        public bool HasRightYThumbStick { get; internal set; }

        /// <summary>
        /// Gets a value indicating whether the controller has the left trigger button.
        /// </summary>
        /// <value><c>true</c> if it has the left trigger button; otherwise, <c>false</c>.</value>
        public bool HasLeftTrigger { get; internal set; }

        /// <summary>
        /// Gets a value indicating whether the controller has the right trigger button.
        /// </summary>
        /// <value><c>true</c> if it has the right trigger button; otherwise, <c>false</c>.</value>
        public bool HasRightTrigger { get; internal set; }

        /// <summary>
        /// Gets a value indicating whether the controller has the left vibration motor.
        /// </summary>
        /// <value><c>true</c> if it has the left vibration motor; otherwise, <c>false</c>.</value>
        public bool HasLeftVibrationMotor { get; internal set; }

        /// <summary>
        /// Gets a value indicating whether the controller has the right vibration motor.
        /// </summary>
        /// <value><c>true</c> if it has the right vibration motor; otherwise, <c>false</c>.</value>
        public bool HasRightVibrationMotor { get; internal set; }

        /// <summary>
        /// Gets a value indicating whether the controller has a microphone.
        /// </summary>
        /// <value><c>true</c> if it has a microphone; otherwise, <c>false</c>.</value>
        public bool HasVoiceSupport { get; internal set; }

        /// <summary>
        /// Gets the type of the controller.
        /// </summary>
        /// <value>A <see cref="GamePadType"/> representing the controller type..</value>
        public GamePadType GamePadType { get; internal set; }

        /// <summary>
        /// Determines whether the specified <see cref="object"/> is equal to the current <see cref="T:Microsoft.Xna.Framework.Input.GamePadCapabilities"/>.
        /// </summary>
        /// <param name="obj">The <see cref="object"/> to compare with the current <see cref="T:Microsoft.Xna.Framework.Input.GamePadCapabilities"/>.</param>
        /// <returns><c>true</c> if the specified <see cref="object"/> is equal to the current
        /// <see cref="T:Microsoft.Xna.Framework.Input.GamePadCapabilities"/>; otherwise, <c>false</c>.</returns>
        public bool Equals(GamePadCapabilities obj)
        {
            var eq = true;

            eq &= (DisplayName == obj.DisplayName);
            eq &= (Identifier == obj.Identifier);
            eq &= (IsConnected == obj.IsConnected);
            eq &= (HasAButton == obj.HasAButton);
            eq &= (HasBackButton == obj.HasBackButton);
            eq &= (HasBButton == obj.HasBButton);
            eq &= (HasDPadDownButton == obj.HasDPadDownButton);
            eq &= (HasDPadLeftButton == obj.HasDPadLeftButton);
            eq &= (HasDPadRightButton == obj.HasDPadRightButton);
            eq &= (HasDPadUpButton == obj.HasDPadUpButton);
            eq &= (HasLeftShoulderButton == obj.HasLeftShoulderButton);
            eq &= (HasLeftStickButton == obj.HasLeftStickButton);
            eq &= (HasRightShoulderButton == obj.HasRightShoulderButton);
            eq &= (HasRightStickButton == obj.HasRightStickButton);
            eq &= (HasStartButton == obj.HasStartButton);
            eq &= (HasXButton == obj.HasXButton);
            eq &= (HasYButton == obj.HasYButton);
            eq &= (HasBigButton == obj.HasBigButton);
            eq &= (HasLeftXThumbStick == obj.HasLeftXThumbStick);
            eq &= (HasLeftYThumbStick == obj.HasLeftYThumbStick);
            eq &= (HasRightXThumbStick == obj.HasRightXThumbStick);
            eq &= (HasRightYThumbStick == obj.HasRightYThumbStick);
            eq &= (HasLeftTrigger == obj.HasLeftTrigger);
            eq &= (HasRightTrigger == obj.HasRightTrigger);
            eq &= (HasLeftVibrationMotor == obj.HasLeftVibrationMotor);
            eq &= (HasRightVibrationMotor == obj.HasRightVibrationMotor);
            eq &= (HasVoiceSupport == obj.HasVoiceSupport);
            eq &= (GamePadType == obj.GamePadType);

            return eq;
        }

        /// <summary>
        /// Serves as a hash function for a <see cref="T:Microsoft.Xna.Framework.Input.GamePadCapabilities"/> object.
        /// </summary>
        /// <returns>A hash code for this instance that is suitable for use in hashing algorithms and data structures such as a
        /// hash table.</returns>
        public int GetHashCode()
        {
            return (int)Identifier.hash();
        }

        /// <summary>
        /// Returns a <see cref="T:System.String"/> that represents the current <see cref="T:Microsoft.Xna.Framework.Input.GamePadCapabilities"/>.
        /// </summary>
        /// <returns>A <see cref="T:System.String"/> that represents the current <see cref="T:Microsoft.Xna.Framework.Input.GamePadCapabilities"/>.</returns>
        public string ToString()
        {
            return string.joinv("", { "[GamePadCapabilities: ",
                @" IsConnected=$IsConnected",
                @", DisplayName=$DisplayName",
                @", Identifier=$Identifier",
                @", HasAButton=$HasAButton",
                @", HasBackButton=$HasBackButton",
                @", HasBButton=$HasBButton",
                @", HasDPadDownButton=$HasDPadDownButton",
                @", HasDPadLeftButton=$HasDPadLeftButton",
                @", HasDPadRightButton=$HasDPadRightButton",
                @", HasDPadUpButton=$HasDPadUpButton",
                @", HasLeftShoulderButton=$HasLeftShoulderButton",
                @", HasLeftStickButton=$HasLeftStickButton",
                @", HasRightShoulderButton=$HasRightShoulderButton",
                @", HasRightStickButton=$HasRightStickButton",
                @", HasStartButton=$HasStartButton",
                @", HasXButton=$HasXButton",
                @", HasYButton=$HasYButton",
                @", HasBigButton=$HasBigButton",
                @", HasLeftXThumbStick=$HasLeftXThumbStick",
                @", HasLeftYThumbStick=$HasLeftYThumbStick",
                @", HasRightXThumbStick=$HasRightXThumbStick",
                @", HasRightYThumbStick=$HasRightYThumbStick",
                @", HasLeftTrigger=$HasLeftTrigger",
                @", HasRightTrigger=$HasRightTrigger",
                @", HasLeftVibrationMotor=$HasLeftVibrationMotor",
                @", HasRightVibrationMotor=$HasRightVibrationMotor",
                @", HasVoiceSupport=$HasVoiceSupport",
                @", GamePadType=$GamePadType",
                "]" });
        }
    }
}
