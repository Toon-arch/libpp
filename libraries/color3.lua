local tbl = { }

for i,v in pairs(getfenv().Color3) do
	tbl[i] = v
end

tbl.add = function(lhs, rhs)
	return Color3.new(lhs.R + rhs.R, lhs.G + rhs.G, lhs.B + rhs.B)
end

tbl.divide = function(lhs, rhs)
	if typeof(rhs) == "Color3" then
		return Color3.new(lhs.R/rhs.R, lhs.G/rhs.G, lhs.B/rhs.B)
	end
	return Color3.new(lhs.R/rhs, lhs.G/rhs, lhs.B/rhs)
end

tbl.multiply = function(lhs, rhs)
	if typeof(rhs) == "Color3" then
		return Color3.new(lhs.R*rhs.R, lhs.G*rhs.G, lhs.B*rhs.B)
	end
	return Color3.new(lhs.R*rhs, lhs.G*rhs, lhs.B*rhs)
end

tbl.subtract = function(lhs, rhs)
	return Color3.new(lhs.R - rhs.R, lhs.G - rhs.G, lhs.B - rhs.B)
end

return tbl
