<%@ page import="parking.Lugar" %>



<div class="fieldcontain ${hasErrors(bean: lugarInstance, field: 'posicion', 'error')} required">
	<label for="posicion">
		<g:message code="lugar.posicion.label" default="Posicion" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="posicion" type="number" value="${lugarInstance.posicion}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: lugarInstance, field: 'techado', 'error')} ">
	<label for="techado">
		<g:message code="lugar.techado.label" default="Techado" />
		
	</label>
	<g:checkBox name="techado" value="${lugarInstance?.techado}" />

</div>

