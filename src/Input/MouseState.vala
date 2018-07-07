// MonoGame - Copyright (C) The MonoGame Team
// This file is subject to the terms and conditions defined in
// file 'LICENSE.txt', which is part of this source code package.

namespace Microsoft.Xna.Framework.Input
{
    /// <summary>
    /// Represents a mouse state with cursor position and button press information.
    /// </summary>
    public struct MouseState
    {
        int _x;
        int _y;
        int _scrollWheelValue;
        ButtonState _leftButton;
        ButtonState _rightButton;
        ButtonState _middleButton;
        ButtonState _xButton1;
        ButtonState _xButton2;
        int _horizontalScrollWheelValue;


        /// <summary>
        /// Initializes a new instance of the MouseState.
        /// </summary>
        /// <param name="x">Horizontal position of the mouse in relation to the window.</param>
        /// <param name="y">Vertical position of the mouse in relation to the window.</param>
        /// <param name="scrollWheel">Mouse scroll wheel's value.</param>
        /// <param name="leftButton">Left mouse button's state.</param>
        /// <param name="middleButton">Middle mouse button's state.</param>
        /// <param name="rightButton">Right mouse button's state.</param>
        /// <param name="xButton1">XBUTTON1's state.</param>
        /// <param name="xButton2">XBUTTON2's state.</param>
        /// <param name="horizontalScrollWheel">Mouse horizontal scroll wheel's value.</param>
        /// <remarks>Normally <see cref="Mouse.GetState()"/> should be used to get mouse current state. The constructor is provided for simulating mouse input.</remarks>
        public MouseState(
            int x,
            int y,
            int scrollWheel,
            ButtonState leftButton,
            ButtonState middleButton,
            ButtonState rightButton,
            ButtonState xButton1,
            ButtonState xButton2,
            int horizontalScrollWheel=0)
        {
            _x = x;
            _y = y;
            _scrollWheelValue = scrollWheel;
            _leftButton = leftButton;
            _middleButton = middleButton;
            _rightButton = rightButton;
            _xButton1 = xButton1;
            _xButton2 = xButton2;
            _horizontalScrollWheelValue = horizontalScrollWheel;
        }
		

        /// <summary>
        /// Compares whether current instance is equal to specified object.
        /// </summary>
        /// <param name="obj">The MouseState to compare.</param>
        /// <returns></returns>
        public bool Equals(MouseState obj)
        {
			return _x == obj._x &&
                   _y == obj._y &&
                   _leftButton == obj._leftButton &&
                   _middleButton == obj._middleButton &&
                   _rightButton == obj._rightButton &&
                   _scrollWheelValue == obj._scrollWheelValue &&
                   _horizontalScrollWheelValue == obj._horizontalScrollWheelValue &&
                   _xButton1 == obj._xButton1 &&
                   _xButton2 == obj._xButton2;
        }

        /// <summary>
        /// Gets the hash code for MouseState instance.
        /// </summary>
        /// <returns>Hash code of the object.</returns>
        public int GetHashCode()
        {
            var hashCode = _x;
            hashCode = (hashCode*397) ^ _y;
            hashCode = (hashCode*397) ^ _scrollWheelValue;
            hashCode = (hashCode*397) ^ _horizontalScrollWheelValue;
            hashCode = (hashCode*397) ^ (int) _leftButton;
            hashCode = (hashCode*397) ^ (int) _rightButton;
            hashCode = (hashCode*397) ^ (int) _middleButton;
            hashCode = (hashCode*397) ^ (int) _xButton1;
            hashCode = (hashCode*397) ^ (int) _xButton2;
            return hashCode;
        }

        /// <summary>
        /// Gets horizontal position of the cursor in relation to the window.
        /// </summary>
		public int X {
			get {
				return _x;
			}
			internal set {
				_x = value;
			}
		}

        /// <summary>
        /// Gets vertical position of the cursor in relation to the window.
        /// </summary>
		public int Y {
			get {
				return _y;
			}
			internal set {
				_y = value;
			}
        }

        /// <summary>
        /// Gets cursor position.
        /// </summary>
        public Point Position
        {
            get { return new Point(_x, _y); }   
        }
        /// <summary>
        /// Gets state of the left mouse button.
        /// </summary>
		public ButtonState LeftButton { 
			get {
				return _leftButton;
			}
			internal set { _leftButton = value; }
		}

        /// <summary>
        /// Gets state of the middle mouse button.
        /// </summary>
		public ButtonState MiddleButton { 
			get {
				return _middleButton;
			}
			internal set { _middleButton = value; }			
		}

        /// <summary>
        /// Gets state of the right mouse button.
        /// </summary>
		public ButtonState RightButton { 
			get {
				return _rightButton;
			}
			internal set { _rightButton = value; }
		}

        /// <summary>
        /// Returns cumulative scroll wheel value since the game start.
        /// </summary>
		public int ScrollWheelValue { 
			get {
				return _scrollWheelValue;
			}
			internal set { _scrollWheelValue = value; }
		}

        /// <summary>
        /// Returns the cumulative horizontal scroll wheel value since the game start
        /// </summary>
        public int HorizontalScrollWheelValue {
            get {
                return _horizontalScrollWheelValue;
            }
            internal set { _horizontalScrollWheelValue = value; }
        }

        /// <summary>
        /// Gets state of the XButton1.
        /// </summary>
		public ButtonState XButton1 { 
			get {
                return _xButton1;
			}
            internal set {
                _xButton1 = value;
            }
		}

        /// <summary>
        /// Gets state of the XButton2.
        /// </summary>
		public ButtonState XButton2 { 
			get {
                return _xButton2;
			}
            internal set {
                _xButton2 = value;
            }
		}
	}
}

