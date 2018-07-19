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
    /// Defines a type of gamepad.
    /// </summary>
    public enum GamePadType
    {
        /// <summary>
        /// Unknown.
        /// </summary>
        Unknown,

        /// <summary>
        /// GamePad is the XBOX controller.
        /// </summary>
        GamePad,

        /// <summary>
        /// GamePad is a wheel.
        /// </summary>
        Wheel,

        /// <summary>
        /// GamePad is an arcade stick.
        /// </summary>
        ArcadeStick,

        /// <summary>
        /// GamePad is a flight stick.
        /// </summary>
        FlightStick,

        /// <summary>
        /// GamePad is a dance pad.
        /// </summary>
        DancePad,

        /// <summary>
        /// GamePad is a guitar.
        /// </summary>
        Guitar,

        /// <summary>
        /// GamePad is an alternate guitar.
        /// </summary>
        AlternateGuitar,

        /// <summary>
        /// GamePad is a drum kit.
        /// </summary>
        DrumKit,

        /// <summary>
        /// GamePad is a big button pad.
        /// </summary>
        BigButtonPad = 768
    }
}