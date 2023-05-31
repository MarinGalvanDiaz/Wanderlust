<%@page import="Modelo.conexion"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
       

        <title>GerenteS</title>
        <link rel="shortcut icon" href="img/logoEmpresa.jpg" type="image/x-icon">
        <link rel="stylesheet" href="estilos2_1.css">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700,800&display=swap" rel="stylesheet"> 
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

        <script>
            function confirmar() {
                if (confirm("Desea eliminar el medicamento? ")) {
                    alert("Medicamento eliminado");
                    var formu = document.getElementById("bajass");
                    formu.submit();
                } else
                    alert("El medicamento no puede ser eliminado");

            }
        </script>
    </head>

    <body>
        <header>
            <nav>

                <a href="GerenteSMain.jsp">Regresar</a>             

            </nav>
            <section class="textos-header">
                <h1>Asignar</h1>

            </section>
            <div class="wave" style="height: 150px; overflow: hidden;"><svg viewBox="0 0 500 150" preserveAspectRatio="none"
                                                                            style="height: 100%; width: 100%;">
                <path d="M0.00,49.98 C150.00,150.00 349.20,-50.00 500.00,49.98 L500.00,150.00 L0.00,150.00 Z"
                      style="stroke: none; fill: #fff;"></path>
                </svg></div>
        </header>
        <main>
            <section class="contenedor sobre-nosotros">


            </section>
            <CENTER>
                <h2 class="titulo"> Asignar reportes </h2><br><br>

                <form action="" method="post" name="formu">
                    <br>
                    Id del reporte <input type="number" name="reporte" required>
                    <select id="combito" name="seleccion" class="form-select form-select-sm col-4" aria-label=".form-select-sm example" required> Área a asignar
                        <option  disabled> Seleccione el área</option>
                        <option  value="Soporte"> Soporte</option>
                        <option  value="Mantenimiento"> Mantenimiento</option>
                    </select>
                    <br><br>

                    <input type="submit" name="modificar" value="Modificar">

                    <br><br><br>
                </form>
                <%
                    if (request.getParameter("modificar") != null) {
                        conexion conection = new conexion();
                        int id = Integer.parseInt(request.getParameter("reporte"));
                        String area = request.getParameter("seleccion");
                        Connection cn = null;
                        Connection cn2 = null;
                        PreparedStatement ps = null;
                        PreparedStatement ps2 = null;
                        ResultSet rs = null;
                        try {
                            String sql2 = "select * from Reporte where IdReporte = (?)";
                            String sql = "update Reporte set Estatus = (?),IdUsuario = 1 where IdReporte = (?);";
                            cn = conection.conectar();
                            ps = cn.prepareStatement(sql);
                            cn2 = conection.conectar();
                            ps2 = cn2.prepareStatement(sql2);
                            ps2.setInt(1,id);
                            rs = ps2.executeQuery();
                            if (rs.next() && rs.getString(5)=="Abierto") {
                                if (area.equals("Soporte")) {
                                    ps.setString(1, "En proceso");
                                    ps.setInt(2, id);
                                    ps.executeUpdate();
                                    out.println("<script>alert('Asignado correctamente a soporte')</script>");
                                    request.getRequestDispatcher("/GerenteSMain.html").forward(request, response);
                                } else if (area.equals("Mantenimiento")) {
                                    ps.setString(1, "En mantenimiento");
                                    ps.setInt(2, id);
                                    ps.executeUpdate();
                                    out.println("<script>alert('Asignado correctamente a mantenimiento')</script>");
                                    request.getRequestDispatcher("/GerenteSMain.html").forward(request, response);

                                }else{
                                out.println("<script>alert('Trono')</script>");
                                request.getRequestDispatcher("/GerenteSMain.html").forward(request, response);
                    }
                            } else {
                                out.println("<script>alert('La asignacion se a realizado antes o no existe ese reporte')</script>");
                            }
                        } catch (Exception e) {
                            out.print(e.toString());
                        }
                    }

                %>



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
                            <p>5551579185</p>
                        </div>
                        <div class="content-foo">
                            <h4>Email</h4>
                            <p>angeles.alpuche.amdrea@gmail.com</p>
                        </div>
                        <div class="content-foo">
                            <h4>Ubicación</h4>
                            <p>Venustiano Carranza, pregunte por Anet</p>
                        </div>
                    </div>
                    <h2 class="titulo-final">&copy; Finite Software | Todos los derechos reservados</h2>
                </footer>
                </body>
                </html>
