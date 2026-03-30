package org.example.repository;

import org.example.model.Reserva;

import java.util.List;

public interface ReservaRepository {

    Integer crearReserva(Reserva reserva);
    List<Reserva> obtenerReservas();
    Reserva obtenerReservaPorId(Integer idReserva);
}
