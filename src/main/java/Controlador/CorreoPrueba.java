/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;

import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import java.util.Properties;
public class CorreoPrueba {

    private String host;
    private String port;
    private String username;
    private String password;
    private boolean sslEnabled;

    public CorreoPrueba(String host, String port, String username, String password, boolean sslEnabled) {
        this.host = host;
        this.port = port;
        this.username = username;
        this.password = password;
        this.sslEnabled = sslEnabled;
    }

    public void sendEmail(String to, String subject, String message) throws Exception {
        Properties properties = new Properties();
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", port);
        properties.put("mail.smtp.auth", "true");

        if (sslEnabled) {
            properties.put("mail.smtp.socketFactory.port", port);
            properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        }

        Session session = Session.getInstance(properties, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        Message mimeMessage = new MimeMessage(session);
        mimeMessage.setFrom(new InternetAddress(username));
        mimeMessage.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
        mimeMessage.setSubject(subject);
        mimeMessage.setText(message);

        Transport.send(mimeMessage);
    }
    
    public static void main(String[] args) {
    String host = "smtp.gmail.com";
    String port = "465";
    String username = "speedexperienceexp@gmail.com";
    String password = "kwkgaogbmuzeoutp";
    boolean sslEnabled = true;

    CorreoPrueba sender = new CorreoPrueba(host, port, username, password, sslEnabled);

    String to = "galvandiazmarin@gmail.com";
    String subject = "Correo de prueba";
    String message = "Corre o no corre Andrea?.";

    try {
        sender.sendEmail(to, subject, message);
        System.out.println("Correo electrónico enviado con éxito.");
    } catch (Exception ex) {
        System.out.println("Error al enviar el correo electrónico: " + ex.getMessage());
    }

    }
}



