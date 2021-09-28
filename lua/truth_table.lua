local function deep_copy(tbl)
  local tbl_copy = {}
  for k, v in pairs(tbl) do
    if type(v) == "table" then
      table.insert(tbl_copy, k, deep_copy(v))
    else
      table.insert(tbl_copy, k, v)
    end
  end
  return tbl_copy
end

local function reversed(tbl)
  local reversed_list = {}
  for i = #tbl, 1, -1 do
    table.insert(reversed_list, tbl[i])
  end
  return reversed_list
end

local function print_table(num_table, num_outputs, separator)
  local lines_list = {}
  local output_list = {}
  for _ = 1, num_outputs do
    table.insert(output_list, "X")
  end
  for i = 1, #num_table do
    table.insert(lines_list, vim.fn.join(reversed(num_table[i]), separator) ..
      string.rep(separator .. "X", num_outputs))
  end
  vim.api.nvim_paste(vim.fn.join(lines_list, "\n"), 'CR', 1)
end

return function (separator)
  if separator == nil then
    separator = " "
  end
  local inputs = tonumber(vim.fn.input("number of inputs: "))
  local outputs = tonumber(vim.fn.input("number of outputs: "))
  local num_table = {{"0"}, {"1"}}
  for i = 2, inputs do
    local num_table_copy = deep_copy(num_table)

    for j = 1, #num_table do
      table.insert(num_table[j], "0")
    end
    for j = 1, #num_table do
      table.insert(num_table_copy[j], "1")
      table.insert(num_table, num_table_copy[j])
    end
  end
  print_table(num_table, outputs, separator)
end
