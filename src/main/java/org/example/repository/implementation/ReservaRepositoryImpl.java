package org.example.repository.implementation;

import org.example.conf.DatabaseConnection;
import org.example.model.EstadoVuelo;
import org.example.model.Reserva;
import org.example.model.SeccionCliente;
import org.example.repository.ReservaRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ReservaRepositoryImpl implements ReservaRepository {

    private final DatabaseConnection databaseConnection = DatabaseConnection.getInstance();

    @Override
    public Integer crearReserva(Reserva reserva) {
        String sql = "INSERT INTO reserva (id_cliente, id_vuelo, numero_asiento, estado_vuelo, seccion_cliente) VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = DatabaseConnection.getInstance().getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            pstmt.setInt(1, reserva.getIdCliente());
            pstmt.setInt(2, reserva.getIdVuelo());
            pstmt.setInt(3, reserva.getNumeroAsiento());
            pstmt.setString(4, reserva.getEstadoVuelo().getValor());
            pstmt.setString(5, reserva.getSeccionCliente().getValor());

            int filasAfectadas = pstmt.executeUpdate();

            if (filasAfectadas > 0) {
                try (ResultSet generatedKeys = pstmt.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        return generatedKeys.getInt(1);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    public List<Reserva> obtenerReservas() {
        String query = "SELECT * FROM reserva";
        List<Reserva> reservas = new ArrayList<>();

        try (
                Connection connection = databaseConnection.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(query);
                ResultSet resultSet = preparedStatement.executeQuery()
        ) {
            while (resultSet.next()) {
                Reserva reserva = new Reserva();
                reserva.setIdReserva(resultSet.getInt("id_reserva"));
                reserva.setIdCliente(resultSet.getInt("id_cliente"));
                reserva.setIdVuelo(resultSet.getInt("id_vuelo"));
                reserva.setNumeroAsiento(resultSet.getInt("numero_asiento"));
                reserva.setEstadoVuelo(EstadoVuelo.fromValor(resultSet.getString("estado_vuelo")));
                reserva.setSeccionCliente(SeccionCliente.fromValor(resultSet.getString("seccion_cliente")));
                reservas.add(reserva);
            }

            return reservas;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    @Override
    public Reserva obtenerReservaPorId(Integer idReserva) {
        String query = "SELECT * FROM reserva WHERE id_reserva = ?";

        try (
                Connection connection = databaseConnection.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(query)
        ) {
            preparedStatement.setInt(1, idReserva);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                Reserva reserva = new Reserva();
                reserva.setIdReserva(resultSet.getInt("id_reserva"));
                reserva.setIdCliente(resultSet.getInt("id_cliente"));
                reserva.setIdVuelo(resultSet.getInt("id_vuelo"));
                reserva.setNumeroAsiento(resultSet.getInt("numero_asiento"));
                reserva.setEstadoVuelo(EstadoVuelo.fromValor(resultSet.getString("estado_vuelo")));
                reserva.setSeccionCliente(SeccionCliente.fromValor(resultSet.getString("seccion_cliente")));
                return reserva;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }
}
