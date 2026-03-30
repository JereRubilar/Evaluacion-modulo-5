<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>AeroFly - Detalle de Reserva</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <style>
        .ticket {
            border-left: 5px solid #0d6efd;
            background: white;
        }
        .barcode {
            font-family: 'Libre Barcode 39', cursive; /* Opcional si quieres agregar una fuente de barras */
            font-size: 2rem;
        }
    </style>
</head>
<body class="bg-light">

<nav class="navbar navbar-dark bg-dark mb-4">
    <div class="container">
        <a class="navbar-brand fw-bold" href="index.jsp">AeroFly</a>
        <a href="reservas" class="btn btn-outline-light btn-sm">Volver a Reservas</a>
    </div>
</nav>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <h3 class="mb-4 text-center">Detalle de su Reserva</h3>

            <c:choose>
                <c:when test="${not empty detalle}">
                    <div class="card ticket shadow-lg overflow-hidden">
                        <div class="card-header bg-white border-bottom-0 pt-4 px-4">
                            <div class="d-flex justify-content-between align-items-center">
                                <h4 class="text-primary mb-0"><i class="bi bi-airplane me-2"></i>TARJETA DE EMBARQUE</h4>
                                <span class="badge bg-success">ESTADO: ${detalle.estadoVuelo}</span>
                            </div>
                        </div>
                        <div class="card-body p-4">
                            <div class="row">
                                <div class="col-sm-6 mb-3">
                                    <label class="text-muted small d-block">PASAJERO</label>
                                    <span class="h5">${detalle.nombreCliente} ${detalle.apellidoCliente}</span>
                                    <p class="text-muted small mt-1">RUT: ${detalle.rutCliente}</p>
                                </div>
                                <div class="col-sm-6 mb-3 text-sm-end">
                                    <label class="text-muted small d-block">ID RESERVA</label>
                                    <span class="h5">#${detalle.idReserva}</span>
                                </div>
                            </div>

                            <hr class="my-3">

                            <div class="row text-center">
                                <div class="col-4">
                                    <label class="text-muted small d-block">VUELO</label>
                                    <span class="fw-bold">${detalle.numeroVuelo}</span>
                                </div>
                                <div class="col-4 border-start border-end">
                                    <label class="text-muted small d-block">ASIENTO</label>
                                    <span class="fw-bold">${detalle.numeroAsiento}</span>
                                </div>
                                <div class="col-4">
                                    <label class="text-muted small d-block">CLASE</label>
                                    <span class="fw-bold">${detalle.seccionCliente}</span>
                                </div>
                            </div>
                        </div>
                        <div class="card-footer bg-light text-center py-3">
                            <p class="mb-0 text-muted small">Gracias por preferir AeroFly. Por favor, presente este documento en el mostrador.</p>
                        </div>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="alert alert-warning text-center">
                        <i class="bi bi-search me-2"></i> No se encontró la información de la reserva seleccionada.
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>