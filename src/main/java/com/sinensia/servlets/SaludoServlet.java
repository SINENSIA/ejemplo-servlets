package com.sinensia.servlets;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Servlet que procesa una solicitud para saludar a un usuario.
 * 
 */
@WebServlet(name = "SaludoServlet", urlPatterns = { "/saludo" })
public class SaludoServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtén el nombre del parámetro del formulario
        String nombre = request.getParameter("nombre");
        System.out.println("Nombre desde formulario: " + nombre);
        // Establecer el límite máximo de caracteres permitidos
        int limiteCaracteres = 100; // Puedes ajustar este valor según tus requisitos

        // Verificar si el texto supera el límite de caracteres
        if (nombre == null || nombre.length() == 0) {
            request.setAttribute("error", "El nombre no puede estar vacío");
            RequestDispatcher dispatcher = request.getRequestDispatcher(
                    "index.jsp"); // Ruta relativa a la raíz del contexto
            dispatcher.forward(request, response);
        }
        if (nombre != null && nombre.length() > limiteCaracteres) {
            RequestDispatcher dispatcher = request.getRequestDispatcher(
                    "error500.jsp"); // Ruta relativa a la raíz del contexto

            request.setAttribute(
                    "error", "El nombre no puede superar los " + limiteCaracteres + " caracteres");
            dispatcher.forward(request, response);
        }

        // Realiza alguna lógica de procesamiento si es necesario
        String patron = "[A-Za-z\\s]+";

        // Compilar el patrón
        Pattern pattern = Pattern.compile(patron);

        // Crear un objeto Matcher para buscar coincidencias
        Matcher matcher = pattern.matcher(nombre);

        // Inicializar una cadena para almacenar el texto limpio
        StringBuilder nombreLimpio = new StringBuilder();

        // Iterar sobre el texto original y agregar solo las coincidencias válidas
        while (matcher.find()) {
            nombreLimpio.append(matcher.group());
        }

        // El resultado contiene solo caracteres válidos
        String nombreClean = nombreLimpio.toString();

        HttpSession session = request.getSession();

        session.setAttribute("nombreClean", nombreClean);
        // Configura un atributo de solicitud con el nombre
        request.setAttribute(
                "nombreClean",
                nombreClean
                        + " (desde el servlet)");

        // Redirige la solicitud al archivo JSP
        RequestDispatcher dispatcher = request.getRequestDispatcher(
                "saludo.jsp"); // Ruta relativa a la raíz del contexto
        try {
            System.out.println("redirigiendo a saludo.jsp");
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            System.err.println("Error al redirigir la solicitud: " + e);
        }
    }
}