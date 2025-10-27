---Concatenate the tables pass throw the parameters.
---@param tables (table[]) The tables to concatenate.
---@return (table) # A new table with all item in each tables inside.
local concattables = function(tables)
  local index = 1
  local buildedtable = {}
  for _, table in ipairs(tables) do
    for _, value in ipairs(table) do
      buildedtable[index] = value
      index = index + 1
    end
  end
  return buildedtable
end

---Merge the tables pass throw the parameters.
---@param tables (table[]) The tables to merge.
---@return (table) # A new table with all tables merged.
local mergetables = function(tables)
  local builttable = {}
  for _, table in ipairs(tables) do
    for key, value in pairs(table) do
      builttable[key] = value
    end
  end
  return builttable
end

return {
  concattables = concattables,
  mergetables = mergetables,
}
