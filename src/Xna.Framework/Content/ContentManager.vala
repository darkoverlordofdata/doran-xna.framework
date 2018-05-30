// MonoGame - Copyright (C) The MonoGame Team
// This file is subject to the terms and conditions defined in
// file 'LICENSE.txt', which is part of this source code package.

using Gee;
using System;
// using System.Collections.Generic;

namespace Microsoft.Xna.Framework.Content
{
	public class ContentManager : Object, IDisposable
	{
		const uint8 ContentCompressedLzx = 0x80;
		const uint8 ContentCompressedLz4 = 0x40;

		private string _rootDirectory = ""; // string.Empty;
		private bool disposed;


		public ContentManager()
		{
			// AddContentManager(this);
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
			return Asset.Get(URI(@"$_rootDirectory/$assetName"));
		}

		/// <summary>
		/// This API is an extension to XNA.
		/// loads all assets from an asset folder
		/// </summary>
		/// <returns>Load all assets.</returns>
		public virtual void LoadAll(string assetFolder)
		{
			if (assetFolder == null || assetFolder == "")
			{
				throw new Exception.ArgumentNullException("assetFolder");
			}
			if (disposed)
			{
				throw new Exception.ObjectDisposedException("ContentManager");
			}
			Folder.Load(URI(@"$_rootDirectory/$assetFolder/"));
			
		}

		/// <summary>
		/// This API is an extension to XNA.
		/// loads 1 asset
		/// </summary>
		/// <returns>Load an asset.</returns>
		public virtual CObject LoadAsset(string assetName)
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
		
	}
}
