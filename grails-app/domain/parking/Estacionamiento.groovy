package parking

import parking.vehiculo.Vehiculo

class Estacionamiento {
    
    Vehiculo vehiculo
    java.sql.Date fecha = new java.sql.Date((new Date()).getTime())
    Date horaIngreso
    Date horaSalida
    Lugar lugar
    boolean confirmado
    
    
    static hasMany = [mantenimientos: Mantenimiento]
    static constraints = {
    }
}
