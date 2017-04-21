<%@ page import="parking.Estacionamiento" %>



<div class="fieldcontain ${hasErrors(bean: estacionamientoInstance, field: 'confirmado', 'error')} ">
	<label for="confirmado">
		<g:message code="estacionamiento.confirmado.label" default="Confirmado" />
		
	</label>
	<g:checkBox name="confirmado" value="${estacionamientoInstance?.confirmado}" />

</div>

<!-- div class="fieldcontain ${hasErrors(bean: estacionamientoInstance, field: 'fecha', 'error')} required">
	<label for="fecha">
		<g:message code="estacionamiento.fecha.label" default="Fecha" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fecha" precision="day"  value="${estacionamientoInstance?.fecha}"  />

</div -->

<div class="fieldcontain ${hasErrors(bean: estacionamientoInstance, field: 'horaIngreso', 'error')} required">
	<label for="horaIngreso">
		<g:message code="estacionamiento.horaIngreso.label" default="Hora Ingreso" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="horaIngreso" precision="day"  value="${estacionamientoInstance?.horaIngreso}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: estacionamientoInstance, field: 'horaSalida', 'error')} required">
	<label for="horaSalida">
		<g:message code="estacionamiento.horaSalida.label" default="Hora Salida" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="horaSalida" precision="day"  value="${estacionamientoInstance?.horaSalida}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: estacionamientoInstance, field: 'lugar', 'error')} required">
	<label for="lugar">
		<g:message code="estacionamiento.lugar.label" default="Lugar" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="lugar" name="lugar.id" from="${parking.Lugar.list()}" optionKey="id" required="" value="${estacionamientoInstance?.lugar?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: estacionamientoInstance, field: 'mantenimientos', 'error')} ">
	<label for="mantenimientos">
		<g:message code="estacionamiento.mantenimientos.label" default="Mantenimientos" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${estacionamientoInstance?.mantenimientos?}" var="m">
    <li><g:link controller="mantenimiento" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="mantenimiento" action="create" params="['estacionamiento.id': estacionamientoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'mantenimiento.label', default: 'Mantenimiento')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: estacionamientoInstance, field: 'vehiculo', 'error')} required">
	<label for="vehiculo">
		<g:message code="estacionamiento.vehiculo.label" default="Vehiculo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="vehiculo" name="vehiculo.id" from="${parking.vehiculo.Vehiculo.list()}" optionKey="id" required="" value="${estacionamientoInstance?.vehiculo?.id}" class="many-to-one"/>

</div>

