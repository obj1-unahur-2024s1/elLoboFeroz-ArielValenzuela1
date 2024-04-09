object feroz{
	var peso = 10
	var estaDisfrazado = false
	method saludable (){
		return peso.between(20,150)
	}
	method subirDePeso(pesoASubir){
		peso = peso + pesoASubir
	}
	method bajarDePeso(pesoABajar){
		peso = 0.max(peso-pesoABajar)
	}
	method sufrirCrisis (){
		peso = 10
	}
	method comerAlgo(algo){
		self.subirDePeso(algo.peso() * 0.1)
	}
	method correrHastaUnLugar(){
		peso = 0.max(peso-1)
	}
	method disfrazarseDe(personaje){
		estaDisfrazado = true
		personaje.sacarseElDisfraz()
	}
	method desarmarCazador(){
		cazador.perderArma()		
	}
	method soplar(casaDeMaterial,cantChanchitos){
		peso = 0.max( peso - casaDeMaterial.resistencia() - cantChanchitos * chanchito.peso())
	}
}

object caperucita{
	const peso = 60
	var nroDeManzanas = 6
	method peso(){
		return peso + (nroDeManzanas*0.02)
	}	
	method perderManzanas(nroManzanasPerdidas){
		nroDeManzanas = 0.max(nroDeManzanas- nroManzanasPerdidas)		
	}
}

object abuelita{
	const peso = 50
    var tieneUnDisfraz = true
    method sacarseElDisfraz(){
        tieneUnDisfraz = false
    }
    method peso(){
        return peso
    }
}

object cazador {
	const peso = 80
	var estaArmado = true
	method peso(){
		return peso + if(estaArmado)10 else 0 
	}
	method perderArma(){
		estaArmado = false
	}
	method provocarCrisis(){
		feroz.sufrirCrisis()
	}
}

/* Si se come al cazador de un solo bocado, comeria al cazador armado, por lo que ingiere 
90 unidades de peso, pero si lo ingiere luego de desarmarlo serian 80 unidades. Si el cazador 
* le provoca una crisis a feroz, le devuelve su peso a 10.
feroz.correrHastaUnLugar()
feroz.correrHastaUnLugar()
feroz.comerAlgo(abuelita)
feroz.disfrazarseDe(abuelita)
caperucita.perderManzanas(1)
feroz.comerAlgo(caperucita) "Feroz queda con un peso de 19.01 y está disfrazado"
* Luego si feroz se come al cazador armado, aumentaria su peso a 28.01
* en cambio si antes de comerlo lo desarma, quedaria con 27.01
* por el contrario si el cazador consigue provocar una crisis en feroz (cazador.provocarCrisis()) ,
* su peso quedaria en 10 nuevamente
*/

object chanchito {
	const peso = 30 
	method peso(){
		return peso
	}
	method agregarLadrillos(cantidad){
		casaDeLadrillos.agregarLadrillos(cantidad)
	}
}

object casaDePaja {
	method resistencia(){
		return 0
	}
}

object casaDeMadera {
	method resistencia(){
		return 5	
	}
}

object casaDeLadrillos {
	var cantLadrillos = 20
	method resistencia(){
		return 	2 * cantLadrillos
	}
	method agregarLadrillos(cantidad){
		cantLadrillos = cantLadrillos + cantidad
	}
}

/* Feros sube de peso 200 unidades por lo que queda con 210, y luego sopla la primer casa de los chanchitos, 
 * la casa de paja tiene 0 de resistencia y sumandole los 30 de peso del primer chanchito, a feroz le disminuye
 * esa cantidad, luego persigue a ese y va a derribar la casa de madera, por lo que se reduce
 * en 2 * 30 y 5 de resistencia de la casa. queda en 115.
 * Por ultimo suponemos una casa con 20 ladrillos y los 3 chanchitos dentro, Luego feroz sube de peso 50 unidades. 
 * Por lo que soplando la casa de ladrillos y los chanchitos podria derribarla. quedando con 35 unidades.   
 */