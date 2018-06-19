// MonoGame - Copyright (C) The MonoGame Team
// This file is subject to the terms and conditions defined in
// file 'LICENSE.txt', which is part of this source code package.

using Gee;
using System;
// using System.Collections.Generic;
using Microsoft.Xna.Framework.Assets;
using Microsoft.Xna.Framework.Graphics;
using ValaGame.OpenGL;

namespace Microsoft.Xna.Framework.Content
{
	public class ContentManager : Object, IDisposable
	{
		const uint8 ContentCompressedLzx = 0x80;
		const uint8 ContentCompressedLz4 = 0x40;

		private string _rootDirectory = ""; // string.Empty;
		private IServiceProvider serviceProvider;
        private HashMap<string, Object> loadedAssets = new HashMap<string, Object>(); // StringComparer.OrdinalIgnoreCase);
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
            if (loadedAssets.has_key(key))
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
			return (T)Asset.Get(URI(@"$_rootDirectory/$assetName"));
		}

		/// <summary>
		/// This API is an extension to XNA.
		/// loads all assets from an asset folder
		/// </summary>
		/// <returns>Load all assets.</returns>
		public virtual void LoadFolder(string folderName)
		{
			if (folderName == null || folderName == "")
			{
				throw new Exception.ArgumentNullException("folderName");
			}
			if (disposed)
			{
				throw new Exception.ObjectDisposedException("ContentManager");
			}
			Folder.Load(URI(@"$_rootDirectory/$folderName/"));
			
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
		    // var tex = CCode.asset_get(URI(@"$_rootDirectory/$textureName"));
			
		    var tex = corange_asset_get(URI(@"$_rootDirectory/$textureName"));
            return corange_texture_handle(tex);
		}

		/// <summary>
		/// This API is an extension to XNA.
		/// loads 1 asset
		/// </summary>
		/// <returns>Load an asset.</returns>
		public virtual CObject LoadResource(string assetName)
		{
			if (assetName == null || assetName == "")
			{
				throw new Exception.ArgumentNullException("assetName");
			}
			if (disposed)
			{
				throw new Exception.ObjectDisposedException("ContentManager");
			}
			return Asset.Get(URI(@"$_rootDirectory/$assetName"));
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
				return URI(RootDirectory).Full().ToString();
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
