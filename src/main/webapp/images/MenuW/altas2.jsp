<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="clasesita.clase"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            clase objeto = new clase();
            if(request.getParameter("altas")!=null){
            int info = Integer.parseInt(request.getParameter("cad"));
            
            String RFC_R = request.getParameter("RFC");
            String Firma_digital_R = request.getParameter("FirmaDigi");
            String Letra = request.getParameter("ltr");
            String Banco_Referencia= request.getParameter("Banco");
            String Num_tarjeta = request.getParameter("NoTarjeta");
            String CURP = request.getParameter("CurP");
            

            Connection conx = null;
            Statement sta = null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                conx = DriverManager.getConnection("jdbc:mysql://localhost/Fondo_financiero3?autoReconnect=true&useSSL=false", "root", "n0m3l0");
                sta = conx.createStatement();
            } catch (SQLException error) {
                out.print(error.toString());
            }
             try {
                sta.executeUpdate("insert into fondo_financiero3 values(default,'" + RFC_R+ "','" + Firma_digital_R + "','" + Letra + "','" + Banco_Referencia + "','" + Num_tarjeta + "'," + CURP + ",'" + info + "');");
                out.println("<script> alert('Datos Guardados')</script>");
                objeto.setNumusuario(info); 
                String prueba = objeto.regresa();
                                    
                RequestDispatcher rd = request.getRequestDispatcher(prueba);
                rd.forward(request, response);
                conx.close();
                sta.close();
            } catch (SQLException error) {
                out.print(error.toString());
            }
            
            }
        %>
    </body>
</html>
