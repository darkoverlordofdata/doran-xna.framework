// MonoGame - Copyright (C) The MonoGame Team
// This file is subject to the terms and conditions defined in
// file 'LICENSE.txt', which is part of this source code package.

using System.Collections.Generic;


namespace Microsoft.Xna.Framework.Input
{
    internal class KeyboardUtil : Object
    {
        static Dictionary<int, Keys> _map;

        public static void Initialize()
        {
            _map = new Dictionary<int, Keys>();
            _map.set(8, Keys.Back);
            _map.set(9, Keys.Tab);
            _map.set(13, Keys.Enter);
            _map.set(27, Keys.Escape);
            _map.set(32, Keys.Space);
            _map.set(39, Keys.OemQuotes);
            _map.set(43, Keys.Add);
            _map.set(44, Keys.OemComma);
            _map.set(45, Keys.OemMinus);
            _map.set(46, Keys.OemPeriod);
            _map.set(47, Keys.OemQuestion);
            _map.set(48, Keys.D0);
            _map.set(49, Keys.D1);
            _map.set(50, Keys.D2);
            _map.set(51, Keys.D3);
            _map.set(52, Keys.D4);
            _map.set(53, Keys.D5);
            _map.set(54, Keys.D6);
            _map.set(55, Keys.D7);
            _map.set(56, Keys.D8);
            _map.set(57, Keys.D9);
            _map.set(59, Keys.OemSemicolon);
            _map.set(60, Keys.OemBackslash);
            _map.set(61, Keys.OemPlus);
            _map.set(91, Keys.OemOpenBrackets);
            _map.set(92, Keys.OemPipe);
            _map.set(93, Keys.OemCloseBrackets);
            _map.set(96, Keys.OemTilde);
            _map.set(97, Keys.A);
            _map.set(98, Keys.B);
            _map.set(99, Keys.C);
            _map.set(100, Keys.D);
            _map.set(101, Keys.E);
            _map.set(102, Keys.F);
            _map.set(103, Keys.G);
            _map.set(104, Keys.H);
            _map.set(105, Keys.I);
            _map.set(106, Keys.J);
            _map.set(107, Keys.K);
            _map.set(108, Keys.L);
            _map.set(109, Keys.M);
            _map.set(110, Keys.N);
            _map.set(111, Keys.O);
            _map.set(112, Keys.P);
            _map.set(113, Keys.Q);
            _map.set(114, Keys.R);
            _map.set(115, Keys.S);
            _map.set(116, Keys.T);
            _map.set(117, Keys.U);
            _map.set(118, Keys.V);
            _map.set(119, Keys.W);
            _map.set(120, Keys.X);
            _map.set(121, Keys.Y);
            _map.set(122, Keys.Z);
            _map.set(127, Keys.Delete);
            _map.set(1073741881, Keys.CapsLock);
            _map.set(1073741882, Keys.F1);
            _map.set(1073741883, Keys.F2);
            _map.set(1073741884, Keys.F3);
            _map.set(1073741885, Keys.F4);
            _map.set(1073741886, Keys.F5);
            _map.set(1073741887, Keys.F6);
            _map.set(1073741888, Keys.F7);
            _map.set(1073741889, Keys.F8);
            _map.set(1073741890, Keys.F9);
            _map.set(1073741891, Keys.F10);
            _map.set(1073741892, Keys.F11);
            _map.set(1073741893, Keys.F12);
            _map.set(1073741894, Keys.PrintScreen);
            _map.set(1073741895, Keys.Scroll);
            _map.set(1073741896, Keys.Pause);
            _map.set(1073741897, Keys.Insert);
            _map.set(1073741898, Keys.Home);
            _map.set(1073741899, Keys.PageUp);
            _map.set(1073741901, Keys.End);
            _map.set(1073741902, Keys.PageDown);
            _map.set(1073741903, Keys.Right);
            _map.set(1073741904, Keys.Left);
            _map.set(1073741905, Keys.Down);
            _map.set(1073741906, Keys.Up);
            _map.set(1073741907, Keys.NumLock);
            _map.set(1073741908, Keys.Divide);
            _map.set(1073741909, Keys.Multiply);
            _map.set(1073741910, Keys.Subtract);
            _map.set(1073741911, Keys.Add);
            _map.set(1073741912, Keys.Enter);
            _map.set(1073741913, Keys.NumPad1);
            _map.set(1073741914, Keys.NumPad2);
            _map.set(1073741915, Keys.NumPad3);
            _map.set(1073741916, Keys.NumPad4);
            _map.set(1073741917, Keys.NumPad5);
            _map.set(1073741918, Keys.NumPad6);
            _map.set(1073741919, Keys.NumPad7);
            _map.set(1073741920, Keys.NumPad8);
            _map.set(1073741921, Keys.NumPad9);
            _map.set(1073741922, Keys.NumPad0);
            _map.set(1073741923, Keys.Decimal);
            _map.set(1073741925, Keys.Apps);
            _map.set(1073741928, Keys.F13);
            _map.set(1073741929, Keys.F14);
            _map.set(1073741930, Keys.F15);
            _map.set(1073741931, Keys.F16);
            _map.set(1073741932, Keys.F17);
            _map.set(1073741933, Keys.F18);
            _map.set(1073741934, Keys.F19);
            _map.set(1073741935, Keys.F20);
            _map.set(1073741936, Keys.F21);
            _map.set(1073741937, Keys.F22);
            _map.set(1073741938, Keys.F23);
            _map.set(1073741939, Keys.F24);
            _map.set(1073741951, Keys.VolumeMute);
            _map.set(1073741952, Keys.VolumeUp);
            _map.set(1073741953, Keys.VolumeDown);
            _map.set(1073742040, Keys.OemClear);
            _map.set(1073742044, Keys.Decimal);
            _map.set(1073742048, Keys.LeftControl);
            _map.set(1073742049, Keys.LeftShift);
            _map.set(1073742050, Keys.LeftAlt);
            _map.set(1073742051, Keys.LeftWindows);
            _map.set(1073742052, Keys.RightControl);
            _map.set(1073742053, Keys.RightShift);
            _map.set(1073742054, Keys.RightAlt);
            _map.set(1073742055, Keys.RightWindows);
            _map.set(1073742082, Keys.MediaNextTrack);
            _map.set(1073742083, Keys.MediaPreviousTrack);
            _map.set(1073742084, Keys.MediaStop);
            _map.set(1073742085, Keys.MediaPlayPause);
            _map.set(1073742086, Keys.VolumeMute);
            _map.set(1073742087, Keys.SelectMedia);
            _map.set(1073742089, Keys.LaunchMail);
            _map.set(1073742092, Keys.BrowserSearch);
            _map.set(1073742093, Keys.BrowserHome);
            _map.set(1073742094, Keys.BrowserBack);
            _map.set(1073742095, Keys.BrowserForward);
            _map.set(1073742096, Keys.BrowserStop);
            _map.set(1073742097, Keys.BrowserRefresh);
            _map.set(1073742098, Keys.BrowserFavorites);
            _map.set(1073742106, Keys.Sleep);
        }

        public static Keys ToXna(int key)
        {
            if (_map.contains(key))
                return _map[key];

            return Keys.None;
        }
    }
}

