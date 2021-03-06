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

	public class ContentManager : Disposable
	{
		// const uint8 ContentCompressedLzx = 0x80;
		// const uint8 ContentCompressedLz4 = 0x40;

		private string _rootDirectory = ""; // string.Empty;
		private ServiceProvider serviceProvider;
        private Dictionary<string, Object> loadedAssets = new Dictionary<string, Object>(); // StringComparer.OrdinalIgnoreCase);
		private bool disposed;


		public ContentManager(ServiceProvider serviceProvider, string rootDirectory="")
		{
			if (serviceProvider == null)
			{
				throw new Exception.ArgumentNullException("serviceProvider");
			}
			if (rootDirectory != "")
			    ResourceManager.SetRoot(rootDirectory);
			this.RootDirectory = rootDirectory;
			this.serviceProvider = serviceProvider;
		}

		public override void Dispose()
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

			var result = GLib.Object.new(typeof(T));
			if (result == null)
				throw new Exception.ContentLoadException("Could not load " + originalAssetName + " asset!");

			var asset = result as ISetData;
			if (asset == null)
				throw new Exception.ContentLoadException("Missing ISetData Interface loading " + originalAssetName + " in " + result.get_type().name());

			asset.SetData(@"$_rootDirectory/$assetName");
			return result;
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
            	ResourceManager.SetRoot(value);
				_rootDirectory = value;
			}
		}

		// internal string RootDirectoryFullPath
		// {
		// 	owned get
		// 	{
		// 		char buf[1024];
		// 		return ((string)Dir.cwd(buf) + "\\" + RootDirectory)
		// 			.replace("\\", "/")
		// 			.replace("/./", "/");
		// 	}
		// }
		
		public ServiceProvider ServiceProvider
		{
			get
			{
				return this.serviceProvider;
			}
		}
		
	}
}
