local function pipe(table, operators)
  local builttable = {}
  for index, item in ipairs(tables) do
    for _, operator in ipairs(operators) do
      item = operator(item, index, table)
    end
    builttable[index] = item
  end
  return builttable
end

local function map(mapFn)
  return function(item, index, table)
    return mapFn(item)
  end
end

local function filter(filterFn)
  return function(item, index, table)

  end
end
