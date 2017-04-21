<%@ page import="parking.vehiculo.TipoVehiculo" %>



<div class="fieldcontain ${hasErrors(bean: tipoVehiculoInstance, field: 'descripcion', 'error')} required">
	<label for="descripcion">
		<g:message code="tipoVehiculo.descripcion.label" default="Descripcion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descripcion" required="" value="${tipoVehiculoInstance?.descripcion}"/>

</div>

