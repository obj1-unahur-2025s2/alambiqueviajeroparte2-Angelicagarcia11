import elAlambiqueViajero.*
object carrera{
    const participantes = #{}
    const rechazados = #{}
    const todos = #{participantes, rechazados}

    method participantesInscriptos() = participantes
    method participantesRechazados() = rechazados 


   method inscribirA(aspirante){
        if(self.evaluarA(aspirante)){
            self.aceptarA(aspirante)
        } else{
            self.rechazarA(aspirante)
        }
    }

    method evaluarA(aspirante) = aspirante.viajarA(carrera.ciudadCarrera) 

    method aceptarA(aspirante){participantes.add(aspirante)}
    method rechazarA(aspirante){rechazados.add(aspirante)}


   

    method reevaluarA(aspirante){
        if(self.evaluarA(aspirante)){
            participantes.add(aspirante)
            } else{
            rechazados.add(aspirante)
        }
    }

    method reevaluarTodos(){
        rechazados.clear()
        participantes.clear()
        todos.forEach({aspirante => self.reevaluarA(aspirante)})
    }

    var ciudadCarrera = ningunLugar
    method ciudadCarrera() = ciudadCarrera

    method cambiarCiudadCarrera(nuevaCiudad){
        ciudadCarrera = nuevaCiudad
    }

}





