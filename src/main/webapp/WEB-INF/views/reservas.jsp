<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>AeroFly - Reservas</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
</head>
<body class="bg-light">

<nav class="navbar navbar-expand-lg navbar-dark bg-dark mb-4">
    <div class="container">
        <a class="navbar-brand fw-bold" href="${pageContext.request.contextPath}/index.jsp">
            <i class="bi bi-airplane-fill me-2"></i>AeroFly
        </a>
    </div>
</nav>

<div class="container">
    <c:if test="${not empty mensajeAlerta}">
        <div class="alert alert-${tipoAlerta} alert-dismissible fade show" role="alert">
            <i class="bi ${tipoAlerta == 'success' ? 'bi-check-circle' : 'bi-exclamation-triangle'} me-2"></i>
                ${mensajeAlerta}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </c:if>

    <div class="row">
        <div class="col-lg-4 mb-4">
            <div class="card shadow-sm">
                <div class="card-header bg-primary text-white">
                    <h5 class="mb-0"><i class="bi bi-plus-circle me-2"></i>Nueva Reserva</h5>
                </div>
                <div class="card-body">
                    <form action="reservas" method="post">
                        <div class="mb-3">
                            <label class="form-label small fw-bold">Nombre</label>
                            <input type="text" name="nombreCliente" class="form-control form-control-sm" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label small fw-bold">Apellido</label>
                            <input type="text" name="apellidoCliente" class="form-control form-control-sm" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label small fw-bold">RUT</label>
                            <input type="text" name="rutCliente" class="form-control form-control-sm" placeholder="12.345.678-9" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label small fw-bold">Vuelo Disponible</label>
                            <select name="idVuelo" class="form-select form-select-sm" required>
                                <option value="">Seleccione un vuelo...</option>
                                <c:forEach items="${vuelos}" var="v">
                                    <option value="${v.idVuelo}">${v.numeroVuelo} - ${v.origen} / ${v.destino}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="row">
                            <div class="col-6 mb-3">
                                <label class="form-label small fw-bold">Asiento</label>
                                <input type="number" name="numeroAsiento" class="form-control form-control-sm" min="1" max="150" required>
                            </div>
                            <div class="col-6 mb-3">
                                <label class="form-label small fw-bold">Sección</label>
                                <select name="seccionCliente" class="form-select form-select-sm">
                                    <option value="Economica">Económica</option>
                                    <option value="Ejecutiva">Ejecutiva</option>
                                    <option value="Primera Clase">Primera Clase</option>
                                </select>
                            </div>
                        </div>
                        <input type="hidden" name="estadoVuelo" value="Confirmado">
                        <button type="submit" class="btn btn-success w-100 mt-2">Reservar Ahora</button>
                    </form>
                </div>
            </div>
        </div>

        <div class="col-lg-8">
            <div class="card shadow-sm">
                <div class="card-header bg-dark text-white d-flex justify-content-between align-items-center">
                    <h5 class="mb-0"><i class="bi bi-list-ul me-2"></i>Reservas Realizadas</h5>
                    <span class="badge bg-secondary">${reservas.size()} registros</span>
                </div>
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-hover mb-0">
                            <thead class="table-light">
                            <tr>
                                <th>ID</th>
                                <th>Cliente</th>
                                <th>Vuelo</th>
                                <th>Asiento</th>
                                <th class="text-center">Acciones</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${reservas}" var="r">
                                <tr>
                                    <td class="fw-bold">#${r.idReserva}</td>
                                    <td>${r.nombreCliente} ${r.apellidoCliente}</td>
                                    <td><span class="badge bg-info text-dark">${r.numeroVuelo}</span></td>
                                    <td>${r.numeroAsiento}</td>
                                    <td class="text-center">
                                        <a href="reservas?id=${r.idReserva}" class="btn btn-outline-primary btn-sm">
                                            <i class="bi bi-eye"></i> Detalle
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>