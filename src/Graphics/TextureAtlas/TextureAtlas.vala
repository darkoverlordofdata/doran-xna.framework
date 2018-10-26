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
    using System.IO;
    using System.Collections.Generic;
    using Microsoft.Xna.Framework;
    using Microsoft.Xna.Framework.Content;

    /**
     * load a libgdx format atlas
     */
    public class TextureAtlas : Object
    {
        private TextureAtlasData data;
        private FileHandle packFile;
        internal static Texture2D[] Textures;
        private ContentManager content;

        public TextureAtlas(ContentManager content, string path)
        {

            packFile = new FileHandle(@"$(content.RootDirectory)/$path");
            data = new TextureAtlasData(packFile, packFile.GetParent(), false);
            foreach (var page in data.pages)
            {
                var p1 = page.textureFile.GetPath()
                            // we need to skip over the content root
                            .replace(@"$(content.RootDirectory)/", "");
                            
                Textures.resize(int.max(page.id+1, Textures.length));
                Textures[page.id] = content.Load<Texture2D>(p1);
            }
        }


        public TextureRegion? Region(string name, int index=-1) { 
            foreach (var region in data.regions) 
            {
                if (region.name == name && region.index == index)
                {
                    return new TextureRegion(Textures[region.page.id], region.top, region.left, region.width, region.height);
                }
            }
            return null;
        }

        static construct
        {
            Textures = new Texture2D[1];
        }

    }
}