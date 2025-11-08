<%@page import="control.AlunoDAO"%>
<%@page import="model.Aluno"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Editar Aluno</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body class="container mt-4">

        <%
            int id = Integer.parseInt(request.getParameter("id"));
            Aluno aluno = AlunoDAO.buscarPorId(id);

            if (aluno == null) {
        %>
        <div class="alert alert-danger">Aluno não encontrado!</div>
        <%
        } else {
        %>
        <h1>Editar Aluno</h1>

        <form action="editar_aluno.jsp" method="post">
            <input type="hidden" name="id" value="<%= aluno.getId()%>">

            <div class="mb-3">
                <label class="form-label">Nome:</label>
                <input type="text" name="nome" class="form-control" value="<%= aluno.getNome()%>" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Matrícula:</label>
                <input type="text" name="matricula" class="form-control" value="<%= aluno.getMatricula()%>" required>
            </div>

            <div class="mb-3">
                <label class="form-label">ID da Turma:</label>
                <input type="number" name="id_turma" class="form-control" value="<%= aluno.getId_turma()%>" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Nome do Responsável:</label>
                <input type="text" name="nomeResponsavel" class="form-control" value="<%= aluno.getNomeResponsavel()%>">
            </div>

            <button type="submit" class="btn btn-success">Salvar Alterações</button>
            <a href="index.jsp" class="btn btn-secondary">Cancelar</a>
        </form>
        <%
            }
        %>
        <a href="form_listar_alunos.jsp" class="btn btn-secondary mt-3">Voltar</a>
    </body>
</html>


