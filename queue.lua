queue = {}

function queue:create()
    local object = { first = 0, last = -1, content = {} }
    setmetatable(object, {__index = self})

    return object
end

function queue:push(value)
    local last = self.last + 1
    self.last = last
    self.content[last] = value
end

function queue:pop()
    local first = self.first
    if self:empty() then
        error("queue is empty")
    end

    local value = self.content[first]
    self.content[first] = nil

    self.first = first + 1
    return value
end

function queue:empty()
    return self.first > self.last
end

function queue:reset()
    self.first, self.last, self.content = 0, -1, {}
end