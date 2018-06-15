--Gerson Espinoza Rivera - Stephanie Delgado
--Piramide de Población
--Esta aplicación cuenta con:
--				USO DE BOTONES
--              USO DE CLASES
--				INTERACCIÓN CON EL MOUSE
--              UTILIZA DESPLIEGUE LLAMATIVO
--              EVENTOS DEL MOUSE SOBRE LA TECNICA
--	(candidato a 5%)
local x = 50
local y = 380
local w = 60
local h = 50

local mouseX=0
local mouseY=0
local pmouseX=0
local pmouseY=0


Node ={label="", children={}}
function Node:new (label,children)
	primer = primer or {}
	setmetatable(primer, self)
	self.__index = self
	self.label = label
	self.children = children
	return primer
end

local root = {label="Provincia Mendoza 2010",children={
			{label="Hombres",children={
				{label="79514",x1=300,y1=156},
				{label="80158",x1=300,y1=165},
				{label="74918",x1=300,y1=154},
				{label="64145",x1=300,y1=130},
				{label="46129",x1=300,y1=85},
				{label="39037",x1=300,y1=78},
				{label="26585",x1=300,y1=53},
				{label="15097",x1=300,y1=36},
				{label="4033",x1=300,y1=15},
				{label="1087",x1=300,y1=5}
			}},
			{label="Mujeres",children={
				{label="75741",x1=144,y1=156},
				{label="74092",x1=150,y1=150},
				{label="74142",x1=151,y1=149},
				{label="66611",x1=176,y1=124},
				{label="46670",x1=210,y1=90},
				{label="44941",x1=215,y1=85},
				{label="39071",x1=222,y1=78},
				{label="24935",x1=235,y1=65},
				{label="15091",x1=250,y1=50},
				{label="2756",x1=290,y1=10}
			}}
			
		}
	}

function setup()
	size(600,500)  
	local tipoletra = loadFont("data/Vera.ttf",13)
	textFont(tipoletra)
end

function draw()
	node=root
	background(0)
	fill(255)
	text("Piramide de poblacion", 240,70)
	celdas()
	asignarTexto()
	asignarCantidad(root)
	crear(root)
end

function celdas( )

	local lineasH=11
	local posX=0
	local posY=0
	fill(100)
	for indice=1, lineasH, 1 do
		line(100+posX,150,100+posX,350)
		line(100,150+posY,500,150+posY)
		posX=posX+40
		posY=posY+20
	end
end

function asignarTexto(  )
	fill(3,169,244)
	local posNueva=165
	text("90 - 99",50,posNueva)
	text("80 - 89",50,posNueva+20)
	text("70 - 79",50,posNueva+40)
	text("60 - 69",50,posNueva+60)
	text("50 - 59",50,posNueva+80)
	text("40 - 49",50,posNueva+100)
	text("30 - 39",50,posNueva+120)
	text("20 - 29",50,posNueva+140)
	text("10 - 19",50,posNueva+160)
	text("0 - 9",50,posNueva+180)

	fill(76,175,80)
	local posNuevaY=90
	text("10.0",posNuevaY,365)
	text("8.0",posNuevaY+40,365)
	text("6.0",posNuevaY+80,365)
	text("4.0",posNuevaY+120,365)
	text("2.0",posNuevaY+160,365)
	text("0.0",posNuevaY+200,365)
	text("2.0",posNuevaY+240,365)
	text("4.0",posNuevaY+280,365)
	text("6.0",posNuevaY+320,365)
	text("8.0",posNuevaY+360,365)
	text("10.0",posNuevaY+400,365)
end

function asignarCantidad(node)
	text(node.label,230,120)
	local tamanno=#node.children[1].children
	local posicion=0

	for indice=1,tamanno, 1 do
		fill(9,140,239)
		rect(node.children[1].children[indice].x1,330+posicion,node.children[1].children[indice].y1,20)
		fill(210,14,192)
		rect(node.children[2].children[indice].x1,330+posicion,node.children[2].children[indice].y1,20)
		posicion=posicion-20
	end
	
end

function crear( node)
	if (button) then
		mostrarInfo(node)
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
		text("Cambiar",x+15,y+40)
  		
	else
		rect(x,y,w,h)
  		fill(255)
		text("Datos",x+8,y+30)
	end
end

function mostrarInfo(node )
	fill(255)
	text(node.children[2].label,180,140)
	text(node.children[1].label,350,140)
	text("Hay una poblacion de:",250,410)
	text(node.children[2].label,200,440)
	text(node.children[1].label,330,440)
	if mouseY>150 and mouseY<170 then
		if mouseX>100 and mouseX<500 then
			text(node.children[2].children[10].label,250,165)
			text(node.children[1].children[10].label,320,165)
			text(node.children[2].children[10].label,270,440)
			text(node.children[1].children[10].label,400,440)
			text("entre 90 y 99 annos",250,470)
		end
	elseif mouseY>170 and mouseY<190 then
		if mouseX>100 and mouseX<500 then
			text(node.children[2].children[9].label,250,185)
			text(node.children[1].children[9].label,320,185)
			text(node.children[2].children[9].label,270,440)
			text(node.children[1].children[9].label,400,440)
			text("entre 80 y 89 annos",250,470)
		end
	elseif mouseY>190 and mouseY<210 then
		if mouseX>100 and mouseX<500 then
			text(node.children[2].children[8].label,250,205)
			text(node.children[1].children[8].label,320,205)
			text(node.children[2].children[8].label,270,440)
			text(node.children[1].children[8].label,400,440)
			text("entre 70 y 79 annos",250,470)
		end
	elseif mouseY>210 and mouseY<230 then
		if mouseX>100 and mouseX<500 then
			text(node.children[2].children[7].label,250,225)
			text(node.children[1].children[7].label,320,225)
			text(node.children[2].children[7].label,270,440)
			text(node.children[1].children[7].label,400,440)
			text("entre 60 y 69 annos",250,470)
		end
	elseif mouseY>230 and mouseY<250 then
		if mouseX>100 and mouseX<500 then
			text(node.children[2].children[6].label,250,245)
			text(node.children[1].children[6].label,320,245)
			text(node.children[2].children[6].label,270,440)
			text(node.children[1].children[6].label,400,440)
			text("entre 50 y 59 annos",250,470)
		end
	elseif mouseY>250 and mouseY<270 then
		if mouseX>100 and mouseX<500 then
			text(node.children[2].children[5].label,250,265)
			text(node.children[1].children[5].label,320,265)
			text(node.children[2].children[5].label,270,440)
			text(node.children[1].children[5].label,400,440)
			text("entre 40 y 49 annos",250,470)
		end
    elseif mouseY>270 and mouseY<290 then
		if mouseX>100 and mouseX<500 then
			text(node.children[2].children[4].label,250,285)
			text(node.children[1].children[4].label,320,285)
			text(node.children[2].children[4].label,270,440)
			text(node.children[1].children[4].label,400,440)
			text("entre 30 y 39 annos",250,470)
		end
	elseif mouseY>290 and mouseY<310 then
		if mouseX>100 and mouseX<500 then
			text(node.children[2].children[3].label,250,305)
			text(node.children[1].children[3].label,320,305)
			text(node.children[2].children[3].label,270,440)
			text(node.children[1].children[3].label,400,440)
			text("entre 20 y 29 annos",250,470)
		end
	elseif mouseY>310 and mouseY<330 then
		if mouseX>100 and mouseX<500 then
			text(node.children[2].children[2].label,250,325)
			text(node.children[1].children[2].label,320,325)
			text(node.children[2].children[2].label,270,440)
			text(node.children[1].children[2].label,400,440)
			text("entre 10 y 19 annos",250,470)
		end
	elseif mouseY>330 and mouseY<350 then
		if mouseX>100 and mouseX<500 then
			text(node.children[2].children[1].label,250,345)
			text(node.children[1].children[1].label,320,345)
			text(node.children[2].children[1].label,270,440)
			text(node.children[1].children[1].label,400,440)
			text("entre 0 y 9 annos",250,470)
		end

	end
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
