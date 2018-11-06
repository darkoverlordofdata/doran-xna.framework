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
    using System.IO;
    using System.Collections.Generic;

    public class TextureAtlasData : Object 
    {
        /** 
         * tuple used to return the parsed values 
         */
        public static TextureAtlasData instance;
        public static string[] tuple;
	    /** 
         * Returns the number of tuple values read (1, 2 or 4). 
         */
        public static int ReadTuple(BufferedReader reader) 
        {
            var line = reader.ReadLine();
            var ts = line.split(":");
            if (ts.length == 0) throw new IOException.InvalidData("invalid line: %s", line);
            tuple = ts[1].split(",");
            for (var i=0; i<tuple.length; i++) {
                tuple[i] = tuple[i];
            }
            return tuple.length;
        }

        /** 
         * Returns the single value 
         */
        public static string ReadValue(BufferedReader reader) 
        {
            var line = reader.ReadLine();
            var ts = line.split(":");
            if (ts.length == 0) throw new IOException.InvalidData("invalid line: %s ", line);
            return ts[1];
        }

        public ArrayList<Page> pages;
        public ArrayList<Region> regions;

        /**
         * @param packFile the atlas file
         * @param imagesDir for the bitmap(s)
         * @param flip vert|horz|none
         */
        public TextureAtlasData(FileHandle packFile, FileHandle imagesDir, bool flip) 
        {
            pages = new ArrayList<Page>();
            regions = new ArrayList<Region>();
            var reader = new BufferedReader(
                            new InputStreamReader(
                                new FileInputStream.FromFile(packFile.file)));
            try 
            {
                Page pageImage = null;
                while (true) 
                {
                    var line = reader.ReadLine();
                    if (line == null) break;
                    // line = line.replace("\r", ""); // no regex!
                    if (line.substring(line.length-1) == "\r") 
                    {
                        line = line.substring(0, line.length-1);
                    }
                    if (line.length == 0) 
                    { 
                        pageImage = null;
                    } 
                    else if (pageImage == null) 
                    {
                        var file = imagesDir.Child(line);
                        var width = 0;
                        var height = 0;
                        if (ReadTuple(reader) == 2) 
                        {
                            width = int.parse(tuple[0]);
                            height = int.parse(tuple[1]);
                            ReadTuple(reader);
                        }
                        var format = Format.from(tuple[0].strip());
                        ReadTuple(reader);
                        var min = TextureFilter.from(tuple[0].strip());
                        var max = TextureFilter.from(tuple[1].strip());
                        var direction = ReadValue(reader);
                        var repeatX = TextureWrap.ClampToEdge;
                        var repeatY = TextureWrap.ClampToEdge;
                        if (direction == "x") 
                        {
                            repeatX = TextureWrap.Repeat;
                        } 
                        else if (direction == "y") 
                        {
                            repeatY = TextureWrap.Repeat;
                        }
                        else if (direction == "xy") 
                        {
                            repeatX = TextureWrap.Repeat;
                            repeatY = TextureWrap.Repeat;
                        }

                        pageImage = new Page(file, width, height, min.isMipMap(), format, min, max, repeatX, repeatY);
                        pages.Add(pageImage);
                    } 
                    else 
                    {
                        var rotate = bool.parse(ReadValue(reader));

                        ReadTuple(reader);
                        // var left = int.parse(tuple[0]);
                        // var top = int.parse(tuple[1]);
                        var top = int.parse(tuple[0]);
                        var left = int.parse(tuple[1]);

                        ReadTuple(reader);
                        var width = int.parse(tuple[0]);
                        var height = int.parse(tuple[1]);

                        var region = new Region(pageImage, left, top, width, height, line, rotate);

                        if (ReadTuple(reader) == 4) 
                        {
                            region.slice9 = true;
                            region.splits = 
                            { 
                                int.parse(tuple[0]), 
                                int.parse(tuple[1]), 
                                int.parse(tuple[2]), 
                                int.parse(tuple[3]) 
                            };

                            if (ReadTuple(reader) == 4) 
                            {
                                region.pads = 
                                { 
                                    int.parse(tuple[0]), 
                                    int.parse(tuple[1]), 
                                    int.parse(tuple[2]), 
                                    int.parse(tuple[3]) 
                                };

                                ReadTuple(reader);
                            }
                        }

                        region.originalWidth = int.parse(tuple[0]);
                        region.originalHeight = int.parse(tuple[1]);

                        ReadTuple(reader);
                        region.offsetX = int.parse(tuple[0]);
                        region.offsetY = int.parse(tuple[1]);

                        region.index = int.parse(ReadValue(reader));

                        if (flip) region.flip = true;

                        regions.Add(region);
                    }
                }
            } 
            catch (Error e) 
            {
                print(e.message);
            }
        }


    }





}