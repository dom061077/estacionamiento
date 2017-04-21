package parking



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class EstacionamientoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Estacionamiento.list(params), model:[estacionamientoInstanceCount: Estacionamiento.count()]
    }

    def show(Estacionamiento estacionamientoInstance) {
        respond estacionamientoInstance
    }

    def create() {
        respond new Estacionamiento(params)
    }

    @Transactional
    def save(Estacionamiento estacionamientoInstance) {
        if (estacionamientoInstance == null) {
            notFound()
            return
        }

        if (estacionamientoInstance.hasErrors()) {
            respond estacionamientoInstance.errors, view:'create'
            return
        }

        estacionamientoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'estacionamiento.label', default: 'Estacionamiento'), estacionamientoInstance.id])
                redirect estacionamientoInstance
            }
            '*' { respond estacionamientoInstance, [status: CREATED] }
        }
    }

    def edit(Estacionamiento estacionamientoInstance) {
        respond estacionamientoInstance
    }

    @Transactional
    def update(Estacionamiento estacionamientoInstance) {
        if (estacionamientoInstance == null) {
            notFound()
            return
        }

        if (estacionamientoInstance.hasErrors()) {
            respond estacionamientoInstance.errors, view:'edit'
            return
        }

        estacionamientoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Estacionamiento.label', default: 'Estacionamiento'), estacionamientoInstance.id])
                redirect estacionamientoInstance
            }
            '*'{ respond estacionamientoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Estacionamiento estacionamientoInstance) {

        if (estacionamientoInstance == null) {
            notFound()
            return
        }

        estacionamientoInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Estacionamiento.label', default: 'Estacionamiento'), estacionamientoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'estacionamiento.label', default: 'Estacionamiento'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
