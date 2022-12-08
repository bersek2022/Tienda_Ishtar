
<%@page import="com.emergentes.modelo.Modo_pago"%>
<%@page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<Modo_pago> lista = (List<Modo_pago>)request.getAttribute("lista");
%>
<!DOCTYPE html>
<html>
    <head>
        
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" rel="stylesheet" >
  
    <link rel="stylesheet" href="css/bulma.min.css">
    <link rel="stylesheet" href="css/material-design-iconic-font.css">
    <link rel="stylesheet" href="css/styles.css">
        <title>Modo Pago</title>
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
   
    </head>
    <body >
        <jsp:include page="WEB-INF/menu.jsp"/>
        <br><br>
        
         <h1 class ="display-1 text-success"align="center"><i class="fa-sharp fa-solid fa-credit-card"></i>Modos de Pago<i class="fa-regular fa-sack-dollar"></i></h1>
        <p>
            <a  class="btn btn-danger" href="PagoControlador?op=nuevo"><i class="fa-solid fa-user-plus"></i>Nuevo</a>
        </p>
        <table  class="table table-striped" width="85%"align="center" border =1>
            
                <tr >
                    <th>Id_pago</th>
                    <th>Descripcion</th>
                    <th>Editar</th>
                    <th>Eliminar</th>
                </tr>
                <c:forEach var="item" items="${lista}">
                    <tr >
                    <td>${item.id_pago}</td>
                    <td>${item.descripcion}</td>
                   
                    <td><a href="PagoControlador?op=editar&id_pago=${item.id_pago}"><i class="fa-solid fa-user-pen"></i>Editar</a></td>
                    <td><a href="PagoControlador?op=eliminar&id_pago=${item.id_pago}"
                           onclick="return(confirm('Esta Seguro de eliminar?'))"><i class="fa-solid fa-trash-can"></i>Eliminar</a></td>
                </tr>
                </c:forEach>
                
        </table>
          <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
  
    </body>
</html>