package grails.plugin.jesqueweb

class JesqueWorkingController extends JesqueController {

    def index() {
        def model = [:]

        model.working = jesqueWorkerInfoService.activeWorkers
        model.totalWorkerCount = jesqueWorkerInfoService.workerCount

        model
    }

    def list() {
        jsonRender([workers: jesqueWorkerInfoService.activeWorkers, total: jesqueWorkerInfoService.workerCount])
    }

}
