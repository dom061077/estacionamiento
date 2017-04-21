<%@ page import="parking.Mantenimiento" %>



<div class="fieldcontain ${hasErrors(bean: mantenimientoInstance, field: 'estacionamiento', 'error')} required">
	<label for="estacionamiento">
		<g:message code="mantenimiento.estacionamiento.label" default="Estacionamiento" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="estacionamiento" name="estacionamiento.id" from="${parking.Estacionamiento.list()}" optionKey="id" required="" value="${mantenimientoInstance?.estacionamiento?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: mantenimientoInstance, field: 'subTotal', 'error')} required">
	<label for="subTotal">
		<g:message code="mantenimiento.subTotal.label" default="Sub Total" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="subTotal" value="${fieldValue(bean: mantenimientoInstance, field: 'subTotal')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: mantenimientoInstance, field: 'tipo', 'error')} required">
	<label for="tipo">
		<g:message code="mantenimiento.tipo.label" default="Tipo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="tipo" name="tipo.id" from="${parking.TipoMantenimiento.list()}" optionKey="id" required="" value="${mantenimientoInstance?.tipo?.id}" class="many-to-one"/>

</div>

