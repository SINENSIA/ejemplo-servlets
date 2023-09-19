<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="es">

    <head>
        <meta charset="UTF-8">
        <title>Página de Error</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    </head>

    <body>
        <div class="p-8">
            <h1>Ocurrió un error</h1>
            <p>Lo sentimos, se produjo un error inesperado en la aplicación.</p>
            <% String ERROR=request.getParameter("error"); if (error !=null && !error.isEmpty()) { %>

                <div class="card bg-info">
                    <div class="card-body">
                        <h5 class="card-title">
                            <%= error %>!
                        </h5>

                    </div>
                </div>

                <% } %>

                    <p><a href="index.jsp">Volver a la página de inicio</a></p>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
    </body>

    </html>