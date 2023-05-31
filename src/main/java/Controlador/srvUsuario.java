/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;

import Modelo.usuario;
import Modelo.verifusuario;
import java.io.IOException;

import java.util.Properties;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author alumno
 */
@WebServlet(name = "srvUsuario", urlPatterns = {"/srvUsuario"})
public class srvUsuario extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
         Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
        props.put("mail.smtp.starttls.enable", "true");
        props.setProperty("mail.smtp.ssl.protocols", "TLSv1.2");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        response.setContentType("text/html;charset=UTF-8");
        String accion = request.getParameter("accion");
        try{
            if(accion != null){
                switch (accion) {
                    case "verificar":
                        verificar(request, response);
                        break;
                    case "cerrar":
                        cerrarsession(request, response);
                    default:
                       response.sendRedirect("login2.jsp");
                }
            }else{
                response.sendRedirect("login2.jsp");
            }
        }catch(Exception e){
            try{
                this.getServletConfig().getServletContext().getRequestDispatcher("/mensaje.jsp").forward(request, response);
            }catch(Exception f){
                System.out.println("Error"+ f.getMessage());
            }
            System.out.println("Error" + e.getMessage());
        }
    }

 private void verificar(HttpServletRequest request, HttpServletResponse response) throws Exception{
        HttpSession sesion;
        verifusuario dao;
        usuario usuario;
        usuario = this.obtenerUsuario(request);
        sesion = request.getSession();
        dao = new verifusuario();
        usuario = dao.identificar(usuario);
        if(usuario != null){
        sesion.setAttribute("usuario",usuario);
        request.setAttribute("msje", "Bienvenido al sistema");
        this.getServletConfig().getServletContext().getRequestDispatcher("/verificarCuestionario1.jsp").forward(request, response);
        }else{
           request.setAttribute("msje", "Credenciales incorrectas"); 
           request.getRequestDispatcher("/login2.jsp").forward(request, response);
        }
    }
    private void cerrarsession(HttpServletRequest request, HttpServletResponse response) throws Exception{
       HttpSession sesion = request.getSession();
       sesion.setAttribute("usuario", null);
       sesion.invalidate();
       response.sendRedirect("login2.jsp");
    }

    private usuario obtenerUsuario(HttpServletRequest request) {
        usuario u = new usuario();
        u.setUsuario(request.getParameter("txtusu"));
        u.setContrasenia(request.getParameter("txtcontra"));
        return u;
    }    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
