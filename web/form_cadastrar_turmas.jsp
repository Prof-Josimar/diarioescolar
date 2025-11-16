<%@page import="control.Conexao"%>
<%@page import="control.TurmaDAO"%>
<%@page import="java.util.List"%>
<%@page import="model.Turma"%>
<%
    request.setAttribute("titulo", "Cadastrar Turma");
%>
<%@ include file="header.jsp" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>

<div class="container mt-4">
    <h1 class="mb-4">Cadastro de Turma</h1>

    <form action="cadastrar_turma.jsp" method="post" class="needs-validation" novalidate>
        <div class="mb-3">
            <label for="nome" class="form-label">Nome da Turma:</label>
            <input type="text" class="form-control" id="nome" name="nome"
                   required autofocus placeholder="Digite o nome da turma">
        </div>
        <!--
        <div class="mb-3">
            <label for="descricao" class="form-label">Descrição:</label>
            <textarea class="form-control" id="descricao" name="descricao"
                      rows="3" placeholder="Digite uma breve descrição"></textarea>
        </div>

        <div class="mb-3">
            <label for="ano" class="form-label">Ano:</label>
            <input type="number" class="form-control" id="ano" name="ano"
                   required placeholder="Digite o ano da turma">
        </div>
        -->
        <button type="submit" class="btn btn-success w-100">Cadastrar Turma</button>
    </form>
</div>
<div>
    <hr>
</div>
<%
    List<Turma> listaTurmas = TurmaDAO.listarTodas();
%>

<table class="table table-striped">
    <thead>
        <tr>
            <th>ID</th>
            <th>Nome da Turma</th>
        </tr>
    </thead>
    <tbody>
        <%
            for (Turma turma : listaTurmas) {
        %>
        <tr>
            <td><%= turma.getId() %></td>
            <td><%= turma.getNome() %></td>
        </tr>
        <%
            }
        %>
    </tbody>
</table>

        

<%@ include file="footer.jsp" %>
