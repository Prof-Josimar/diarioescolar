<%@page import="java.util.List"%>
<%@page import="control.AlunoDAO"%>
<%@page import="model.Aluno"%>

<%
    request.setAttribute("titulo", "Lista de Alunos");
    List<Aluno> alunos = AlunoDAO.listarAlunos();
%>
<%@ include file="header.jsp" %>

<div class="card shadow-sm p-4 mt-4">
    <h2 class="mb-4 text-center text-primary">Lista de Alunos</h2>

    <table class="table table-striped">
        <thead>
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
                for (Aluno a : alunos) {
            %>
            <tr>
                <td><%= a.getId()%></td>
                <td><%= a.getNome()%></td>
                <td><%= a.getMatricula()%></td>
                <td><%= a.getTurma().getNome()%></td>
                <td><%= a.getNomeResponsavel()%></td>
                <td>
                    <!-- Botão Editar -->
                    <form action="form_editar_aluno.jsp" method="POST" style="display:inline;">
                        <input type="hidden" name="id" value="<%= a.getId()%>">
                        <button type="submit" class="btn btn-sm btn-warning">
                            <i class="bi bi-pencil-square"></i> Editar
                        </button>
                    </form>

                    <!-- Botão Deletar -->
                    <form action="form_excluir_aluno.jsp" method="POST" style="display:inline;"
                          onsubmit="return confirm('Tem certeza que deseja excluir este aluno?');">
                        <input type="hidden" name="id" value="<%= a.getId()%>">
                        <button type="submit" class="btn btn-sm btn-danger">
                            <i class="bi bi-trash"></i> Excluir
                        </button>
                    </form>
                </td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
</div>

<%@ include file="footer.jsp" %>
