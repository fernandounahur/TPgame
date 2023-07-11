import wollok.game.*

import modoJugar.*
import poderes.*

object guerrero {
	var property image = "guerrera.png"
	
	var property position = game.at(2,2)	
	var vidas =9
   
    method resetVidas(){
    	vidas = 9
    }
	method vidas() = vidas
	
	method perderVida() {
		vidas -=1
		if(vidas == 0){
			0.max(vidas)
			juego.terminar()
		}
	}
	method teChocoLaBola(){
//		self.perderVida()
	    self.volverAlInicio()
	} 
 	method atacar() {
  		const corte = new Espadazo(position = position.right(1))
  		corte.sonidoDeCorte()  		
		game.addVisual(corte)
		corte.desplazarse()
		
  	}
  	method sonidoDeSalto(){
  		game.sound("dolor2.mp3").play()
  		
  	} 	
	method subir(){ position = position.up(2)
		self.sonidoDeSalto()
	}
	method caer(){position = position.down(2)} 
	
	method saltar(){
		self.subir()
		game.schedule(500,{self.caer()})
	}
	method sonidoMovimiento(){
		game.sound("soplido.mp3").play()
	}
	
	
	method volverAlInicio() {
		position = game.at(2, 2)
	}
    method teChocoEspada(){}
	method teAgarroGuerrero(){}
	

}


  	
 

object antagonista {
	var property image = "drago.png"
	var property position = game.at(12, 2)
    var vidas = 9
    
    method resetVidas(){
    	vidas = 9
    }
    method vidas()=vidas
    
    method atacar(){
		const bola = new BolaFuego(position = position.left(1))
		bola.sonidoDeCorte()
		game.addVisual(bola)
		bola.desplazarse()
		
	}
	
	method atacarAGuerrero(){
		game.onTick(2000,"atacar",{self.atacar()})
	    game.removeTickEvent("atacar a guerrero")	
		
	}

	
	
	method teAgarroGuerrero() {
		guerrero.perderVida()
		guerrero.volverAlInicio()
		
	}
		method desaparecer() {
		if(game.hasVisual(self)){
			game.removeVisual(self)
		    
		}
	}
	method perderVida() {
		vidas -=1
		if(vidas == 0){
			0.max(vidas)
			juego.terminar()
		}
	}
	 method sonidoDeCorte() {
	    game.sound("rugidoInicio.mp3").play()
	   
	}
	 method teChocoEspada(){}
	 method sonidoMovimiento(){}
	 method teChocoLaBola(){}

}



 