
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="jakarta.mail.*" %>
<%@page import="jakarta.mail.internet.*" %>
<%@page import="Controlador.Correo" %>
<%@page import="java.sql.*"%>
<%@page import="java.time.*"%>
<%@page import="Modelo.conexion"%>
<%@page import="Modelo.usuario"%>


<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
        <!--<style>
            html, body{
                height: 100%;
                overflow: hidden;
            }
        </style>-->
        <title>Ingresar Capital</title>
    </head>

    <body background="images/fondito.png" style="background-size: cover;">

        <nav class="navbar navbar-expand-lg fixed-top bg-light navbar-light">
            <div class="container">
                <a class="navbar-brand" href="indexMenu.jsp"
                   ><img
                        id="MDB-logo"
                        src="./images/logoEmpresa.jpg"
                        alt="MDB Logo"
                        draggable="false"
                        height="30"
                        />  WANDERLUST</a>
                <button
                    class="navbar-toggler"
                    type="button"
                    data-mdb-toggle="collapse"
                    data-mdb-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent"
                    aria-expanded="false"
                    aria-label="Toggle navigation"
                    >
                    <i class="fas fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto align-items-center">
                        <li class="nav-item">
                            <a class="nav-link mx-2" href="indexMenu.jsp"><i class="fas fa-plus-circle pe-2"></i>Regresar</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link mx-2" href="ofertas/banner.html"><i class="fas fa-bell pe-2"></i>Ver ofertas</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link mx-2" href="/srvUsuario?accion=cerrar"><i class="fas fa-bell pe-2"></i>LogOut</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="container-fluid">
            <div class="card text-bg-dark">
                <img src="images/DALL·E 2023-03-29 01.10.44 - fondo con coleres azules claros para fondo de pagina web 2.png" alt="alt" class="card-img"/>
                <div class="card-img-overlay">
                    <form action="" method="post" name="formu">
                        <br><br><br><br>
                        <div class="col-4 mx-auto">
                            <h1 class="display-6 text-white">Ingresa el movimiento realizado</h1>
                        </div>
                        <br><br><br>
                        <div class="col-4 mx-auto">
                            <select id="combito" name="seleccion" class="form-select form-select-sm col-4" aria-label=".form-select-sm example" required> Tipo de movimiento
                                <option  selected disabled> Seleccione un tipo de movimiento</option>
                                <option  value="Ingreso"> Ingreso</option>
                                <option  value="Retiro"> Retiro</option>
                            </select>
                        </div>
                        <br>
                        <div class="col-4 mx-auto">
                            <select id="combito" name="seleccion2" class="form-select form-select-sm col-4" aria-label=".form-select-sm example" required> Tipo de movimiento
                                <option  selected disabled> Seleccione un tipo de movimiento</option>
                                <option  value="Interbancario"> Interbancario</option>
                                <option  value="Mismo banco"> Mismo Banco</option>
                            </select>
                            <br>
                        </div>
                        <div class="form-outline mb-4 col-4 mx-auto">
                            <input type="number" name="Monto" placeholder="Ingrese el monto" pattern=".{1,16}" title="Ingrese un valor" required class="form-control form-control-lg">
                        </div>
                        <div class="form-outline mb-4 col-4 mx-auto">
                            <input type="number" name="Total" placeholder="Ingrese el Total" pattern=".{1,16}" title="Ingrese un valor" required class="form-control form-control-lg">
                        </div>
                        <div class="form-outline mb-4 col-4 mx-auto">
                            <input type="text" name="concepto" placeholder="Ingrese el concepto" pattern=".{1,16}" title="Ingrese un valor" required class="form-control form-control-lg" pattern="[a-zA-Z0-9]{4,20}" title="Ingrese un concepto">
                        </div>
                        <br><br>
                        <div class="d-grid gap-2 mx-auto col-2">
                            <button type="submit" name="subir" value="Enviar" class="btn btn-primary btn-lg btn-block">Aceptar</button>
                        </div>
                        <input type="hidden" name="Usuario" value="${usuario.id}">
                        <input type="hidden" name="correo" value="${usuario.email}">

                    </form>

                    <%
                        if (request.getParameter("subir") != null) {
                            String host = "smtp.gmail.com";
                            String port = "465";
                            String username = "speedexperienceexp@gmail.com";
                            String password = "kwkgaogbmuzeoutp";
                            boolean sslEnabled = true;

                            Correo sender = new Correo(host, port, username, password, sslEnabled);

                            String to = request.getParameter("correo");
                            String subject = "Movimiento " + request.getParameter("seleccion2");
                            String message = "Se ha realizado un " + request.getParameter("seleccion") + " de " + request.getParameter("Monto");

                            try {
                                sender.sendEmail(to, subject, message);
                                System.out.println("Correo electrónico enviado con éxito.");
                            } catch (Exception ex) {
                                System.out.println("Error al enviar el correo electrónico: " + ex.getMessage());
                            }

                            int usuario = Integer.parseInt(request.getParameter("Usuario"));
                            System.out.println("Este es el usuario: " + usuario);

                            conexion con = new conexion();
                            Connection cn = con.conectar();
                            PreparedStatement ps = null;
                            ResultSet rs = null;

                            double total = Double.parseDouble(request.getParameter("Total"));
                            double ingresos = Double.parseDouble(request.getParameter("Monto"));
                            double retiros = Double.parseDouble(request.getParameter("Monto"));
                            String concepto = request.getParameter("concepto");
                            String tipo = request.getParameter("seleccion2");
                            String tipo1 = request.getParameter("seleccion");
                            java.sql.Date dia = java.sql.Date.valueOf(LocalDate.now());

                            String sql2 = "Insert into movimientos values(default,(?),(?),(?),(?),(?),(?),(?));";
                            ps = cn.prepareStatement(sql2);

                            if (tipo1.equals("Ingreso")) {
                                ps.setDouble(1, total);
                                ps.setDouble(2, ingresos);
                                ps.setDouble(3, 0.0);
                                ps.setString(4, concepto);
                                ps.setString(5, tipo);
                                ps.setDate(6, dia);
                                ps.setInt(7, usuario);
                                ps.executeUpdate();
                                request.getRequestDispatcher("/verificarIngresarCapital1.jsp").forward(request, response);
                            } else {
                                ps.setDouble(1, total);
                                ps.setDouble(2, 0.0);
                                ps.setDouble(3, retiros);
                                ps.setString(4, concepto);
                                ps.setString(5, tipo);
                                ps.setDate(6, dia);
                                ps.setInt(7, usuario);
                                ps.executeUpdate();
                                request.getRequestDispatcher("/verificarIngresarCapital1.jsp").forward(request, response);
                            }

                        }
                    %> 

                    <br><br>
                    <br>
                    <center>
                        <div class="col-8 mx-auto">
                            <h1 class="display-6 text-black">Ingrese un movimiento para ver la gráfica</h1>
                        </div>
                    </center>






                </div>
            </div>
        </div>

    </body>
</html>
