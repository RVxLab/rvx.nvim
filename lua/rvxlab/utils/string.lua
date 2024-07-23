local M = {}

---Check if a string starts with a given substring
---@param haystack string
---@param needle string
function M.string_starts_with(haystack, needle)
    return haystack:sub(1, #needle) == needle
end

---Pad a string on both sides
---
---@param str string
---@param padding_length integer
function M.pad_string(str, padding_length)
    local padding = string.rep(" ", padding_length)
    return padding .. str .. padding
end

---Split a string
---
---@param str string
---@param delimiter string
---@return table
function M.string_split(str, delimiter)
    local parts = {}
    local pattern = string.format("[^%s]+", delimiter)

    for s in string.gmatch(str, pattern) do
        table.insert(parts, s)
    end

    return parts
end

return M
