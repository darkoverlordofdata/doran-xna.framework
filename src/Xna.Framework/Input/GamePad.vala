// MonoGame - Copyright (C) The MonoGame Team
// This file is subject to the terms and conditions defined in
// file 'LICENSE.txt', which is part of this source code package.

using Gee;
using System;
// using System.Collections.Generic;

namespace Microsoft.Xna.Framework.Input
{
    /// <summary> 
    /// Supports querying the game controllers and setting the vibration motors.
    /// </summary>
    public class GamePad
    {
        private class GamePadInfo
        {
            public IntPtr Device;
            public IntPtr HapticDevice;
            public int HapticType;
        }

        private static HashMap<int, GamePadInfo> Gamepads;
        
        public static void Initialize()
        {
            Gamepads = new HashMap<int, GamePadInfo>();
        }

        /// <summary>
        /// Returns the capabilites of the connected controller.
        /// </summary>
        /// <param name="index">Index for the controller you want to query.</param>
        /// <returns>The capabilites of the controller.</returns>
        public static GamePadCapabilities GetCapabilities(PlayerIndex playerIndex)
        {
            var index = (int)playerIndex;
            if (index < 0 || index >= PlatformGetMaxNumberOfGamePads())
                return new GamePadCapabilities();

            return PlatformGetCapabilities(index);
        }

        /// <summary>
        /// Gets the current state of a game pad controller, using a specified dead zone
        /// on analog stick positions.
        /// </summary>
        /// <param name="playerIndex">Player index for the controller you want to query.</param>
        /// <param name="deadZoneMode">Enumerated value that specifies what dead zone type to use.</param>
        /// <returns>The state of the controller.</returns>
        public static GamePadState GetState(PlayerIndex playerIndex, GamePadDeadZone deadZoneMode=GamePadDeadZone.IndependentAxes)
        {
            var index = (int)playerIndex;
            if (index < 0 || index >= PlatformGetMaxNumberOfGamePads())
                return GamePadState.Default;
            return PlatformGetState(index, deadZoneMode);
        }

        /// <summary>
        /// Sets the vibration motor speeds on the controller device if supported.
        /// </summary>
        /// <param name="playerIndex">Player index that identifies the controller to set.</param>
        /// <param name="leftMotor">The speed of the left motor, between 0.0 and 1.0. This motor is a low-frequency motor.</param>
        /// <param name="rightMotor">The speed of the right motor, between 0.0 and 1.0. This motor is a high-frequency motor.</param>
        /// <returns>Returns true if the vibration motors were set.</returns>
        public static bool SetVibration(PlayerIndex playerIndex, float leftMotor, float rightMotor)
        {
            var index = (int)playerIndex;
            if (index < 0 || index >= PlatformGetMaxNumberOfGamePads())
                return false;
            
            return PlatformSetVibration(index, MathHelper.Clampf(leftMotor, 0.0f, 1.0f), MathHelper.Clampf(rightMotor, 0.0f, 1.0f));
        }

        /// <summary>
        /// The maximum number of game pads supported on this system.  Attempting to
        /// access a gamepad index higher than this number will result in an <see cref="InvalidOperationException"/>
        /// being thrown by the API.
        /// </summary>
        public static int MaximumGamePadCount
        {
            get { return PlatformGetMaxNumberOfGamePads(); }
        }

        private static Sdl.Haptic.Effect _hapticLeftRightEffect = new Sdl.Haptic.Effect()
        {
            // type = Sdl.Haptic.EffectId.LeftRight,
            // leftright = new Sdl.Haptic.LeftRight()
            // {
                Type = Sdl.Haptic.EffectId.LeftRight,
                Length = Sdl.Haptic.Infinity,
                LargeMagnitude = ushort.MAX,
                SmallMagnitude = ushort.MAX
            // }
        };

        public static void InitDatabase()
        {
            // using (var stream = ReflectionHelpers.GetAssembly(typeof(GamePad)).GetManifestResourceStream("gamecontrollerdb.txt"))
            // {
            //     if (stream != null)
            //     {
            //         using (var reader = new BinaryReader(stream))
            //         {
            //             try
            //             {
            //                 var src = Sdl.RwFromMem(reader.ReadBytes((int)stream.Length), (int)stream.Length);
            //                 Sdl.GameController.AddMappingFromRw(src, 1);
            //             }
            //             catch { }
            //         }
            //     }
            // }
        }

        internal static void AddDevice(int deviceId)
        {
            var gamepad = new GamePadInfo();
            gamepad.Device = Sdl.GameController.Open(deviceId);
            gamepad.HapticDevice = Sdl.Haptic.Open(deviceId);

            var id = 0;
            while (Gamepads.has_key(id))
                id++;

            Gamepads.set(id, gamepad);
            
            if (gamepad.HapticDevice == IntPtr.Zero)
                return;

            try
            {
                if (Sdl.Haptic.EffectSupported(gamepad.HapticDevice, ref _hapticLeftRightEffect) == 1)
                {
                    Sdl.Haptic.NewEffect(gamepad.HapticDevice, ref _hapticLeftRightEffect);
                    gamepad.HapticType = 1;
                }
                else if (Sdl.Haptic.RumbleSupported(gamepad.HapticDevice) == 1)
                {
                    Sdl.Haptic.RumbleInit(gamepad.HapticDevice);
                    gamepad.HapticType = 2;
                }
                else
                    Sdl.Haptic.Close(gamepad.HapticDevice);
            }
            catch
            {
                Sdl.Haptic.Close(gamepad.HapticDevice);
                gamepad.HapticDevice = IntPtr.Zero;
                Sdl.ClearError();
            }
        }

        internal static void RemoveDevice(int instanceid)
        {
            foreach (var entry in Gamepads.entries)
            {
                if (Sdl.Joystick.InstanceID(Sdl.GameController.GetJoystick(entry.value.Device)) == instanceid)
                {
                    Gamepads.unset(entry.key);
                    DisposeDevice(entry.value);
                    break;
                }
            }
        }

        private static void DisposeDevice(GamePadInfo info)
        {
            if (info.HapticType > 0)
                Sdl.Haptic.Close(info.HapticDevice);
            Sdl.GameController.Close(info.Device);
        }

        internal static void CloseDevices()
        {
            foreach (var entry in Gamepads.entries)
                DisposeDevice(entry.value);

            Gamepads.clear();
        }

        private static int PlatformGetMaxNumberOfGamePads()
        {
            return 16;
        }

        private static GamePadCapabilities PlatformGetCapabilities(int index)
        {
            if (!Gamepads.has_key(index))
                return new GamePadCapabilities();

            var gamecontroller = Gamepads[index].Device;
            var caps = new GamePadCapabilities();
            var mapping = Sdl.GameController.GetMapping(gamecontroller).split(",");

            caps.IsConnected = true;
            caps.DisplayName = Sdl.GameController.GetName(gamecontroller);
            caps.Identifier = Sdl.Joystick.GetGUID(Sdl.GameController.GetJoystick(gamecontroller)).to_string();
            caps.HasLeftVibrationMotor = caps.HasRightVibrationMotor = (Gamepads[index].HapticType != 0);
            caps.GamePadType = GamePadType.GamePad;

            foreach (var map in mapping)
            {
                var split = map.split(":");
                if (split.length != 2)
                    continue;

                switch (split[0])
                {
                    case "a":
                        caps.HasAButton = true;
                        break;
                    case "b":
                        caps.HasBButton = true;
                        break;
                    case "x":
                        caps.HasXButton = true;
                        break;
                    case "y":
                        caps.HasYButton = true;
                        break;
                    case "back":
                        caps.HasBackButton = true;
                        break;
                    case "guide":
                        caps.HasBigButton = true;
                        break;
                    case "start":
                        caps.HasStartButton = true;
                        break;
                    case "dpleft":
                        caps.HasDPadLeftButton = true;
                        break;
                    case "dpdown":
                        caps.HasDPadDownButton = true;
                        break;
                    case "dpright":
                        caps.HasDPadRightButton = true;
                        break;
                    case "dpup":
                        caps.HasDPadUpButton = true;
                        break;
                    case "leftshoulder":
                        caps.HasLeftShoulderButton = true;
                        break;
                    case "lefttrigger":
                        caps.HasLeftTrigger = true;
                        break;
                    case "rightshoulder":
                        caps.HasRightShoulderButton = true;
                        break;
                    case "righttrigger":
                        caps.HasRightTrigger = true;
                        break;
                    case "leftstick":
                        caps.HasLeftStickButton = true;
                        break;
                    case "rightstick":
                        caps.HasRightStickButton = true;
                        break;
                    case "leftx":
                        caps.HasLeftXThumbStick = true;
                        break;
                    case "lefty":
                        caps.HasLeftYThumbStick = true;
                        break;
                    case "rightx":
                        caps.HasRightXThumbStick = true;
                        break;
                    case "righty":
                        caps.HasRightYThumbStick = true;
                        break;
                }
            }

            return caps;
        }

        private static float GetFromSdlAxis(int axis)
        {
            // SDL Axis ranges from -32768 to 32767, so we need to divide with different numbers depending on if it's positive
            if (axis < 0)
                return axis / 32768f;

            return axis / 32767f;
        }

        private static GamePadState PlatformGetState(int index, GamePadDeadZone deadZoneMode)
        {
            if (!Gamepads.has_key(index))
                return GamePadState.Default;

            var gdevice = Gamepads[index].Device;

            // Y gamepad axis is rotate between SDL and XNA
            var thumbSticks =
                new GamePadThumbSticks(
                    new Vector2(
                        GetFromSdlAxis(Sdl.GameController.GetAxis(gdevice, Sdl.GameController.Axis.LeftX)),
                        GetFromSdlAxis(Sdl.GameController.GetAxis(gdevice, Sdl.GameController.Axis.LeftY)) * -1f
                    ),
                    new Vector2(
                        GetFromSdlAxis(Sdl.GameController.GetAxis(gdevice, Sdl.GameController.Axis.RightX)),
                        GetFromSdlAxis(Sdl.GameController.GetAxis(gdevice, Sdl.GameController.Axis.RightY)) * -1f
                    ),
                    deadZoneMode
                );

            var triggers = new GamePadTriggers(
                GetFromSdlAxis(Sdl.GameController.GetAxis(gdevice, Sdl.GameController.Axis.TriggerLeft)),
                GetFromSdlAxis(Sdl.GameController.GetAxis(gdevice, Sdl.GameController.Axis.TriggerRight))
            );

            var buttons =
                new GamePadButtons(
                    ((Sdl.GameController.GetButton(gdevice, Sdl.GameController.Button.A) == 1) ? Buttons.A : 0) |
                    ((Sdl.GameController.GetButton(gdevice, Sdl.GameController.Button.B) == 1) ? Buttons.B : 0) |
                    ((Sdl.GameController.GetButton(gdevice, Sdl.GameController.Button.Back) == 1) ? Buttons.Back : 0) |
                    ((Sdl.GameController.GetButton(gdevice, Sdl.GameController.Button.Guide) == 1) ? Buttons.BigButton : 0) |
                    ((Sdl.GameController.GetButton(gdevice, Sdl.GameController.Button.LeftShoulder) == 1) ? Buttons.LeftShoulder : 0) |
                    ((Sdl.GameController.GetButton(gdevice, Sdl.GameController.Button.RightShoulder) == 1) ? Buttons.RightShoulder : 0) |
                    ((Sdl.GameController.GetButton(gdevice, Sdl.GameController.Button.LeftStick) == 1) ? Buttons.LeftStick : 0) |
                    ((Sdl.GameController.GetButton(gdevice, Sdl.GameController.Button.RightStick) == 1) ? Buttons.RightStick : 0) |
                    ((Sdl.GameController.GetButton(gdevice, Sdl.GameController.Button.Start) == 1) ? Buttons.Start : 0) |
                    ((Sdl.GameController.GetButton(gdevice, Sdl.GameController.Button.X) == 1) ? Buttons.X : 0) |
                    ((Sdl.GameController.GetButton(gdevice, Sdl.GameController.Button.Y) == 1) ? Buttons.Y : 0) |
                    ((triggers.Left > 0f) ? Buttons.LeftTrigger : 0) |
                    ((triggers.Right > 0f) ? Buttons.RightTrigger : 0)
                );

            var dPad =
                new GamePadDPad(
                    (Sdl.GameController.GetButton(gdevice, Sdl.GameController.Button.DpadUp) == 1) ? ButtonState.Pressed : ButtonState.Released,
                    (Sdl.GameController.GetButton(gdevice, Sdl.GameController.Button.DpadDown) == 1) ? ButtonState.Pressed : ButtonState.Released,
                    (Sdl.GameController.GetButton(gdevice, Sdl.GameController.Button.DpadLeft) == 1) ? ButtonState.Pressed : ButtonState.Released,
                    (Sdl.GameController.GetButton(gdevice, Sdl.GameController.Button.DpadRight) == 1) ? ButtonState.Pressed : ButtonState.Released
                );

            return new GamePadState(thumbSticks, triggers, buttons, dPad);
        }

        private static bool PlatformSetVibration(int index, float leftMotor, float rightMotor)
        {
            if (!Gamepads.has_key(index))
                return false;

            var gamepad = Gamepads[index];

            if (gamepad.HapticType == 0)
                return false;

            if (leftMotor <= 0.0f && rightMotor <= 0.0f)
                Sdl.Haptic.StopAll(gamepad.HapticDevice);
            else if (gamepad.HapticType == 1)
            {
                _hapticLeftRightEffect.LargeMagnitude = (ushort)(65535f * leftMotor);
                _hapticLeftRightEffect.SmallMagnitude = (ushort)(65535f * rightMotor);

                Sdl.Haptic.UpdateEffect(gamepad.HapticDevice, 0, ref _hapticLeftRightEffect);
                Sdl.Haptic.RunEffect(gamepad.HapticDevice, 0, 1);
            }
            else if (gamepad.HapticType == 2)
                Sdl.Haptic.RumblePlay(gamepad.HapticDevice, Math.fmaxf(leftMotor, rightMotor), Sdl.Haptic.Infinity);

            return true;
        }
        
    }
}
