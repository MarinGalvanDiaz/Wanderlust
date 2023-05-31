<%-- 
    Document   : Asistente
    Created on : 31 mar 2023, 22:19:23
    Author     : chang
--%>
<%@page import="java.text.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="jakarta.mail.*"%>
<%@page import="jakarta.mail.internet.*"%>
<%@page import="Controlador.Correo"%>
<%@page import="java.sql.*"%>
<%@page import="java.time.*"%>
<%@page import="Modelo.conexion"%>
<%@page import="Modelo.usuario"%>


<!DOCTYPE html>
<%
    //Soporte sop = new Soporte();
    //System.out.println(sop.getIdSoporte());
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Asistente</title>
    </head>
    <body>
        <form action="" method="post">
            <input type="text" name="Usuario" placeholder="Ingrese el usuario" required pattern="[A-Za-z]{2-15}" title="Ingrese el usuario"> 
            <input type="text" name="Reporte" placeholder="Ingrese el reporte" required pattern="[A-Za-z]{2-15}" title="Ingrese el reporte"> 
            
            <input type="hidden" name="Asistente" value=${Soporte.idSoporte}>
            <button type="submit" name="subir" value="subir">Buscar</button>
            <a href="#">${msje}</a>
        </form>
        <%
            if (request.getParameter("subir") != null) {
                conexion conection = new conexion();
                String usuario = request.getParameter("Usuario");
                Connection cn = null;
                Connection cn2 = null;
                PreparedStatement ps = null;
                PreparedStatement ps2 = null;
                ResultSet rs = null;
                String sql2 = "insert into Reporte values(default,(?),(?),(?),(?),(?),(?),(?))";

                String reporte = request.getParameter("Reporte");
                System.out.println(reporte);
                //int asistente = Integer.parseInt(request.getParameter("Asistente"));
                //System.out.println(asistente);
                java.sql.Date dia = java.sql.Date.valueOf(LocalDate.now());
                java.util.Date date = new java.util.Date();
                Timestamp timestamp = new Timestamp(date.getTime());
                String sql = "select Id_cliente from cliente where Usuario_cliente=(?);";
                try {

                    cn = conection.conectar();
                    ps = cn.prepareStatement(sql);
                    ps.setString(1, usuario);
                    rs = ps.executeQuery();

                    if (rs.next()) {
                        int idusu = rs.getInt(1);
                        System.out.println(idusu);
                        cn2 = conection.conectar();
                        ps2 = cn2.prepareStatement(sql2);
                        ps2.setString(1, reporte);
                        ps2.setTimestamp(2, timestamp);
                        ps2.setDate(3, dia);
                        ps2.setString(4, "Abierto");
                        ps2.setInt(5, idusu);
                        ps2.setInt(6, 3);
                        ps2.setString(7, " ");
                        ps2.executeUpdate();
                        request.setAttribute("msje", "Reporte guardado");
                        request.getRequestDispatcher("/AsistenteMain.html").forward(request, response);

                    } else {
                        System.out.println("No se que paso xd");
                        request.setAttribute("msje", "Usuario no encontrado");
                        request.getRequestDispatcher("/AsistenteMain.html").forward(request, response);
                    }

                } catch (Exception e) {
                    System.out.println("Error" + e.getMessage());
                }

            }

        %>

    </body>
</html>