local tbl = { }

for i,v in pairs(getfenv().math) do
	tbl[i] = v
end

tbl.e = 2.7182818284

tbl.nan = 0/0

tbl.nhuge = -math.huge

tbl.phi = 1.618033988749895

tbl.tau = 2*math.pi

tbl.cbrt = function(num)
	return (math.abs(num)^(1/3))*math.sign(num)
end

tbl.factorial = function(num)
	assert(num%1 == 0 and num >= 0, "number must be positive and integral")
	return num == 0 and 1 or num*tbl.factorial(num - 1)
end

tbl.comb = function(num, num2)
	assert(num >= 0 and num%1 == 0, "bad argument #1 to 'comb' (number is negative/non-integral)")
	assert(num2 >= 0 and num2%1 == 0, "bad argument #2 to 'comb' (number is negative/non-integral)")
	return tbl.factorial(num)/(tbl.factorial(num2)*tbl.factorial(num - num2))
end

tbl.cosec = function(num)
	return 1/math.sin(num)
end

tbl.cotan = function(num)
	return 1/math.tan(num)
end

tbl.factorsof = function(num)
	assert(num >= 0 and num%1 == 0, "number cannot be negative/non-integral")
	if num == 0 then
		return { 0 }
	end
	local factors = { }
	for i = 1, num do
		if num%i == 0 then
			table.insert(factors, num)
		end
	end
	return factors
end

tbl.iseven = function(num)
	return num%2 == 0
end

tbl.isinf = function(num)
	return math.abs(num) == math.huge
end

tbl.isnan = function(arg)
	return not rawequal(arg, arg)
end

tbl.lerp = function(start, goal, alpha)
	return start + (goal - start)*alpha
end

tbl.roundtoplace = function(num, place)
	place = place or 1
	return math.floor(num*(10^place) + 0.5)/(10^place)
end

tbl.secant = function(num)
	return 1/math.cos(num)
end

return tbl
