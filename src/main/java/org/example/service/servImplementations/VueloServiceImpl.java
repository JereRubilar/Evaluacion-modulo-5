package org.example.service.servImplementations;

import org.example.model.Vuelo;
import org.example.repository.VueloRepository;
import org.example.repository.implementation.VueloRepositoryImpl;
import org.example.service.VueloService;

import java.util.List;

public class VueloServiceImpl implements VueloService {

    private final VueloRepository vueloRepository = new VueloRepositoryImpl();

    @Override
    public List<Vuelo> obtenerVuelos() {
        return vueloRepository.obtenerVuelos();
    }
}
