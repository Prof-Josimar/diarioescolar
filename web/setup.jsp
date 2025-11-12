<%@page import="java.sql.*"%>
<%@page import="control.Conexao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Configurar Banco</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
</head>
<body class="container mt-4">

<h2>Configuração do Banco de Dados</h2>

<%
    Connection con = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        con = Conexao.getConexao(); // usa sua classe de conexão
        stmt = con.createStatement();

        // Cria tabela turma
        String sqlTurma =
            "CREATE TABLE IF NOT EXISTS turma (" +
            "id INT AUTO_INCREMENT PRIMARY KEY, " +
            "nome VARCHAR(100) NOT NULL" +
            ")";

        // Cria tabela aluno
        String sqlAluno =
            "CREATE TABLE IF NOT EXISTS aluno (" +
            "id INT AUTO_INCREMENT PRIMARY KEY, " +
            "nome VARCHAR(100) NOT NULL, " +
            "matricula VARCHAR(50) NOT NULL UNIQUE, " +
            "id_turma INT NOT NULL, " +
            "nomeResponsavel VARCHAR(100), " +
            "created_at DATETIME DEFAULT CURRENT_TIMESTAMP, " +
            "updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, " +
            "FOREIGN KEY (id_turma) REFERENCES turma(id)" +
            ")";

        stmt.executeUpdate(sqlTurma);
        stmt.executeUpdate(sqlAluno);

        rs = stmt.executeQuery("SELECT COUNT(*) FROM turma");
        int count = 0;
        if (rs.next()) count = rs.getInt(1);

        if (count == 0) {
            stmt.executeUpdate("INSERT INTO turma (nome) VALUES ('EJA'), ('2003')");
            out.println("<div class='alert alert-success'>✅ Banco, tabelas e turmas criadas com sucesso!</div>");
        } else {
            out.println("<div class='alert alert-info'>ℹ️ Banco e tabelas já existiam. Nenhuma turma inserida novamente.</div>");
        }

    } catch (SQLException e) {
        out.println("<div class='alert alert-danger'>❌ Erro ao configurar o banco: " + e.getMessage() + "</div>");
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
        if (stmt != null) try { stmt.close(); } catch (SQLException ignore) {}
        if (con != null) try { con.close(); } catch (SQLException ignore) {}
    }
%>

<a href="index.jsp" class="btn btn-primary mt-3">Voltar</a>

</body>
</html>
