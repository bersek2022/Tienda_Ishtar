
<%@page import="com.emergentes.modelo.Usuarios"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
    Usuarios usu= (Usuarios) request.getAttribute("usu");
%>    
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
     <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" rel="stylesheet" >
  
    <link rel="stylesheet" href="css/bulma.min.css">
    <link rel="stylesheet" href="css/material-design-iconic-font.css">
    <link rel="stylesheet" href="css/styles.css">
        <title>Usuarios</title>
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
   
    </head>
  
    <body >
          <jsp:include page="WEB-INF/menu.jsp"/>
        <h1 class ="display-1 text-info"align  ="center"><c:if test="${usu.id==0}">
                Nuevo Usuario
            </c:if>
            <c:if test="${usu.id!=0}">
                Editar Usuario
            </c:if>
        </h1>
        <form action="UsuarioControlador" name="usuario" method="POST"  >
            <input type="hidden" name="id" value="${usu.id}">
            <table ALIGN="center">

                <tr>
                    <td><label for="">Nombre:  </label></td>
                    <td><input type="text" name="nombre" value="${usu.nombre}" required>
                    </td>
                </tr>
               <tr>
                    <td><label for="">Apellido:  </label></td>
                    <td><input type="text" name="apellido" value="${usu.apellido}" required>
                    </td>
                </tr>
                <tr>
                    <td><label for="">CI:  </label></td>
                    <td><input type="text" name="ci" value="${usu.ci}" >
                    </td>
                </tr>
                <tr>
                    <td><label for="">Correo:  </label></td>
                    <td><input type="text" name="correo" value="${usu.correo}" required>
                    </td>
                </tr>
                <tr>
                    <td><label for="">Telefono:  </label></td>
                    <td><input type="text" name="telefono" value="${usu.telefono}" required>
                    </td>
                </tr>
                <tr>
                    <td><label for="">Contraseña:  </label></td>
                    <td><input type="password" name="password" value="${usu.password}" required>
                    </td>
                </tr>
                <tr>
                    <td> </td>
                    <td><input class="btn btn-primary" type="submit" value="Enviar" /></td>
                </tr>
            </table>

        </form>
                    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
 
    </body>
</html>
