<%-- 
    Document   : Datos_graficaM
    Created on : 17 abr 2023, 23:54:57
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
<html lang="en">
    <%
   int idUsuario2 = (int) session.getAttribute("IdUsuario");  
   System.out.println("Id de usuario "+idUsuario2);
   request.setAttribute("Usuario", idUsuario2);
    conexion con = new conexion();
    Connection cn300 = con.conectar();
    PreparedStatement ps300 = cn300.prepareStatement("Select * from rendimiento where Id_cliente = (?) and mes = 'Enero';");
    ps300.setInt(1, idUsuario2);
    ResultSet rs300= ps300.executeQuery();
    if(rs300.next()){
    response.sendRedirect("GraficaMensual.jsp");
    
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
<div class="wrapper">
    <div class="title">
      Ingresos mensuales
    </div>
    
    <div class="form">
       <div class="inputfield">
          <label> Enero </label>
          <input type="number" class="input" name="enero" required>
       </div>  
        <div class="inputfield">
          <label> Febrero </label>
          <input type="number" class="input" name="febrero" required>
       </div>  
       <div class="inputfield">
          <label> Marzo</label>
          <input type="number" class="input" name="marzo" required>
       </div>  
       <div class="inputfield">
        <label> Abril</label>
        <input type="number" class="input" name="abril" required>
     </div>  
     <div class="inputfield">
        <label> Mayo</label>
        <input type="number" class="input" name="mayo" required>
     </div>  
     <div class="inputfield">
        <label> Junio </label>
        <input type="number" class="input" name="junio" required>
     </div>  
     <div class="inputfield">
        <label> Julio</label>
        <input type="number" class="input" name="julio" required>
     </div>  
     <div class="inputfield">
        <label> Agosto</label>
        <input type="number" class="input" name="agosto" required>
     </div> 
     <div class="inputfield">
        <label> Septiembre </label>
        <input type="number" class="input" name="septiembre" required>
     </div>
     <div class="inputfield">
        <label> Octubre </label>
        <input type="number" class="input" name="octubre" required>
     </div>     
     <div class="inputfield">
        <label> Noviembre </label>
        <input type="number" class="input" name="noviembre" required>
     </div>  
     <div class="inputfield">
        <label> Diciembre</label>
        <input type="number" class="input" name="diciembre" required>
     </div>  
    <br><br>
      
    </div>
        <input type="hidden" value="${usuario.id}" name="User">
	</div>
        <div class="wrapper">
    <div class="title">
      Gastos mensuales
    </div>
    
    <div class="form">
       <div class="inputfield">
          <label> Enero </label>
          <input type="number" class="input" name="enerob" required>
       </div>  
        <div class="inputfield">
          <label> Febrero </label>
          <input type="number" class="input" name="febrerob" required>
       </div>  
       <div class="inputfield">
          <label> Marzo</label>
          <input type="number" class="input" name="marzob" required>
       </div>  
       <div class="inputfield">
        <label> Abril</label>
        <input type="number" class="input" name="abrilb" required>
     </div>  
     <div class="inputfield">
        <label> Mayo</label>
        <input type="number" class="input" name="mayob" required>
     </div>  
     <div class="inputfield">
        <label> Junio </label>
        <input type="number" class="input" name="juniob" required>
     </div>  
     <div class="inputfield">
        <label> Julio</label>
        <input type="number" class="input" name="juliob" required>
     </div>  
     <div class="inputfield">
        <label> Agosto</label>
        <input type="number" class="input" name="agostob" required>
     </div> 
     <div class="inputfield">
        <label> Septiembre </label>
        <input type="number" class="input" name="septiembreb" required>
     </div>
     <div class="inputfield">
        <label> Octubre </label>
        <input type="number" class="input" name="octubreb" required>
     </div>     
     <div class="inputfield">
        <label> Noviembre </label>
        <input type="number" class="input" name="noviembreb" required>
     </div>  
     <div class="inputfield">
        <label> Diciembre</label>
        <input type="number" class="input" name="diciembreb" required>
     </div>  
    <br><br>
      <div class="inputfield">
          <input type="submit" value="Register" class="btn" name="boton">
      </div>
    </div>
        <input type="hidden" value="${usuario.id}" name="User">
	</div>
    </div>
</form>
        <%
        if(request.getParameter("boton")!=null){
        
        int idUsuario = Integer.parseInt(request.getParameter("User"));
        int enero = Integer.parseInt(request.getParameter("enero"));
        int febrero = Integer.parseInt(request.getParameter("febrero"));
        int marzo = Integer.parseInt(request.getParameter("marzo"));
        int abril = Integer.parseInt(request.getParameter("abril"));
        int mayo = Integer.parseInt(request.getParameter("mayo"));
        int junio = Integer.parseInt(request.getParameter("junio"));
        int julio = Integer.parseInt(request.getParameter("julio"));
        int agosto = Integer.parseInt(request.getParameter("agosto"));
        int septiembre = Integer.parseInt(request.getParameter("septiembre"));
        int octubre = Integer.parseInt(request.getParameter("octubre"));
        int noviembre = Integer.parseInt(request.getParameter("noviembre"));
        int diciembre = Integer.parseInt(request.getParameter("diciembre"));
        
        int enerob = Integer.parseInt(request.getParameter("enerob"));
        int febrerob = Integer.parseInt(request.getParameter("febrerob"));
        int marzob = Integer.parseInt(request.getParameter("marzob"));
        int abrilb = Integer.parseInt(request.getParameter("abrilb"));
        int mayob = Integer.parseInt(request.getParameter("mayob"));
        int juniob = Integer.parseInt(request.getParameter("juniob"));
        int juliob = Integer.parseInt(request.getParameter("juliob"));
        int agostob = Integer.parseInt(request.getParameter("agostob"));
        int septiembreb = Integer.parseInt(request.getParameter("septiembreb"));
        int octubreb = Integer.parseInt(request.getParameter("octubreb"));
        int noviembreb = Integer.parseInt(request.getParameter("noviembreb"));
        int diciembreb = Integer.parseInt(request.getParameter("diciembreb"));
        
        String tipo1 = "ingresomes";
                    String tipo2 = "gastomes";
        String anio = null;
        
        try {
                
            
        
     
        Connection cn2 = con.conectar();
        PreparedStatement ps2 = null;
        String sql2 = "Insert into rendimiento values (default, (?) ,(?),(?),(?),(?));";
        ps2 = cn2.prepareStatement(sql2);
        ps2.setString(1, anio);
        ps2.setString(2, "Enero");
        ps2.setInt(3, enero);
        ps2.setString(4, tipo1);
        ps2.setInt(5, idUsuario);
        ps2.executeUpdate();
        
        Connection cn3 = con.conectar();
        PreparedStatement ps3 = null;
        String sql3 = "Insert into rendimiento values (default, (?) ,(?),(?),(?));";
        ps3 = cn3.prepareStatement(sql2);
        ps3.setString(1, anio);
        ps3.setString(2, "Febrero");
        ps3.setInt(3, febrero);
        ps3.setString(4, tipo1);
        ps3.setInt(5, idUsuario);
        ps3.executeUpdate();
        
        
        Connection cn4 = con.conectar();
        PreparedStatement ps4 = null;
        String sql4 = "Insert into rendimiento values (default, (?) ,(?),(?),(?));";
        ps4 = cn4.prepareStatement(sql2);
        ps4.setString(1, anio);
        ps4.setString(2, "Marzo");
        ps4.setInt(3, marzo);
        ps4.setString(4, tipo1);
        ps4.setInt(5, idUsuario);
        ps4.executeUpdate();
        
        Connection cn5 = con.conectar();
        PreparedStatement ps5 = null;
        String sql5 = "Insert into rendimiento values (default, (?) ,(?),(?),(?));";
        ps5 = cn5.prepareStatement(sql2);
        ps5.setString(1, anio);
        ps5.setString(2, "Abril");
        ps5.setInt(3, abril);
        ps5.setString(4, tipo1);
        ps5.setInt(5, idUsuario);
        ps5.executeUpdate();
        
        Connection cn6 = con.conectar();
        PreparedStatement ps6 = null;
        String sql6 = "Insert into rendimiento values (default, (?) ,(?),(?),(?));";
        ps6 = cn6.prepareStatement(sql2);
        ps6.setString(1, anio);
        ps6.setString(2, "Mayo");
        ps6.setInt(3, mayo);
        ps6.setString(4, tipo1);
        ps6.setInt(5, idUsuario);
        ps6.executeUpdate();
        
        Connection cn7 = con.conectar();
        PreparedStatement ps7 = null;
        String sql7 = "Insert into rendimiento values (default, (?) ,(?),(?),(?));";
        ps7 = cn7.prepareStatement(sql2);
        ps7.setString(1, anio);
        ps7.setString(2, "Junio");
        ps7.setInt(3, junio);
        ps7.setString(4, tipo1);
        ps7.setInt(5, idUsuario);
        ps7.executeUpdate();
        
        Connection cn8 = con.conectar();
        PreparedStatement ps8 = null;
        String sql8 = "Insert into rendimiento values (default, (?) ,(?),(?),(?));";
        ps8 = cn8.prepareStatement(sql2);
        ps8.setString(1, anio);
        ps8.setString(2, "Julio");
        ps8.setInt(3, julio);
        ps8.setString(4, tipo1);
        ps8.setInt(5, idUsuario);
        ps8.executeUpdate();
        
        Connection cn9 = con.conectar();
        PreparedStatement ps9 = null;
        String sql9 = "Insert into rendimiento values (default, (?) ,(?),(?),(?));";
        ps9 = cn9.prepareStatement(sql2);
        ps9.setString(1, anio);
        ps9.setString(2, "Agosto");
        ps9.setInt(3, agosto);
        ps9.setString(4, tipo1);
        ps9.setInt(5, idUsuario);
        ps9.executeUpdate();
        
        Connection cn10 = con.conectar();
        PreparedStatement ps10 = null;
        String sql10 = "Insert into rendimiento values (default, (?) ,(?),(?),(?));";
        ps10 = cn10.prepareStatement(sql2);
        ps10.setString(1, anio);
        ps10.setString(2, "Septiembre");
        ps10.setInt(3, septiembre);
        ps10.setString(4, tipo1);
        ps10.setInt(5, idUsuario);
        ps10.executeUpdate();
        
        Connection cn11 = con.conectar();
        PreparedStatement ps11 = null;
        String sql11 = "Insert into rendimiento values (default, (?) ,(?),(?),(?));";
        ps11 = cn11.prepareStatement(sql2);
        ps11.setString(1, anio);
        ps11.setString(2, "Octubre");
        ps11.setInt(3, octubre);
        ps11.setString(4, tipo1);
        ps11.setInt(5, idUsuario);
        ps11.executeUpdate();
        
        Connection cn12 = con.conectar();
        PreparedStatement ps12 = null;
        String sql12 = "Insert into rendimiento values (default, (?) ,(?),(?),(?));";
        ps12 = cn12.prepareStatement(sql2);
        ps12.setString(1, anio);
        ps12.setString(2, "Noviembre");
        ps12.setInt(3, noviembre);
        ps12.setString(4, tipo1);
        ps12.setInt(5, idUsuario);
        ps12.executeUpdate();
        
        Connection cn13 = con.conectar();
        PreparedStatement ps13 = null;
        String sql13 = "Insert into rendimiento values (default, (?) ,(?),(?),(?));";
        ps13 = cn13.prepareStatement(sql2);
        ps13.setString(1, anio);
        ps13.setString(2, "Diciembre");
        ps13.setInt(3, diciembre);
       ps13.setString(4, tipo1);
        ps13.setInt(5, idUsuario);
        ps13.executeUpdate();
            
        
       
        Connection cn21 = con.conectar();
        PreparedStatement ps21 = null;
        //String sql2 = "Insert into rendimiento values (default, (?) ,(?),(?),(?),(?));";
        ps21 = cn21.prepareStatement(sql2);
        ps21.setString(1, anio);
        ps21.setString(2, "Enero");
        ps21.setInt(3, enerob);
        ps21.setString(4, tipo2);
        ps21.setInt(5, idUsuario);
        ps21.executeUpdate();
        
        Connection cn31 = con.conectar();
        PreparedStatement ps31 = null;
        //String sql31 = "Insert into rendimiento values (default, (?) ,(?),(?),(?));";
        ps31 = cn31.prepareStatement(sql2);
        ps31.setString(1, anio);
        ps31.setString(2, "Febrero");
        ps31.setInt(3, febrerob);
        ps31.setString(4, tipo2);
        ps31.setInt(5, idUsuario);
        ps31.executeUpdate();
        
        
        Connection cn41 = con.conectar();
        PreparedStatement ps41 = null;
        //String sql4 = "Insert into rendimiento values (default, (?) ,(?),(?),(?));";
        ps41 = cn41.prepareStatement(sql2);
        ps41.setString(1, anio);
        ps41.setString(2, "Marzo");
        ps41.setInt(3, marzob);
        ps41.setString(4, tipo2);
        ps41.setInt(5, idUsuario);
        ps41.executeUpdate();
        
        Connection cn51 = con.conectar();
        PreparedStatement ps51 = null;
        //String sql5 = "Insert into rendimiento values (default, (?) ,(?),(?),(?));";
        ps51 = cn51.prepareStatement(sql2);
        ps51.setString(1, anio);
        ps51.setString(2, "Abril");
        ps51.setInt(3, abrilb);
        ps51.setString(4, tipo2);
        ps51.setInt(5, idUsuario);
        ps51.executeUpdate();
        
        Connection cn61 = con.conectar();
        PreparedStatement ps61 = null;
        //String sql6 = "Insert into rendimiento values (default, (?) ,(?),(?),(?));";
        ps61 = cn61.prepareStatement(sql2);
        ps61.setString(1, anio);
        ps61.setString(2, "Mayo");
        ps61.setInt(3, mayob);
        ps61.setString(4, tipo2);
        ps61.setInt(5, idUsuario);
        ps61.executeUpdate();
        
        Connection cn71 = con.conectar();
        PreparedStatement ps71 = null;
        //String sql7 = "Insert into rendimiento values (default, (?) ,(?),(?),(?));";
        ps71 = cn71.prepareStatement(sql2);
        ps71.setString(1, anio);
        ps71.setString(2, "Junio");
        ps71.setInt(3, juniob);
        ps71.setString(4, tipo2);
        ps71.setInt(5, idUsuario);
        ps71.executeUpdate();
        
        Connection cn81 = con.conectar();
        PreparedStatement ps81 = null;
        //String sql8 = "Insert into rendimiento values (default, (?) ,(?),(?),(?));";
        ps81 = cn81.prepareStatement(sql2);
        ps81.setString(1, anio);
        ps81.setString(2, "Julio");
        ps81.setInt(3, juliob);
        ps81.setString(4, tipo2);
        ps81.setInt(5, idUsuario);
        ps81.executeUpdate();
        
        Connection cn91 = con.conectar();
        PreparedStatement ps91 = null;
        //String sql91 = "Insert into rendimiento values (default, (?) ,(?),(?),(?));";
        ps91 = cn91.prepareStatement(sql2);
        ps91.setString(1, anio);
        ps91.setString(2, "Agosto");
        ps91.setInt(3, agostob);
        ps91.setString(4, tipo2);
        ps91.setInt(5, idUsuario);
        ps91.executeUpdate();
        
        Connection cn101 = con.conectar();
        PreparedStatement ps101 = null;
        //String sql10 = "Insert into rendimiento values (default, (?) ,(?),(?),(?));";
        ps101 = cn101.prepareStatement(sql2);
        ps101.setString(1, anio);
        ps101.setString(2, "Septiembre");
        ps101.setInt(3, septiembreb);
        ps101.setString(4, tipo2);
        ps101.setInt(5, idUsuario);
        ps101.executeUpdate();
        
        Connection cn111 = con.conectar();
        PreparedStatement ps111 = null;
        //String sql11 = "Insert into rendimiento values (default, (?) ,(?),(?),(?));";
        ps111 = cn111.prepareStatement(sql2);
        ps111.setString(1, anio);
        ps111.setString(2, "Octubre");
        ps111.setInt(3, octubreb);
        ps111.setString(4, tipo2);
        ps111.setInt(5, idUsuario);
        ps111.executeUpdate();
        
        Connection cn121 = con.conectar();
        PreparedStatement ps121 = null;
        //String sql12 = "Insert into rendimiento values (default, (?) ,(?),(?),(?));";
        ps121 = cn121.prepareStatement(sql2);
        ps121.setString(1, anio);
        ps121.setString(2, "Noviembre");
        ps121.setInt(3, noviembreb);
        ps121.setString(4, tipo2);
        ps121.setInt(5, idUsuario);
        ps121.executeUpdate();
        
        Connection cn131 = con.conectar();
        PreparedStatement ps131 = null;
        //String sql131 = "Insert into rendimiento values (default, (?) ,(?),(?),(?));";
        ps131 = cn131.prepareStatement(sql2);
        ps131.setString(1, anio);
        ps131.setString(2, "Diciembre");
        ps131.setInt(3, diciembreb);
        ps131.setString(4, tipo2);
        ps131.setInt(5, idUsuario);
        ps131.executeUpdate();
        
        System.out.println(idUsuario);
        request.setAttribute("User", idUsuario);
        request.getRequestDispatcher("/Parte2Wanderlust/GraficaMensual.jsp").forward(request, response);
        } catch (Exception e) {
        System.out.println("Error " + e.getMessage());
            }
            }
        %>
       

    
</body>
</html>
