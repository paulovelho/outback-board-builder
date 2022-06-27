if love == nil then
  love = {}
end

local Board = {
  margin = 30,
  canvas = nil,
  cells = 8, -- how many cells are we talking about? (each side [cells] x [cells])
  screen_width = love.graphics.getWidth(),
  screen_height = love.graphics.getHeight(),
  size, -- the size (px) of the board. Will be calculated, if not provided
  cell_size -- the size (px) of each cell. Will be calculated
}

function Board:new(o)
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  return o
end

function Board:calculateSize()
  local board_size
  if self.screen_width > self.screen_height then
    board_size = self.screen_height
  else
    board_size = self.screen_width
  end
  self.size = board_size - (self.margin * 2)
end

function Board:calculateCellSize()
  self.cell_size = self.size / self.cells
end

function Board:draw()
  if self.size == nil or type(self.size) ~= "number" 
    then self:calculateSize() 
  end
  assert( type(self.size) == "number", "board size is null")
  self:calculateCellSize()

  self.canvas = love.graphics.newCanvas(self.size, self.size)
  love.graphics.setCanvas(self.canvas)

  for i = 0, self.cells do
    for j = 0, self.cells do
      love.graphics.rectangle("line", self.cell_size * i, self.cell_size * j, self.cell_size, self.cell_size)
    end
  end

  love.graphics.setCanvas()
  return self
end

function Board:get()
  assert(self.canvas ~= nil, "trying to draw non-existing board")
  return self.canvas
end

function Board:toString()
  local str = [[BOARD = { 
    cells = ]]..self.cells..[[,
    screen_width = ]]..self.screen_width..[[,
    screen_height = ]]..self.screen_height..[[,
    size = ]]..self.size..[[,
    cell_size = ]]..self.cell_size..[[,
  }]]
  return(str);
end

return Board