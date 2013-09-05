package grails.plugin.jesqueweb

class JesqueWorkersController extends JesqueController {

    def index = {
        def model = [:]
        def hostMap = workerInfoDao.workerHostMap
        def viewName
        if (hostMap.size() == 1) {
            viewName = 'singleHost'
            model.workers = hostMap.values().asList()[0]
        } else {
            viewName = 'multipleHosts'
            model.hostMap = hostMap
            model.totalWorkerCount = hostMap.values().flatten().size()
        }

        render view:viewName, model:model
    }

    def detail = {
        def model = [:]
        def workerName = params.id
        def workerInfo = workerInfoDao.getWorker(workerName)
        def hostMap = workerInfoDao.workerHostMap
        def viewName

        if( workerInfo ) {
            viewName = 'detail'
            model.activeSubTab = workerInfo.host
            model.worker = workerInfo
        } else if(workerName == 'all') {
            viewName = 'singleHost'
            model.workers = hostMap.values().asList().flatten()
        } else if(hostMap[workerName]) {
            viewName = 'singleHost'
            model.workers = hostMap[workerName]
        } else {
            redirect action:index
        }
        model.activeSubTabs = hostMap.keySet()
        model.subTabs = hostMap.size() > 1 ? hostMap.keySet() : null

        render view:viewName, model:model
    }

    def remove = {
        def workerName = params.id

        def workerInfo = workerInfoDao.getWorker(workerName)

        if( workerInfo )
            workerInfoDao.removeWorker(workerName)

        if( workerInfoDao.workerHostMap[workerInfo.host] )
            redirect action:detail, id:workerInfo.host
        else
            redirect action:index
    }
}
