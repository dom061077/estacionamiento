package parking

class Mantenimiento {
    TipoMantenimiento tipo
    float subTotal
    
    Estacionamiento estacionamiento
    static belongsTo = [estacionamiento:Estacionamiento]
    static constraints = {
    }
}
