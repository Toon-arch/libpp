local tbl = { }

for i,v in pairs(getfenv().Region3) do
	tbl[i] = v
end

tbl.fromPart = function(part)
	return Region3.new(part.Position - part.Size/2, part.Position + part.Size/2)
end

return tbl
