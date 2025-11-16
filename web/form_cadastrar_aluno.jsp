<%@page import="control.TurmaDAO"%>
<%@page import="java.util.List"%>
<%@page import="model.Turma"%>
<%
    request.setAttribute("titulo", "Lista de Alunos");
%>
<%@ include file="header.jsp" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>

<div class="container mt-4">
    <h1 class="mb-4">Cadastro de Aluno</h1>

    <form action="cadastrar_aluno.jsp" method="post" class="needs-validation" novalidate>
        <div class="mb-3">
            <label for="nome" class="form-label">Nome:</label>
            <input type="text" class="form-control" id="nome" name="nome"
                   required autofocus placeholder="Digite o nome">
        </div>

        <div class="mb-3">
            <label for="matricula" class="form-label">Matrícula:</label>
            <input type="text" class="form-control" id="matricula" name="matricula"
                   required>
        </div>

        <%
            List<Turma> listaTurmas = TurmaDAO.listarTodas();
            request.setAttribute("listaTurmas", listaTurmas);
            request.getRequestDispatcher("form_aluno.jsp").forward(request, response);

        %>



        <div class="mb-3">
            <label for="id_turma" class="form-label">Turma:</label>
            <select class="form-select" id="id_turma" name="id_turma" required>
                <c:forEach var="turma" items="${listaTurmas}">
                    <option value="${turma.id}">${turma.nome}</option>
                </c:forEach>
            </select>
        </div>

        <div class="mb-3">
            <label for="id_turma" class="form-label">ID da Turma:</label>
            <input type="number" class="form-control" id="id_turma" name="id_turma"
                   required value="1">
        </div>

        <div class="mb-3">
            <label for="nomeResponsavel" class="form-label">Nome do Responsável:</label>
            <input type="text" class="form-control" id="nomeResponsavel" name="nomeResponsavel" >
        </div>

        <button type="submit" class="btn btn-success w-100">Cadastrar</button>
    </form>
</div>

<%@ include file="footer.jsp" %>
