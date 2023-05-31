<%@page import="java.time.LocalDate"%>
<%@page import="Modelo.conexion"%>
<%@page import="java.text.SimpleDateFormat"%>

<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>WANDERLUST</title>
        <link rel="shortcut icon" href="../imgasesores/logo_sin_fondo.png" type="image/x-icon">
        <link rel="stylesheet" href="estilos3.css">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700,800&display=swap" rel="stylesheet"> 
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Coiny&display=swap" rel="stylesheet">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Arimo&display=swap" rel="stylesheet">

    </head>
    <body>
        <header>
            <nav>
                <a href="Editores.jsp">Editor</a>



            </nav>
           
            <div class="wave" style="height: 150px; overflow: hidden;"><svg viewBox="0 0 500 150" preserveAspectRatio="none"
                                                                            style="height: 100%; width: 100%;">
                <path d="M0.00,49.98 C150.00,150.00 349.20,-50.00 500.00,49.98 L500.00,150.00 L0.00,150.00 Z"
                      style="stroke: none; fill: #fff;"></path>
                </svg></div>
        </header>
        <CENTER>
         <section class="textos-header">
                <h2> Modificación de Reportes</h2>

         </section>
        <main>
            <section class="contenedor sobre-nosotros"></section>
            
                <table border="1" width="900" align="center" class="tablilla">
                    <th colspan="3" >Reportes</th>
                    <tr bgcolor="#B5D7EA">


                        <th>ID</th>
                        <th>Descripcion</th>

                        <th>Respuesta</th>
                            <%
                                conexion conection = new conexion();
                                String usuario = request.getParameter("Usuario");
                                Connection cn = null;
                                Connection cn2 = null;
                                Connection cn3 = null;
                                PreparedStatement ps = null;
                                PreparedStatement ps2 = null;
                                PreparedStatement ps3 = null;
                                ResultSet rs = null;
                                ResultSet rs2 = null;

                                try {
                                    String sql = "select Idpregunta,pregunta,respuesta from FAQS where 1=1;";
                                    cn = conection.conectar();
                                    ps = cn.prepareStatement(sql);

                                    rs = ps.executeQuery();

                                    while (rs.next()) {
                            %>
                    </tr>
                    <tr>

                        <td align="center"><%=rs.getInt(1)%></td>
                        <td align="center"><%=rs.getString(2)%></td>
                        <td align="center"><%=rs.getString(3)%></td>


                    </tr>


                    <%
                            }
                            ps.close();
                            cn.close();
                        } catch (SQLException error) {
                            out.print(error.toString());
                        }
                    %>
                </table>
                <form action="" method="post" name="formu">
                    <br>
                 <select id="usuario" name="id" required onchange="actualizar()">
                        <option value="todotonto" selected>Seleccione un Reporte</option>

                        <%
                            String usuario2 = null;
                            String pregunta2 = null;
                            String respuesta2 = null;
                            Connection cn9 = null;
                            PreparedStatement ps9 = null;
                            ResultSet rs9 = null;
                            String sql9 = ("select * from FAQS;");
                            try {
                                cn9 = conection.conectar();
                                ps9 = cn9.prepareStatement(sql9);
                                rs9 = ps9.executeQuery();
                                while (rs9.next()) {
                                    usuario2 = rs9.getString(1);
                                    pregunta2 = rs9.getString(2);
                                    respuesta2 = rs9.getString(3);
                        %>

                        <option value="<%=usuario2%>"><%=rs9.getString(1)%></option>

                    <%
                            }
                        } catch (Exception e) {
                            out.println(e.getMessage());
                            ps9.close();
                            cn9.close();
                        }
                    %>
                    <input type="hidden" name="preguntaobt" id="preguntaobt" value="<%=pregunta2%>"> 
                    <input type="hidden" name="respuestaobt" id="respuestaobt" value="<%=respuesta2%>"> 
                    </select>
                        Pregunta <input style="color: white"  class="textito" type="text" name="pregunta" id="pregunta" required>
                        Respuesta <input style="color: white"  class="textito" type="text" name="respuesta" id="respuesta" required>

                    <br><br>

                    <input class="btn-custom" type="submit" name="modificar" value="Cambiar">

                    <br><br><br>
                </form>
                <form method="post" action="CambiosEditor.jsp">
                    <input type="submit" name="Jaqui" value="Actualizar" class="btn-custom" id="jaqui">
                    </form>
                <%
                    if (request.getParameter("modificar") != null) {
                        try {

                            String sql4 = "Update FAQS set pregunta=(?),respuesta=(?),fecha=(?) where Idpregunta=(?);";
                            Connection cn5 = null;
                            PreparedStatement ps5 = null;
                            ResultSet rs5 = null;
                            cn5 = conection.conectar();
                            ps5 = cn5.prepareStatement("select * from FAQS where Idpregunta=(?);");
                            int id = Integer.parseInt(request.getParameter("id"));
                            ps5.setInt(1, id);
                            rs5 = ps5.executeQuery();
                            if (rs5.next()) {

                                String pregunta = request.getParameter("pregunta");
                                String respuesta = request.getParameter("respuesta");
                                java.sql.Date dia = java.sql.Date.valueOf(LocalDate.now());
                                cn2 = conection.conectar();
                                ps2 = cn2.prepareStatement(sql4);
                                ps2.setInt(4, id);
                                ps2.setString(1, pregunta);
                                ps2.setString(2, respuesta);
                                ps2.setDate(3, dia);
                                ps2.executeUpdate();
                                //request.getRequestDispatcher("/Soporte/EditorMain.html").forward(request, response);
                                out.println("<script>alert('Modificado');</script>");
                                out.println("<script>");
                                            out.println("(function(){");
                                            out.println("var boton = document.getElementById('jaqui');");
                                            out.println("boton.click();");
                                            out.println("})();");
                                            out.println("</script>");
                            } else {
                                out.println("<script>alert('No existe esa pregunta')</script>");

                            }

                        } catch (SQLException error) {
                            out.print(error.toString());
                        }
                    }
                %>

            </CENTER>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
        </main>
        <footer>
            <h2 class="titulo-final">&copy; Speed Experience | Todos los derechos reservados</h2>
        </footer>
                 <script>

            function actualizar() {

                var usuario = document.getElementById("usuario");
                var pregunta = document.getElementById("pregunta");

                var respuesta = document.getElementById("respuesta");


                if (usuario.value !== "todotonto") {
                    var pregunta2 = document.getElementById("preguntaobt").value;
                    var respuesta2 = document.getElementById("respuestaobt").value;

                    pregunta.value = pregunta2;
                    respuesta.value = respuesta2;
                    alert('Pregunta pre rellenada');
                } else {
                    alert("Seleccione un reporte");
                }
            }
        </script>
    </body>
</html>
