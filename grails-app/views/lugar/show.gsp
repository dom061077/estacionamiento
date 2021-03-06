
<%@ page import="parking.Lugar" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'lugar.label', default: 'Lugar')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-lugar" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-lugar" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list lugar">
			
				<g:if test="${lugarInstance?.posicion}">
				<li class="fieldcontain">
					<span id="posicion-label" class="property-label"><g:message code="lugar.posicion.label" default="Posicion" /></span>
					
						<span class="property-value" aria-labelledby="posicion-label"><g:fieldValue bean="${lugarInstance}" field="posicion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${lugarInstance?.techado}">
				<li class="fieldcontain">
					<span id="techado-label" class="property-label"><g:message code="lugar.techado.label" default="Techado" /></span>
					
						<span class="property-value" aria-labelledby="techado-label"><g:formatBoolean boolean="${lugarInstance?.techado}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:lugarInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${lugarInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
