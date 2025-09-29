object luke{
    var vehiculo = alambiqueVeloz
    var cantLugaresQueVisito = 0
    var recuerdo = ningunLugar.recuerdo()
    method viajarA(lugar){  
        if(lugar.puedeLlegar(vehiculo)){
            cantLugaresQueVisito = cantLugaresQueVisito + 1
            recuerdo = lugar.recuerdo()
            vehiculo.desgaste()
        }
    }
    method recuerdo() = recuerdo
    method cantViajes() = cantLugaresQueVisito
    method cambiarVehiculo(nuevoVehiculo){
        vehiculo = nuevoVehiculo
    }
        
}

object pierreYPatan{
    var vehiculo = chatarra
    var cantLugaresQueVisito = 0
    var recuerdo = ningunLugar.recuerdo()
    method viajarA(lugar){  
        if(lugar.puedeLlegar(vehiculo)){
            cantLugaresQueVisito = cantLugaresQueVisito + 1
            recuerdo = lugar.recuerdo()
            vehiculo.desgaste()
        }
    }
    method recuerdo() = recuerdo
    method cantViajes() = cantLugaresQueVisito
    method cambiarVehiculo(nuevoVehiculo){
        vehiculo = nuevoVehiculo
    }
}


object profesor{
    var vehiculo = convertible
    var cantLugaresQueVisito = 0
    var recuerdo = ningunLugar.recuerdo()
    method viajarA(lugar){  
        if(lugar.puedeLlegar(vehiculo)){
            cantLugaresQueVisito = cantLugaresQueVisito + 1
            recuerdo = lugar.recuerdo()
            vehiculo.desgaste()
        }
    }
    method recuerdo() = recuerdo
    method cantViajes() = cantLugaresQueVisito
    method cambiarVehiculo(nuevoVehiculo){
        vehiculo = nuevoVehiculo
    }

}



//LUGARES
object paris{
    method puedeLlegar(vehiculo) = vehiculo.puedeFuncionar()
    method recuerdo() = "llavero Torre Eiffel"
}

object buenosAires{
    method puedeLlegar(vehiculo) = vehiculo.rapido()
    method recuerdo() = "mate"
}




object bagdad{
    var recuerdo ="bidon petroleo"
    method recuerdo() = recuerdo
    method recuerdoNuevo(recuerdoNuevo) {recuerdo = recuerdoNuevo}
    method puedeLlegar(vehiculo) = true
}

object lasVegas{
    var property homenajeA = paris
    method recuerdo() = homenajeA.recuerdo()
    method puedeLlegar(vehiculo) = homenajeA.puedeLlegar(vehiculo)
}

object ningunLugar{
    method recuerdo() = "ninguno"
}


//VEHICULOS
object alambiqueVeloz{
    var combustible = 20
    const consumoPorViaje = 10
    method puedeFuncionar() = combustible >= consumoPorViaje
    method desgaste() {combustible = combustible - consumoPorViaje}
    method rapido() = true
}


object chatarra {
    var cañones = 10
    var municiones = "ACME"
    method puedeFuncionar() = municiones == "ACME" and cañones.between(6,12)
    method rapido() = municiones.size() < cañones
    method desgaste(){
        cañones = (cañones / 2).roundUp(0) //redondea para arriba (0 decimales)
        if (cañones < 5 )
          municiones = municiones + " Obsoleto"
    }
    method patenteValida() = municiones.take(4) == "ACME" 
    method cañones() = cañones

}

object antigualla{
    var cantGangsters = gangters.size()
    const gangters=#{"juan", "pepe", "luis", "carlos", "ana", "maria", "pedro"}
    method subirGangster(nombre){gangters.add(nombre)}
    method bajarGangster(nombre){gangters.remove(nombre)}

    method puedeFuncionar() = cantGangsters.even()
    method desgaste() {cantGangsters = cantGangsters - 1}
    method rapido() = cantGangsters >6
    method patenteValida() = chatarra.rapido() 


    method velocidad() = gangters.sum({gangster => gangster.size()}) //suma todas las letras de los nombres de los gangsters

}


object convertible{
    const vehiculos=[alambiqueVeloz, chatarra, antigualla]
    var convertido = alambiqueVeloz
    method agregarVehiculo(nuevoVehiculo){
        if(not vehiculos.contains(nuevoVehiculo)){
            vehiculos.add(nuevoVehiculo)
        }
    }
    method quitarVehiculo(vehiculoAEliminar){
        if(vehiculos.contains(vehiculoAEliminar)){
            vehiculos.remove(vehiculoAEliminar)
            if(convertido == vehiculoAEliminar){
                convertido = vehiculos.any()
            }
        }
    }


    method convertir(){
        const posicionActual = vehiculos.indexOf(convertido)
        if(posicionActual == vehiculos.size() - 1){
            convertido = vehiculos.get(0)
        } else {
            convertido = vehiculos.get(posicionActual + 1)
        }
    }



    
    method puedeFuncionar() = convertido.puedeFuncionar()
    method desgaste() = convertido.desgaste()
    method rapido() = convertido.rapido()
    method cambiarA(nuevoVehiculo){convertido = nuevoVehiculo}
    method patenteValida() = convertido.patenteValida()
}
