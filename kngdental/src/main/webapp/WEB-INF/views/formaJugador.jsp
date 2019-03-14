<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Agregar / Edita Integrante</title>
    <link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
    <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
    
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">    
    
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    
    
</head>
<body>
    <div class="generic-container">
        <%@include file="authheader.jsp" %>
        <div class="well lead">Forma de Registro de Integrantes</div>

        <form:form action="guardarJugadorTorneoEquipo" method="post" modelAttribute="torneoEquipoJugador"
        id="formulario">
                    <form:hidden path="id"/>
                    <form:hidden path="torneo.id"/>
                    <form:hidden path="equipo.id"/>
                    <form:hidden path="jugador.id"/>
        
			<div class="form-row">
			
				<div class="form-group col-md-3">
					<div >
					<img  height="175" src="" name = "foto"  width="155" alt="FotoJugador" />
					</div>
				</div>
			

				
				<div class="form-group col-md-3">
					<label class="control-lable" for="nombre">Nombre :
					<span
						class="text-danger">*</span>
					</label>
					<div>
						<form:input type="text" path="jugador.nombre" id="nombre" required ="true"
							class="form-control input-sm" />
						<div class="has-error">
							<form:errors path="jugador.nombre" class="help-inline" />

						</div>
					</div>
					
					</br></br>
					
					<label class="control-lable" for="numero">Número dorsal:
						<span class="text-danger">*</span></label>
					<div>
						<form:input type="number" path="jugador.numero" id="numero" required ="true"
							class="form-control input-sm" />
						<div class="has-error">
							<form:errors path="jugador.numero" class="help-inline" />
						</div>
					</div>
						
					<label class="control-lable" for="numero">Estatura:
						<span class="text-danger">*</span></label>
					<div>
						<form:input type="number" step="0.01" path="jugador.estatura" id="estatura" required ="true"
							class="form-control input-sm" />
						<div class="has-error">
							<form:errors path="jugador.estatura" class="help-inline" />
						</div>
					</div>
					
					
				</div>
				
				<div class="form-group col-md-3">
					<label class="control-lable" for="apellidos">Apellidos:
					<span
						class="text-danger">*</span>
					</label>
					<div>
						<form:input type="text" path="jugador.apellidos" id="apellidos" required ="true"
							class="form-control input-sm" />
						<div class="has-error">
							<form:errors path="jugador.apellidos" class="help-inline" />

						</div>
					</div>
					
					</br></br>
					
				<div>
					<label class="control-label">Fecha Nacimiento: <span
						class="text-danger">*</span></label>
<%-- 						<fmt:parseDate value="${fecha}" pattern="yyyy-MM-dd" var="myDate"/> --%>
						<fmt:formatDate value="${jugador.fechaNacimiento}" var="fechaa" type="date" pattern="dd/MM/yyyy" />
						<form:input type="date" path="jugador.fechaNacimiento" id="fechaNacimiento" required ="false" value = "${fechaa}"
							class="form-control input-sm" />
	
				</div>
					
                    <label class="control-lable" for="rol">Tipo integrante</label>
                    <div>
                        <form:select 
                            path="jugador.rol.id" 
                            items="${tiposIntegrante}" 
                            multiple="false" 
                        	itemValue="id" 
                        	itemLabel="descripcion" 
                        	class="form-control input-sm" />

                        <div class="has-error">
                            <form:errors path="jugador.rol.id" class="help-inline"/>
                        </div>
                    </div>
					
				</div>

			</div>
        
			<div class="form-row">

				<div class="form-group col-md-3">
					<label class="control-lable" for="correo">Correo electrónico:
						<span class="text-danger">*</span></label>
					<div>
						<form:input type="text" path="jugador.correo" id="correo" required ="true"
							class="form-control input-sm" />
						<div class="has-error">
							<form:errors path="jugador.correo" class="help-inline" />
						</div>
					</div>

				</div>
			
				<div class="form-group col-md-3">

					<label class="control-lable" for="telefono">Teléfono:
						<span class="text-danger">*</span></label>
					<div>
						<form:input type="text" path="jugador.telefono" id="telefono" required ="true"
							class="form-control input-sm" />
						<div class="has-error">
							<form:errors path="jugador.telefono" class="help-inline" />
						</div>
					</div>
				</div>
			
				<div class="form-group col-md-1">

					<label class="control-lable" for="estatus">Estatus:</label>
					<div>
						<form:checkbox path="jugador.estatus"    checked = "true"/>
						<div class="has-error">
							<form:errors path="jugador.estatus" class="help-inline" />
						</div>
					</div>
				</div>
				
				<div class="form-group col-md-2">

					<label class="control-lable" for="foto">Foto:
						<span class="text-danger">*</span></label>
					<div>
						<form:input type="text" path="jugador.foto" id="fotografia" required ="false"
							class="form-control input-sm" />
						<div class="has-error">
							<form:errors path="jugador.foto" class="help-inline" />
						</div>
					</div>
				</div>
				
				

			</div>
        
			<div class="form-row">
				<div class="form-group col-md-6">

					<label class="control-lable" for="foto">Observaciones:
						</label>
							<td>
							 <form:textarea path="jugador.observaciones" rows="3"
							cols="85"></form:textarea>
							</td>

				</div>
				
				<div class="form-group col-md-1"></div>
				
				<div class="form-group col-md-1">
					<label class="control-lable" for="foto">Estadisticas:
						</label>
					<a href="#" data-toggle="modal" data-target="#estadisticasModal">
					<i class="large material-icons"  
								data-toggle="tooltip" data-placement="left" 
								title="Estadisticas">equalizer</i>
					</a>

				</div>

				
			</div>
      
      
            <div class="row">
                <div class="form-actions floatRight">     
                <sec:authorize access="hasRole('ADMIN')  or hasRole('DBA')">              
                    <c:choose>
                        <c:when test="${edit}">
                            <input type="submit" value="Actualizar" class="btn btn-primary"/> 
                            <a href="listaJugadoresTorneoEquipo?idt=${torneoEquipoJugador.torneo.id}&ide=${torneoEquipoJugador.equipo.id}" 
							class="btn btn-warning">Cancelar</a>
                        </c:when>
                        <c:otherwise>
                            <input type="submit" value="Registrar" class="btn btn-primary"/> 
                            <a href="listaJugadoresTorneoEquipo?idt=${torneoEquipoJugador.torneo.id}&ide=${torneoEquipoJugador.equipo.id}" 
							class="btn btn-warning">Cancelar</a>
                        </c:otherwise>
                    </c:choose>
                  </sec:authorize>  
                <sec:authorize access="hasRole('TEST')">              
                    <c:choose>
                        <c:when test="${edit}">
                            <input type="button" value="Actualizar" class="btn btn-primary"/> 
                            <a href="listaJugadoresTorneoEquipo?idt=${torneoEquipoJugador.torneo.id}&ide=${torneoEquipoJugador.equipo.id}" 
							class="btn btn-warning">Cancelar</a>
                        </c:when>
                        <c:otherwise>
                            <input type="button" value="Registrar" class="btn btn-primary"/> 
                            <a href="listaJugadoresTorneoEquipo?idt=${torneoEquipoJugador.torneo.id}&ide=${torneoEquipoJugador.equipo.id}" 
							class="btn btn-warning">Cancelar</a>
                        </c:otherwise>
                    </c:choose>
                  </sec:authorize>  
                  
                </div>
            </div>
        
        </form:form>


	</div>
	
			<script language="JavaScript" type="text/javascript">
			  var src = "";
				document.foto.src ="./static/images/fotosJugadores/" + document.getElementById("fotografia").value;
			</script> 


</body>

<!-- Modal -->
<div class="modal fade" id="estadisticasModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Estadisticas Personales</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">

            <table id="example" class="table table-hover" cellspacing="0" width="100%">
                <thead>
                    <tr>
                    	<th>CONCEPTO</th>
                        <th>TOTAL</th>
                        <th>PROMEDIO</th>
                    </tr>
                </thead>

            	 <tbody>
					<c:forEach items="${listaEstadisticasJugador}" var="estadistica">

                    	<tr>
                    		<td>${estadistica.concepto}</td>
	                        <td>${estadistica.total}</td>
	                        <td>${estadistica.promedio}</td>

                    	</tr>


					</c:forEach>

            	 </tbody>

            </table>
            	 

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        <button type="button" class="btn btn-primary">Descargar</button>
      </div>
    </div>
  </div>
</div>


</html>