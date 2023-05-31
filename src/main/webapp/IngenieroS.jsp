<%@page import="Controlador.Correo"%>
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
        <title>Ingeniero de soporte</title>
        <link rel="shortcut icon" href="img/logoEmpresa.jpg" type="image/x-icon">
        <link rel="stylesheet" href="estilos3.css">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700,800&display=swap" rel="stylesheet"> 
        
    </head>
    <body>
        <header>
            <nav>



            </nav>
            <section class="textos-header">
                <h1>Ingeniero de soporte</h1>

            </section>
            <div class="wave" style="height: 150px; overflow: hidden;"><svg viewBox="0 0 500 150" preserveAspectRatio="none"
                                                                            style="height: 100%; width: 100%;">
                <path d="M0.00,49.98 C150.00,150.00 349.20,-50.00 500.00,49.98 L500.00,150.00 L0.00,150.00 Z"
                      style="stroke: none; fill: #fff;"></path>
                </svg></div>
        </header>
        <main>
            <section class="contenedor sobre-nosotros"></section>
            <CENTER>
                <table border="1" width="900" align="center" class="tablilla">
                    <th colspan="8" >Reportes</th>
                    <tr bgcolor="#D2B2F5">

                        <th>Id Reporte</th>
                        <th>Descripcion</th>
                        <th>Hora</th>
                        <th>Fecha</th>
                        <th>Estatus</th>
                        <th>Id Encargado</th>
                        <th>Id Usuario</th>
                        <th>Respuesta</th>
                            <%
                                conexion conection = new conexion();
                                String usuario = request.getParameter("Usuario");
                                Connection cn = null;
                                Connection cn2 = null;
                                Connection cn3 = null;
                                Connection cn4 = null;
                                PreparedStatement ps = null;
                                PreparedStatement ps2 = null;
                                PreparedStatement ps3 = null;
                                PreparedStatement ps4 = null;
                                ResultSet rs = null;
                                ResultSet rs2 = null;
                                ResultSet rs3 = null;
                                try {
                                    String sql = "select * from reporte where Estatus = 'En proceso';";
                                    cn = conection.conectar();
                                    ps = cn.prepareStatement(sql);

                                    rs = ps.executeQuery();

                                    while (rs.next()) {
                            %>
                    </tr>
                    <tr>

                        <td align="center"><%=rs.getInt(1)%></td>
                        <td align="center"><%=rs.getString(2)%></td>
                        <td align="center"><%=rs.getTime(3)%></td>
                        <td align="center"><%=rs.getDate(4)%></td>
                        <td align="center"><%=rs.getString(5)%></td>
                        <td align="center"><%=rs.getInt(6)%></td>
                        <td align="center"><%=rs.getInt(7)%></td>
                        <td align="center"><%=rs.getString(8)%></td>

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
                    Id del reporte <input type="number" name="reporte" required>
                    Respuesta <input type="text" name="respuesta" placeholder="Dejar vacio si ya hay una respuesta" id="campo">
                    <br><br>

                    <input type="submit" name="modificar" required>

                    <br><br><br>
                </form>
                <%
                    if (request.getParameter("modificar") != null) {
                        try {
                            String sql3 = "select * from Reporte where IdReporte = (?)";
                            String sql4 = "update Reporte set Estatus = (?),IdUsuario = 5,Respuesta =(?) where IdReporte = (?);";
                            int id = Integer.parseInt(request.getParameter("reporte"));
                            String respuesta = null;
                            cn2 = conection.conectar();
                            ps2 = cn2.prepareStatement(sql4);
                            cn3 = conection.conectar();
                            ps3 = cn3.prepareStatement(sql3);
                            ps3.setInt(1, id);
                            rs2 = ps3.executeQuery();
                            if (rs2.next()) {
                                if (rs2.getString(5).equals("En proceso")) {
                                    if(rs2.getString(8)!=""){
                                    respuesta = rs2.getString(8);
                                    }else if(rs2.getString(8).equals("")){
                                    respuesta = request.getParameter("respuesta");
                                    if(respuesta.equals(null)){
                                    out.println("<script>alert('Ingrese una respuesta')</script>");
                                    request.getRequestDispatcher("/IngenieroSMain.html").forward(request, response);
                    }
                    }
                                    System.out.println(rs2.getString(5));
                                    ps2.setString(1, "Cerrado");
                                    ps2.setString(2, respuesta);
                                    ps2.setInt(3, id);
                                    ps2.executeUpdate();
                                    cn3 = conection.conectar();
                                    int idusu = rs2.getInt(6);
                                    ps4 = cn3.prepareStatement("select Email_cliente from cliente where Id_cliente = (?);");
                                    ps4.setInt(1, idusu);
                                    rs3 = ps4.executeQuery();
                                    
                                    
                                    if (rs3.next()) {
                                    
                                        String host = "smtp.gmail.com";
                                        String port = "465";
                                        String username = "speedexperienceexp@gmail.com";
                                        String password = "kwkgaogbmuzeoutp";
                                        boolean sslEnabled = true;

                                        Correo sender = new Correo(host, port, username, password, sslEnabled);

                                        String to = rs3.getString(1);
                                        System.out.println(rs3.getString(1));
                                        String subject = "Respuesta al reporte: " + rs2.getString(2);
                                        System.out.println(rs2.getString(2));
                                        String message = respuesta;
                                        System.out.println(respuesta);

                                        try {
                                            sender.sendEmail(to, subject, message);
                                            System.out.println("Correo electrónico enviado con éxito.");
                                        } catch (Exception ex) {
                                            System.out.println("Error al enviar el correo electrónico: " + ex.getMessage());
                                        }
                                    }
                                    request.getRequestDispatcher("/IngenieroSMain.html").forward(request, response);
                                } else {
                                    out.println("<script>alert('La asignacion se a realizado antes')</script>");
                                    request.getRequestDispatcher("/IngenieroSMain.html").forward(request, response);
                                }
                            } else {
                                System.out.println(rs2.getString(5));
                                out.println("<script>alert('No existe ese reporte')</script>");
                                request.getRequestDispatcher("/IngenieroSMain.html").forward(request, response);
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
            <div class="contenedor-footer">
                <div class="content-foo">
                    <h4>Telefono</h4>
                    <p>5510600720</p>
                </div>
                <div class="content-foo">
                    <h4>Email</h4>
                    <p>angeles.alpuche.andrea@gmail.com</p>
                </div>
                <div class="content-foo">
                    <h4>Ubicación</h4>
                    <p>Popotla, pregunte por Andrea</p>
                </div>
            </div>
            <h2 class="titulo-final">&copy; Speed Experience | Todos los derechos reservados</h2>
        </footer>
    </body>
</html>
