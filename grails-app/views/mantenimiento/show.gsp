
<%@ page import="parking.Mantenimiento" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'mantenimiento.label', default: 'Mantenimiento')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-mantenimiento" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-mantenimiento" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list mantenimiento">
			
				<g:if test="${mantenimientoInstance?.estacionamiento}">
				<li class="fieldcontain">
					<span id="estacionamiento-label" class="property-label"><g:message code="mantenimiento.estacionamiento.label" default="Estacionamiento" /></span>
					
						<span class="property-value" aria-labelledby="estacionamiento-label"><g:link controller="estacionamiento" action="show" id="${mantenimientoInstance?.estacionamiento?.id}">${mantenimientoInstance?.estacionamiento?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${mantenimientoInstance?.subTotal}">
				<li class="fieldcontain">
					<span id="subTotal-label" class="property-label"><g:message code="mantenimiento.subTotal.label" default="Sub Total" /></span>
					
						<span class="property-value" aria-labelledby="subTotal-label"><g:fieldValue bean="${mantenimientoInstance}" field="subTotal"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${mantenimientoInstance?.tipo}">
				<li class="fieldcontain">
					<span id="tipo-label" class="property-label"><g:message code="mantenimiento.tipo.label" default="Tipo" /></span>
					
						<span class="property-value" aria-labelledby="tipo-label"><g:link controller="tipoMantenimiento" action="show" id="${mantenimientoInstance?.tipo?.id}">${mantenimientoInstance?.tipo?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:mantenimientoInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${mantenimientoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
