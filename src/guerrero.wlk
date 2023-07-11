import wollok.game.*
import modoJugar.*


object guerrero {
	var property image = "guerrera.png"
	
	var property position = game.at(2,2)	
	var vidas =10
   
    
	method vidas() = vidas
	
	method perderVida() {
		vidas -=1
		if(vidas == 0){
			juego.terminar()
		}
	}
	method teChocoLaBola(){
		self.perderVida()
	    self.volverAlInicio()
	} 
 	method atacar() {
  		const corte = new Espadazo(position = position.right(1))
  		corte.sonidoDeCorte()  		
		game.addVisual(corte)
		corte.desplazarse()
		
  	} 	
	method subir(){ position = position.up(2)}
	method caer(){position = position.down(2)} 
	
	method saltar(){
		self.subir()
		game.schedule(500,{self.caer()})
	}
	
	
	method volverAlInicio() {
		position = game.at(2, 2)
	}
	

}
class Espadazo {
	var position
	
	method image() = "slash.png"
	
	method position() = position
	
	method desplazarse(){
		game.onCollideDo(self,{algo=>algo.teChocoLaBola()})
		game.onTick(250,"bola",{self.moverseDerecha()})
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
	method teChocoLaBola(){
		self.desaparecer()
	}
	method desaparecer() {
		if(game.hasVisual(self)){
			game.removeVisual(self)
		    
		}
		
	}
	method teAgarroMario(){}
	
}

  	
 

object antagonista {
	var property image = "drago.png"
	var property position = game.at(12, 2)
    var vidas = 10
    
    method vidas()=vidas
    
    method dispara(){
		const bola = new BolaFuego(position = position.left(1))
		game.addVisual(bola)
		bola.desplazarse()
		
	}
	method aparecer(){
		
		game.addVisual(self)
		self.atacarAGuerreo()
		
	}
	method atacarAGuerreo(){
		game.onTick(2000,"atacar",{self.dispara()})
	}

	method teChocoLaBola(){}
	
	method teAgarroMario() {
		guerrero.perderVida()
		game.say(guerrero,"Me quedan " + guerrero.vidas() + " vidas")

	}
		method desaparecer() {
		if(game.hasVisual(self)){
			game.removeVisual(self)
		    
		}
	}
	method perderVida() {
		vidas -=1
		if(vidas == 0){
			juego.terminar()
		}
	}
	
	method teChocoEspada(){
		self.perderVida()
		game.say(self,self.vidas())
	  
		
	}
	

}
class BolaFuego {
	var position
	method image() = "bola1.png"
	
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
	method teChocoLaBola(){}
	method teAgarroMario(){
		guerrero.perderVida()
		game.say(guerrero,"Me quedan " + guerrero.vidas() + " vidas")
		
	}
	method teChocoEspada(){
		
	}
}

	
//class Fuego {
//	var property position
//	var property image
	
//	method chocarCon(rival){
//		game.removeVisual(rival)
	//	guerrero.morir()
//	}
	
	
//	 method movete() {
//			const x = self.position().x() - 2
 //   		position = game.at(x,2) 
	//}
//}
 //class Moneda {
 //	var property valor
 //	var property position = game.center()
 	
 //	method image()="moneda"+ valor +".png"
 //	method chocarCon(rival){
 		
 //	}
 	
 //}
// class Numero {
//	const img
//	method image() = img
//}

//	const num0 = new Numero(img="Numero0.png")
//	const num1 = new Numero(img="Numero1.png")
//	const num2 = new Numero(img="Numero2.png")
//	const num3 = new Numero(img="Numero3.png")
//	const num4 = new Numero(img="Numero4.png")
///	const num5 = new Numero(img="Numero5.png")
//	const num6 = new Numero(img="Numero6.png")
//	const num7 = new Numero(img="Numero7.png")
//	const num8 = new Numero(img="Numero8.png")
//	const num9 = new Numero(img="Numero9.png")
	
//object contadorX {
//	var property indiceX = 0
		
//	method puntajeX(ind) = [num0,num1,num2,num3,num4,num5,num6,num7,num8,num9].get(ind)
	
//	method position()= game.at(7, 14)
	
//	method sumarPuntajeX() {
	//	if (indiceX == 9) {
	//		indiceX = 0
	//		contadorXX.sumarPuntajeXX()
	//	} else indiceX++
//	}
//	method image() = self.puntajeX(indiceX).image()
//	method reiniciarContador() {
//		indiceX = 0
//		contadorXX.reiniciarContador()
//	}
//}

//object contadorXX {
//	var indiceXX = 0
//	method position() = game.at(6, 14)
//	method sumarPuntajeXX() {
//		if (indiceXX == 9) {
	//		indiceXX = 0
	//	} else indiceXX++
	//}
//	method puntajeXX(ind) = [num0,num1,num2,num3,num4,num5,num6,num7,num8,num9].get(ind)
	
//	method image() = self.puntajeXX(indiceXX).image()
//	method reiniciarContador() {
//		indiceXX = 0
//	}	
	
//}	 