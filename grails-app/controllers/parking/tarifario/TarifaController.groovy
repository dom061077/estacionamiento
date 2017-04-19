package parking.tarifario



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TarifaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Tarifa.list(params), model:[tarifaInstanceCount: Tarifa.count()]
    }

    def show(Tarifa tarifaInstance) {
        respond tarifaInstance
    }

    def create() {
        respond new Tarifa(params)
    }

    @Transactional
    def save(Tarifa tarifaInstance) {
        if (tarifaInstance == null) {
            notFound()
            return
        }

        if (tarifaInstance.hasErrors()) {
            respond tarifaInstance.errors, view:'create'
            return
        }

        tarifaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'tarifa.label', default: 'Tarifa'), tarifaInstance.id])
                redirect tarifaInstance
            }
            '*' { respond tarifaInstance, [status: CREATED] }
        }
    }

    def edit(Tarifa tarifaInstance) {
        respond tarifaInstance
    }

    @Transactional
    def update(Tarifa tarifaInstance) {
        if (tarifaInstance == null) {
            notFound()
            return
        }

        if (tarifaInstance.hasErrors()) {
            respond tarifaInstance.errors, view:'edit'
            return
        }

        tarifaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Tarifa.label', default: 'Tarifa'), tarifaInstance.id])
                redirect tarifaInstance
            }
            '*'{ respond tarifaInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Tarifa tarifaInstance) {

        if (tarifaInstance == null) {
            notFound()
            return
        }

        tarifaInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Tarifa.label', default: 'Tarifa'), tarifaInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'tarifa.label', default: 'Tarifa'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
