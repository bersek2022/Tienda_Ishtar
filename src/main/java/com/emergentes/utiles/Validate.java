
package com.emergentes.utiles;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;


public class Validate extends ConexionBD{
    Connection conn=this.conectar();
    PreparedStatement ps;
    
    public boolean chekUser(String correo, String password){
       boolean resultado=false;
        try{
        
        String sql="select *  from usuarios where correo=? and password= ?";
        
        ps=conn.prepareStatement(sql);
        ps.setString(1, correo);
        ps.setString(2, password);
        ResultSet rs= ps.executeQuery();
        resultado=rs.next();
       }catch(Exception ex){
          System.out.println("ERROR AL AUTENTIFICAR");
       }
        return resultado;
    }
    
            
}
