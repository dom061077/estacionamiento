<%@ page import="parking.vehiculo.Vehiculo" %>



<div class="fieldcontain ${hasErrors(bean: vehiculoInstance, field: 'observacion', 'error')} required">
	<label for="observacion">
		<g:message code="vehiculo.observacion.label" default="Observacion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="observacion" required="" value="${vehiculoInstance?.observacion}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: vehiculoInstance, field: 'patente', 'error')} required">
	<label for="patente">
		<g:message code="vehiculo.patente.label" default="Patente" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="patente" required="" value="${vehiculoInstance?.patente}"/>

</div>

