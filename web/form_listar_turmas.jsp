<%
    request.setAttribute("titulo", "Cadastrar Turma");
%>
<%@ include file="header.jsp" %>
<%@page import="control.TurmaDAO"%>
<%@page import="java.util.List"%>
<%@page import="model.Turma"%>

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
