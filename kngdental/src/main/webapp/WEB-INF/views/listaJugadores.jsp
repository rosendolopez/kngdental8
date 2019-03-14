<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Lista de Integrantes</title>
    <link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
    <link href="<c:url value='/static/css/bootstrap.min.css' />" rel="stylesheet"></link>
    <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
    <link href="<c:url value='/static/css/dataTables.bootstrap4.min.css' />" rel="stylesheet"></link>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">    

 <!--    Para modal y estilo de pantalla -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

    <script  src="./static/js/jquery-1.12.4.js"></script>
    <script  src="./static/js/jquery.dataTables.min.js"></script>
    <script  src="./static/js/dataTables.bootstrap4.min.js"></script>
</head>
 
<body>
    <div class="generic-container">
        <%@include file="authheader.jsp" %>   
        
        <sec:authorize access="hasRole('ADMIN')"> 
		<ul class="nav nav-pills">
			<li class="nav-item"><a class="nav-link" href="<c:url value='/listaEmpleados' />">
			Empleados</a> </li>
			<li class="nav-item"><a class="nav-link" href="<c:url value='/list' />">
			Usuarios</a></li>
			<li class="nav-item"><a class="nav-link" href="<c:url value='/listaTorneosPorTorneo' />">
			Torneos</a></li>
			<li class="nav-item"><a class="nav-link" href="<c:url value='/listaEquipos' />">
			Equipos</a></li>
			<li class="nav-item"><a class="nav-link active" href="<c:url value='/listaJugadores' />">
			Jugadores</a></li>
			<li class="nav-item"><a class="nav-link" href="<c:url value='/listaJornadas' />">
			Jornadas</a></li>
			<li class="nav-item"><a class="nav-link disabled" href="#">Disabled</a> </li>
		</ul>
		</sec:authorize>   
        
		<div class="panel panel-default">
              <!-- Default panel contents -->
            <div class="panel-heading" align="center"><span class="lead">Lista de Jugadores</span></div>
            <table id="example" class="table table-hover" cellspacing="0" width="100%">
                <thead>
                    <tr>
                    	<th>ID</th>
                        <th>Dorsal</th>
                        <th>Nombre</th>
                        <th>Apellidos</th>
                        <th>Equipo</th>
                        <sec:authorize access="hasRole('ADMIN') or hasRole('DBA') or hasRole('USER')  or hasRole('TEST')">
                            <th width="25"></th>
                        </sec:authorize>
                        <sec:authorize access="hasRole('ADMIN')">
                            <th width="25"></th>
                        </sec:authorize>
                         
                    </tr>
                </thead>
                <tbody>
                <c:forEach items="${listaJugadores}" var="jugador">
                    <tr>
                    	<td>${jugador.id}</td>
                        <td>${jugador.numero}</td>
                        <td>${jugador.nombre}</td>
                        <td>${jugador.apellidos}</td>
                        <td>${jugador.equipo.nombreEquipo}</td>
                        <sec:authorize access="hasRole('ADMIN') or hasRole('DBA') or hasRole('USER') or hasRole('TEST')">
                            <td><a href="<c:url value='editarJugadorTorneoEquipo?idj=${jugador.id}&idt=${torneoId}&ide=${equipoId}' />">  
                            	<i class="large material-icons"  
								data-toggle="tooltip" data-placement="left" 
								title="Editar">edit</i></a>
                            	</td>
                        </sec:authorize>
                        <sec:authorize access="hasRole('ADMIN')">
                            <td><a href="<c:url value='eliminarJugador?id=${jugador.id}' />"> 
                           <i class="large material-icons"
	                            data-toggle="tooltip" data-placement="left" 
								title="Eliminar">delete</i></a>
                            </td>
                        </sec:authorize>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>

            <div class="well">
        <sec:authorize access="hasRole('ADMIN') or hasRole('DBA')  or hasRole('TEST')">
                            <a href="<c:url value='/nuevoJugadorTorneoEquipo?idt=${torneoId}&ide=${equipoId}' />" 
                            class="btn btn-primary">Nuevo</a>

                            <a href="<c:url value='/listaEquiposPorTorneo?idt=${torneoId}'/>" 
                            class="btn btn-secondary">Ir a Equipos</a>
         </sec:authorize>         
            </div>  
            

    </div>
    
<script type="text/javascript" class="init">
  $(document).ready(function() {
    $('#example').DataTable({

        language: {
            "decimal": "",
            "emptyTable": "No hay información",
            "info": "Mostrando _START_ a _END_ de _TOTAL_ Entradas",
            "infoEmpty": "Mostrando 0 to 0 of 0 Entradas",
            "infoFiltered": "(Filtrado de _MAX_ total entradas)",
            "infoPostFix": "",
            "thousands": ",",
            "lengthMenu": "Mostrar _MENU_ Entradas",
            "loadingRecords": "Cargando...",
            "processing": "Procesando...",
            "search": "Buscar:",
            "zeroRecords": "Sin resultados encontrados",
            "paginate": {
                "first": "Primero",
                "last": "Ultimo",
                "next": "Siguiente",
                "previous": "Anterior"
            }
        },
        
        
    	  "pageLength": 5
    } );
  } );
</script>
    
</body>
</html>