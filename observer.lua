observer = {}

function observer:create()
    local object = {}
    setmetatable(object, {__index = self})

    object.listeners = {}

    return object
end

function observer:add_listener(event, callback)
    -- If there's no listener table for the event create it.
    if not self.listeners[event] then
        self.listeners[event] = {}
    end

    table.insert(self.listeners[event], callback)

    -- Return listener index for removal purpose later.
    return { event = event, index = #self.listeners[event] }
end

function observer:remove_listener(event, index)
    self.listeners[event][index] = nil
end

function observer.remove_listeners_from_object(object)
    for i, listener in ipairs(object.listeners) do
        object.observer:remove_listener(listener.event, listener.index)
    end
end

function observer:notify(event, data)
    if self.listeners[event] then
        for k, callback in pairs(self.listeners[event]) do
            callback(data)
        end
    else
        print(string.format("No listener exists for \"%s\" event.", event))
    end
end