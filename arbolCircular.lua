--Trabajo de Investigación
--Stephanie Delgado 
--Gerson Espinoza
-- GRAFICO DE ÁRBOL CIRCULAR
-- Valor 5%

local button = false

local x = 50
local y = 50
local w = 60
local h = 50

Node ={label="", children={}}
function Node:new (x,y,label,data,leaves,height,children)
	primer = primer or {}
	setmetatable(primer, self)
	self.__index = self
	self.label = label
	self.children = children
	return primer
end

local root = {label="World",x=400,y=400,z=700,z1=200,children={
			{label="America",x=-140,y=-80,z=730,z1=220,children={
				{label="Canada",x=-200,y=-30,z=760,z1=240,children={
					{label="Quebec",x=-220,y=-55,z=790,z1=260,children={}},
					{label="Montreal",x=-180,y=0,z=790,z1=280,children={}}
				}},
				{label="Mexico",x=-140,y=-150,z=760,z1=300,children={
					{label="Monterrey",x=-140,y=-150,z=790,z1=320,children={}}
				}},
				{label="Brazil",x=-80,y=-30,z=760,z1=340,children={
					{label="Sao Paulo",x=-80,y=-30,z=790,z1=360,children={}}
				}}
			}},
			{label="Europe",x=30,y=150,z=730,z1=380,children={
				{label="Portugal",x=-20,y=185,z=760,z1=400,children={
					{label="Lisboa",x=-45,y=200,z=790,z1=420,children={}},
					{label="Porto",x=5,y=200,z=790,z1=440,children={}},
					{label="Portoben",x=-15,y=160,z=790,z1=460,children={}}
				}},
				{label="Germany",x=70,y=105,z=760,z1=480,children={
					{label="Munich",x=45,y=105,z=790,z1=500,children={}},
					{label="Berlin",x=95,y=105,z=790,z1=520,children={}}
				}}
			}},
			{label="Asia",x=120,y=-110,z=730,z1=540,children={
				{label="India",x=80,y=-150,z=760,z1=560,children={
					{label="Bombay",x=80,y=-150,z=790,z1=580,children={}}
				}},
				{label="China",x=150,y=-50,z=760,z1=600,children={
					{label="Shangai",x=150,y=-25,z=790,z1=620,children={}},
					{label="Pekin",x=150,y=-75,z=790,z1=640,children={}}
				}}
			}}
		}
	}

local root2 = {label="Costa Rica",x=400,y=400,z=700,z1=200,children={
			{label="Cartago",x=-80,y=-80,z=730,z1=220,children={
				{label="San Rafael",x=-90,y=-40,z=760,z1=240,children={
					{label="Blanquillo",x=-80,y=-55,z=790,z1=260,children={}},
					{label="El Bosque",x=-100,y=-20,z=790,z1=280,children={}}
				}},
				{label="Guadalupe",x=-90,y=-120,z=760,z1=300,children={
					{label="La joya",x=-80,y=-120,z=790,z1=320,children={}}
				}},
				{label="Occidental",x=-35,y=-75,z=760,z1=340,children={
					{label="San Blas",x=-35,y=-75,z=790,z1=360,children={}}
				}}
			}},
			{label="Alajuela",x=30,y=100,z=730,z1=380,children={
				{label="Alajuela Centro",x=-20,y=115,z=760,z1=400,children={
					{label="El Invu",x=-35,y=100,z=790,z1=420,children={}},
					{label="La idependencia",x=-5,y=100,z=790,z1=440,children={}},
					{label="Aeropuerto",x=-30,y=125,z=790,z1=460,children={}},
					{label="CityMall",x=0,y=130,z=790,z1=480,children={}}
				}},
				{label="San Carlos",x=70,y=105,z=760,z1=500,children={
					{label="La fortuna",x=55,y=100,z=790,z1=520,children={}},
					{label="Volcan Arenal",x=901,y=105,z=790,z1=540,children={}}
				}}
			}},
			
		}
	}



function setup()
	size(1000,900)  
	local tipoletra = loadFont("data/Karla.ttf",13)
	textFont(tipoletra)
end

function draw()
	background(0)

	node=root
	fill(255)

	text("Mapa de Arbol Circular",350,50)
	tamannoPadre=#node.children
	if (button) then
      padreCirculo(root)
	  hijosCirculo(root,tamannoPadre)
	  fill(255)
      text("Ejemplo 1: Parte del mundo",350,70)
  	else
      padreCirculo(root2)
	  hijosCirculo(root2,tamannoPadre)
	  fill(255)
      text("Ejemplo 2: Parte de Costa Rica",350,70)
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
		text("Cambiar",x+14,y+40)
  		
	else
		rect(x,y,w,h)
  		fill(255)
		text("Cambiar",x+4,y+30)
	end
end

function padreCirculo( node )
	fill(255)
	strokeWeight(2)
	stroke(255)
	text(node.label,node.x,node.y)
	text(node.label,node.z,node.z1)
	fill(195,58,24,83)
	tamannoPadre=#node.children
	ellipse(node.x,node.y,tamannoPadre*200,tamannoPadre*200)
end

function hijosCirculo( node , tamannoPadre)
	tamannoPHijo=#node.children
	for indice=1, tamannoPHijo, 1 do
		local x1=node.children[indice].x
		local y1=node.children[indice].y
		fill(233,30,224)
		stroke(233,30,224)
		text(node.children[indice].label,node.x+x1,node.y+y1)
		text(node.children[indice].label,node.children[indice].z,node.children[indice].z1)
		fill(195,58,24,83)
		ellipse(node.x+x1,node.y+y1,(tamannoPadre*100)-30,(tamannoPadre*100)-30)
		tamannoPHijo2= #node.children[indice].children

		for indice2=1, tamannoPHijo2, 1 do
			fill(33,241,12)
			stroke(33,241,12)
			text(node.children[indice].children[indice2].label,node.x+node.children[indice].children[indice2].x-40,node.y+node.children[indice].children[indice2].y-40)
			text(node.children[indice].children[indice2].label,node.children[indice].children[indice2].z,node.children[indice].children[indice2].z1)
			fill(195,58,24,83)
		    ellipse(node.x+node.children[indice].children[indice2].x,node.y+node.children[indice].children[indice2].y,(tamannoPadre*50)-30,(tamannoPadre*50)-30)
			tamannoPHijo3= #node.children[indice].children[indice2].children
			
			for indice3=1, tamannoPHijo3, 1 do

				local x2=node.children[indice].children[indice2].children[indice3].x
				local y2=node.children[indice].children[indice2].children[indice3].y
				fill(12,241,213)
		   		stroke(12,241,213)
				text(node.children[indice].children[indice2].children[indice3].label,node.x+x2,node.y+y2)
				text(node.children[indice].children[indice2].children[indice3].label,node.children[indice].children[indice2].children[indice3].z,node.children[indice].children[indice2].children[indice3].z1)
				fill(195,58,24,83)
		   		ellipse(node.x+x2,node.y+y2,(tamannoPadre*25)-30,(tamannoPadre*25)-30)
		   		
			
			end
		end
	end

end

function mousePressed()
  if (mouseX > x and mouseX < x+w and mouseY > y and mouseY < y+h) then
    button = not button
    xnueva=mouseX
    ynueva=mouseY
  end  
end

function mouseMoved(x,y)
  mouseX = x
  mouseY = y
end
