/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author alumno
 */
public class verifafinanciero extends conexion{
     public Afinaciero identificar(Afinaciero user) throws Exception {
        Afinaciero usu = null;
        conexion con;
        Connection cn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "select * from asesor_financiero where Usuario='" + user.getUsuario() + "' and Contra='" + user.getContra() + "'; ";
        String sql2 = "SELECT * FROM asesor_financiero WHERE Usuario = (?) AND Contra = (?);";

        
        con = new conexion();
        try {
            cn = con.conectar();
            ps = cn.prepareStatement(sql2);
            ps.setString(1, user.getUsuario());
            ps.setString(2, user.getContra());
            rs = ps.executeQuery();
            if (rs.next() == true) {
                usu = new Afinaciero();
                usu.setId(rs.getInt(1));
                usu.setUsuario(user.getUsuario());
                usu.setEmail(rs.getString(3));
                usu.setContra(user.getContra());
                usu.setNumero(rs.getString(5));
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
