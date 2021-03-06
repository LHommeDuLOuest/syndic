<%@ include file="/WEB-INF/tiles/template/includes.jsp"%>
<spring:url value="/welcome.ldz" var="homeUrl" htmlEscape="true" />
<spring:url value="/getformadduser.ldz" var="adduserUrl" htmlEscape="true" />
<spring:url value="/event/add.ldz" var="addeventUrl" htmlEscape="true" />
<spring:url value="/getformaddprovider.ldz" var="addproviderUrl" htmlEscape="true" />
<spring:url value="/event/list.ldz" var="listeventUrl" htmlEscape="true" />
<spring:url value="/listprovider.ldz" var="listproviderUrl" htmlEscape="true" />
<spring:url value="/j_spring_security_logout.ldz" var="logoutUrl" />
<spring:url value="/sign.ldz" var="loginUrl" />
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
<STYLE>
  #bou {
    background-color: #101010;
    border-color: #101010;
    color: #fff;
  }
</STYLE>


 <nav onload="change_class()" class="navbar navbar-default" id="bou">
        <div class="container-fluid">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="${homeUrl}">Syndic</a>
          </div>
          <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
              <li id="acc" class=""><a href="${homeUrl}"><spring:message code="header.home"/></a></li>

          <sec:authorize access="hasRole('ROLE_ADMIN')">

              <li id="adduser" class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Gestion Utilisateurs <span class="caret"></span></a>
                <ul class="dropdown-menu">
                  <li><a  href="${adduserUrl}"><spring:message code="header.add.user"/></a></li>
              <!--    <li><a href="#"></a></li>
                  <li><a href="#"></a></li>-->
                </ul>
              </li>
          </sec:authorize>

              <sec:authorize access="hasRole('ROLE_OWNER')">

                <li id="adduser" class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Gestion Utilisateurs <span class="caret"></span></a>
                  <ul class="dropdown-menu">
                    <li><a  href="${adduserUrl}"><spring:message code="header.add.user"/></a></li>
                    <!--    <li><a href="#"></a></li>
                        <li><a href="#"></a></li>-->
                  </ul>
                </li>
              </sec:authorize>


              <li id="listevent" class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Gestion Evenements<span class="caret"></span></a>
                <ul class="dropdown-menu">
                  <li><a href="${addeventUrl}"><spring:message code="header.add.event"/></a></li>
                  <li><a href="${listeventUrl}">Liste evenements</a></li>
               <!--   <li><a href="#">Action2</a></li>-->
                </ul>
              </li>
            <sec:authorize access="hasRole('ROLE_ADMIN')">
              <li id="listprovider" class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Fournisseurs<span class="caret"></span></a>
                <ul class="dropdown-menu">
                  <li><a href="${addproviderUrl}"><spring:message code="header.add.provider"/></a></li>
                  <li><a href="${listproviderUrl}">Liste fournisseurs</a></li>
              <!--    <li><a href="#">Action2</a></li>-->
                </ul>
              </li>
            </sec:authorize>
            </ul>
            <ul class="nav navbar-nav navbar-right">
              <li>
	            <c:choose>
                 <c:when test="${pageContext.request.userPrincipal.name != null}"><a href="#">${pageContext.request.userPrincipal.name}</a><li><a href="${logoutUrl}"><spring:message code="header.logout"/></a></li></c:when>
                 <c:otherwise><a href="${loginUrl}"><spring:message code="header.login"/></a></c:otherwise>
                </c:choose>
                <span class="sr-only">(current)</span>
              </li>
              <li><a href="#">UPOND</a></li>
              <li><a href="#"><spring:message code="header.about"/></a></li>
              <li><a href="?lang=en">En</a></li>
              <li><a href="?lang=fr">Fr</a></li>
            </ul>
          </div><!--/.nav-collapse -->
        </div><!--/.container-fluid -->
 </nav>
