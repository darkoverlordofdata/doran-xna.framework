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

    /**
     * load a libgdx format atlas
     */
    public class TextureAtlas : Object {
        private TextureAtlasData data;
        private Texture2D[] image;

        /**
         * @param packFile handle
         * @param imageDir handle
         * @param flip images?
         */
        public TextureAtlas(FileHandle packFile, FileHandle? imageDir=null, bool flip=false) {
            Load(new TextureAtlasData(packFile, imageDir == null ? packFile.GetParent() : imageDir, flip));
        }


        public Region? FindRegion(string name, int index=-1) {
            foreach (var region in data.regions) {   
                if (index == -1) {
                    if (region.name == name) return region;
                } else {
                    if (region.name == name && region.index == index) return region;
                }
            }
            return null;
        }
        
        private void Load(TextureAtlasData data)
        {
            this.data = data;
            image = new Texture2D[data.pages.Count];
            
            // load page images
            foreach (var page in data.pages)
            {
                image[i++] = Content.Load<Texture2D>("images/"+page.textureFile.GetName());
            }
        }

        // public Sprite? createSprite(string name, int index=-1) { 
        //     foreach (var region in regions) {
        //         if (index == -1) {
        //             if (region.name == name) {
        //                 return new Sprite.AtlasSprite(region);
        //             }
        //         } else {    
        //             if (region.name == name && region.index == index)
        //                 return new Sprite.AtlasSprite(region);
        //         }
        //     }
        //     return null;
        // }

    }
}