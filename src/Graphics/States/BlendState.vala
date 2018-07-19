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
namespace Microsoft.Xna.Framework.Graphics
{
    using System;

	public class BlendState : GraphicsResource
	{
        private TargetBlendState[] _targetBlendState;

        private bool _defaultStateObject;

	    private Color _blendFactor;

	    private int _multiSampleMask;

	    private bool _independentBlendEnable;

        internal void BindToGraphicsDevice(GraphicsDevice device)
        {
            if (_defaultStateObject)
                throw new Exception.InvalidOperationException("You cannot bind a default state object.");
            if (GraphicsDevice != null && GraphicsDevice != device)
                throw new Exception.InvalidOperationException("This blend state is already bound to a different graphics device.");
            GraphicsDevice = device;
        }

        internal void ThrowIfBound()
        {
            if (_defaultStateObject)
                throw new Exception.InvalidOperationException("You cannot modify a default blend state object.");
            if (GraphicsDevice != null)
                throw new Exception.InvalidOperationException("You cannot modify the blend state after it has been bound to the graphics device!");
        }

        /// <summary>
        /// Returns the target specific blend state.
        /// </summary>
        /// <param name="index">The 0 to 3 target blend state index.</param>
        /// <returns>A target blend state.</returns>
        public TargetBlendState get(int index)
        {
            return _targetBlendState[index];
        }

	    public BlendFunction AlphaBlendFunction
	    {
	        get { return _targetBlendState[0].AlphaBlendFunction; }
            set
            {
                ThrowIfBound();
                _targetBlendState[0].AlphaBlendFunction = value;
            }
	    }

		public Blend AlphaDestinationBlend
        {
            get { return _targetBlendState[0].AlphaDestinationBlend; }
            set
            {
                ThrowIfBound();
                _targetBlendState[0].AlphaDestinationBlend = value;
            }
        }

		public Blend AlphaSourceBlend
        {
            get { return _targetBlendState[0].AlphaSourceBlend; }
            set
            {
                ThrowIfBound();
                _targetBlendState[0].AlphaSourceBlend = value;
            }
        }

		public BlendFunction ColorBlendFunction
        {
            get { return _targetBlendState[0].ColorBlendFunction; }
            set
            {
                ThrowIfBound();
                _targetBlendState[0].ColorBlendFunction = value;
            }
        }

		public Blend ColorDestinationBlend
        {
            get { return _targetBlendState[0].ColorDestinationBlend; }
            set
            {
                ThrowIfBound();
                _targetBlendState[0].ColorDestinationBlend = value;
            }
        }

		public Blend ColorSourceBlend
        {
            get { return _targetBlendState[0].ColorSourceBlend; }
            set
            {
                ThrowIfBound();
                _targetBlendState[0].ColorSourceBlend = value;
            }
        }

		public ColorWriteChannels ColorWriteChannels
        {
            get { return _targetBlendState[0].ColorWriteChannels; }
            set
            {
                ThrowIfBound();
                _targetBlendState[0].ColorWriteChannels = value;
            }
        }

		public ColorWriteChannels ColorWriteChannels1
        {
            get { return _targetBlendState[1].ColorWriteChannels; }
            set
            {
                ThrowIfBound();
                _targetBlendState[1].ColorWriteChannels = value;
            }
        }

		public ColorWriteChannels ColorWriteChannels2
        {
            get { return _targetBlendState[2].ColorWriteChannels; }
            set
            {
                ThrowIfBound();
                _targetBlendState[2].ColorWriteChannels = value;
            }
        }

		public ColorWriteChannels ColorWriteChannels3
        {
            get { return _targetBlendState[3].ColorWriteChannels; }
            set
            {
                ThrowIfBound();
                _targetBlendState[3].ColorWriteChannels = value;
            }
        }

        /// <summary>
        /// The color used as blend factor when alpha blending.
        /// </summary>
        /// <remarks>
        /// <see cref="P:Microsoft.Xna.Framework.Graphics.GraphicsDevice.BlendFactor"/> is set to this value when this <see cref="BlendState"/>
        /// is bound to a GraphicsDevice.
        /// </remarks>
	    public Color BlendFactor
	    {
	        get { return _blendFactor; }
            set
            {
                ThrowIfBound();
                _blendFactor = value;
            }
	    }

        public int MultiSampleMask
        {
            get { return _multiSampleMask; }
            set
            {
                ThrowIfBound();
                _multiSampleMask = value;
            }
        }

        /// <summary>
        /// Enables use of the per-target blend states.
        /// </summary>
        public bool IndependentBlendEnable
        {
            get { return _independentBlendEnable; }
            set
            {
                ThrowIfBound();
                _independentBlendEnable = value;
            }
        }


        public static BlendState Additive;
        public static BlendState AlphaBlend;
        public static BlendState NonPremultiplied;
        public static BlendState Opaque;

        public BlendState()
        {
            _targetBlendState = new TargetBlendState[4];
            _targetBlendState[0] = new TargetBlendState(this);
            _targetBlendState[1] = new TargetBlendState(this);
            _targetBlendState[2] = new TargetBlendState(this);
            _targetBlendState[3] = new TargetBlendState(this);

			_blendFactor = Color.White;
            _multiSampleMask = int32.MAX;
            _independentBlendEnable = false;
        }

        private BlendState.Named(string name, Blend sourceBlend, Blend destinationBlend)
        {
            this();
            Name = name;
            ColorSourceBlend = sourceBlend;
            AlphaSourceBlend = sourceBlend;
            ColorDestinationBlend = destinationBlend;
            AlphaDestinationBlend = destinationBlend;
            _defaultStateObject = true;
        }

        private BlendState.Cloned(BlendState cloneSource)
        {
            Name = cloneSource.Name;

            _targetBlendState = new TargetBlendState[4];
            _targetBlendState[0] = cloneSource[0].Clone(this);
            _targetBlendState[1] = cloneSource[1].Clone(this);
            _targetBlendState[2] = cloneSource[2].Clone(this);
            _targetBlendState[3] = cloneSource[3].Clone(this);

            _blendFactor = cloneSource._blendFactor;
            _multiSampleMask = cloneSource._multiSampleMask;
            _independentBlendEnable = cloneSource._independentBlendEnable;
        }

        static construct
        {
            Additive = new BlendState.Named("BlendState.Additive", Blend.SourceAlpha, Blend.One);
            AlphaBlend = new BlendState.Named("BlendState.AlphaBlend", Blend.One, Blend.InverseSourceAlpha);
            NonPremultiplied = new BlendState.Named("BlendState.NonPremultiplied", Blend.SourceAlpha, Blend.InverseSourceAlpha);
            Opaque = new BlendState.Named("BlendState.Opaque", Blend.One, Blend.Zero);
		}

	    internal BlendState Clone()
	    {
	        return new BlendState.Cloned(this);
	    }

        public void PlatformDispose(){}

        protected override void Dispose2(bool disposing)
        {
            if (!IsDisposed)
            {
                for (int i = 0; i < _targetBlendState.length; ++i)
                    _targetBlendState[i] = null;

                PlatformDispose();
            }
            base.Dispose2(disposing);
        }
    }
}

