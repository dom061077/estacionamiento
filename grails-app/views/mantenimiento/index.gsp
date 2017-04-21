
<%@ page import="parking.Mantenimiento" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'mantenimiento.label', default: 'Mantenimiento')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-mantenimiento" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-mantenimiento" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="mantenimiento.estacionamiento.label" default="Estacionamiento" /></th>
					
						<g:sortableColumn property="subTotal" title="${message(code: 'mantenimiento.subTotal.label', default: 'Sub Total')}" />
					
						<th><g:message code="mantenimiento.tipo.label" default="Tipo" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${mantenimientoInstanceList}" status="i" var="mantenimientoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${mantenimientoInstance.id}">${fieldValue(bean: mantenimientoInstance, field: "estacionamiento")}</g:link></td>
					
						<td>${fieldValue(bean: mantenimientoInstance, field: "subTotal")}</td>
					
						<td>${fieldValue(bean: mantenimientoInstance, field: "tipo")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${mantenimientoInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
