local tbl = { }

local _wsp = {
	_tableFilter = function(tabl, predicate)
		local new_tbl = { }
		for index, value in ipairs(tabl) do
			if predicate(value, index, tabl) then
				table.insert(new_tbl, value)
			end
		end
		return new_tbl
	end
}

for i,v in pairs(getfenv().Instance) do
	tbl[i] = v
end

function tbl:GetAncestors(instance)
	instance = instance.Parent
	local ancestors = { instance }
	while instance do
		instance = instance.Parent
		table.insert(ancestors, instance)
	end
	return ancestors
end

function tbl:GetAncestorsOfClass(instance, class_name)
	instance = instance.Parent
	local ancestors = { instance }
	while instance do
		instance = instance.Parent
		if not instance or instance.ClassName ~= class_name then
			continue
		end
		table.insert(ancestors, instance)
	end
	return ancestors
end

function tbl:GetAncestorsWhichAreA(instance, class_name)
	instance = instance.Parent
	local ancestors = { instance }
	while instance do
		instance = instance.Parent
		if not instance or not instance:IsA(class_name) then
			continue
		end
		table.insert(ancestors, instance)
	end
	return ancestors
end

function tbl:GetChildrenOfClass(instance, class_name)
	return _wsp._tableFilter(instance:GetChildren(), function(child)
		return child.ClassName == class_name
	end)
end

function tbl:GetChildrenWhichAreA(instance, class_name)
	return _wsp._tableFilter(instance:GetChildren(), function(child)
		return child:IsA(class_name)
	end)
end

function tbl:GetDescendantsOfClass(instance, class_name)
	return _wsp._tableFilter(instance:GetDescendants(), function(child)
		return child.ClassName == class_name
	end)
end

function tbl:GetDescendantsWhichAreA(instance, class_name)
	return _wsp._tableFilter(instance:GetDescendants(), function(child)
		return child:IsA(class_name)
	end)
end

function tbl:GetSiblings(instance)
	local siblings = instance.Parent and instance.Parent:GetChildren() or { }
	table.remove(siblings, table.find(siblings, instance) or 0)
	return siblings
end

function tbl:GetSiblingsOfClass(instance, class_name)
	local siblings = instance.Parent and instance.Parent:GetChildren() or { }
	table.remove(siblings, table.find(siblings, instance) or 0)
	return _wsp._tableFilter(siblings, function(sibling)
		return sibling.ClassName == class_name
	end)
end

function tbl:GetSiblingsWhichAreA(instance, class_name)
	local siblings = instance.Parent and instance.Parent:GetChildren() or { }
	table.remove(siblings, table.find(siblings, instance) or 0)
	return _wsp._tableFilter(siblings, function(sibling)
		return sibling:IsA(class_name)
	end)
end

function tbl:WaitForChildOfClass(instance, class_name)
	local found = instance:FindFirstChildOfClass(class_name)
	while not found or found.ClassName ~= class_name do
		found = instance.ChildAdded:Wait()
	end
	return found
end

function tbl:WaitForChildWhichIsA(instance, class_name)
	local found = instance:FindFirstChildWhichIsA(class_name)
	while not found or not found:IsA(class_name) do
		found = instance.ChildAdded:Wait()
	end
	return found
end

return tbl
