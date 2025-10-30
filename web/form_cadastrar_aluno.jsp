<%-- 
    Document   : cadastrar_aluno
    Created on : 16/10/2025, 08:49:17
    Author     : ETEP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar Aluno</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    </head>
    <body>
        <h1>Cadastro de Aluno</h1>

        <form action="cadastrar_aluno.jsp" method="post">
            
            <label for="nome">Nome:</label>
            <input type="text" id="nome" name="nome" required  autofocus placeholder="Digite o nome" value="Josimar Ribeiro"/><br/><br/>

            <label for="matricula">Matrícula:</label>
            <input type="text" id="matricula" name="matricula" required value="2262830" /><br/><br/>

            <label for="id_turma">ID da Turma:</label>
            <input type="number" id="id_turma" name="id_turma" required  value="1"/><br/><br/>

            <label for="nomeResponsavel">Nome do Responsável:</label>
            <input type="text" id="nomeResponsavel" name="nomeResponsavel" value="Irene Ribeiro"/><br/><br/>

            <input type="submit" value="Cadastrar"  class="btn btn-success"/>
        </form>


        <br>
        <a href="index.jsp">Voltar ao Início</a>
    </body>
</html>
