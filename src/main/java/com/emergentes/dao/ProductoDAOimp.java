package com.emergentes.dao;

import com.emergentes.modelo.Productos;
import com.emergentes.utiles.ConexionBD;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductoDAOimp extends ConexionBD implements ProductoDAO {

    @Override
    public void insert(Productos producto) throws Exception {
        String sql = "insert into productos (nombre_producto,imagen_1,imagen_2,precio,descripcion,marca,stock,estado,id_proveedores,id_categoria) values (?,?,?,?,?,?,?,?,?,?)";
        this.conectar();
        PreparedStatement ps = this.conn.prepareStatement(sql);
        ps.setString(1, producto.getNombre_producto());
        ps.setString(2, producto.getImagen_1());
        ps.setString(3, producto.getImagen_2());
        ps.setDouble(4, producto.getPrecio());
        ps.setString(5, producto.getDescripcion());
        ps.setString(6, producto.getMarca());
        ps.setInt(7, producto.getStock());
        ps.setString(8, producto.getEstado());
        ps.setInt(9, producto.getId_proveedores());
        ps.setInt(9, producto.getId_categoria());

        ps.executeUpdate();
        this.desconectar();
    }

    @Override
    public void update(Productos producto) throws Exception {
        String sql = "update productos set nombre_producto=?,imagen_1 =?,imagen_2 =?,precio=? ,descripcion=? ,marca=?,stock=?,estado=?,id_proveedores=?,id_categoria=?where id=?";
        this.conectar();
        PreparedStatement ps = this.conn.prepareStatement(sql);
        ps.setString(1, producto.getNombre_producto());
        ps.setString(2, producto.getImagen_1());
        ps.setString(3, producto.getImagen_2());
        ps.setDouble(4, producto.getPrecio());
        ps.setString(5, producto.getDescripcion());
        ps.setString(6, producto.getMarca());
        ps.setInt(7, producto.getStock());
        ps.setString(8, producto.getEstado());
        ps.setInt(9, producto.getId_proveedores());
        ps.setInt(9, producto.getId_categoria());

        ps.executeUpdate();
        this.desconectar();
    }

    @Override
    public void delete(int id) throws Exception {
        String sql = "delete from productos where id = ?";
        this.conectar();
        PreparedStatement ps = this.conn.prepareStatement(sql);
        ps.setInt(1, id);
        ps.executeUpdate();
        this.desconectar();
    }

    @Override
    public Productos getById(int id) throws Exception {
        Productos pro = new Productos();
        String sql = "select * from productos where id = ?";
        this.conectar();
        PreparedStatement ps = this.conn.prepareStatement(sql);
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            pro.setId(rs.getInt("id"));

            pro.setNombre_producto(rs.getString("nombre_producto"));
            pro.setImagen_1(rs.getString("imagen_1"));
            pro.setImagen_2(rs.getString("imagen_2"));
            pro.setPrecio(rs.getDouble("precio"));
            pro.setDescripcion(rs.getString("descripcion"));
            pro.setMarca(rs.getString("marca"));
            pro.setStock(rs.getInt("stock"));
            pro.setEstado(rs.getString("estado"));
            pro.setId_proveedores(rs.getInt("proveedores"));
            pro.setId_categoria(rs.getInt("categoria"));
        }
        this.desconectar();
        return pro;
    }

    @Override
    public List<Productos> getAll() throws Exception {
        List<Productos> list = null;
        String sql = "select * from productos";
        this.conectar();
        PreparedStatement ps = this.conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        list = new ArrayList<Productos>();
        while (rs.next()) {
            Productos pro = new Productos();
            pro.setId(rs.getInt("id"));

            pro.setNombre_producto(rs.getString("nombre_producto"));
            pro.setImagen_1(rs.getString("imagen_1"));
            pro.setImagen_2(rs.getString("imagen_2"));
            pro.setPrecio(rs.getDouble("precio"));
            pro.setDescripcion(rs.getString("descripcion"));
            pro.setMarca(rs.getString("marca"));
            pro.setStock(rs.getInt("stock"));
            pro.setEstado(rs.getString("estado"));
            pro.setId_proveedores(rs.getInt("proveedores"));
            pro.setId_categoria(rs.getInt("categoria"));

            list.add(pro);
        }
        this.desconectar();
        return list;
    }

}
