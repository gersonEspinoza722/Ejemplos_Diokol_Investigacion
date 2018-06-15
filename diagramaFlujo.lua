--Trabajo de Investigación
--Stephanie Delgado 
--Gerson Espinoza
-- Mapa de flujo
--Valor 3%
local x = 50
local y = 50
local w = 60
local h = 50

local mouseX=0
local mouseY=0
local pmouseX=0
local pmouseY=0

function setup()
	size(600,700)  
	local tipoletra = loadFont("data/Karla.ttf",13)
	textFont(tipoletra)
end

function draw()
	background(0)
	crear()
	

end

function crear( )
	text("Diagrama de Flujo", 250,100)

	if (button) then
	  	crearInicio(mouseX,mouseY)
	else
		crearInicio(300,200)
 	end
 	fill(255)
 	stroke(125)
 	rect(x+10,y+10,w,h)
  	fill(125)
  	stroke(255)
  	cambiarBotton()
	
end

  	
function cambiarBotton( )
	if(button) then
		rect(x+10,y+10,w,h)
		fill(255)
		text("Detener",x+18,y+40)
  		
	else
		rect(x,y,w,h)
  		fill(255)
		text("Mover",x+8,y+30)
	end
end


function crearInicio( posicionx1,posiciony1 )
	fill(9,140,239)
	stroke(255)
	strokeWeight(2)

	ellipse(posicionx1,posiciony1,40,40)
	stroke(0)
	fill(255)
	text("Inicio",posicionx1-15,posiciony1-40)
	ellipse(posicionx1,posiciony1,20,20)
	cuerpo(posicionx1,posiciony1)
	crearFin(posicionx1,posiciony1)
end

function crearFin(posicionx1 ,posiciony1 )
	fill(9,140,239)
	stroke(255)
	strokeWeight(2)
	ellipse(posicionx1,posiciony1+380,40,40)
	stroke(0)
	fill(255)
	text("Fin",posicionx1-10,posiciony1+420)
	ellipse(posicionx1,posiciony1+380,20,20)
end


function cuerpo( posicionx1,posiciony1 )

	local cantiFlechas=4
	local posx=0
	for indice=1, cantiFlechas, 1 do
		stroke(255)
		line(posicionx1,posiciony1+posx+20,posicionx1,posiciony1+posx+50)
		posx=posx+100
	end 
	local cantRect=2
	local posy=0
	for i=1,cantRect,1 do
		fill(125,232,11)
		rect(posicionx1-50,posiciony1+60+posy,100,50)
		fill(0)
		text("Variables",posicionx1-30,posiciony1+90+posy)
		posy=posy+200
	end
	fill(232,6,6)
	quad(posicionx1,posiciony1+155,posicionx1+50,posiciony1+180,posicionx1,posiciony1+210,posicionx1-50,posiciony1+180)
	fill(255)
	text("Condicion",posicionx1-30,posiciony1+185)
	line(posicionx1+150,posiciony1+100,posicionx1+150,posiciony1+300)
	line(posicionx1+50,posiciony1+100,posicionx1+150,posiciony1+100)
	line(posicionx1+50,posiciony1+300,posicionx1+150,posiciony1+300)
	text("Ciclo",posicionx1+160,posiciony1+200)
	line(posicionx1-150,posiciony1+180,posicionx1-50,posiciony1+180)
	fill(179,69,34)
	ellipse(posicionx1-160,posiciony1+180,100,40)
	fill(255)
	text("print",posicionx1-180,posiciony1+185)

end

function mouseMoved(x1,y1)
  pmouseX = mouseX
  pmouseY = mouseY
  mouseX = x1
  mouseY = y1
end

function mousePressed()
  if (mouseX > x and mouseX < x+w and mouseY > y and mouseY < y+h) then
    button = not button
    xnueva=mouseX
    ynueva=mouseY
  end  
end
