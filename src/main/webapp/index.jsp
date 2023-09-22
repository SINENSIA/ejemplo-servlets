<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="es">

    <head>

        <meta charset="UTF-8">
        <title>Saludo Personalizado</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script type="text/javascript" src="${jakarta.servlet.jsp.ServletContext}/holajsp/js/index.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/index.js"></script>

        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/resources.js"></script>
    </head>

    <body>
        <main>
            <header class="py-5 mb-4 border-bottom">

                <div class="container d-flex flex-wrap justify-content-center">
                    <a href="/"
                        class="d-flex align-items-center mb-3 mb-lg-0 me-lg-auto text-dark text-decoration-none">
                        <svg class="bi me-2" width="40" height="32">
                            <use xlink:href="#bootstrap"></use>
                        </svg>
                        <span class="fs-4">Bienvenido</span>
                    </a>
                    <form class="col-12 col-lg-auto mb-3 mb-lg-0">
                        <input type="search" class="form-control" placeholder="Search..." aria-label="Search">
                    </form>
                </div>
            </header>
            <div class="container p-12 px-8 py-10 my-10">
                <h1>Saludo Personalizado</h1>
                <% Object error=request.getAttribute("error"); if (error !=null && !error.toString().isEmpty()) { %>
                    <div class="alert alert-danger" role="alert">
                        <%= error.toString() %>
                    </div>
                    <% } %>
                        <form action="saludo" method="post">
                            <div class="form-group">
                                <label for="nombre">Nombre:</label>
                                <input type="text" name="nombre" class="form-control" id="nombre" pattern="[A-Za-z\s]+"
                                    title="Solo se permiten letras y espacios" required
                                    placeholder="Cuál es tu nombre?">

                            </div>
                            <button type="submit" class="btn btn-primary">Enviar</button>

                        </form>
                        <p>
                            <% Integer contadorVisitas=(Integer) application.getAttribute("contadorVisitas"); String
                                mensaje=(contadorVisitas !=null) ? "Contador de visitas: " + contadorVisitas : "" ; %>

                                <%= mensaje %>
                        </p>
                        <p>
                            <% Integer contadorVisitasGlobal=(Integer)
                                application.getAttribute("contadorVisitasGlobal"); String
                                mensajeGlobal=(contadorVisitasGlobal !=null) ? "Contador de visitas global (filter): " +
                                contadorVisitasGlobal : "" ; %>

                                <%= mensajeGlobal %>
                        </p>
            </div>
        </main>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>

    </body>

    </html>