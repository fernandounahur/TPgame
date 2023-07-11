import wollok.game.*
//import guerrero.*
import modoJugar.*
import extras.*


object menu {
	method cargarJuego() {
		
	//	if (game.hasVisual(fondoMenu)) game.removeVisual(fondoMenu)
	//	else (game.hasVisual(fondoGame)) game.removeVisual(fondoGame)
		game.addVisual(fondoMenuElegir)
		
		const fondoRuido = game.sound("ruidoNoche.mp3")
		const fondoCancion = game.sound("cancionMenu.mp3")
		
		fondoCancion.shouldLoop(true)
		fondoRuido.shouldLoop(true)
		
		fondoRuido.play()
		fondoCancion.play()
		
		keyboard.q().onPressDo {if (game.hasVisual(fondoMenuElegir)) 
			                        self.modoNormal() fondoCancion.stop()
		}
		
	}
	
	method modoNormal(){
		
		game.removeVisual(fondoMenuElegir)
		game.addVisual(fondoMenu)
		
		game.removeVisual(fondoMenuElegir)
		game.addVisual(fondoMenu)
		
		const rugido = game.sound("rugidoInicio.mp3")
		
		keyboard.enter().onPressDo {if (game.hasVisual(fondoMenu)) juego.empezar() rugido.play()}
	}
	
	
//	method resetearJuego() {
		
//		game.addVisual(fondoMenuElegir)		const fondoCancion = game.sound("cancionMenu.mp3")
		
//		fondoCancion.shouldLoop(true)
//		fondoCancion.play()
		
//		keyboard.enter().onPressDo {if (game.hasVisual(fondoMenuElegir)) self.modoNormal() fondoCancion.stop()}
//	}

}
