<%-- 
    Document   : GraficaMensual
    Created on : 17 abr 2023, 23:49:21
    Author     : chang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.*"%>
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
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

        <title>JSP Page</title>
    </head>
    <body background="../images/fondito.png" style="background-size: cover;">
        <nav class="navbar navbar-expand-lg fixed-top bg-light navbar-light">
            <div class="container">
                <a class="navbar-brand" href="indexMenu.jsp"
                   ><img
                        id="MDB-logo"
                        src="../images/logoEmpresa.jpg"
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
                            <a class="nav-link mx-2" href="Grafica.html"><i class="fas fa-plus-circle pe-2"></i>Regresar</a>
                        </li>
                        
                        <li class="nav-item">
                            <a class="nav-link mx-2" href="../srvUsuario?accion=cerrar"><i class="fas fa-bell pe-2"></i>LogOut</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        
        <div class="container-fluid">
            <div class="card text-bg-dark">
                <img src="../images/DALL·E 2023-03-29 01.10.44 - fondo con coleres azules claros para fondo de pagina web.png" alt="alt" class="card-img"/>
                <div class="card-img-overlay">
            <br>
                <br>
                <br>
                <canvas id="myChart"></canvas>
                <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
                <%
                    String usuarioini = session.getAttribute("IdUsuario").toString();
                    int usuario1 = Integer.parseInt(usuarioini);
                    System.out.println(usuarioini);
                    conexion con = new conexion();

                    Connection cn1 = con.conectar();
                    PreparedStatement ps21 = null;
                    PreparedStatement ps22 = null;
                    PreparedStatement ps23 = null;
                    ResultSet rs1 = null;
                    ResultSet rs2 = null;
                    ResultSet rs3 = null;
                    String sql1 = "select * from rendimiento where Id_cliente = (?) and tipo='ingreso';";
                    String sql21 = "select count(anio) from rendimiento where Id_cliente =(?) and tipo='ingreso';";
                    String sql3 = "select * from rendimiento where Id_cliente = (?) and tipo='gasto';";
                    ps22 = cn1.prepareStatement(sql21);
                    ps22.setInt(1, usuario1);
                    rs2 = ps22.executeQuery();

                    ps21 = cn1.prepareStatement(sql1);
                    ps21.setInt(1, usuario1);
                    rs1 = ps21.executeQuery();
                    
                    ps23 = cn1.prepareStatement(sql3);
                    ps23.setInt(1, usuario1);
                    rs3 = ps23.executeQuery();
                    

                    if (rs1.next() && rs2.next() && rs3.next()) {
                       System.out.println(rs2.getInt(1));
                        //System.out.println(rs1.getDouble(2));
                       

                        int total = rs2.getInt(1);

                        double[] datos = new double[total];
                        double[] datos3 = new double[total];
                        String[] meses = new String[total];
                        for (int i = 0; i < total; i++) {
                            datos[i] = rs1.getInt(4);
                            datos3[i] = rs3.getInt(4);
                            meses[i] = "\""+rs1.getString(2)+"\"";
                            rs1.next();
                            rs3.next();
                        }
                        System.out.println(Arrays.toString(datos));
                        System.out.println(Arrays.toString(meses));
                        String datos1 = Arrays.toString(datos);
                        String datos2 = Arrays.toString(datos3);
                        String datos4 = Arrays.toString(meses);
                        System.out.println(datos2);
                        System.out.println(datos4);

                %>
                
                <script>

                    const ctx = document.getElementById('myChart');

                    new Chart(ctx, {
                        type: 'line',
                        data: {
                            labels: <%=datos4%>,
                            datasets: [{
                                    label: 'Ingresos',
                                    data: <%=datos1%>,
                                    borderWidth: 1,
                                    borderColor: 'rgb(0, 0, 0)',
                                    backgroundColor: 'rgb(0, 0, 0)',
                                    pointBackgroundColor: 'rgb(0, 0, 0)',
                                    pointBorderColor: 'rgb(0, 0, 0)',
                                    tension: 0.1
                                },{
                                    label: 'Gastos',
                                    data: <%=datos2%>,
                                    borderWidth: 1,
                                    borderColor: 'rgb(255, 0, 0)',
                                    backgroundColor: 'rgb(255, 0, 0)',
                                    pointBackgroundColor: 'rgb(255, 0, 0)',
                                    pointBorderColor: 'rgb(255, 0, 0)',
                                    tension: 0.1
                                }]
                        },
                        options: {
                            scales: {
                                y: {
                                    beginAtZero: true
                                }
                            }
                        }
                    });


                </script>
            </div>


            <%

                }

                
            %> 

                </div>
</div>
        </div>
    </body>
</html>
