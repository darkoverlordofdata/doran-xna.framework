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

        public Object GetService(Type? type)
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
