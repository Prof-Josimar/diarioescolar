<%-- 
    Document   : cadastrar_aluno
    Created on : 16/10/2025, 09:16:45
    Author     : ETEP
--%>

<%@page import="model.Aluno"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar Aluno</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    </head>
    <body>
        <h1>Dados Recebidos</h1>

        <%
            String nome = request.getParameter("nome");
            out.println("Nome..: " + nome);
            out.println("<br>");

            String matricula = request.getParameter("matricula");
            out.println("Matricula..: " + matricula);
            out.println("<br>");

            int id_turma = Integer.parseInt(request.getParameter("id_turma"));
            out.println("Id da Turma " + id_turma);
            out.println("<br>");

            String nomeResponsavel = request.getParameter("nomeResponsavel");
            if (nomeResponsavel == null) {
                nomeResponsavel = "";
            }
            out.println("Nome Responsavel :  " + nomeResponsavel);
            
            Aluno aluno = new Aluno();
            
            aluno.setNome(nome);
            aluno.setMatricula(matricula);
            aluno.setId_turma(id_turma);
            aluno.setNomeResposavel(nomeResponsavel);
            
            out.println(aluno);

        %>
        <hr>
        <a href="index.jsp">Voltar ao Início</a>
    </body>
</html>
