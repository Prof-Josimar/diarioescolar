<%@page import="control.AlunoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ include file="header.jsp" %>

<div class="container mt-4">
    <h1 class="mb-4">Excluir Aluno</h1>

    <div class="alert alert-info">
        <%
            out.println("Recebido id a excluir: " + request.getParameter("id"));

            int id = Integer.parseInt(request.getParameter("id"));
            boolean ok = AlunoDAO.deletarAluno(id);
            if (ok) {
                out.println("<span class='text-success'>Dados Excluídos com sucesso!</span>");
            } else {
                out.println("<span class='text-danger'>Erro ao excluir os dados.</span>");
            }
        %>
    </div>

    <a href="form_listar_alunos.jsp" class="btn btn-primary">Voltar à Listagem</a>
</div>

<%@ include file="footer.jsp" %>
