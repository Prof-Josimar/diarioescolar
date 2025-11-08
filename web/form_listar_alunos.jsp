
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@page import="java.util.List"%>
<%@page import="control.AlunoDAO"%>
<%@page import="model.Aluno"%>
<%@page import="model.Aluno"%>



<html>
    <head>
        <title>Lista de Alunos</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>

    <body class="bg-light">

        <div class="container mt-5">
            <h2 class="mb-4">Lista de Alunos</h2>

            <%
                List<Aluno> alunos = AlunoDAO.listarAlunos();
                
            %>

            <table class="table table-striped table-hover align-middle">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Nome</th>
                        <th>Matrícula</th>
                        <th>Turma</th>
                        <th>Responsável</th>
                        <th>Ações</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        if (alunos != null && !alunos.isEmpty()) {
                            for (Aluno a : alunos) {
                    %>
                    <tr>
                        <td><%= a.getId()%></td>
                        <td><%= a.getNome()%></td>
                        <td><%= a.getMatricula()%></td>
                        <td><%= a.getId_turma()%></td>
                        <td><%= a.getNomeResponsavel()%></td>
                        <td>
                            <!-- Botão Editar -->
                            <form action="form_editar_aluno.jsp" method="POST" style="display:inline;">
                                <input type="hidden" name="id" value="<%= a.getId()%>">
                                <button type="submit" class="btn btn-sm btn-warning">Editar</button>
                            </form>

                            <!-- Botão Deletar -->
                            <form action="deleteAluno.jsp" method="POST" style="display:inline;" 
                                  onsubmit="return confirm('Tem certeza que deseja excluir este aluno?');">
                                <input type="hidden" name="id" value="<%= a.getId()%>">
                                <button type="submit" class="btn btn-sm btn-danger">Excluir</button>
                            </form>
                        </td>
                    </tr>
                    <%
                        }
                    } else {
                    %>
                    <tr><td colspan="6" class="text-center text-muted">Nenhum aluno cadastrado.</td></tr>
                    <% }%>
                </tbody>
            </table>

            <a href="inserirAluno.jsp" class="btn btn-primary mt-3">Cadastrar novo aluno</a>
        </div>
        <a href="index.jsp">Voltar ao Início</a>
    </body>
</html>
