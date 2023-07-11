import wollok.game.*

object fondoGameOver {
	
	var property image = "assets/fondoDeMenu3.png"
	var property position = game.origin()
	method agregar(){
		game.addVisualIn(usarGameOver,game.at(6,8))
		
	}
	method eliminar(){

		game.addVisualIn(usarHasGanado,game.at(6,8))
			
	}
	
}

object fondoMenuElegir {
	var property image = "assets/fondoDeMenu3.png"
	var property position = game.origin()
	method agregar(){
		game.addVisualIn(matarAlDragon,game.at(6,10))
		game.addVisualIn(instrucciones,game.at(6,9))
		game.addVisualIn(enter,game.at(6,8))
		game.addVisualIn(direcciones,game.at(6,7))
		game.addVisualIn(moverSaltar,game.at(6,6))
		game.addVisualIn(moverAtacar,game.at(6,5))
		game.addVisualIn(usarReiniciar,game.at(6,4))
			
	}
	method eliminar(){
		game.removeVisual(matarAlDragon)
		game.removeVisual(instrucciones)
		game.removeVisual(enter)
		game.removeVisual(direcciones)
		game.removeVisual(moverSaltar)
		game.removeVisual(moverAtacar)
		game.removeVisual(usarReiniciar)
	}
}


class Textos{
	method text()
	method textColor() = "43ff64d9"
	method clase() = "texto"
}
object versus inherits Textos{ override method text() = "VERSUS"}
object guerreroVida inherits Textos{ override method text() = "GUERRERO VIDAS"}
object dragonVida inherits Textos{ override method text() = "DRAGON VIDAS"}

object matarAlDragon inherits Textos{ override method text() = "¡¡¡MATAR AL DRAGON!!!"}
object enter inherits Textos{ override method text() = "EMPEZAR : [[ENTER]]"}
object direcciones inherits Textos{ override method text() = "DIRECCIONES : [[<=]] [[=>]]"}
object instrucciones inherits Textos{ override method text() = "** INSTRUCCIONES **"}
object moverSaltar inherits Textos{ override method text() = " SALTAR : [[ SPACE ]]"}
object moverAtacar inherits Textos{ override method text() = " ATACAR : [[  A  ]]"}
object usarReiniciar inherits Textos{ override method text() = " REINICIAR : [[  Q  ]]"}
object usarGameOver inherits Textos{ override method text() = " GAME OVER "}
object usarHasGanado inherits Textos{ override method text() = " HAS GANADO ..!!!"}



object textos {
	method agregar(){
		game.addVisualIn(versus,game.at(6,13))
		game.addVisualIn(guerreroVida,game.at(2,13))
		game.addVisualIn(dragonVida,game.at(10,13))
		
	}
}
 class Numero {
	const img
	method image() = img
}

	const num0 = new Numero(img="assets/Numero0.png")
	const num1 = new Numero(img="assets/Numero1.png")
	const num2 = new Numero(img="assets/Numero2.png")
	const num3 = new Numero(img="assets/Numero3.png")
	const num4 = new Numero(img="assets/Numero4.png")
	const num5 = new Numero(img="assets/Numero5.png")
	const num6 = new Numero(img="assets/Numero6.png")
	const num7 = new Numero(img="assets/Numero7.png")
	const num8 = new Numero(img="assets/Numero8.png")
	const num9 = new Numero(img="assets/Numero9.png")
	
object contadorX {
	var property indiceX = 9
		
	method puntajeX(ind) = [num0,num1,num2,num3,num4,num5,num6,num7,num8,num9].get(ind)
	
	method position()= game.at(4, 14)
	
	method sumarPuntajeX() {
		if (indiceX == 0) {
			indiceX = 9

		} else indiceX--
	}
	method image() = self.puntajeX(indiceX).image()
	
	method reiniciarContador() {
		indiceX = 9

	}
}

object contadorXX {
	var indiceXX = 9
	method position() = game.at(9, 14)
	
	method sumarPuntajeXX() {
		if (indiceXX == 0) {
     		indiceXX = 9
		} else indiceXX--
    }
	method puntajeXX(ind) = [num0,num1,num2,num3,num4,num5,num6,num7,num8,num9].get(ind)
	
	method image() = self.puntajeXX(indiceXX).image()
	method reiniciarContador() {
		indiceXX = 9
	}	
	
}	

