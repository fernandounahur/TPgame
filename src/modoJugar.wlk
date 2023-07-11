import wollok.game.*
import guerrero.*
//import extras.*
//import menu.*

object juego {
	var property personajeActual = guerrero
	
	method empezar(){
		game.addVisual(guerrero)
	    
	    game.onCollideDo(guerrero,{algo=> algo.teAgarroMario()})
		  
		keyboard.left().onPressDo({
		guerrero.image("guerreraIzq.png")
			if(personajeActual.position().x() != 0){
				personajeActual.position(personajeActual.position().left(1))
			}
			 
		})  	
		keyboard.right().onPressDo({
		   guerrero.image("guerrera.png")
			if(personajeActual.position().x() != game.width() - 1){
				personajeActual.position(personajeActual.position().right(1))
			}
			
		})
		keyboard.space().onPressDo({guerrero.saltar()})
		keyboard.a().onPressDo({guerrero.atacar()})
		
	    self.dragonAtaca()
	  
	     keyboard.enter().onPressDo({
			game.removeTickEvent("aparece invasor")
			
		})
//		game.addVisual(fondoGame)
		
//		const fondo = game.sound("ruidoDeFondo.mp3")

//	 	fondo.shouldLoop(true)
//		fondo.play()
		
//		if (game.hasVisual(fondoMenu)) game.removeVisual(fondoMenu)
//		if (game.hasVisual(fondoTip)) game.removeVisual(fondoTip)
		
		
	}	
		method dragonAtaca() {
		game.onTick(1000,"aparece invasor",{antagonista.aparecer()}) 
		 
	}
	    method terminar(){
			game.clear()
			game.addVisual(guerrero)
			game.say(guerrero,"PERDI")	
	}
  		
	
	
		
//		method gameOver() {
		
//		if (game.hasVisual(fondoGame)) game.removeVisual(fondoGame)
//		if (game.hasVisual(guerrero)) game.removeVisual(guerrero)
//		if (!game.hasVisual(fondoGameOver)) game.addVisual(fondoGameOver)
		
	//	contadorX.reiniciarContador()
		
//		keyboard.r().onPressDo {if (game.hasVisual(fondoGameOver)) {
//									game.clear()
//								 	self.restart()}}
//	}
	
//	   method winGame() {
//		 game.clear()
		
//		game.addVisual(fondoWinGame1)
		
//		const cancionGanar = game.sound("cancionGanar.mp3") 
//		cancionGanar.shouldLoop(true)

		
 // 	   game.schedule(1500, {game.addVisual(fondoWinGame2)})
//		game.schedule(1500, {cancionGanar.play()})
		
//		contadorX.reiniciarContador()
		
//		keyboard.r().onPressDo {if (game.hasVisual(fondoWinGame2)) {
//									game.clear()
//							 	self.restart()
//								 	cancionGanar.stop()}
//	}
//	}
//	  method restart() {
		
//	}

 
}
  
  
  

 //method cargar (){
//		(0..19).forEach{x=>objetos.add(new Invisible(position = game.at(x,0)))}
//		(0..19).forEach{x=>objetos.add(new Invisible(position = game.at(x,11)))}
//		(0..19).forEach{x=>objetos.add(new Invisible(position = game.at(x,11)))}
//		(0..19).forEach{x=>objetos.add(new Invisible(position = game.at(x,11)))}
		
	//	objetos.add(new Caja(position = game.at(0,9)))
	//    objetos.add(new Caja(position = game.at(0,9)))
	//    objetos.add(new Caja(position = game.at(0,9)))
		
	//	rivales.add(new Fuego(position = game.at(12,9)))
		
//		objetos.forEach{x => game.addVisual(x)}
//	    rivales.forEach{x => game.addVisual(x)}
///		game.addVisual("fueg.jpg")
//	}
//}

	


