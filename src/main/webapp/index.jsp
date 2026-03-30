<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AeroFly - Tu próximo destino comienza aquí</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">

    <style>
        body { font-family: 'Poppins', sans-serif; }
        .hero-section {
            background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)),
            url('https://images.unsplash.com/photo-1436491865332-7a61a109c0f2?auto=format&fit=crop&w=1350&q=80');
            background-size: cover;
            background-position: center;
            height: 80vh;
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
        }
        .feature-icon {
            font-size: 2.5rem;
            color: #0d6efd;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
    <div class="container">
        <a class="navbar-brand fw-bold" href="index.jsp">
            <i class="bi bi-airplane-fill me-2"></i>AeroFly
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link active" href="index.jsp">Inicio</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="reservas">Gestión de Reservas</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="reservas.jsp">Mis Reservas</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<header class="hero-section">
    <div class="container">
        <h1 class="display-2 fw-bold mb-3">Vuela mas alto con AeroFly</h1>
        <p class="lead mb-4">Encuentra las mejores ofertas en vuelos nacionales e internacionales.</p>
        <a href="reservas" class="btn btn-primary btn-lg px-5 shadow">Ver Mis Reservas</a>
    </div>
</header>

<section class="py-5 bg-light">
    <div class="container">
        <div class="row text-center">
            <div class="col-md-4 mb-4">
                <div class="p-4 bg-white rounded shadow-sm">
                    <i class="bi bi-shield-check feature-icon"></i>
                    <h3 class="h5 mt-3">Seguridad Garantizada</h3>
                    <p class="text-muted">Protocolos de seguridad de alto nivel en cada uno de nuestros viajes.</p>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="p-4 bg-white rounded shadow-sm">
                    <i class="bi bi-clock-history feature-icon"></i>
                    <h3 class="h5 mt-3">Puntualidad</h3>
                    <p class="text-muted">Valoramos tu tiempo. Somos líderes en puntualidad en la región.</p>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="p-4 bg-white rounded shadow-sm">
                    <i class="bi bi-headset feature-icon"></i>
                    <h3 class="h5 mt-3">Soporte 24/7</h3>
                    <p class="text-muted">Nuestro equipo está listo para ayudarte en cualquier momento del viaje.</p>
                </div>
            </div>
        </div>
    </div>
</section>

<footer class="bg-dark text-white py-4 mt-auto">
    <div class="container text-center">
        <p class="mb-0">&copy; 2026 AeroFly IT Academy. Todos los derechos reservados.</p>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>