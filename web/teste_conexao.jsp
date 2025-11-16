<%@ include file="header.jsp" %>
<%@page import="java.sql.*"%>
<%@page import="control.Conexao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Teste de Conexão com o Banco</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB"
          crossorigin="anonymous">
</head>
<body class="container mt-4">

<h2>🔍 Teste de Conexão com o Banco de Dados</h2>
<hr>

<%
    Connection con = null;
    try {
        con = Conexao.getConexao();
        if (con != null && !con.isClosed()) {
            out.println("<div class='alert alert-success'>✅ Conexão estabelecida com sucesso!</div>");
        } else {
            out.println("<div class='alert alert-danger'>❌ A conexão retornou nula ou foi fechada.</div>");
        }
    } catch (Exception e) {
        out.println("<div class='alert alert-danger'>❌ Erro ao conectar: " + e.getMessage() + "</div>");
    } finally {
        if (con != null) try { con.close(); } catch (SQLException ignore) {}
    }
%>


<%@ include file="footer.jsp" %>
</body>
</html>

