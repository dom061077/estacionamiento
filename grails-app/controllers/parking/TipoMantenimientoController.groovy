package parking



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TipoMantenimientoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond TipoMantenimiento.list(params), model:[tipoMantenimientoInstanceCount: TipoMantenimiento.count()]
    }

    def show(TipoMantenimiento tipoMantenimientoInstance) {
        respond tipoMantenimientoInstance
    }

    def create() {
        respond new TipoMantenimiento(params)
    }

    @Transactional
    def save(TipoMantenimiento tipoMantenimientoInstance) {
        if (tipoMantenimientoInstance == null) {
            notFound()
            return
        }

        if (tipoMantenimientoInstance.hasErrors()) {
            respond tipoMantenimientoInstance.errors, view:'create'
            return
        }

        tipoMantenimientoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'tipoMantenimiento.label', default: 'TipoMantenimiento'), tipoMantenimientoInstance.id])
                redirect tipoMantenimientoInstance
            }
            '*' { respond tipoMantenimientoInstance, [status: CREATED] }
        }
    }

    def edit(TipoMantenimiento tipoMantenimientoInstance) {
        respond tipoMantenimientoInstance
    }

    @Transactional
    def update(TipoMantenimiento tipoMantenimientoInstance) {
        if (tipoMantenimientoInstance == null) {
            notFound()
            return
        }

        if (tipoMantenimientoInstance.hasErrors()) {
            respond tipoMantenimientoInstance.errors, view:'edit'
            return
        }

        tipoMantenimientoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'TipoMantenimiento.label', default: 'TipoMantenimiento'), tipoMantenimientoInstance.id])
                redirect tipoMantenimientoInstance
            }
            '*'{ respond tipoMantenimientoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(TipoMantenimiento tipoMantenimientoInstance) {

        if (tipoMantenimientoInstance == null) {
            notFound()
            return
        }

        tipoMantenimientoInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'TipoMantenimiento.label', default: 'TipoMantenimiento'), tipoMantenimientoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoMantenimiento.label', default: 'TipoMantenimiento'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
