<%@ page import="parking.TipoMantenimiento" %>



<div class="fieldcontain ${hasErrors(bean: tipoMantenimientoInstance, field: 'descripcion', 'error')} required">
	<label for="descripcion">
		<g:message code="tipoMantenimiento.descripcion.label" default="Descripcion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descripcion" required="" value="${tipoMantenimientoInstance?.descripcion}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: tipoMantenimientoInstance, field: 'tarifa', 'error')} required">
	<label for="tarifa">
		<g:message code="tipoMantenimiento.tarifa.label" default="Tarifa" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="tarifa" value="${fieldValue(bean: tipoMantenimientoInstance, field: 'tarifa')}" required=""/>

</div>

