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
namespace Microsoft.Xna.Framework
{
    using System;
    using System.Collections.Generic;
    // using Microsoft.Xna.Framework.Utilities;

    public class GameServiceContainer : ServiceProvider
    {
        Dictionary<Type, Object> services;

        public GameServiceContainer()
        {
            services = new Dictionary<Type, Object>();
        }

        public void AddServiceType<T>(T? provider)
        {
            AddService(typeof(T), (Object?)provider);
        }

 	    public T GetServiceType<T>() // where T : class
        {
            var service = GetService(typeof(T));

            if (service == null)
                return null;

            return (T)service;
        }

        public void AddService(Type? type, Object? provider)
        {
            if (type == null)
                throw new Exception.ArgumentNullException("type");
            if (provider == null)
                throw new Exception.ArgumentNullException("provider");
            // if (!ReflectionHelpers.IsAssignableFrom(type, provider))
            //     throw new Exception.ArgumentException("The provider does not match the specified service type!");

            services.set(type, provider);
        }

        public override Object GetService(Type? type)
        {
            if (type == null)
                throw new Exception.ArgumentNullException("type");
						
            if (services.ContainsKey(type))
                return services[type];
            else
                return null;
        }

        public void RemoveService(Type? type)
        {
            if (type == null)
                throw new Exception.ArgumentNullException("type");

            services.Remove(type);
        }
    }
}
