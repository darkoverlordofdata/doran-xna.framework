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
namespace Microsoft.Xna.Framework.Content
{
	using System;
	using System.Collections.Generic;
	using Microsoft.Xna.Framework.Graphics;
	using ValaGame.OpenGL;

	public class ContentManager : Object, IDisposable
	{
		const uint8 ContentCompressedLzx = 0x80;
		const uint8 ContentCompressedLz4 = 0x40;

		private string _rootDirectory = ""; // string.Empty;
		private IServiceProvider serviceProvider;
        private Dictionary<string, Object> loadedAssets = new Dictionary<string, Object>(); // StringComparer.OrdinalIgnoreCase);
		private bool disposed;


		public ContentManager(IServiceProvider serviceProvider, string rootDirectory="")
		{
			if (serviceProvider == null)
			{
				throw new Exception.ArgumentNullException("serviceProvider");
			}
			this.RootDirectory = rootDirectory;
			this.serviceProvider = serviceProvider;
		}

		public void Dispose()
		{
			Dispose2(true);
		}

		// If disposing is true, it was called explicitly and we should dispose managed objects.
		// If disposing is false, it was called by the finalizer and managed objects should not be disposed.
		protected virtual void Dispose2(bool disposing)
		{
			if (!disposed)
			{
				if (disposing)
				{
					Unload();
				}

				disposed = true;
			}
		}

		public virtual T Load<T>(string assetName)
		{
			if (assetName == null || assetName == "")
			{
				throw new Exception.ArgumentNullException("assetName");
			}
			if (disposed)
			{
				throw new Exception.ObjectDisposedException("ContentManager");
			}

            // On some platforms, name and slash direction matter.
            // We store the asset by a /-seperating key rather than how the
            // path to the file was passed to us to avoid
            // loading "content/asset1.xnb" and "content\\ASSET1.xnb" as if they were two 
            // different files. This matches stock XNA behavior.
            // The key will ignore case differences
            var key = assetName.replace("\\", "/").casefold();

            // Check for a previously loaded asset first
            Object? asset = null;
            if (loadedAssets.ContainsKey(key))
            {
				asset = loadedAssets[key];
                if (asset is T)
                {
                    return (T)asset;
                }
            }

            // Load the asset.
            T? result = ReadAsset<T>(assetName);
            loadedAssets[key] = (Object)result;
            return result;
		}

		protected T ReadAsset<T>(string assetName)
		{
			if (assetName == null || assetName == "")
			{
				throw new Exception.ArgumentNullException("assetName");
			}
			if (disposed)
			{
				throw new Exception.ObjectDisposedException("ContentManager");
			}

			string originalAssetName = assetName;

			// Instead of loading from *.xnb file, we get from Corange cache:
			var result = GLib.Object.new(typeof(T));
			if (result == null)
				throw new Exception.ContentLoadException("Could not load " + originalAssetName + " asset!");

			var manager = result as ISetContent;
			if (manager != null)
				manager.SetContent(this);
							
			var asset = result as ISetData;
			if (asset == null)
				throw new Exception.ContentLoadException("Missing ISetData Interface loading " + originalAssetName + " in " + result.get_type().name());

			asset.SetData(@"$_rootDirectory/$assetName");
			return result;
		}

		/// <summary>
		/// This API is an extension to XNA.
		/// loads all assets from an asset folder
		/// </summary>
		/// <returns>Loads a typed assets.</returns>
		public virtual T LoadAsset<T>(string assetName)
		{
			if (assetName == null || assetName == "")
			{
				throw new Exception.ArgumentNullException("assetName");
			}
			if (disposed)
			{
				throw new Exception.ObjectDisposedException("ContentManager");
			}
			return null;
			// return (T)Asset.Get(URI(@"$_rootDirectory/$assetName"));
		}

		/// <summary>
		/// This API is an extension to XNA.
		/// loads all assets from an asset folder
		/// </summary>
		/// <returns>Load all assets.</returns>
		public virtual void PreLoad(string location)
		{
			// if (location == null || location == "")
			// {
			// 	throw new Exception.ArgumentNullException("location");
			// }
			// if (disposed)
			// {
			// 	throw new Exception.ObjectDisposedException("ContentManager");
			// }
			// Folder.Load(URI(@"$_rootDirectory/$location/"));
			
		}

		public virtual uint LoadTexture(string textureName)
		{
			if (textureName == null || textureName == "")
			{
				throw new Exception.ArgumentNullException("textureName");
			}
			if (disposed)
			{
				throw new Exception.ObjectDisposedException("ContentManager");
			}
			
		    // var tex = corange_asset_get(URI(@"$_rootDirectory/$textureName"));
            // return corange_texture_handle(tex);
			return 0;
		}

		/// <summary>
		/// This API is an extension to XNA.
		/// loads 1 asset
		/// </summary>
		/// <returns>Load an asset.</returns>
		public virtual IntPtr LoadResource(string assetName)
		{
			if (assetName == null || assetName == "")
			{
				throw new Exception.ArgumentNullException("assetName");
			}
			if (disposed)
			{
				throw new Exception.ObjectDisposedException("ContentManager");
			}
			// return Asset.Get(URI(@"$_rootDirectory/$assetName"));
			return null;
		}

		public virtual void Unload()
		{
			// Look for disposable assets.
		}

		public string RootDirectory
		{
			get
			{
				return _rootDirectory;
			}
			set
			{
				_rootDirectory = value;
			}
		}

		internal string RootDirectoryFullPath
		{
			get
			{
				char buf[1024];
            	GetFullPathName(RootDirectory, 1024, buf);
				return (string) buf;
				// return URI(RootDirectory).Full().ToString();
			}
		}
		
		public IServiceProvider ServiceProvider
		{
			get
			{
				return this.serviceProvider;
			}
		}
		
	}
}
