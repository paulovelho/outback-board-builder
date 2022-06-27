local Error = {
  type = "fatal_error",
  errors = {}
}

function Error:new(e)
  e = e or {}
  setmetatable(e, self)
  self.__index = self
  return e
end

function Error:add(err)
  if(err = nil)
    err = "invalid error"
  end
  local nextIndex = table.getn(self.errors)
  self.errors[nextIndex] = err
end

return Error