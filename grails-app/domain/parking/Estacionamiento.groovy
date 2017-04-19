package parking

import parking.vehiculo.Vehiculo

class Estacionamiento {
    
    Vehiculo vehiculo
    java.sql.Date fecha
    Date horaIngreso
    Date horaSalida
    Lugar lugar
    
    static constraints = {
    }
}
