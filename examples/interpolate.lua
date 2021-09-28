--[[

interpolate(str: string, tbl: { [string]: string | number }): string

Simulates JavaScript templates interpolation.

Example use:

]]--

local LuaH = loadstring(game:HttpGetAsync(("https://raw.githubusercontent.com/Toon-arch/LuaH/main/main.lua")))()
local format = LuaH.format

format.interpolate("Hello my name is ${name} and I am ${age} years old!", {
	name = "Kevin",
	age = 4
}) --> "Hello my name is Kevin and I am 4 years old!"
