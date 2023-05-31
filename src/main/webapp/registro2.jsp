<%-- 
    Document   : registro2
    Created on : 17/10/2022, 10:23:58 PM
    Author     : chang
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="java.sql.*"%>
<%@page import="Modelo.conexion"%>
<%@page import="java.io.*"%>
<%@page import="org.apache.commons.fileupload.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href = "https://fonts.googleapis.com/css2?family=Open+Sans" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" media="screen" href="estilos2.css">
    <link rel="stylesheet" href="normalize.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <header class="header">
            <div class="contenedor1">
                <div class="header__contenido">
                    <p class="logo"> WANDERLUST</p>
                    <div class="menu">
                        <ul>
                            <li><a href="registro.jsp">Registrarse</a></li>
                            <li><a href="#">ABOUT</a></li>
                            <li><a href="#">SERVICE</a></li>
                            <li><a href="#">CONTACT</a></li>
                        </ul>
                    </div>
                </div>
                       </div>
        </header>
    <CENTER>
        <%
        
            conexion conection = new conexion();
           
            String usuario = null;
            String contra = null;
            String repcontra = null;
            String nombre = null;
            String apellido = null;
            String sexo = null;
            String email = null;
            byte[] imagen = null;
            
            Connection cn = null;
            PreparedStatement st = null;
            PreparedStatement st2 = null;
            ResultSet rs = null;
            System.out.println(usuario);
            System.out.println(contra);
            System.out.println(repcontra);
            System.out.println(nombre);
            System.out.println(apellido);
            System.out.println(sexo);
            System.out.println(email);
            String sql = "select * from cliente where Usuario_cliente=(?) and Contrasenia_cliente=(?); ";
            String sql2 = "insert into cliente values(default,(?),(?),(?),(?),(?),(?),(?),0,0);";
            try{
            cn = conection.conectar();
            
  
  DiskFileItemFactory factory = new DiskFileItemFactory();
  ServletFileUpload upload = new ServletFileUpload(factory);
  List<FileItem> items = upload.parseRequest(request);
  Iterator<FileItem> iter = items.iterator();
  while (iter.hasNext()) {
    FileItem item = iter.next();

    if (item.isFormField()) {
      // Si el elemento es un campo de texto
      String name = item.getFieldName();
      String value = item.getString();
      if (name.equals("txtusu")) {
        usuario = value;
      }else if(name.equals("txtcontra")){
      contra = value;
            }else if(name.equals("txtrepetircontra")){
      repcontra = value;
            }else if(name.equals("txtnombre")){
      nombre = value;
            }else if(name.equals("txtapellido")){
      apellido = value;
            }else if(name.equals("sexo")){
      sexo = value;
            }else if(name.equals("email")){
      email = value;
            }
    } else {
      // Si el elemento es un archivo
      String fieldName = item.getFieldName();
      String fileName = item.getName();
      String contentType = item.getContentType();
      boolean isInMemory = item.isInMemory();
      long sizeInBytes = item.getSize();
      if (sizeInBytes > 0) {
        InputStream inputStream = item.getInputStream();
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        byte[] buffer = new byte[4096];
        int bytesRead = -1;
        while ((bytesRead = inputStream.read(buffer)) != -1) {
          outputStream.write(buffer, 0, bytesRead);
        }
        imagen = outputStream.toByteArray();
        outputStream.close();
        inputStream.close();
      }
    }
  }

            st = cn.prepareStatement(sql);
            st.setString(1, usuario);
            st.setString(2, contra);
            rs = st.executeQuery();
                if(rs.next() == true){
                request.setAttribute("msje", "Nombre de usuario registrado con anterioridad"); 
                request.getRequestDispatcher("/registro.jsp").forward(request, response);
                }else{
                if(contra.equals(repcontra)){
                st2 = cn.prepareStatement(sql2);
                st2.setString(1, nombre);
                st2.setString(2, apellido);
                st2.setString(3, sexo);
                st2.setString(4, email);
                st2.setBytes(5, imagen);
                st2.setString(6, usuario);
                st2.setString(7, contra);
                st2.executeUpdate();
                request.getRequestDispatcher("/login2.jsp").forward(request, response);
                }else{
                request.setAttribute("msje", "La contraseña no coincide"); 
                request.getRequestDispatcher("/registro.jsp").forward(request, response);
            }
               // © Copyright 2023 Speed Experience. Todos los derechos reservados 
            }
            }
            catch(Exception e){
            System.out.println("Error"+e.getMessage());
            out.println(e.getMessage());
            }
            finally {
            if (rs != null && rs.isClosed() == false) {
                rs.close();
            }
            rs = null;
            if(st != null && st.isClosed() == false){
                st.close();
            }
            st = null;
            if(st2 != null && st2.isClosed() == false){
                st2.close();
            }
            st2 = null;
            if(cn != null && cn.isClosed()==false){
                cn.close();
            }
            cn=null;
        }
            
            
        %>
    </CENTER>
    </body>
</html>
