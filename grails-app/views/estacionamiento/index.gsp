
<%@ page import="parking.Estacionamiento" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'estacionamiento.label', default: 'Estacionamiento')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-estacionamiento" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-estacionamiento" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="confirmado" title="${message(code: 'estacionamiento.confirmado.label', default: 'Confirmado')}" />
					
						<g:sortableColumn property="fecha" title="${message(code: 'estacionamiento.fecha.label', default: 'Fecha')}" />
					
						<g:sortableColumn property="horaIngreso" title="${message(code: 'estacionamiento.horaIngreso.label', default: 'Hora Ingreso')}" />
					
						<g:sortableColumn property="horaSalida" title="${message(code: 'estacionamiento.horaSalida.label', default: 'Hora Salida')}" />
					
						<th><g:message code="estacionamiento.lugar.label" default="Lugar" /></th>
					
						<th><g:message code="estacionamiento.vehiculo.label" default="Vehiculo" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${estacionamientoInstanceList}" status="i" var="estacionamientoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${estacionamientoInstance.id}">${fieldValue(bean: estacionamientoInstance, field: "confirmado")}</g:link></td>
					
						<td><g:formatDate date="${estacionamientoInstance.fecha}" /></td>
					
						<td><g:formatDate date="${estacionamientoInstance.horaIngreso}" /></td>
					
						<td><g:formatDate date="${estacionamientoInstance.horaSalida}" /></td>
					
						<td>${fieldValue(bean: estacionamientoInstance, field: "lugar")}</td>
					
						<td>${fieldValue(bean: estacionamientoInstance, field: "vehiculo")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${estacionamientoInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
