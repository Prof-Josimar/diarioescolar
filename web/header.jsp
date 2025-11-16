<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title><%= (request.getAttribute("titulo") != null) ? request.getAttribute("titulo") : "Sistema Escolar"%></title>

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Ícones (opcional) -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">

        <!-- CSS personalizado (se quiser adicionar seu próprio estilo) -->
        <style>
            body {
                background-color: #f8f9fa;
            }
            .navbar {
                margin-bottom: 30px;
            }


            .nav-item.separator {
                width: 20px;  /* largura do espaço */
                border-left: 1px solid #ccc; /* ou cor desejada */
                margin: 0 10px; /* espaçamento horizontal */
            }

        </style>
    </head>
    <body>
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
            <div class="container-fluid">
                <a class="navbar-brand" href="index.jsp">Sistema Escolar</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link" href="form_cadastrar_aluno.jsp">Cadastrar Aluno</a></li>
                        <li class="nav-item"><a class="nav-link" href="form_pesquisar_alunos.jsp">Pesquisar Aluno</a></li>
                        <li class="nav-item"><a class="nav-link" href="form_listar_alunos.jsp">Listar Alunos</a></li>
                        <li class="nav-item separator"></li>
                        <li class="nav-item"><a class="nav-link" href="form_cadastrar_turmas.jsp">Cadastrar Turmas</a></li>

                    </ul>
                </div>
            </div>
        </nav>

        <div class="container">
