local Debugger = {
	active = configs.debug
}

function Debugger:print(str)
	if not self.active then return end
	print(str)
end

return Debugger