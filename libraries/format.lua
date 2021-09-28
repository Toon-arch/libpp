local tbl = { }

tbl.delimit_thousands = function(num)
	local minus, int, fraction = select(3, tostring(num):find("([-]?)(%d+)([.]?%d*)"))
	int = int:reverse():gsub("(%d%d%d)", "%1,")
	return minus .. int:reverse():gsub("^,", "") .. fraction
end

tbl.digital_clock = function(seconds)
	return string.format("%d:%02d", math.floor(seconds/60), seconds%60)
end

tbl.interpolate = function(str, tabl)
	return (str:gsub("($%b{})", function(capture)
		return tabl[capture:sub(3, -2)] or capture
	end))
end

return tbl
