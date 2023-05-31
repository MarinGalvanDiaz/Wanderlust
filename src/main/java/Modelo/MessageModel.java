/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import java.sql.*;
import java.util.ArrayList;

/**
 *
 * @author chang
 */
public class MessageModel {
    
    
    public ArrayList<Message> get(){
     ArrayList<Message> messages = new ArrayList<>();
    try {
        conexion conection = new conexion();
        
        Connection cn = null;
        String sql= "Select id,usuario,idusuario,mensaje,DATE_FORMAT(fecha, '%d-%m-%y a las %h:%i:%s %p') as date from mensajes order by fecha limit 100";
        PreparedStatement ps;
        cn = conection.conectar();
        ps = cn.prepareStatement(sql);
        ResultSet rs;
        rs = ps.executeQuery();
        
        while(rs.next()){
        messages.add(new Message(rs.getInt(1), rs.getString(2),rs.getInt(3),rs.getString(4),rs.getString(5)));
    }
        cn.close();
        rs.close();
        ps.close();
        
    } catch (Exception e) {
    }
    return messages;
}
    public boolean create(Message m){
        conexion conection = new conexion();
        boolean flag = false;
        try {
        PreparedStatement ps = conection.conectar().prepareStatement("Insert into mensajes(usuario,idusuario,mensaje,fecha) values(?,?,?,?)");
            ps.setString(1, m.getUsuario());
            ps.setInt(2, m.getIdusuario());
            ps.setString(3, m.getMensaje());
            ps.setString(4, m.getFecha());
            
            flag = ps.executeUpdate() == 1; 
            conection.conectar().close();
            ps.close();
        } catch (Exception e) {
        }
        return flag;
    }
    public static void main(String[] args) {
        MessageModel mm = new MessageModel();
        mm.create(new Message("Pedro",1,"Hola...","2023-04-26 7:40:25"));
    }
}
