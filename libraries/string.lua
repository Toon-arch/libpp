local tbl = { }

local _wsp = {
	isidentifier_keywords = {
		"true", "false", "nil",
		"for", "while", "do",
		"if", "then", "repeat",
		"until", "in", "return",
		"function", "and", "or",
		"local", "else", "elseif",
		"end", "break", "not",
	},
}

for i,v in pairs(getfenv().string) do
	tbl[i] = v
end

tbl.capitalize = function(str)
	return (str:gsub("^%l", string.upper))
end

tbl.isalnum = function (str)
	return not str:match("%W")
end

tbl.isalpha = function(str)
	return not str:match("%A")
end

tbl.isidentifier = function(str)
	return not table.find(_wsp.isidentifier_keywords, str) and str:match("^[_%a][_%w]*$") ~= nil
end

tbl.islower = function(str)
	return str:lower() == str
end

tbl.isupper = function(str)
	return str:upper() == str
end

tbl.iswhitespace = function(str)
	return not str:match("%S")
end

tbl.join = function(delimiter, iterable)
	local is_string = typeof(iterable) == "string"
	return is_string and table.concat(iterable:split(""), delimiter) or table.concat(iterable, delimiter)
end

tbl.startswith = function(str, start)
	return str:sub(1, #start) == start
end

tbl.strip = function(str, chars)
	chars = chars or "%s"
	return (str:gsub(string.format("^[%s]*(.-)[%s]*$", chars, chars), "%1"))
end

tbl.swapcase = function(str)
	return (str:gsub("%a", function(match: string)
		return tbl.islower(match) and match:upper() or match:lower()
	end))
end

tbl.title = function(str)
	return (str:gsub("%S+", tbl.capitalize))
end

tbl.zfill = function(str, goal)
	local no_sign, replacements = str:gsub("^[%-%+]", "")
	local sign = str:match("^[%-%+]") or ""
	return sign .. string.rep("0", goal - #str - replacements + 1) .. no_sign
end

return tbl
