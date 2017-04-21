
<%@ page import="parking.vehiculo.Vehiculo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'vehiculo.label', default: 'Vehiculo')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-vehiculo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-vehiculo" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="observacion" title="${message(code: 'vehiculo.observacion.label', default: 'Observacion')}" />
					
						<g:sortableColumn property="patente" title="${message(code: 'vehiculo.patente.label', default: 'Patente')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${vehiculoInstanceList}" status="i" var="vehiculoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${vehiculoInstance.id}">${fieldValue(bean: vehiculoInstance, field: "observacion")}</g:link></td>
					
						<td>${fieldValue(bean: vehiculoInstance, field: "patente")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${vehiculoInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
