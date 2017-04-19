<%@ page import="parking.tarifario.Tarifa" %>



<div class="fieldcontain ${hasErrors(bean: tarifaInstance, field: 'descripcion', 'error')} required">
	<label for="descripcion">
		<g:message code="tarifa.descripcion.label" default="Descripcion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descripcion" required="" value="${tarifaInstance?.descripcion}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: tarifaInstance, field: 'precio', 'error')} required">
	<label for="precio">
		<g:message code="tarifa.precio.label" default="Precio" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="precio" value="${fieldValue(bean: tarifaInstance, field: 'precio')}" required=""/>

</div>

