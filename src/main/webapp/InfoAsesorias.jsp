<%-- 
    Document   : InfoAsesorias
    Created on : 23 may 2023, 07:37:51
    Author     : chang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.usuario"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Asesorías</title>
        <link rel="stylesheet" href="css/style.css">
        
        <link href="https://fonts.googleapis.com/css2?family=Fredericka+the+Great&display=swap" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

        <!-- Optional theme -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

        <!-- Latest compiled and minified JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script> <link rel="stylesheet" href="Asesorfinanciero.css">

        <link href="https://fonts.googleapis.com/css2?family=Fredericka+the+Great&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="styles2.css">
    </head>
    <body>
        <div class="header">
            <h1>Contactos Asesores</h1>
        </div>
        
        <div class="card">
            <div class="face front">
                <img src="asesora.png" alt="">
                <h3>María Alicia Viquez Cerón</h3>
            </div>
            <div class="face back">
                <h3>Contadora Pública</h3>
                <p>Número de contacto: &nbsp; &nbsp; 5560719766</p>
                <div class="link">
                    <a href="mailto:aliciavc_mx@hotmail.com">hotmail</a>
                </div>
            </div>
        </div>

        <div class="card">
            <div class="face front">
                <img src="contador.png" alt="">
                <h3>Luis Bolaños Gutiérrez</h3>
            </div>
            <div class="face back">
                <h3>Contador Público</h3>
                <p>Número de contacto: &nbsp; &nbsp; 5521299016</p>
                <div class="link">
                    <a href="mailto:lbolanos74@hotmail.com">hotmail</a>
                </div>
            </div>
        </div>

        <div class="card">
            <div class="face front">
                <img src="contador2.png" alt="">
                <h3>Rafael Díaz Luna</h3>
            </div>
            <div class="face back">
                <h3>Gestor de Sistemas SAT</h3>
                <p>Número de contacto: &nbsp; &nbsp; 278 738 7112</p>
                <div class="link">
                    <a href="mailto:Rafa.diazL1970@gmail.com">gmail</a>
                </div>
            </div>
        </div>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
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
                                <input type="text" class="form-control input-sm chat-name" placeholder="Escriba su nombre" value="${usuario.usuario}" disabled="true">
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
