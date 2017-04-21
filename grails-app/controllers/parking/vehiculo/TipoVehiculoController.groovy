package parking.vehiculo



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TipoVehiculoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond TipoVehiculo.list(params), model:[tipoVehiculoInstanceCount: TipoVehiculo.count()]
    }

    def show(TipoVehiculo tipoVehiculoInstance) {
        respond tipoVehiculoInstance
    }

    def create() {
        respond new TipoVehiculo(params)
    }

    @Transactional
    def save(TipoVehiculo tipoVehiculoInstance) {
        if (tipoVehiculoInstance == null) {
            notFound()
            return
        }

        if (tipoVehiculoInstance.hasErrors()) {
            respond tipoVehiculoInstance.errors, view:'create'
            return
        }

        tipoVehiculoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'tipoVehiculo.label', default: 'TipoVehiculo'), tipoVehiculoInstance.id])
                redirect tipoVehiculoInstance
            }
            '*' { respond tipoVehiculoInstance, [status: CREATED] }
        }
    }

    def edit(TipoVehiculo tipoVehiculoInstance) {
        respond tipoVehiculoInstance
    }

    @Transactional
    def update(TipoVehiculo tipoVehiculoInstance) {
        if (tipoVehiculoInstance == null) {
            notFound()
            return
        }

        if (tipoVehiculoInstance.hasErrors()) {
            respond tipoVehiculoInstance.errors, view:'edit'
            return
        }

        tipoVehiculoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'TipoVehiculo.label', default: 'TipoVehiculo'), tipoVehiculoInstance.id])
                redirect tipoVehiculoInstance
            }
            '*'{ respond tipoVehiculoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(TipoVehiculo tipoVehiculoInstance) {

        if (tipoVehiculoInstance == null) {
            notFound()
            return
        }

        tipoVehiculoInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'TipoVehiculo.label', default: 'TipoVehiculo'), tipoVehiculoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoVehiculo.label', default: 'TipoVehiculo'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
