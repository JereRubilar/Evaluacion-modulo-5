package org.example.service.servImplementations;

import org.example.dtos.CrearReservaDTO;
import org.example.dtos.DetalleReservaDTO;
import org.example.dtos.ListarReservaDTO;
import org.example.model.*;
import org.example.repository.ClienteRepository;
import org.example.repository.ReservaRepository;
import org.example.repository.VueloRepository;
import org.example.repository.implementation.ClienteRepositoryImpl;
import org.example.repository.implementation.ReservaRepositoryImpl;
import org.example.repository.implementation.VueloRepositoryImpl;
import org.example.service.ReservaService;

import java.util.ArrayList;
import java.util.List;

public class ReservaServiceImpl implements ReservaService {

    private final ReservaRepository reservaRepository = new ReservaRepositoryImpl();
    private final ClienteRepository clienteRepository = new ClienteRepositoryImpl();
    private final VueloRepository vueloRepository = new VueloRepositoryImpl();

    @Override
    public Integer crearReserva(CrearReservaDTO crearReservaDTO) {
        validarCrearReserva(crearReservaDTO);

        Integer clienteReservaId;

        Cliente clienteExistente = clienteRepository.obtenerClientePorRut(crearReservaDTO.getRutCliente());
        if (clienteExistente != null) {
            clienteReservaId = clienteExistente.getIdCliente();
        } else {
            Cliente nuevoCliente = new Cliente();
            nuevoCliente.setNombre(crearReservaDTO.getNombreCliente());
            nuevoCliente.setApellido(crearReservaDTO.getApellidoCliente());
            nuevoCliente.setRut(crearReservaDTO.getRutCliente());
            clienteReservaId = clienteRepository.crearCliente(nuevoCliente);
        }

        Reserva nuevaReserva = new Reserva(
                null,
                clienteReservaId,
                crearReservaDTO.getIdVuelo(),
                crearReservaDTO.getNumeroAsiento(),
                EstadoVuelo.fromValor(crearReservaDTO.getEstadoVuelo()),
                SeccionCliente.fromValor(crearReservaDTO.getSeccionCliente())
        );

        Integer idReservaGenerada = reservaRepository.crearReserva(nuevaReserva);

        return idReservaGenerada;
    }

    @Override
    public List<ListarReservaDTO> obtenerReservas() {

        List<Reserva> reservasExistentes = reservaRepository.obtenerReservas();
        List<ListarReservaDTO> reservasDTO = new ArrayList<>();

        for (Reserva reserva : reservasExistentes) {
            Vuelo vuelo = vueloRepository.obtenerVueloPorId(reserva.getIdVuelo());
            ListarReservaDTO reservaDTO = new ListarReservaDTO(
                    reserva.getIdReserva(),
                    vuelo.getCiudadDespegue(),
                    vuelo.getCiudadAterrizaje()
            );

            reservasDTO.add(reservaDTO);
        }

        return reservasDTO;
    }

    @Override
    public DetalleReservaDTO obtenerReservaPorId(Integer idReserva) {

        if (idReserva == null) {
            throw new IllegalArgumentException("El ID de la reserva es obligatorio.");
        }

        Reserva reserva = reservaRepository.obtenerReservaPorId(idReserva);
        if (reserva == null) {
            throw new IllegalArgumentException("No se encontró una reserva con el ID proporcionado.");
        }

        DetalleReservaDTO reservaDTO = new DetalleReservaDTO();
        reservaDTO.setIdReserva(idReserva);

        Cliente cliente = clienteRepository.obtenerClientePorId(reserva.getIdCliente());
        reservaDTO.setNombre(cliente.getNombre());
        reservaDTO.setApellido(cliente.getApellido());
        reservaDTO.setRut(cliente.getRut());

        Vuelo vuelo = vueloRepository.obtenerVueloPorId(reserva.getIdVuelo());
        reservaDTO.setCiudadDespegue(vuelo.getCiudadDespegue());
        reservaDTO.setCiudadAterrizaje(vuelo.getCiudadAterrizaje());
        reservaDTO.setFechaSalida(vuelo.getFechaSalida());
        reservaDTO.setFechaLlegada(vuelo.getFechaLlegada());
        reservaDTO.setHoraAbordaje(vuelo.getHoraAbordaje());
        reservaDTO.setHoraSalida(vuelo.getHoraSalida());
        reservaDTO.setHoraLlegada(vuelo.getHoraLlegada());
        reservaDTO.setNumeroAsiento(reserva.getNumeroAsiento());
        reservaDTO.setEstadoVuelo(reserva.getEstadoVuelo().getValor());
        reservaDTO.setSeccionCliente(reserva.getSeccionCliente().getValor());



        return reservaDTO;
    }

    private void validarCrearReserva(CrearReservaDTO reservaDTO) {
        if (reservaDTO.getNombreCliente() == null || reservaDTO.getNombreCliente().isEmpty()) {
            throw new IllegalArgumentException("El nombre del cliente es obligatorio.");
        }
        if (reservaDTO.getApellidoCliente() == null || reservaDTO.getApellidoCliente().isEmpty()) {
            throw new IllegalArgumentException("El apellido del cliente es obligatorio.");
        }
        if (reservaDTO.getRutCliente() == null || reservaDTO.getRutCliente().isEmpty()) {
            throw new IllegalArgumentException("El RUT del cliente es obligatorio.");
        }

        if (reservaDTO.getIdVuelo() == null) {
            throw new IllegalArgumentException("Vuelo es obligatorio.");
        }
        if (reservaDTO.getNumeroAsiento() <= 0) {
            throw new IllegalArgumentException("El número de asiento debe ser mayor a cero.");
        }
        if (reservaDTO.getEstadoVuelo() == null || reservaDTO.getEstadoVuelo().isEmpty()) {
            throw new IllegalArgumentException("El estado del vuelo es obligatorio.");
        }
        if (reservaDTO.getEstadoVuelo().equalsIgnoreCase("CANCELADO")) {
            throw new IllegalArgumentException("No se pueden crear reservas para vuelos cancelados.");
        }

        if (reservaDTO.getSeccionCliente() == null || reservaDTO.getSeccionCliente().isEmpty()) {
            throw new IllegalArgumentException("La sección del cliente es obligatoria.");
        }

    }
}
