<%@page import="control.AlunoDAO"%>
<%@page import="model.Aluno"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Atualizar Aluno</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-4">

<%
    int id = Integer.parseInt(request.getParameter("id"));
    String nome = request.getParameter("nome");
    String matricula = request.getParameter("matricula");
    int id_turma = Integer.parseInt(request.getParameter("id_turma"));
    String nomeResponsavel = request.getParameter("nomeResponsavel");

    Aluno aluno = new Aluno();
    aluno.setId(id);
    aluno.setNome(nome);
    aluno.setMatricula(matricula);
    aluno.setId_turma(id_turma);
    aluno.setNomeResponsavel(nomeResponsavel);

    boolean sucesso = AlunoDAO.atualizarAluno(aluno);

    if (sucesso) {
%>
    <script>
        alert("Aluno atualizado com sucesso!");
        window.location.href = "index.jsp";
    </script>
<%
    } else {
%>
    <div class="alert alert-danger">❌ Falha ao atualizar o aluno.</div>
    <a href="index.jsp" class="btn btn-secondary mt-3">Voltar</a>
<%
    }
%>

</body>
</html>
