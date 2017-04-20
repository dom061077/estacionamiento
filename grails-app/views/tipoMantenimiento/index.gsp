
<%@ page import="parking.TipoMantenimiento" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tipoMantenimiento.label', default: 'TipoMantenimiento')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-tipoMantenimiento" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-tipoMantenimiento" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="descripcion" title="${message(code: 'tipoMantenimiento.descripcion.label', default: 'Descripcion')}" />
					
						<g:sortableColumn property="tarifa" title="${message(code: 'tipoMantenimiento.tarifa.label', default: 'Tarifa')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${tipoMantenimientoInstanceList}" status="i" var="tipoMantenimientoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${tipoMantenimientoInstance.id}">${fieldValue(bean: tipoMantenimientoInstance, field: "descripcion")}</g:link></td>
					
						<td>${fieldValue(bean: tipoMantenimientoInstance, field: "tarifa")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${tipoMantenimientoInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
