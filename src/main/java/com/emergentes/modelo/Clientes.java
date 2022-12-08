

package com.emergentes.modelo;


public class Clientes {
    private int id;
    private String nombre;
    private String apellido;
    private String ci;
    private String correo;
    private String telefono;
    private String direccion;
    private String password;

    public Clientes() {
        this.id = 0;
        this.nombre = "";
        this.apellido = "";
        this.ci = "";
        this.correo = "";
        this.telefono = "";
        this.direccion = "";
        this.password = "";
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getCi() {
        return ci;
    }

    public void setCi(String ci) {
        this.ci = ci;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    

    @Override
    public String toString() {
        return "Clientes{" + "id=" + id + ", nombre=" + nombre + ", apellido=" + apellido + ", ci=" + ci + ", correo=" + correo + ", telefono=" + telefono + ", direccion=" + direccion + ", password=" + password+ '}';
    }
    
}
