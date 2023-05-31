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
public class DAOSoporte extends conexion{
    public Soporte identificar (Soporte user) throws Exception{
        Soporte usu = null;
        conexion con;
        Connection cn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        String sql = "select Soporte.IdUsuario, Cargo.NombreCargo from Soporte, "
                + "Cargo where Soporte.IdCargo = Cargo.IdCargo and "
                + "Soporte.NombreUsuario= (?) and Soporte.ContraUsuario=(?);";
       con = new conexion();
        try {
            cn=con.conectar();
            ps=cn.prepareStatement(sql);
            ps.setString(1, user.getUsuario());
            ps.setString(2, user.getContraUsuario());
            rs=ps.executeQuery();
            if(rs.next()==true){
                usu = new Soporte();
                usu.setIdSoporte(rs.getInt(1));
                System.out.println(rs.getInt(1));
                usu.setUsuario(user.getUsuario());
                //usu.setCargo(new Cargo());
                //usu.getCargo().setNombreCargo(rs.getString(2));
                usu.setEstado(1);
                System.out.println("Encontrado");
            }
        } catch (Exception e) {
            System.out.println("Error " + e.getMessage());
        }finally{
            if(rs!=null && rs.isClosed() == false){
                rs.close();
            }
            rs = null;
            if(ps!=null && ps.isClosed() == false){
                ps.close();
            }
            ps = null;
        }
        if(cn!=null && cn.isClosed() == false){
                cn.close();
            }
            cn = null;
      return usu;  
    }
}
