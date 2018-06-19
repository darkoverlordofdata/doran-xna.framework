/* ******************************************************************************
 *# MIT License
 *
 * Copyright (c) 2018-2018 Bruce Davidson &lt;darkoverlordofdata@gmail.com&gt;
 *
 * Permission is hereby granted, free of charge, to any person obtaining
 * a copy of this software and associated documentation files (the
 * 'Software'), to deal in the Software without restriction, including
 * without limitation the rights to use, copy, modify, merge, publish,
 * distribute, sublicense, and/or sell copies of the Software, and to
 * permit persons to whom the Software is furnished to do so, subject to
 * the following conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
 * IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
 * CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
 * TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
 * SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

/**
 * Port of Xna from CSharp to Vala
 *
 *  
 *
 *
 */
 namespace Microsoft.Xna.Framework 
{
    public int FloatGetHashCode(float m_value)
    {
        float f = m_value;
        if (f == 0) return 0;
        long value = *(long*)(&f);
        return ((int)value) ^ ((int)(value >> 32));
    }
    /**
     *
     * Initialize the framework.
     * This makes sure that static values such as:
     *  TimeSpan.Zero 
     *  System.EventArgs.Empty
     *
     * are initialized.
     */
    public void Initialize()
    {
        TimeSpan.Initialize();
        
        new System.EventArgs();
        new Microsoft.Xna.Framework.Color(0);
        new Microsoft.Xna.Framework.Input.KeyboardUtil();
        Microsoft.Xna.Framework.Input.MouseCursor.Initialize();
        Microsoft.Xna.Framework.Input.Joystick.Initialize();
        Microsoft.Xna.Framework.Input.GamePad.Initialize();
        Microsoft.Xna.Framework.Input.KeyboardState.Initialize();
    }
}