<%-- 
    Document   : Asesorfinanciero
    Created on : 25 abr 2023, 12:16:26
    Author     : alumno
--%>

<%@page import="Modelo.Message"%>
<%@page import="java.sql.*"%>
<%@page import="Modelo.conexion"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.Afinaciero" %>
<!DOCTYPE html>
<%
    ArrayList<Message> messages = new ArrayList<>();
    try {
        conexion conection = new conexion();
        String usuario = request.getParameter("Usuario");
        Connection cn = null;
        String sql= "Select id,usuario,idusuario,mensaje,DATE_FORMAT(fecha, 'a las %h:%i:%s %p') as date from mensajes order by fecha limit 100";
        PreparedStatement ps;
        cn = conection.conectar();
        ps = cn.prepareStatement(sql);
        ResultSet rs;
        rs = ps.executeQuery();
        
        while(rs.next()){
        
    }
        
    } catch (Exception e) {
    }

%>
