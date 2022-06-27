if love == nil then
	love = {}
end

function deb(args)
  Debugger = require("helper.debug")
  Debugger:print(args)
end

function love.load(args)
  check_args(args)
end

function love.update(dt)
 
end

function love.draw()
  Board = require("game.board"):new{
    margin = 20
  }

  if not Board:draw()
    then error("board could not be drawn")
  end
  love.graphics.draw(Board:get(), 20, 20)
end

function love.keypressed(k)
  deb("key pressed: " .. k)
  if k == "escape" or k == "q" then
    quit()
  end
end

function help()
  print("\n == "..configs.title.." ==\n")
  print("a project [LUA + Love2D]")
  print("by Platypus Technology")
  print("author: Paulo Henrique Martins (Paulo Velho)")
  print("www.platypusweb.com.br\n")
  print("console commands:")
  print("\t-h, --help : help")
  print("\t-t, --test : run tests")
  print("\t-c         : enable debugger")
  print("keys:")
  print("\t[Q], [ESC] : quit")
end

function check_args(args) 
  for _, flag in ipairs(args) do
    if flag == "-h" or flag == "--help" then
      help()
    end
    if flag == "-t" or flag == "--test" then
      lovetest.run()
    end
    if flag == "-c" then
      debug.debug()
      quit()
    end
  end
  return false
end

function quit()
  love.event.quit()
end
