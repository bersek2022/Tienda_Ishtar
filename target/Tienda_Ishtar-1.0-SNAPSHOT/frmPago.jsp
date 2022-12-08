<%@page import="com.emergentes.modelo.Modo_pago"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
    Modo_pago pago= (Modo_pago) request.getAttribute("pago");
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
        <title>Modo Pago</title>
              <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
   
    </head>
  
    <body >
          <jsp:include page="WEB-INF/menu.jsp"/>
        <h1 class ="display-1 text-danger"align  ="center"><c:if test="${pago.id_pago==0}">
                Nuevo Modo de Pago
            </c:if>
            <c:if test="${pago.id_pago!=0}">
                Editar Modo de Pago
            </c:if>
        </h1>
        <form action="PagoControlador" name="modoPago" method="POST"  >
            <input type="hidden" name="id_pago" value="${pago.id_pago}">
            <table ALIGN="center">

                <tr>
                    <td><label class="h3 text-primary" for="">Descripcion:  </label></td>
                    <td><input type="text" name="descripcion" value="${pago.descripcion}" required>
                    </td>
                </tr>
               
                <tr>
                    <td> </td>
                    <td><input  class="btn btn-success"  type="submit" value="Enviar" /></td>
                </tr>
            </table>

        </form>
                     <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
 
    </body>
</html>
