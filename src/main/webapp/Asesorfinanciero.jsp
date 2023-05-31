<%-- 
    Document   : Asesorfinanciero
    Created on : 25 abr 2023, 12:16:26
    Author     : alumno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.Afinaciero" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <link rel="stylesheet" href="Asesorfinanciero.css">
        <link rel="stylesheet" href="css/style.css">
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

        <!-- Optional theme -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

        <!-- Latest compiled and minified JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script> <link rel="stylesheet" href="Asesorfinanciero.css">
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" href="imgasesores/logo_sin_fondo.png" type="image/x-icon">
        <title> WANDERLUST </title>

    </head>
    <body>
        <header>
            <nav>
               
                <a href="srvaFinanciero?accion=cerrar"> Cerrar Sesión </a>
            </nav>
        </header>

        <div class="encabezado-img">
            <p>Asesoría Financiera</p>
            <h1> Bienvenido ${Afinanciero.usuario} </h1>
            <p>Aquí encontraras lo necesario para brindar la 
                mejor atención posible al cliente que te contacte
            </p>
        </div>
        <div class="contenedor">
            <div class="contenedor_tarjeta">
                <a href="http://www.falconmasters.com">
                    <figure id="tarjeta">
                        <img src="imgasesores/Dinero.png" class="frontal" alt="">
                        <figcaption class="trasera">
                            <h2 class="titulo">Bienvenido Asesor!</h2>
                            <hr>
                            <p>Te agradecemos por tu atención.</p>
                        </figcaption>
                    </figure>
                </a>
            </div>

            <div class="contenedor_tarjeta">
                <a href="http://www.falconmasters.com">
                    <figure id="tarjeta">
                        <img src="imgasesores/Dinero2.png" class="frontal" alt="">
                        <figcaption class="trasera">
                            <h2 class="titulo">Ayuda a los usuarios!</h2>
                            <hr>
                            <p>Nunca sabes cuando te puede ayudar el usuario también.</p>
                        </figcaption>
                    </figure>
                </a>
            </div>

            <div class="contenedor_tarjeta">
                <a href="http://www.falconmasters.com">
                    <figure id="tarjeta">
                        <img src="imgasesores/dinero3.png" class="frontal" alt="">
                        <figcaption class="trasera">
                            <h2 class="titulo">Hola asesor!</h2>
                            <hr>
                            <p>Felices de tenerte de vuelta</p>
                        </figcaption>
                    </figure>
                </a>
            </div>
        </div>

        <div class="row navbar-fixed-bottom">
            <div class="col-md-4 chat-box footer pull-right">
                <div class="panel panel-primary">
                    <div class="panel-heading">  
                        <span class="glyphicon glyphicon-comment"></span> Chat
                        <div class="btn-group pull-right">
                            <button type="button" class="btn btn-default btn-xs dropdown toggle" data-toggle="dropdown">
                                <span class="glyphicon glyphicon-chevron-down"></span>
                            </button>
                            <ul class="dropdown-menu slidedown">
                                <li><a href><span class="glyphicon glyphicon-off"></span>Salir</a></li>
                            </ul>
                        </div>

                    </div>
                    <div class="panel-body chat-widget">
                        <ul class="chat chat-messages">
                           
                        </ul>
                    </div>

                    <div class="panel-footer">
                        <form action="Chat.jsp" method="post">
                            <div class="form-group">
                                <input type="text" class="form-control input-sm chat-name" placeholder="Escriba su nombre" value="${Afinanciero.usuario}" disabled="true">
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control input-sm chat-entry" placeholder="Escriba un mensaje y presione enter para enviar">
                            </div>
                           <!-- <input type="hidden" name="idUsu" class="idUsu" value="${usuario.id}">-->
                        </form>
                    </div>

                </div>
            </div>
        </div>
        <script src="https://js.pusher.com/7.2/pusher.min.js"></script>
        <script src="Javascript/chat.js"></script>
        <script>

            // Enable pusher logging - don't include this in production
            

            var pusher = new Pusher('b3cf95809db76ca14bcc', {
      cluster: 'us2'
    });
            var chat = new ChatWidget(pusher);

        </script>
    </body>
</html>
