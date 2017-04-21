package parking



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class MantenimientoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Mantenimiento.list(params), model:[mantenimientoInstanceCount: Mantenimiento.count()]
    }

    def show(Mantenimiento mantenimientoInstance) {
        respond mantenimientoInstance
    }

    def create() {
        respond new Mantenimiento(params)
    }

    @Transactional
    def save(Mantenimiento mantenimientoInstance) {
        if (mantenimientoInstance == null) {
            notFound()
            return
        }

        if (mantenimientoInstance.hasErrors()) {
            respond mantenimientoInstance.errors, view:'create'
            return
        }

        mantenimientoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'mantenimiento.label', default: 'Mantenimiento'), mantenimientoInstance.id])
                redirect mantenimientoInstance
            }
            '*' { respond mantenimientoInstance, [status: CREATED] }
        }
    }

    def edit(Mantenimiento mantenimientoInstance) {
        respond mantenimientoInstance
    }

    @Transactional
    def update(Mantenimiento mantenimientoInstance) {
        if (mantenimientoInstance == null) {
            notFound()
            return
        }

        if (mantenimientoInstance.hasErrors()) {
            respond mantenimientoInstance.errors, view:'edit'
            return
        }

        mantenimientoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Mantenimiento.label', default: 'Mantenimiento'), mantenimientoInstance.id])
                redirect mantenimientoInstance
            }
            '*'{ respond mantenimientoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Mantenimiento mantenimientoInstance) {

        if (mantenimientoInstance == null) {
            notFound()
            return
        }

        mantenimientoInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Mantenimiento.label', default: 'Mantenimiento'), mantenimientoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'mantenimiento.label', default: 'Mantenimiento'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
