<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<!--[if lt IE 7 ]> <html class="no-js ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]>    <html class="no-js ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]>    <html class="no-js ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--> <html class="no-js" lang="en"><!--<![endif]-->
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <meta name="apple-mobile-web-app-status-bar-style" content="black"/>
    <title><g:message code="jesque.web.title" args="${g.layoutTitle()}"/></title>
    <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}"/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'style.css')}">
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
    <script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/handlebars.js/1.0.0/handlebars.js"></script>
    <script src="${g.resource(dir: 'js', file: 'jesque.js')}"></script>
</head>

<body>
    <header class="navbar navbar-default navbar-static-top bs-docs-nav" role="banner">
        <div class="container">
            <div class="navbar-header">
                <button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a href="#" class="navbar-brand"><g:message code="jesque.web.brand"/></a>
            </div>
            <nav id="collapse" class="collapse navbar-collapse" role="navigation">
                <ul class="nav navbar-nav">
                    <li class="${controllerName == "jesqueOverview" ? 'active' : ''}">
                        <g:link controller="jesqueOverview"><g:message code="jesque.web.nav.overview"/></g:link>
                    </li>
                    <li class="${controllerName == 'jesqueWorking' ? 'active' : ''}">
                        <g:link controller="jesqueWorking"><g:message code="jesque.web.nav.working"/></g:link>
                    </li>
                    <li class="${controllerName == 'jesqueFailed' ? 'active' : ''}">
                        <g:link controller="jesqueFailed"><g:message code="jesque.web.nav.failed"/></g:link>
                    </li>
                    <li class="${controllerName == 'jesqueQueues' ? 'active' : ''}">
                        <g:link controller="jesqueQueues"><g:message code="jesque.web.nav.queues"/></g:link>
                    </li>
                    <li class="${controllerName == 'jesqueWorkers' ? 'active' : ''}">
                        <g:link controller="jesqueWorkers"><g:message code="jesque.web.nav.workers"/></g:link>
                    </li>
                    <li>
                    </li>
                    <li class="${controllerName == 'jesqueStats' ? 'active' : ''}">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><g:message code="jesque.web.nav.stats"/> <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><g:link controller="jesqueStats" action="detail" id="redis"><g:message code="jesque.web.nav.stats.redis"/></g:link></li>
                            <li><g:link controller="jesqueStats" action="detail" id="resque"><g:message code="jesque.web.nav.stats.resque"/></g:link></li>
                            <li><g:link controller="jesqueStats" action="detail" id="keys"><g:message code="jesque.web.nav.stats.keys"/></g:link></li>
                        </ul>
                    </li>
                    <li class="${controllerName == 'jesqueScheduled' ? 'active' : ''}">
                        <g:link controller="jesqueScheduled"><g:message code="jesque.web.nav.scheduled"/></g:link>
                    </li>
                    <g:if test="${grailsApplication.config.grails.plugin.jesque.web.nav.custom}">
                        <g:each in="${grailsApplication.config.grails.plugin.jesque.web.nav.custom}" var="item">
                            <li class="${controllerName == "jesque${item}" ? 'active' : ''}">
                                <g:link controller="jesque${item}"><g:message code="jesque.web.nav.${item.toLowerCase()}"/></g:link>
                            </li>
                        </g:each>
                    </g:if>
                </ul>

                <form class="navbar-form navbar-right" onsubmit="updateIntervall();
                return false;">
                    <div class="form-group">
                        <input type="number" step="50" min="50" name="intervall" id="intervall"/>
                    </div>
                </form>
            </nav>
        </div>
    </header>

    <g:if test="${flash.message}">
        <div class="container" style="margin-top: 55px;">
            <div class="col-md-12">
                <div class="alert alert-dismissable ${flash.success == true ? 'alert-success' : flash.success == false ? 'alert-danger' : 'alert-info'}">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                    <g:message code="${flash.message}"/>
                </div>
            </div>
        </div>
    </g:if>

    <div class="container">
        <g:layoutBody/>
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
    </div>
    <footer>
        Connected to Redis namespace ${namespace} on ${redisUri}
    </footer>
</body>
</html>
