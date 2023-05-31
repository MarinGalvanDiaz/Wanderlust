/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import java.sql.*;

/**
 *
 * @author chang
 */
public class verifusuario extends conexion {

    public usuario identificar(usuario user) throws Exception {
        usuario usu = null;
        conexion con;
        Connection cn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql2 = "SELECT * FROM cliente WHERE Usuario_cliente = (?) AND Contrasenia_cliente = (?);";
        
        con = new conexion();
        try {
            cn = con.conectar();
            ps = cn.prepareStatement(sql2);
            ps.setString(1, user.getUsuario());
            ps.setString(2, user.getContrasenia());

            rs = ps.executeQuery();
            if (rs.next() == true) {
                usu = new usuario();
                usu.setId(rs.getInt(1));
                usu.setUsuario(user.getUsuario());
                usu.setNombre(rs.getString(2));
                usu.setApellido(rs.getString(3));
                usu.setSexo(rs.getString(4));
                usu.setEmail(rs.getString(5));
                usu.setBytes(rs.getBytes(6));
                usu.setContrasenia(user.getContrasenia());
                usu.setCuestionario1(rs.getInt(9));
                usu.setCuestionario2(rs.getInt(10));
                System.out.println("Encontrado");
            } else {
                System.out.println("algo tamal");

            }
        } catch (Exception e) {
            System.out.println("Error" + e.getMessage());
        } finally {
            if (rs != null && rs.isClosed() == false) {
                rs.close();
            }
            rs = null;
            if (ps != null && ps.isClosed() == false) {
                ps.close();
            }
            ps = null;
            if (cn != null && cn.isClosed() == false) {
                cn.close();
            }
            cn = null;
        }
        return usu;
    }

}
