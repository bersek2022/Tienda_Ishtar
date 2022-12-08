<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.emergentes.utiles.ConexionBD"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.emergentes.modelo.Productos"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    List<Productos> lista = (List<Productos>)request.getAttribute("lista");
%>

<%
    Productos prod= (Productos) request.getAttribute("prod");
    PreparedStatement ps;
        ConexionBD canal = new ConexionBD();
        Connection conn = canal.conectar();
        ResultSet rs;
        String op;
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
        <title>Productos</title>
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  
    </head>
    
    <body >
        <jsp:include page="WEB-INF/menu.jsp"/><br><br>
        <h1 class ="display-1 text-primary"  align  ="center">
                Editar Productos
           
        </h1><br>
        <form action="ProductosController" name="frmProductos" method="POST"  id="frmProductos" >
            <input type="hidden" name="id" value="${prod.id}">
            <table ALIGN="center">

                <tr>
                    <td><label for=""class="text-primary">Nombre del Producto:  </label></td>
                    <td><input type="text" name="nombre_producto" id="nombre_producto" value="${prod.nombre_producto}">
                    </td>
                </tr>
                <tr>
                    <td><label for=""class="text-primary">precio :  </label></td>
                    <td><input type="text" name="precio" id="precio" value="${prod.precio}">
                    </td>
                </tr>
                
                <tr>
                    <td><label for=""class="text-primary">Descripcion:  </label></td>
                    <td><textarea name="descripcion" rows="6" cols="30" id="descripcion" value="${prod.descripcion}"></textarea>
                    </td>
                
                </tr>
                
                <tr>
                    <td><label for="" class="text-primary">Marca:  </label></td>
                    <td><input type="text" name="marca" id="marca" value="${prod.marca}" >
                    </td>
                </tr>
                <tr>
                    <td><label for="" class="text-primary">Stock:  </label></td>
                    <td><input type="text" name="stock" id="stock" value="${prod.stock}">
                    </td>
                </tr>
                <tr>
                    <td><label for="" class="text-primary">Estado:  </label></td>
                    <td>
                       <select name="estado" id="estado" name="estado" value="${prod.estado}">
                        <option value="promocion" >Promocion</option>
                        <option value="disponible"  selected>Disponible</option>
                        <option value="agotado" >Agotado</option>
                      </select> 
                    </td>
                </tr>
                <tr>
                    <td><label for=""class="text-primary">Proveedor:  </label></td>
                    <td>
                        <select id="proveedores" name="proveedores" value="${prod.id_proveedores}">
                          <% String sql="select * from proveedores";
                               ps = conn.prepareStatement(sql);
                                rs = ps.executeQuery();  
                                while(rs.next()){%>
                                <option value= '<%=rs.getString(1)%>' id='proveedores'><%=rs.getString(2)%></option>
                             <% }%>
                                 
                          %> 
                    </td>
                </tr>
                <tr>
                    <td><label for=""class="text-primary">Categoria:  </label></td>
                    <td><select id="categoria" name="categoria" value="${prod.id_categoria}">
                        <% String sql1="select * from categoria";
                               ps = conn.prepareStatement(sql1);
                                rs = ps.executeQuery();  
                                while(rs.next()){%>
                                <option value= '<%=rs.getString(1)%>' id='proveedores'><%=rs.getString(2)%></option>
                             <% }%>
                                 
                          %> 
                        </select>
                    </td>
                </tr>
               
                <tr>
                    <td> </td>
                    <td><input class="btn btn-danger"type="submit" value="Enviar" /></td>
                </tr>
            </table>

        </form>
                             
                    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
           
    </body>
</html>
