/* emscripten Vala Bindings
 * Copyright (c) 2018 Bruce Davidspn <darkoverlordofdata@gmail.com>
 * 
 * ***********************************************************************
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
 * ***********************************************************************
 * 
 */
[CCode (lower_case_cprefix ="emscripten_", cheader_filename="emscripten/emscripten.h")]
namespace Emscripten
{

    [CCode (cname = "emscripten_GetProcAddress")]
    public void* emscripten_GetProcAddress(char* name);

    [CCode (cname = "em_arg_callback_func", has_target = false)]
    public delegate void em_arg_callback_func(void* arg);

    [CCode (cname = "em_callback_func", has_target = false)]
    public delegate void em_callback_func();


    public void set_main_loop_arg(
        em_arg_callback_func func, 
        void *arg, 
        int fps, 
        int simulate_infinite_loop);

    public void set_main_loop(
        em_callback_func func, 
        int fps, 
        int simulate_infinite_loop);

    public char* get_preloaded_image_data(string path, int *w, int *h);

}