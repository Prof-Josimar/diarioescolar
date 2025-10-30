<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String id = request.getParameter("id");
   

    
%>

<html>
<head>
    <title>Editar Aluno</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
    <h2>Editar Aluno</h2>
    <p>ID recebido: <strong><%= id %></strong></p>

    <!-- Aqui você pode buscar o aluno pelo ID e preencher um form -->
    <a href="form_listar_alunos.jsp" class="btn btn-secondary mt-3">Voltar</a>
    
</div>
</body>
</html>
