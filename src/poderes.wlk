import wollok.game.*

import guerrero.*
import extras.*

class Poder {
	method teAgarroGuerrero(){}
	method teChocoEspada(){}
	method teChocoLaBola(){}
	method resetVidas(){}
	method sonidoMovimiento(){}
}

class Espadazo inherits Poder {
	var position
	
	method image() = "assets/slash.png"
	
	method position() = position
	
	method desplazarse(){
		game.onCollideDo(self,{algo=>algo.teChocoLaBola()})
		game.onTick(250,"atacar",{self.moverseDerecha()})
		
		
	}
	
    method moverseDerecha() {
		position = position.right(1)
		if(position.x() > game.width()){
			game.removeVisual(self)
		}
	
    }
    method sonidoDeCorte() {
  		game.sound("slash.mp3").play()
  	}
  	
	override method teChocoLaBola(){
		self.desaparecer()
	}
	method desaparecer() {
		if(game.hasVisual(self)){
			game.removeVisual(self)
		    
		}
		
	}
	override method teChocoEspada(){
		antagonista.perderVida()
		contadorXX.sumarPuntajeXX()
		antagonista.sonidoDeCorte()
		self.desaparecer()
	}

	
	
}
class BolaFuego inherits Poder{
	var position
	method image() = "assets/bola1.png"
	
	method position() = position
	
	method desplazarse(){
		game.onCollideDo(self,{algo=>algo.teChocoLaBola()})
		game.onTick(100,"bola",{self.moverseIzquierda()})
	}
	method moverseIzquierda() {
		position = position.left(1)
		if(position.x() > game.width()){
			game.removeTickEvent("bola")
			game.removeVisual(self)
		}
	}
	method sonidoDeCorte() {
  		game.sound("Fuegito.mp3").play()
  	}
	
	override method teAgarroGuerrero(){
		guerrero.perderVida()
		contadorX.sumarPuntajeX()
		self.desaparecer()	
	}
		method desaparecer() {
		if(game.hasVisual(self)){
			game.removeVisual(self)
		    
		}
		
	}
	

}