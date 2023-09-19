<%@ page contentType="text/html; charset=UTF-8" %>
    <!DOCTYPE html>
    <html lang="es">

    <head>
        <meta charset="UTF-8">
        <title>Saludo Personalizado
        </title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    </head>

    <body>
        <main>
            <header class="py-5 mb-4 border-bottom">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item active" aria-current="page">Home</li>
                </ol>
                <div class="container d-flex flex-wrap justify-content-center">
                    <a href="/"
                        class="d-flex align-items-center mb-3 mb-lg-0 me-lg-auto text-dark text-decoration-none">
                        <svg class="bi me-2" width="40" height="32">
                            <use xlink:href="#bootstrap"></use>
                        </svg>
                        <span class="fs-4">Bienvenido <%= request.getAttribute("nombreClean") %></span>
                    </a>
                    <form class="col-12 col-lg-auto mb-3 mb-lg-0">
                        <input type="search" class="form-control" placeholder="Buscar..." aria-label="Search">
                    </form>
                </div>
            </header>

            <div class="container p-12">
                <h1>Saludo Personalizado</h1>
                <%-- Procesar el formulario cuando se envíe --%>
                    <% Object nombreClean=request.getAttribute("nombreClean"); if (nombreClean !=null &&
                        !nombreClean.toString().isEmpty()) { %>

                        <div class="card bg-info">
                            <div class="card-body">
                                <h5 class="card-title">Hola, <%= nombreClean.toString() %>!</h5>
                                <p class="card-text"> Bienvenido al saludo personalizado.</p>
                            </div>
                        </div>

                        <% } %>

                            <%-- Incrementar el contador de visitas global -- está mal hecho deberiamos reducir codigo
                                --%>
                                <% Integer contadorVisitas=(Integer) application.getAttribute("contadorVisitas"); if
                                    (contadorVisitas==null) { contadorVisitas=1; } else { contadorVisitas++; }
                                    application.setAttribute("contadorVisitas", contadorVisitas); %>

                                    <%-- Incrementar el contador de visitas de sesión --%>
                                        <% Integer contadorVisitasSesion=(Integer)
                                            session.getAttribute("contadorVisitasSesion"); if
                                            (contadorVisitasSesion==null) { contadorVisitasSesion=1; } else {
                                            contadorVisitasSesion++; } session.setAttribute("contadorVisitasSesion",
                                            contadorVisitasSesion); %>

                                            <p>Contador de visitas global: <%= contadorVisitas %>
                                            </p>
                                            <p>Contador de visitas de sesión: <%= contadorVisitasSesion %>
                                            </p>

                                            <a href="index.jsp">Volver al inicio</a>
            </div>
        </main>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
    </body>

    </html>