package grails.plugin.jesqueweb

import net.greghaines.jesque.meta.dao.FailureDAO

class JesqueFailureService {

    FailureDAO failureDao

    def requeue(long id) {
        failureDao.requeue(id)
    }

    def remove(long id){
        failureDao.remove(id)
    }

    def clear(){
        failureDao.clear()
    }

    def getCount() {
        failureDao.count
    }

    def getFailures(long offset, long max) {
        failureDao.getFailures(offset, max)
    }

}
