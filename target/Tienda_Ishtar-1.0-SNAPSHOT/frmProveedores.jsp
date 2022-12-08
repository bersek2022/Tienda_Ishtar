

<%@page import="com.emergentes.modelo.Proveedores"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
    Proveedores prov= (Proveedores) request.getAttribute("prov");
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
        <title>Proveedores</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
   
    </head>
  
    <body >
          <jsp:include page="WEB-INF/menu.jsp"/>
        <h1 class ="display-1 text-primary"align  ="center"><c:if test="${prov.id_proveedor==0}">
                Nuevo Proveedor
            </c:if>
            <c:if test="${prov.id_proveedor!=0}">
                Editar proveedor
            </c:if>
        </h1>
        <form action="ProveedoresControlador" name="proveedores" method="POST"  >
            <input type="hidden" name="id_proveedor" value="${prov.id_proveedor}">
            <table ALIGN="center">

                <tr>
                    <td><label for=""class="h3 text-danger" >Descripcion:  </label></td>
                    <td><input type="text" name="descripcion" value="${prov.descripcion}" required>
                    </td>
                </tr>
               <tr>
                    <td><label for=""class="h3 text-danger" >Telefono:  </label></td>
                    <td><input type="text" name="telefono" value="${prov.telefono}" required>
                    </td>
                </tr>
                <tr>
                    <td><label for=""class="h3 text-danger" >Direcion:  </label></td>
                    <td><input type="text" name="direccion" value="${prov.direccion}" >
                    </td>
                </tr>
                <tr>
                    <td><label for=""class="h3 text-danger" >Cantidad:  </label></td>
                    <td><input type="text" name="cantidad" value="${prov.cantidad}" required>
                    </td>
                </tr>
                <tr>
                    <td><label for=""class="h3 text-danger" >Precio:  </label></td>
                    <td><input type="text" name="precio" value="${prov.precio}" required>
                    </td>
                </tr>
                <tr>
                    <td> </td>
                    <td><input class="btn btn-primary"  type="submit" value="Enviar" /></td>
                </tr>
            </table>

        </form>
                    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
  
    </body>
</html>
