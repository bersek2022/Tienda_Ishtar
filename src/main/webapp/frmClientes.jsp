
<%@page import="com.emergentes.modelo.Clientes"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
    Clientes cli= (Clientes) request.getAttribute("cli");
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
        <title>Clientes</title>
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    </head>
  
    <body >
          <jsp:include page="WEB-INF/menu.jsp"/>
          <br>
          <br>
        <h1  class ="display-1 text-danger"align  ="center"><c:if test="${cli.id==0}">
                NUEVO CLIENTE
            </c:if>
            <c:if test="${cli.id!=0}">
                EDITAR CLIENTE
            </c:if>
        </h1>
        <form action="ClienteController" name="clientes" method="POST"  >
            <input type="hidden" name="id" value="${cli.id}">
            <table ALIGN="center">

                <tr>
                    <td><label for="" class="text-primary">Nombre:  </label></td>
                    <td><input type="text" name="nombre" value="${cli.nombre}" required>
                    </td>
                </tr>
               <tr>
                    <td><label for=""class="text-primary">Apellido:  </label></td>
                    <td><input type="text" name="apellido" value="${cli.apellido}" required>
                    </td>
                </tr>
                <tr>
                    <td><label for="" class="text-primary">CI:  </label></td>
                    <td><input type="text" name="ci" value="${cli.ci}" >
                    </td>
                </tr>
                <tr>
                    <td><label for="" class="text-primary">Correo:  </label></td>
                    <td><input type="text" name="correo" value="${cli.correo}" required>
                    </td>
                </tr>
                <tr>
                    <td><label for="" class="text-primary">Telefono:  </label></td>
                    <td><input type="text" name="telefono" value="${cli.telefono}" required>
                    </td>
                </tr>
                <tr>
                    <td><label for="" class="text-primary">Direccion:  </label></td>
                    <td><input type="text" name="direccion" value="${cli.direccion}" required>
                    </td>
                </tr>
                <tr>
                    <td><label for="" class="text-primary">Contraseña:  </label></td>
                    <td><input type="password" name="password" value="${cli.password}" required>
                    </td>
                </tr>
                <tr>
                    <td> </td>
                    <td><input class="btn btn-danger"  type="submit" value="Enviar" /></td>
                </tr>
            </table>

        </form>
                    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
    </body>
</html>
