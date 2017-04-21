package parking.vehiculo



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class VehiculoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Vehiculo.list(params), model:[vehiculoInstanceCount: Vehiculo.count()]
    }

    def show(Vehiculo vehiculoInstance) {
        respond vehiculoInstance
    }

    def create() {
        respond new Vehiculo(params)
    }

    @Transactional
    def save(Vehiculo vehiculoInstance) {
        if (vehiculoInstance == null) {
            notFound()
            return
        }

        if (vehiculoInstance.hasErrors()) {
            respond vehiculoInstance.errors, view:'create'
            return
        }

        vehiculoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'vehiculo.label', default: 'Vehiculo'), vehiculoInstance.id])
                redirect vehiculoInstance
            }
            '*' { respond vehiculoInstance, [status: CREATED] }
        }
    }

    def edit(Vehiculo vehiculoInstance) {
        respond vehiculoInstance
    }

    @Transactional
    def update(Vehiculo vehiculoInstance) {
        if (vehiculoInstance == null) {
            notFound()
            return
        }

        if (vehiculoInstance.hasErrors()) {
            respond vehiculoInstance.errors, view:'edit'
            return
        }

        vehiculoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Vehiculo.label', default: 'Vehiculo'), vehiculoInstance.id])
                redirect vehiculoInstance
            }
            '*'{ respond vehiculoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Vehiculo vehiculoInstance) {

        if (vehiculoInstance == null) {
            notFound()
            return
        }

        vehiculoInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Vehiculo.label', default: 'Vehiculo'), vehiculoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'vehiculo.label', default: 'Vehiculo'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
