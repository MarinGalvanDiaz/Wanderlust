<%-- 
    Document   : Datos_graficaA
    Created on : 18 abr 2023, 11:23:18
    Author     : alumno
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
<html>
    <%
    int idUsuario2 = (int) session.getAttribute("IdUsuario");  
   System.out.println("Id de usuario "+idUsuario2);
   request.setAttribute("Usuario", idUsuario2);
    conexion con = new conexion();
    Connection cn300 = con.conectar();
    PreparedStatement ps300 = cn300.prepareStatement("Select * from rendimiento where Id_cliente = (?) and anio = '2010';");
    ps300.setInt(1, idUsuario2);
    ResultSet rs300= ps300.executeQuery();
    if(rs300.next()){
    response.sendRedirect("GraficaAnual.jsp");
    
        }
    %>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" href="imgasesores/logo_sin_fondo.png" type="image/x-icon">
        <title> WANDERLUST </title>
        <link rel="stylesheet" href="Datos_grafica.css">

    </head>
    <body>
        <form action="" method="post">
        <div class="container">
            
        <div class="wrapper element-1">
            
            <div class="title">
                Ingresos anuales
            </div>
            
                <div class="form">
                    <div class="inputfield">
                        <label> 2010 </label>
                        <input type="number" class="input" name="2010" required>
                    </div>  
                    <div class="inputfield">
                        <label> 2011 </label>
                        <input type="number" class="input" name="2011" required>
                    </div>  
                    <div class="inputfield">
                        <label> 2012 </label>
                        <input type="number" class="input" name="2012" required>
                    </div>  
                    <div class="inputfield">
                        <label> 2013 </label>
                        <input type="number" class="input" name="2013" required>
                    </div>  
                    <div class="inputfield">
                        <label> 2014 </label>
                        <input type="number" class="input" name="2014" required>
                    </div>  
                    <div class="inputfield">
                        <label> 2015 </label>
                        <input type="number" class="input" name="2015" required>
                    </div>  
                    <div class="inputfield">
                        <label> 2016 </label>
                        <input type="number" class="input" name="2016" required>
                    </div>  
                    <div class="inputfield">
                        <label> 2017 </label>
                        <input type="number" class="input" name="2017" required>
                    </div> 
                    <div class="inputfield">
                        <label> 2018 </label>
                        <input type="number" class="input" name="2018" required>
                    </div>
                    <div class="inputfield">
                        <label> 2019 </label>
                        <input type="number" class="input" name="2019" required>
                    </div>     
                    <div class="inputfield">
                        <label> 2020 </label>
                        <input type="number" class="input" name="2020" required>
                    </div>  
                    <div class="inputfield">
                        <label> 2021 </label>
                        <input type="number" class="input" name="2021" required>
                    </div>  
                    <div class="inputfield">
                        <label> 2022 </label>
                        <input type="number" class="input" name="2022" required>
                    </div>  
                    <div class="inputfield">
                        <label> 2023 </label>
                        <input type="number" class="input" name="2023" required>
                    </div>  
                    <br><br>
                    
                </div>
                
            
        </div>
            <div class="wrapper element-2">
            <div class="title">
                Gastos anuales
            </div>
            
                <div class="form">
                    <div class="inputfield">
                        <label> 2010 </label>
                        <input type="number" class="input" name="2010b" required>
                    </div>  
                    <div class="inputfield">
                        <label> 2011 </label>
                        <input type="number" class="input" name="2011b" required>
                    </div>  
                    <div class="inputfield">
                        <label> 2012 </label>
                        <input type="number" class="input" name="2012b" required>
                    </div>  
                    <div class="inputfield">
                        <label> 2013 </label>
                        <input type="number" class="input" name="2013b" required>
                    </div>  
                    <div class="inputfield">
                        <label> 2014 </label>
                        <input type="number" class="input" name="2014b" required>
                    </div>  
                    <div class="inputfield">
                        <label> 2015 </label>
                        <input type="number" class="input" name="2015b" required>
                    </div>  
                    <div class="inputfield">
                        <label> 2016 </label>
                        <input type="number" class="input" name="2016b" required>
                    </div>  
                    <div class="inputfield">
                        <label> 2017 </label>
                        <input type="number" class="input" name="2017b" required>
                    </div> 
                    <div class="inputfield">
                        <label> 2018 </label>
                        <input type="number" class="input" name="2018b" required>
                    </div>
                    <div class="inputfield">
                        <label> 2019 </label>
                        <input type="number" class="input" name="2019b" required>
                    </div>     
                    <div class="inputfield">
                        <label> 2020 </label>
                        <input type="number" class="input" name="2020b" required>
                    </div>  
                    <div class="inputfield">
                        <label> 2021 </label>
                        <input type="number" class="input" name="2021b" required>
                    </div>  
                    <div class="inputfield">
                        <label> 2022 </label>
                        <input type="number" class="input" name="2022b" required>
                    </div>  
                    <div class="inputfield">
                        <label> 2023 </label>
                        <input type="number" class="input" name="2023b" required>
                    </div>  
                    <br><br>
                    <div class="inputfield">
                        <input type="submit" value="Register"  class="btn" name="boton">
                       
                    </div>
                </div>
                </div>
                 

        </div>
         <input type="hidden" value="${usuario.id}" name="User">
            </form>
            
            <%
                if (request.getParameter("boton") != null) {

                    int idUsuario = Integer.parseInt(request.getParameter("User"));
                    int diez = Integer.parseInt(request.getParameter("2010"));
                    int once = Integer.parseInt(request.getParameter("2011"));
                    int doce = Integer.parseInt(request.getParameter("2012"));
                    int trece = Integer.parseInt(request.getParameter("2013"));
                    int catorce = Integer.parseInt(request.getParameter("2014"));
                    int quice = Integer.parseInt(request.getParameter("2015"));
                    int dieciseis = Integer.parseInt(request.getParameter("2016"));
                    int diecisiete = Integer.parseInt(request.getParameter("2017"));
                    int dieciocho = Integer.parseInt(request.getParameter("2018"));
                    int diecinueve = Integer.parseInt(request.getParameter("2019"));
                    int veinte = Integer.parseInt(request.getParameter("2020"));
                    int veintiuno = Integer.parseInt(request.getParameter("2021"));
                    int veintidos = Integer.parseInt(request.getParameter("2022"));
                    int veintitres = Integer.parseInt(request.getParameter("2023"));
                    int diezb = Integer.parseInt(request.getParameter("2010b"));
                    int onceb = Integer.parseInt(request.getParameter("2011b"));
                    int doceb = Integer.parseInt(request.getParameter("2012b"));
                    int treceb = Integer.parseInt(request.getParameter("2013b"));
                    int catorceb = Integer.parseInt(request.getParameter("2014b"));
                    int quiceb = Integer.parseInt(request.getParameter("2015b"));
                    int dieciseisb = Integer.parseInt(request.getParameter("2016b"));
                    int diecisieteb = Integer.parseInt(request.getParameter("2017b"));
                    int dieciochob = Integer.parseInt(request.getParameter("2018b"));
                    int diecinueveb = Integer.parseInt(request.getParameter("2019b"));
                    int veinteb = Integer.parseInt(request.getParameter("2020b"));
                    int veintiunob = Integer.parseInt(request.getParameter("2021b"));
                    int veintidosb = Integer.parseInt(request.getParameter("2022b"));
                    int veintitresb = Integer.parseInt(request.getParameter("2023b"));
                    String tipo1 = "ingreso";
                    String tipo2 = "gasto";

                    String mes = null;

                    try {

                        
                        

                        Connection cn2 = con.conectar();
                        PreparedStatement ps2 = null;
                        String sql2 = "Insert into rendimiento values (default, (?) ,(?),(?),(?),(?));";
                        ps2 = cn2.prepareStatement(sql2);
                        ps2.setString(1, "2010");
                        ps2.setString(2, mes);
                        ps2.setInt(3, diez);
                        ps2.setString(4, tipo1);
                        ps2.setInt(5, idUsuario);
                        ps2.executeUpdate();

                        Connection cn3 = con.conectar();
                        PreparedStatement ps3 = null;
                        //String sql3 = "Insert into rendimiento values (default, (?) ,(?),(?),(?));";
                        ps3 = cn3.prepareStatement(sql2);
                        ps3.setString(1, "2011");
                        ps3.setString(2, mes);
                        ps3.setInt(3, once);
                        ps3.setString(4, tipo1);
                        ps3.setInt(5, idUsuario);
                        ps3.executeUpdate();

                        Connection cn4 = con.conectar();
                        PreparedStatement ps4 = null;
                        String sql4 = "Insert into rendimiento values (default, (?) ,(?),(?),(?));";
                        ps4 = cn4.prepareStatement(sql2);
                        ps4.setString(1, "2012");
                        ps4.setString(2, mes);
                        ps4.setInt(3, doce);
                        ps4.setString(4, tipo1);
                        ps4.setInt(5, idUsuario);
                        ps4.executeUpdate();

                        Connection cn5 = con.conectar();
                        PreparedStatement ps5 = null;
                        String sql5 = "Insert into rendimiento values (default, (?) ,(?),(?),(?));";
                        ps5 = cn5.prepareStatement(sql2);
                        ps5.setString(1, "2013");
                        ps5.setString(2, mes);
                        ps5.setInt(3, trece);
                        ps5.setString(4, tipo1);
                        ps5.setInt(5, idUsuario);
                        ps5.executeUpdate();

                        Connection cn6 = con.conectar();
                        PreparedStatement ps6 = null;
                        String sql6 = "Insert into rendimiento values (default, (?) ,(?),(?),(?));";
                        ps6 = cn6.prepareStatement(sql2);
                        ps6.setString(1, "2014");
                        ps6.setString(2, mes);
                        ps6.setInt(3, catorce);
                        ps6.setString(4, tipo1);
                        ps6.setInt(5, idUsuario);
                        ps6.executeUpdate();

                        Connection cn7 = con.conectar();
                        PreparedStatement ps7 = null;
                        String sql7 = "Insert into rendimiento values (default, (?) ,(?),(?),(?));";
                        ps7 = cn7.prepareStatement(sql2);
                        ps7.setString(1, "2015");
                        ps7.setString(2, mes);
                        ps7.setInt(3, quice);
                        ps7.setString(4, tipo1);
                        ps7.setInt(5, idUsuario);
                        ps7.executeUpdate();

                        Connection cn8 = con.conectar();
                        PreparedStatement ps8 = null;
                        String sql8 = "Insert into rendimiento values (default, (?) ,(?),(?),(?));";
                        ps8 = cn8.prepareStatement(sql2);
                        ps8.setString(1, "2016");
                        ps8.setString(2, mes);
                        ps8.setInt(3, dieciseis);
                        ps8.setString(4, tipo1);
                        ps8.setInt(5, idUsuario);
                        ps8.executeUpdate();

                        Connection cn9 = con.conectar();
                        PreparedStatement ps9 = null;
                        String sql9 = "Insert into rendimiento values (default, (?) ,(?),(?),(?));";
                        ps9 = cn9.prepareStatement(sql2);
                        ps9.setString(1, "2017");
                        ps9.setString(2, mes);
                        ps9.setInt(3, diecisiete);
                        ps9.setString(4, tipo1);
                        ps9.setInt(5, idUsuario);
                        ps9.executeUpdate();

                        Connection cn10 = con.conectar();
                        PreparedStatement ps10 = null;
                        String sql10 = "Insert into rendimiento values (default, (?) ,(?),(?),(?));";
                        ps10 = cn10.prepareStatement(sql2);
                        ps10.setString(1, "2018");
                        ps10.setString(2, mes);
                        ps10.setInt(3, dieciocho);
                        ps10.setString(4, tipo1);
                        ps10.setInt(5, idUsuario);
                        ps10.executeUpdate();

                        Connection cn11 = con.conectar();
                        PreparedStatement ps11 = null;
                        String sql11 = "Insert into rendimiento values (default, (?) ,(?),(?),(?));";
                        ps11 = cn11.prepareStatement(sql2);
                        ps11.setString(1, "2019");
                        ps11.setString(2, mes);
                        ps11.setInt(3, diecinueve);
                        ps11.setString(4, tipo1);
                        ps11.setInt(5, idUsuario);
                        ps11.executeUpdate();

                        Connection cn12 = con.conectar();
                        PreparedStatement ps12 = null;
                        String sql12 = "Insert into rendimiento values (default, (?) ,(?),(?),(?));";
                        ps12 = cn12.prepareStatement(sql2);
                        ps12.setString(1, "2020");
                        ps12.setString(2, mes);
                        ps12.setInt(3, veinte);
                        ps12.setString(4, tipo1);
                        ps12.setInt(5, idUsuario);
                        ps12.executeUpdate();

                        Connection cn13 = con.conectar();
                        PreparedStatement ps13 = null;
                        String sql13 = "Insert into rendimiento values (default, (?) ,(?),(?),(?));";
                        ps13 = cn13.prepareStatement(sql2);
                        ps13.setString(1, "2021");
                        ps13.setString(2, mes);
                        ps13.setInt(3, veintiuno);
                        ps13.setString(4, tipo1);
                        ps13.setInt(5, idUsuario);
                        ps13.executeUpdate();
                        
                        
                        Connection cn14 = con.conectar();
                        PreparedStatement ps14 = null;
                        String sql14 = "Insert into rendimiento values (default, (?) ,(?),(?),(?));";
                        ps14 = cn14.prepareStatement(sql2);
                        ps14.setString(1, "2022");
                        ps14.setString(2, mes);
                        ps14.setInt(3, veintidos);
                        ps14.setString(4, tipo1);
                        ps14.setInt(5, idUsuario);
                        ps14.executeUpdate();
                        
                        
                        Connection cn15 = con.conectar();
                        PreparedStatement ps15 = null;
                        String sql15 = "Insert into rendimiento values (default, (?) ,(?),(?),(?));";
                        ps15 = cn15.prepareStatement(sql2);
                        ps15.setString(1, "2023");
                        ps15.setString(2, mes);
                        ps15.setInt(3, veintitres);
                        ps15.setString(4, tipo1);
                        ps15.setInt(5, idUsuario);
                        ps15.executeUpdate();
                        
                        
                        Connection cn21 = con.conectar();
                        PreparedStatement ps21 = null;
                        
                        ps21 = cn21.prepareStatement(sql2);
                        ps21.setString(1, "2010");
                        ps21.setString(2, mes);
                        ps21.setInt(3, diezb);
                        ps21.setString(4, tipo2);
                        ps21.setInt(5, idUsuario);
                        ps21.executeUpdate();

                        Connection cn31 = con.conectar();
                        PreparedStatement ps31 = null;
                        //String sql3 = "Insert into rendimiento values (default, (?) ,(?),(?),(?));";
                        ps31 = cn31.prepareStatement(sql2);
                        ps31.setString(1, "2011");
                        ps31.setString(2, mes);
                        ps31.setInt(3, onceb);
                        ps31.setString(4, tipo2);
                        ps31.setInt(5, idUsuario);
                        ps31.executeUpdate();

                        Connection cn41 = con.conectar();
                        PreparedStatement ps41 = null;
                        
                        ps41 = cn41.prepareStatement(sql2);
                        ps41.setString(1, "2012");
                        ps41.setString(2, mes);
                        ps41.setInt(3, doceb);
                        ps41.setString(4, tipo2);
                        ps41.setInt(5, idUsuario);
                        ps41.executeUpdate();

                        Connection cn51 = con.conectar();
                        PreparedStatement ps51 = null;
                        
                        ps51 = cn51.prepareStatement(sql2);
                        ps51.setString(1, "2013");
                        ps51.setString(2, mes);
                        ps51.setInt(3, treceb);
                        ps51.setString(4, tipo2);
                        ps51.setInt(5, idUsuario);
                        ps51.executeUpdate();

                        Connection cn61 = con.conectar();
                        PreparedStatement ps61 = null;
                        
                        ps61 = cn61.prepareStatement(sql2);
                        ps61.setString(1, "2014");
                        ps61.setString(2, mes);
                        ps61.setInt(3, catorceb);
                        ps61.setString(4, tipo2);
                        ps61.setInt(5, idUsuario);
                        ps61.executeUpdate();

                        Connection cn71 = con.conectar();
                        PreparedStatement ps71 = null;
                        
                        ps71 = cn71.prepareStatement(sql2);
                        ps71.setString(1, "2015");
                        ps71.setString(2, mes);
                        ps71.setInt(3, quiceb);
                        ps71.setString(4, tipo2);
                        ps71.setInt(5, idUsuario);
                        ps71.executeUpdate();

                        Connection cn81 = con.conectar();
                        PreparedStatement ps81 = null;
                        
                        ps81 = cn81.prepareStatement(sql2);
                        ps81.setString(1, "2016");
                        ps81.setString(2, mes);
                        ps81.setInt(3, dieciseisb);
                        ps81.setString(4, tipo2);
                        ps81.setInt(5, idUsuario);
                        ps81.executeUpdate();

                        Connection cn91 = con.conectar();
                        PreparedStatement ps91 = null;
                
                        ps91 = cn91.prepareStatement(sql2);
                        ps91.setString(1, "2017");
                        ps91.setString(2, mes);
                        ps91.setInt(3, diecisieteb);
                        ps91.setString(4, tipo2);
                        ps91.setInt(5, idUsuario);
                        ps91.executeUpdate();

                        Connection cn101 = con.conectar();
                        PreparedStatement ps101 = null;
                       
                        ps101 = cn101.prepareStatement(sql2);
                        ps101.setString(1, "2018");
                        ps101.setString(2, mes);
                        ps101.setInt(3, dieciochob);
                        ps101.setString(4, tipo2);
                        ps101.setInt(5, idUsuario);
                        ps101.executeUpdate();

                        Connection cn111 = con.conectar();
                        PreparedStatement ps111 = null;
                        
                        ps111 = cn111.prepareStatement(sql2);
                        ps111.setString(1, "2019");
                        ps111.setString(2, mes);
                        ps111.setInt(3, diecinueveb);
                        ps111.setString(4, tipo2);
                        ps111.setInt(5, idUsuario);
                        ps111.executeUpdate();

                        Connection cn121 = con.conectar();
                        PreparedStatement ps121 = null;
                        
                        ps121 = cn121.prepareStatement(sql2);
                        ps121.setString(1, "2020");
                        ps121.setString(2, mes);
                        ps121.setInt(3, veinteb);
                        ps121.setString(4, tipo2);
                        ps121.setInt(5, idUsuario);
                        ps121.executeUpdate();

                        Connection cn131 = con.conectar();
                        PreparedStatement ps131 = null;
                        
                        ps131 = cn131.prepareStatement(sql2);
                        ps131.setString(1, "2021");
                        ps131.setString(2, mes);
                        ps131.setInt(3, veintiunob);
                        ps131.setString(4, tipo2);
                        ps131.setInt(5, idUsuario);
                        ps131.executeUpdate();
                        
                        
                        Connection cn141 = con.conectar();
                        PreparedStatement ps141 = null;
                       
                        ps141 = cn141.prepareStatement(sql2);
                        ps141.setString(1, "2022");
                        ps141.setString(2, mes);
                        ps141.setInt(3, veintidosb);
                        ps141.setString(4, tipo2);
                        ps141.setInt(5, idUsuario);
                        ps141.executeUpdate();
                        
                        
                        Connection cn151 = con.conectar();
                        PreparedStatement ps151 = null;
                        
                        ps151 = cn151.prepareStatement(sql2);
                        ps151.setString(1, "2023");
                        ps151.setString(2, mes);
                        ps151.setInt(3, veintitresb);
                        ps151.setString(4, tipo2);
                        ps151.setInt(5, idUsuario);
                        ps151.executeUpdate();

                        System.out.println(idUsuario);
                        request.setAttribute("User", idUsuario);
                        request.getRequestDispatcher("/Parte2Wanderlust/GraficaAnual.jsp").forward(request, response);
                    } catch (Exception e) {
                       
                    }
                }
            %>
        
    </body>
</html>
