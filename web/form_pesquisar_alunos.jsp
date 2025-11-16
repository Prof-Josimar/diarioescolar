
<%@page import="java.util.List"%>
<%@page import="control.AlunoDAO"%>
<%@page import="model.Aluno"%>

<%@ include file="header.jsp" %>

    <div class="card shadow-sm p-4">
        <h3 class="mb-4 text-primary text-center">Pesquisar Aluno por Nome</h3>

        <form method="POST" action="form_pesquisar_alunos.jsp">
            <div class="mb-3">
                <label for="nome" class="form-label">Nome:</label>
                <input type="text" class="form-control" id="nome" name="nome" required autofocus placeholder="Digite parte do nome">
            </div>
            <button type="submit" class="btn btn-primary"><i class="bi bi-search"></i> Pesquisar</button>
        </form>

        <hr>

        <%
            String nome = request.getParameter("nome");
            if (nome != null && !nome.trim().isEmpty()) {
                List<Aluno> lista = AlunoDAO.listarAlunosPorNome(nome);

                if (lista.isEmpty()) {
        %>
                    <div class="alert alert-warning mt-3">Nenhum aluno encontrado.</div>
        <%
                } else {
        %>
                    <table class="table table-striped table-hover mt-3">
                        <thead class="table-primary">
                            <tr>
                                <th>ID</th>
                                <th>Nome</th>
                                <th>Matrícula</th>
                                <th>Turma</th>
                                <th>Responsável</th>
                            </tr>
                        </thead>
                        <tbody>
                        <%
                            for (Aluno a : lista) {
                        %>
                            <tr>
                                <td><%= a.getId() %></td>
                                <td><%= a.getNome() %></td>
                                <td><%= a.getMatricula() %></td>
                                <td><%= a.getId_turma() %></td>
                                <td><%= a.getNomeResponsavel() %></td>
                            </tr>
                        <%
                            }
                        %>
                        </tbody>
                    </table>
        <%
                }
            }
        %>
    </div>

<%@ include file="footer.jsp" %>
