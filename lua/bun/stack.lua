local Stack = {}

-- Create a Table with stack functions
function Stack:Create()

    -- stack table
    local t = {}
    -- entry table
    t._et = {}

    -- push a value on to the stack
    function t:push(...)
        if ... then
            local targs = {...}
            -- add values
            for _,v in ipairs(targs) do
                table.insert(self._et, v)
            end
        end
    end

    -- pop a value from the stack
    function t:pop(num)

        -- get num values from stack
        num = num or 1

        -- return table
        local entries = {}

        -- get values into entries
        for i = 1, num do
            -- get last entry
            if #self._et ~= 0 then
                table.insert(entries, self._et[#self._et])
                -- remove last value
                table.remove(self._et)
            else
                break
            end
        end
        -- return unpacked entries
        return unpack(entries)
    end

    -- get entries
    function t:getn()
        return #self._et
    end

    -- list values
    function t:list()
        return self._et
    end
    return t
end

return Stack
