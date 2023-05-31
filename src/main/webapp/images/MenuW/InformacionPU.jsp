<%@page import="java.sql.*"%>
<%@page import="Modelo.conexion"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>WANDERLUST</title>
        <link rel="stylesheet" type="text/css" href="https://necolas.github.io/normalize.css/8.0.1/normalize.css">
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
        <link rel="shortcut icon" href="../imgasesores/logo_sin_fondo.png" type="image/x-icon">
        <link rel="stylesheet" href="InformacionPU.css">

    </head>
    <body>

        <section class="perfil-usuario">
            <div class="contenedor-perfil">
                <div class="portada-perfil" style="background-image: url('fondoportada2.jpg')">
                   <div class="sombra"></div>
                    <div class="avatar-perfil">
                        <img id="imgPreview" alt="img" style="height: 220px; width: 220px">
                        <a class="cambiar-foto">
                            <div class="input-container">
                            <i class="fas fa-camera"></i> 
                            <input type="file" id="inputArchivo"/>
                            </div>
                        </a>
                    </div>

                    <div class="datos-perfil">
                        <h4 class="titulo-usuario"> ${usuario.nombre} ${usuario.apellido} </h4>
                        <p class="bio-usuario"> "Qué maravilloso es que nadie tenga que esperar ni un segundo para empezar a mejorar el mundo" -Ana Frank</p>
                    </div>
                    
                    <div class="opcciones-perfil">
                            <div class="opcciones-perfil"> 
                        <a href="/srvUsuario?accion=cerrar" class="logout_btn">
                            <i class="fa fa-sign-out-alt fa-2x"></i>
                        </a>
                            </div>
                    </div>
                </div>
                <div class="menu-perfil">
                    <ul>
                        <li><a href="#" title=""><i class="icono-perfil fas fa-bullhorn"></i> Publicaciones</a></li>
                        <li><a href="#" title=""><i class="icono-perfil fas fa-grin"></i> Archivos importantes</a></li>
                    </ul>
                </div>
                <div class="main">
                    <div class="card">
                        <div class="card-body">
                            <table>
                                <tbody>
                                    <tr>
                                        <td>Nombre</td>
                                        <td>:</td>
                                        <td>${usuario.nombre}</td>
                                    </tr>
                                    <tr>
                                        <td>Apellido</td>
                                        <td>:</td>
                                        <td>${usuario.apellido}</td>
                                    </tr>
                                    <tr>
                                        <td>Sexo</td>
                                        <td>:</td>
                                        <td>${usuario.sexo}</td>
                                    </tr>
                                    <tr>
                                        <td>Correo</td>
                                        <td>:</td>
                                        <td>${usuario.email}</td>
                                    </tr>
                                    <tr>
                                        <td>Usuario</td>
                                        <td>:</td>
                                        <td>${usuario.usuario}</td>
                                    </tr>
                                    <tr>
                                        <td>Password</td>
                                        <td>:</td>
                                        <td>${usuario.contrasenia}</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
             </div>
           
        </section>

        <div class="mis-redes" style="display: block;position: fixed;bottom: 1rem;left: 1rem; opacity: 0.5; z-index: 1000;">
            <p style="font-size: .75rem;"> Redes Sociales </p>
            <div>
                <a target="_blank" href="https://www.facebook.com/people/Speed-Exp/100087152760879/"><i class="fab fa-facebook-square"></i></a>
                <a target="_blank" href="https://twitter.com/speedexperience?t=gzUKnMc0yAAij1ueJXYm5w&s=08"><i class="fab fa-twitter"></i></a>
                <a target="_blank" href="https://www.instagram.com/speedexperience09/?igshid=YmMyMTA2M2Y%3D"><i class="fab fa-instagram"></i></a>
            </div>
        </div>
        <script>
            function listenerMostraImagen() {
                var imagenSource = event.target.result;
                var previewImage = document.getElementById('imgPreview');
                previewImage.src = imagenSource;
            }
            function listenerCambiarFoto(event) {
                var image = event.target.files[0];
                var lector = new FileReader();

                lector.addEventListener('load', listenerMostraImagen, false);
                lector.readAsDataURL(image);
            }
            document.getElementById('inputArchivo').addEventListener('change', listenerCambiarFoto, false);
        </script>

    </body>

</html>