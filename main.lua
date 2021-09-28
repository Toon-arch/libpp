local ReturnWithLibrary = function(URL) loadstring(game:HttpGetAsync(("https://raw.githubusercontent.com/Toon-arch/LuaH/main/libraries/" .. string.lower(tostring(URL)) .. ".lua")))() end
return {
	["string"] = ReturnWithLibrary("string"),
	["instance"] = ReturnWithLibrary("instance"),
	["format"] = ReturnWithLibrary("format"),
	["table"] = ReturnWithLibrary("table"),
	["color3"] = ReturnWithLibrary("color3"),
	["region3"] = ReturnWithLibrary("region3"),
	["math"] = ReturnWithLibrary("math")
}
