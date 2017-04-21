
<%@ page import="parking.Lugar" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'lugar.label', default: 'Lugar')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-lugar" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-lugar" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="posicion" title="${message(code: 'lugar.posicion.label', default: 'Posicion')}" />
					
						<g:sortableColumn property="techado" title="${message(code: 'lugar.techado.label', default: 'Techado')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${lugarInstanceList}" status="i" var="lugarInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${lugarInstance.id}">${fieldValue(bean: lugarInstance, field: "posicion")}</g:link></td>
					
						<td><g:formatBoolean boolean="${lugarInstance.techado}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${lugarInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>