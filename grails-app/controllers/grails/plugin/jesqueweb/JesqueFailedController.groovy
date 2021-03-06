package grails.plugin.jesqueweb

class JesqueFailedController extends JesqueController {

    def index() {
        def offset = params.offset?.isInteger() ? params.offset.toInteger() : 0
        def max = params.max?.isInteger() ? params.max.toInteger() : 10
        def model = [:]

        model.offset = offset
        model.max = max
        model.fullFailureCount = jesqueFailureService.count
        model.total = model.fullFailureCount
        model.failures = jesqueFailureService.getFailures(offset, max)

        model
    }

    def count(){
        jsonRender([failed: jesqueFailureService.count])
    }

    def requeue(long id) {
        jesqueFailureService.requeue(id.toLong())

        redirect(action: 'index')
    }

    def remove(long id) {
        jesqueFailureService.remove(id.toLong())

        redirect(action: 'index')
    }

    def clear() {
        jesqueFailureService.clear()

        redirect(action: 'index')
    }

    def retryAll() {
        jesqueFailureService.count.times {
            jesqueFailureService.requeue(it)
        }

        redirect(action: 'index')
    }
}
