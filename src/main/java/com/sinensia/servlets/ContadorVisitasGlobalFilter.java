package com.sinensia.servlets;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import java.io.IOException;

/**
 * Filtro que cuenta el número de visitas a la aplicación.
 */
public class ContadorVisitasGlobalFilter implements Filter {
    @Override
    public void init(FilterConfig config) throws ServletException {
        // Inicialización del filtro (opcional)
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        // Obtener el contador de visitas global
        jakarta.servlet.ServletContext application = request.getServletContext();
        Integer contadorVisitasGlobal = (Integer) application.getAttribute("contadorVisitasGlobal");

        // Incrementar el contador o inicializarlo en 1 si es nulo
        if (contadorVisitasGlobal == null) {
            contadorVisitasGlobal = 1;
        } else {
            contadorVisitasGlobal++;
        }

        // Guardar el contador actualizado en el contexto de la aplicación
        application.setAttribute("contadorVisitasGlobal", contadorVisitasGlobal);

        // Continuar con el flujo principal
        chain.doFilter(request, response);
    }

    public void destroy() {

        // Limpieza del filtro (opcional)
    }
}
