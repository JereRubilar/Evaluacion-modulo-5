CREATE SCHEMA aerofly;

USE aerofly;

CREATE TABLE Vuelo (
                       id_vuelo INT AUTO_INCREMENT,
                       ciudad_despegue VARCHAR(25) NOT NULL,
                       ciudad_aterrizaje VARCHAR(25) NOT NULL,
                       fecha_salida DATE NOT NULL,
                       fecha_llegada DATE NOT NULL,
                       hora_abordaje TIME NOT NULL,
                       hora_salida TIME NOT NULL,
                       hora_llegada TIME NOT NULL,
                       PRIMARY KEY (id_vuelo)
);

CREATE TABLE Cliente (
                         id_cliente INT AUTO_INCREMENT,
                         nombre VARCHAR(25) NOT NULL,
                         apellido VARCHAR(25) NOT NULL,
                         rut VARCHAR(10) UNIQUE NOT NULL,
                         PRIMARY KEY (id_cliente)
);

CREATE TABLE Reserva (
                         id_reserva INT AUTO_INCREMENT,
                         id_cliente INT NOT NULL,
                         id_vuelo INT NOT NULL,
                         numero_asiento INT NOT NULL,
                         estado_vuelo ENUM ('A TIEMPO', 'ATRASADO', 'CANCELADO') NOT NULL,
                         seccion_cliente ENUM ('ECONOMICA', 'EJECUTIVO', 'VIP') NOT NULL,
                         CONSTRAINT uq_vuelo_asiento UNIQUE (id_vuelo, numero_asiento),
                         PRIMARY KEY (id_reserva),
                         FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
                         FOREIGN KEY (id_vuelo) REFERENCES Vuelo(id_vuelo)
);

/* inserciones de prueba */
INSERT INTO vuelo (ciudad_despegue, ciudad_aterrizaje, fecha_salida, fecha_llegada, hora_abordaje, hora_salida, hora_llegada)
VALUES ('Santiago', 'Puerto Montt', '2026-05-15','2026-05-15', '10:00:00','10:30:00','12:00:00'),
       ('Concepción', 'Antofagasta', '2026-05-16' ,'2026-05-16', '14:30:00','15:00:00','17:30:00'),
       ('Santiago', 'Punta Arenas', '2026-05-17','2026-05-17', '08:00:00','08:20:00','11:00:00');