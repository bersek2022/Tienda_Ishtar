package com.emergentes.utiles;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ConexionBD {
        static String driver="com.mysql.jdbc.Driver";
    static String url = "jdbc:mysql://localhost:33065/consulta_1";
    static String usuario ="root";
    static String password = "";
   protected  Connection conn = null;
    
    public ConexionBD(){
        try{
            //especificacion del driver
            Class.forName(driver);
            //establece la conexion a la basede datos
            conn=DriverManager.getConnection(url, usuario , password);
            //Verificar si la conexion fue exitosa
            if(conn !=null){
                System.out.println("Conexion OK:  "+ conn);
            }
        } catch(SQLException ex){
            System.out.println("Error de SQL "+ ex.getMessage());
        } catch (ClassNotFoundException ex){
            Logger.getLogger(ConexionBD.class.getName()).log(Level.SEVERE,null,ex);
        }
    }
    
    public Connection getConnection(){
        return conn;
    }

public void desconectar(){
    try{
        conn.close();
    }catch (SQLException ex){
        Logger.getLogger(ConexionBD.class.getName()).log(Level.SEVERE,null,ex);
    }
    
}

    public Connection conectar() {
    return conn;    
    }
}
