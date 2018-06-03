// MIT License - Copyright (C) The Mono.Xna Team
// This file is subject to the terms and conditions defined in
// file 'LICENSE.txt', which is part of this source code package.

using Gee;
using System;
// using System.Collections.Generic;
// using Microsoft.Xna.Framework.Utilities;

namespace Microsoft.Xna.Framework
{
    public class GameServiceContainer : Object, IServiceProvider
    {
        HashMap<Type, Object> services;

        public GameServiceContainer()
        {
            services = new HashMap<Type, Object>();
        }

        public void AddService<T>(T? provider)
        {
            AddServiceType(typeof(T), (Object?)provider);
        }

 	    public T GetService<T>() // where T : class
        {
            var service = GetServiceType(typeof(T));

            if (service == null)
                return null;

            return (T)service;
        }

        public void AddServiceType(Type? type, Object? provider)
        {
            if (type == null)
                throw new Exception.ArgumentNullException("type");
            if (provider == null)
                throw new Exception.ArgumentNullException("provider");
            // if (!ReflectionHelpers.IsAssignableFrom(type, provider))
            //     throw new Exception.ArgumentException("The provider does not match the specified service type!");

            services.set(type, provider);
        }

        public Object GetServiceType(Type? type)
        {
            if (type == null)
                throw new Exception.ArgumentNullException("type");
						
            if (services.has_key(type))
                return services[type];
            else
                return null;
        }

        public void RemoveService(Type? type)
        {
            if (type == null)
                throw new Exception.ArgumentNullException("type");

            services.unset(type);
        }
        
    }
}
