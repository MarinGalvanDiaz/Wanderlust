/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import com.google.gson.JsonObject;

/**
 *
 * @author chang
 */
public class Message {
    
    private int id;
    private String usuario;
    private int idusuario;
    private String mensaje;
    private String fecha;

    public Message(int id, String usuario, int idusuario, String mensaje, String fecha) {
        this.id = id;
        this.usuario = usuario;
        this.idusuario = idusuario;
        this.mensaje = mensaje;
        this.fecha = fecha;
    }

    public Message(String usuario, int idusuario, String mensaje, String fecha) {
        this.usuario = usuario;
        this.idusuario = idusuario;
        this.mensaje = mensaje;
        this.fecha = fecha;
    }
    
    
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public int getIdusuario() {
        return idusuario;
    }

    public void setIdusuario(int idusuario) {
        this.idusuario = idusuario;
    }

    public String getMensaje() {
        return mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }
    
    public JsonObject getJsonObject(){
        JsonObject jo = new JsonObject();
        jo.addProperty("id", this.getId());
        jo.addProperty("usuario", this.getUsuario());
        jo.addProperty("idusuario", this.getIdusuario());
        jo.addProperty("mensaje", this.getMensaje());
        jo.addProperty("fecha", this.getFecha());
        
        return jo;
    }
}
