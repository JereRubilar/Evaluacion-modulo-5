# AeroFly - Sistema de Reservas de Vuelos ✈️

Este proyecto es una aplicación web dinámica desarrollada en Java siguiendo el patrón de diseño MVC (Modelo-Vista-Controlador). 
Permite la gestión de reservas de vuelos, permitiendo a los usuarios visualizar vuelos disponibles, registrar pasajeros y generar tickets de embarque.

## 🚀 Características

- Listado de Reservas: Visualización de todas las reservas existentes con datos de origen y destino.


- Registro de Pasajeros: Creación automática de clientes al momento de realizar una reserva.


- Detalle de Reserva: Vista detallada tipo "Boarding Pass" (Tarjeta de embarque) para cada reserva.


- Validación Robusta: Limpieza de RUT y validación de integridad de datos en servidor.


- Arquitectura Profesional: Implementación de patrones DAO y DTO para una separación de responsabilidades limpia.

## 🛠️ Tecnologías Utilizadas

1. Backend: Java 17+, Jakarta Servlet API 6.0.

2. Frontend: JSP (JavaServer Pages), JSTL, Bootstrap 5.3, Bootstrap Icons.

3. Base de Datos: MySQL 8.0+.

4. Gestión de Dependencias: Maven.

5. Servidor: Apache Tomcat 10.1+.

### 📋 Requisitos Previos

- Tener instalado MySQL Server.

- Un IDE (IntelliJ IDEA, Eclipse o VS Code).

- Servidor Apache Tomcat 10 configurado.

### ⚙️ Configuración e Instalación


1. Base de Datos:

    Ejecuta el script init.sql incluido en el proyecto para crear la base de datos aerofly y las tablas necesarias.
    SQL


2. Conexión:

    Configura tus credenciales en la clase org.example.conf.DatabaseConnection.java:
    Java
    
    String url = "jdbc:mysql://localhost:3306/aerofly";
    String user = "tu_usuario";
    String password = "tu_password";


3. Despliegue:

   Compila el proyecto con Maven: mvn clean install.

   Despliega el archivo .war generado en tu servidor Tomcat.

   Accede a http://localhost:8080/Evaluacion-modular-5/ (la URL puede variar según tu configuración de context path).
