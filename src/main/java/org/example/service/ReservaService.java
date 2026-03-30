package org.example.service;

import org.example.dtos.CrearReservaDTO;
import org.example.dtos.DetalleReservaDTO;
import org.example.dtos.ListarReservaDTO;

import java.util.List;

public interface ReservaService {

    Integer crearReserva(CrearReservaDTO crearReservaDTO);
    List<ListarReservaDTO> obtenerReservas();
    DetalleReservaDTO obtenerReservaPorId(Integer idReserva);

}
