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
        <title>Gerente de soporte</title>
        <link rel="shortcut icon" href="img/logoEmpresa.jpg" type="image/x-icon">
        <link rel="stylesheet" href="estilos3.css">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700,800&display=swap" rel="stylesheet"> 

    </head>
    <body>
        <header>
            <nav>
                <a href="IngenieroMMain.html">Ingeniero de Mantenimiento</a>


            </nav>
            <section class="textos-header">
                <h1>Gerente de Mantenimiento</h1>

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
                                PreparedStatement ps = null;
                                PreparedStatement ps2 = null;
                                PreparedStatement ps3 = null;
                                ResultSet rs = null;
                                ResultSet rs2 = null;
                                try {
                                    String sql = "select * from reporte where Estatus = 'En mantenimiento' or Estatus = 'Programacion finalizada';";
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
                    <select id="combito" name="seleccion" class="form-select form-select-sm col-4" aria-label=".form-select-sm example" required> Área a asignar
                        <option  selected disabled value="todotonto"> Seleccione el área</option>
                        <option  value="Soporte"> Gerente de Soporte</option>
                        <option  value="Mantenimiento"> Ingeniero de Mantenimiento</option>
                    </select>
                    <br><br>

                    <input type="submit" name="modificar" value="Modificar">

                    <br><br><br>
                </form>
                <%
                    if (request.getParameter("modificar") != null) {
                        try {
                            String sql3 = "select * from Reporte where IdReporte = (?)";
                            String sql4 = "update Reporte set Estatus = (?),IdUsuario = 2 where IdReporte = (?);";
                            int id = Integer.parseInt(request.getParameter("reporte"));
                            String area = request.getParameter("seleccion");
                            cn2 = conection.conectar();
                            ps2 = cn2.prepareStatement(sql4);
                            cn3 = conection.conectar();
                            ps3 = cn3.prepareStatement(sql3);
                            ps3.setInt(1, id);
                            rs2 = ps3.executeQuery();
                            if (rs2.next()) {
                                if (rs2.getString(5).equals("En mantenimiento") || rs2.getString(5).equals("Programacion finalizada")) {
                                    System.out.println(rs2.getString(5));
                                    if (area.equals("Soporte")) {
                                        ps2.setString(1, "Mantenimiento finalizado");
                                        ps2.setInt(2, id);
                                        ps2.executeUpdate();
                                        out.println("<script>alert('Asignado correctamente a soporte')</script>");
                                        request.getRequestDispatcher("/GerenteMMain.html").forward(request, response);
                                    } else if (area.equals("Mantenimiento")) {
                                        ps2.setString(1, "En programacion");
                                        ps2.setInt(2, id);
                                        ps2.executeUpdate();
                                        out.println("<script>alert('Asignado correctamente a mantenimiento')</script>");
                                        request.getRequestDispatcher("/GerenteMMain.html").forward(request, response);

                                    } else if (area.equals("todotonto")) {
                                        out.println("<script>alert('Ingrese un área')</script>");
                                        request.getRequestDispatcher("/GerenteMMain.html").forward(request, response);
                                    } else {
                                        out.println("<script>alert('Trono')</script>");
                                        request.getRequestDispatcher("/GerenteMMain.html").forward(request, response);
                                    }
                                } else {
                                    out.println("<script>alert('La asignacion se ha realizado antes')</script>");
                                    request.getRequestDispatcher("/GerenteMMain.html").forward(request, response);
                                }
                            } else {
                                System.out.println(rs2.getString(5));
                                out.println("<script>alert('No existe ese reporte')</script>");
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
