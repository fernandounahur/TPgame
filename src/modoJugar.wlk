import wollok.game.*

import guerrero.*
import extras.*


object juego {
	var property personajeActual = guerrero
	
	method empezar(){
		game.addVisual(guerrero)
	    game.addVisual(antagonista)
	    game.addVisual(contadorX)
	    game.addVisual(contadorXX)
	   
	    
	    game.onCollideDo(guerrero,{algo=> algo.teAgarroGuerrero()})
	    game.onCollideDo(antagonista,{algo=> algo.teChocoEspada()})
		  
		keyboard.left().onPressDo({
		guerrero.image("guerreraIzq.png")
			if(personajeActual.position().x() != 0){
				personajeActual.position(personajeActual.position().left(1))
			}
			guerrero.sonidoMovimiento()
			 
		})  	
		keyboard.right().onPressDo({
		   guerrero.image("guerrera.png")
			if(personajeActual.position().x() != game.width() - 1){
				personajeActual.position(personajeActual.position().right(1))
			}
		guerrero.sonidoMovimiento()
			
		})
		keyboard.space().onPressDo({guerrero.saltar()})
		
		keyboard.a().onPressDo({guerrero.atacar()	
			
		})
	
	    keyboard.enter().onPressDo({	    
	   	game.onTick(3000,"atacar a guerrero",{antagonista.atacarAGuerrero()})
	    game.removeTickEvent("bola")
	    
	   	
	   	 self.dragonAtaca()
	        
	     })
	    
	     
	     
        }	
		method dragonAtaca() {
		game.onTick(2000,"atacar a guerrero",{antagonista.atacarAGuerrero()}) 
		 
	    }
	    method terminar(){
			game.clear()
		    game.addVisual(fondoGameOver)
		    if(guerrero.vidas()==0)
        		fondoGameOver.agregar()
			if (antagonista.vidas()==0 and guerrero.vidas()>0)fondoGameOver.eliminar()

				
	    }
        method reiniciar(){
           keyboard.q().onPressDo({})
       	 
       }
	
}		
	
		

  		
	
	


 

  
  
  

	


