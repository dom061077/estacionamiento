
<%@ page import="parking.Estacionamiento" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'estacionamiento.label', default: 'Estacionamiento')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-estacionamiento" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-estacionamiento" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list estacionamiento">
			
				<g:if test="${estacionamientoInstance?.confirmado}">
				<li class="fieldcontain">
					<span id="confirmado-label" class="property-label"><g:message code="estacionamiento.confirmado.label" default="Confirmado" /></span>
					
						<span class="property-value" aria-labelledby="confirmado-label"><g:formatBoolean boolean="${estacionamientoInstance?.confirmado}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${estacionamientoInstance?.fecha}">
				<li class="fieldcontain">
					<span id="fecha-label" class="property-label"><g:message code="estacionamiento.fecha.label" default="Fecha" /></span>
					
						<span class="property-value" aria-labelledby="fecha-label"><g:formatDate date="${estacionamientoInstance?.fecha}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${estacionamientoInstance?.horaIngreso}">
				<li class="fieldcontain">
					<span id="horaIngreso-label" class="property-label"><g:message code="estacionamiento.horaIngreso.label" default="Hora Ingreso" /></span>
					
						<span class="property-value" aria-labelledby="horaIngreso-label"><g:formatDate date="${estacionamientoInstance?.horaIngreso}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${estacionamientoInstance?.horaSalida}">
				<li class="fieldcontain">
					<span id="horaSalida-label" class="property-label"><g:message code="estacionamiento.horaSalida.label" default="Hora Salida" /></span>
					
						<span class="property-value" aria-labelledby="horaSalida-label"><g:formatDate date="${estacionamientoInstance?.horaSalida}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${estacionamientoInstance?.lugar}">
				<li class="fieldcontain">
					<span id="lugar-label" class="property-label"><g:message code="estacionamiento.lugar.label" default="Lugar" /></span>
					
						<span class="property-value" aria-labelledby="lugar-label"><g:link controller="lugar" action="show" id="${estacionamientoInstance?.lugar?.id}">${estacionamientoInstance?.lugar?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${estacionamientoInstance?.mantenimientos}">
				<li class="fieldcontain">
					<span id="mantenimientos-label" class="property-label"><g:message code="estacionamiento.mantenimientos.label" default="Mantenimientos" /></span>
					
						<g:each in="${estacionamientoInstance.mantenimientos}" var="m">
						<span class="property-value" aria-labelledby="mantenimientos-label"><g:link controller="mantenimiento" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${estacionamientoInstance?.vehiculo}">
				<li class="fieldcontain">
					<span id="vehiculo-label" class="property-label"><g:message code="estacionamiento.vehiculo.label" default="Vehiculo" /></span>
					
						<span class="property-value" aria-labelledby="vehiculo-label"><g:link controller="vehiculo" action="show" id="${estacionamientoInstance?.vehiculo?.id}">${estacionamientoInstance?.vehiculo?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:estacionamientoInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${estacionamientoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
