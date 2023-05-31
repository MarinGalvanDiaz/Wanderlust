/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author chang
 */
public class verifSoporte {
   public Soporte identificar(Soporte user) throws Exception {
        Soporte usu = null;
        conexion con;
        Connection cn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        //String sql = "select * from Soporte where Nombreusuario='" + user.getUsuario() + "' and Contra='" + user.getContra() + "'; ";
        String sql2 = "SELECT * FROM Soporte WHERE NombreUsuario = (?) AND ContraUsuario = (?);";

        
        con = new conexion();
        try {
            cn = con.conectar();
            ps = cn.prepareStatement(sql2);
            ps.setString(1, user.getUsuario());
            ps.setString(2, user.getContraUsuario());
            rs = ps.executeQuery();
            if (rs.next() == true) {
                usu = new Soporte();
                usu.setIdSoporte(rs.getInt(1));
                usu.setUsuario(user.getUsuario());
                usu.setContraUsuario(user.getContraUsuario());
                usu.setEstado(rs.getInt(4));
                usu.setCargo(rs.getInt(5));
                System.out.println("Encontrado");
            }else{
                System.out.println("algo tamal");
                
            }
        } catch (Exception e) {
            System.out.println("Error" + e.getMessage());
        } finally {
            if (rs != null && rs.isClosed() == false) {
                rs.close();
            }
            rs = null;
            if(ps != null && ps.isClosed() == false){
                ps.close();
            }
            ps = null;
            if(cn != null && cn.isClosed()==false){
                cn.close();
            }
            cn=null;
        }
        return usu;
    }
}
