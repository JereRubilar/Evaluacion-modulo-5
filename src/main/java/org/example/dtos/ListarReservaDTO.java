package org.example.dtos;

public class ListarReservaDTO {

    private Integer idReserva;
    private String nombreCliente;
    private String apellidoCliente;
    private String ciudadDespegue;
    private String ciudadAterrizaje;
    private int numeroAsiento;

    public ListarReservaDTO() {

    }

    public ListarReservaDTO(Integer idReserva, String nombreCliente, String apellidoCliente, String ciudadDespegue, String ciudadAterrizaje, int numeroAsiento) {
        this.idReserva = idReserva;
        this.nombreCliente = nombreCliente;
        this.apellidoCliente = apellidoCliente;
        this.ciudadDespegue = ciudadDespegue;
        this.ciudadAterrizaje = ciudadAterrizaje;
        this.numeroAsiento = numeroAsiento;
    }

    public Integer getIdReserva() {
        return idReserva;
    }

    public void setIdReserva(Integer idReserva) {
        this.idReserva = idReserva;
    }

    public String getNombreCliente() {
        return nombreCliente;
    }

    public void setNombreCliente(String nombreCliente) {
        this.nombreCliente = nombreCliente;
    }

    public String getApellidoCliente() {
        return apellidoCliente;
    }

    public void setApellidoCliente(String apellidoCliente) {
        this.apellidoCliente = apellidoCliente;
    }

    public String getCiudadDespegue() {
        return ciudadDespegue;
    }

    public void setCiudadDespegue(String ciudadDespegue) {
        this.ciudadDespegue = ciudadDespegue;
    }

    public String getCiudadAterrizaje() {
        return ciudadAterrizaje;
    }

    public void setCiudadAterrizaje(String ciudadAterrizaje) {
        this.ciudadAterrizaje = ciudadAterrizaje;
    }

    public int getNumeroAsiento() {
        return numeroAsiento;
    }

    public void setNumeroAsiento(int numeroAsiento) {
        this.numeroAsiento = numeroAsiento;
    }

    @Override
    public String toString() {
        return "ListarReservaDTO{" +
                "idReserva=" + idReserva +
                ", nombreCliente='" + nombreCliente + '\'' +
                ", apellidoCliente='" + apellidoCliente + '\'' +
                ", ciudadDespegue='" + ciudadDespegue + '\'' +
                ", ciudadAterrizaje='" + ciudadAterrizaje + '\'' +
                ", numeroAsiento=" + numeroAsiento +
                '}';
    }
}