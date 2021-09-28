local tbl = { }

for i,v in pairs(getfenv().table) do
	tbl[i] = v
end

tbl.copy = function(tabl, deep)
	if not deep then
		return table.move(tabl, 1, #tbl, 1, table.create(#tabl))
	end
	local new = table.create(#tabl)
	for index, value in ipairs(tabl) do
		if typeof(value) == "table" then
			new[index] = tbl.copy(value, true)
		else
			new[index] = value
		end
	end
	return new
end

tbl.count = function(tabl, value)
	local occurrences = 0
	for _, element in ipairs(tabl) do
		if element == value then
			occurrences += 1
		end
	end
	return occurrences
end

tbl.filter = function(tabl, predicate)
	local new_tbl = { }
	for index, value in ipairs(tabl) do
		if predicate(value, index, tabl) then
			table.insert(new_tbl, value)
		end
	end
	return new_tbl
end

tbl.isempty = function(tabl)
	return next(tabl) == nil
end

tbl.map = function(tabl, callback)
	local new_tbl = table.create(#tabl)
	for index, value in ipairs(tabl) do
		table.insert(new_tbl, callback(value, index, tabl))
	end
	return new_tbl
end

tbl.reduce = function(tabl, reducer, initial_value)
	local accumulator = initial_value
	for index, value in ipairs(tabl) do
		if accumulator == nil then
			accumulator = value
		else
			accumulator = reducer(accumulator, value, index, tabl)
		end
	end
	return accumulator
end

tbl.reverse = function(tabl)
	for i = 1, math.floor(#tabl/2) do
		tabl[#tabl - i + 1], tabl[i] = tabl[i], tabl[#tabl - i + 1]
	end
	return tabl
end

tbl.shuffle = function(tabl)
	assert(#tabl > 1, "bad argument #2 to 'shuffle' (table length < 2)")
	for i = 1, #tabl do
		local j = math.random(#tabl)
		tabl[i], tabl[j] = tabl[j], tabl[i]
	end
	return tabl
end

tbl.zip = function(...)
	local args, args_values = { ... }, { }
	local i = 0
	return function()
		i = i + 1
		for index, tbl in ipairs(args) do
			args_values[index] = tbl[i]

			if args_values[index] == nil then
				return nil
			end
		end
		return table.unpack(args_values)
	end
end

return tbl
