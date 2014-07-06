class JesqueWebGrailsPlugin {
    def version = "0.6"
    def grailsVersion = "2.4.0 > *"
    def dependsOn = [jesque: '0.6.0 > *']
    def pluginExcludes = [
            "grails-app/views/error.gsp",
            "src/groovy/grails/plugin/jesqueweb/test/**",
            "test/**",
    ]

    def title = "Jesque Web"
    def description = '''\\
Web interface to view and manage jesque queues, jobs and workers.
'''

    def author = "Michael Cameron"
    def authorEmail = "michael.e.cameron@gmail.com"

    def license = "APACHE"
    def developers = [
            [name: "Michael Cameron", email: "michael.e.cameron@gmail.com"],
            [name: "Ted Naleid", email: "contact@naleid.com"],
            [name: "Philipp Eschenbach", email: "peh@kunstsysteme.com"],
            [name: "Egor Pervuninski", email: "egor@egor.pe"],
    ]
    def documentation = "https://github.com/michaelcameron/grails-jesque-web"
    def scm = [url: "https://github.com/michaelcameron/grails-jesque-web"]

    def doWithWebDescriptor = { xml ->

    }

    def doWithSpring = {

    }

    def doWithDynamicMethods = { ctx ->
    }

    def doWithApplicationContext = { applicationContext ->
    }

    def onChange = { event ->
    }

    def onConfigChange = { event ->
    }
}
