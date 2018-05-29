namespace System {
    public class EventArgs : Object {
        public static EventArgs Empty = new EventArgs();
    }

    public delegate void Event<E>(Object sender, E e);
    
    public class EventHandler<E> : Object {
        public class Listener : Object {
            public Event Event;
            public Listener(Event evt) {
                this.Event = evt;
            }
        }
        public GenericArray<Listener> Listeners;

        public Event Dispatch = (o, e) => {};
        public EventHandler() {
            Listeners = new GenericArray<Listener>();
            Dispatch = (o, e) => {
                Listeners.foreach(listener => listener.Event(o, e));
            };
        }

        public void Add(Event evt) {
            Listeners.add(new Listener(evt));
        }

        public void Remove(Event evt) {
            for (var i=0; i<Listeners.length; i++) {
                if (Listeners[i].Event == evt) {
                    Listeners.remove_index_fast(i);
                    return;
                }
            }
        }
        public void Clear() {
            Listeners.remove_range(0, Listeners.length);
        }
    }
}