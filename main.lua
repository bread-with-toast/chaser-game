math.randomseed(os.time() - 1238901 * 3819)

function love.load()
  love.graphics.setFont(love.graphics.newFont(20))
  
  x = 10
  y = 200
  
  zx = 400
  zy = 400
  
  points = 0
end

function love.update(dt)
  if love.keyboard.isDown("d") then
    x = x + 150 * dt
  end
  
  if love.keyboard.isDown("w") then
    y = y - 150 * dt
  end
  
  if love.keyboard.isDown("a") then
    x = x - 150* dt
  end
  
  if love.keyboard.isDown("s") then
    y = y + 150 * dt
  end
  
  zx = (zx + (25 * points) * dt)
  zy = (zx + (25 * points) * dt)
  
  if detect_col(zx, zy, x, y) < 75 then
    points = points + 1
    
    x = 10
    y = 200
    
    zx = math.random(50, 550)
    zy = math.random(50, 550)
  end
  
  
end

function love.draw()
    love.graphics.setColor(0, 0, 1)
    love.graphics.rectangle("fill", x, y, 50, 50)
    
    love.graphics.setColor(0, 1, 0)
    love.graphics.rectangle("fill", zx, zy, 50, 50)
    
    love.graphics.setColor(1, 1, 1)
    love.graphics.print("Points: " .. points, 0, 0)
    
    if zx > 600 or zy > 600 then
    zx = 10000000
    zy = 10000000
    
    x = 20000000
    y = 20000000
    love.graphics.print("You Lost With " .. points .. " points D:<", 250, 250)
  end
end

function detect_col(x1, y1, x2, y2) 
    return math.sqrt( (x2-x1)^2 + (y2 - y1)^2 )
end
