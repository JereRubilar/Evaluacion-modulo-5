package org.example.repository;

import org.example.model.Vuelo;

import java.util.List;

public interface VueloRepository {

    List<Vuelo> obtenerVuelos();
    Vuelo obtenerVueloPorId(Integer idVuelo);
}
