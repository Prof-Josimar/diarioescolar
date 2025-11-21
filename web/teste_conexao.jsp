<%@page import="java.util.Map"%>
<%@page import="java.util.Properties"%>
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

        <h2>🔍 Teste de Conexão com o Banco de Dados e Informações</h2>
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
                if (con != null) try {
                    con.close();
                } catch (SQLException ignore) {
                }
            }
            out.println("<hr>");
            out.println("<h4>🌐 Informações do Servidor</h4>");
            out.println("Server Info: " + application.getServerInfo() + "<br>");
            out.println("Servlet Version: " + application.getMajorVersion() + "." + application.getMinorVersion() + "<br>");

            out.println("<hr>");
            out.println("<h4>☕ Versão do Java</h4>");
            out.println("Java Version: " + System.getProperty("java.version") + "<br>");
            out.println("Java Vendor: " + System.getProperty("java.vendor") + "<br>");

            out.println("<hr>");
            Connection c = null;
            PreparedStatement ps = null;
            ResultSet rs = null;

            try {
                c = Conexao.getConexao();
                ps = c.prepareStatement("SELECT VERSION()");
                rs = ps.executeQuery();

                if (rs.next()) {
                    out.println("<h4>🗄️ Versão do MySQL</h4>");
                    out.println("MySQL Version: " + rs.getString(1) + "<br>");
                }
            } catch (Exception e) {
                out.println("Erro ao obter versão do MySQL: " + e.getMessage());
            } finally {
                Conexao.fecharConexao(c, ps, rs);
            }
            out.println("<hr>");
            out.println("<h4>🔌 Driver JDBC</h4>");
            try {
                Class cJDBC = Class.forName("com.mysql.cj.jdbc.Driver");
                Package p = cJDBC.getPackage();

                out.println("Driver: " + p.getImplementationTitle() + "<br>");
                out.println("Driver Version: " + p.getImplementationVersion() + "<br>");
            } catch (Exception e) {
                out.println("Erro ao obter driver JDBC: " + e.getMessage());
            }


        %>


        <hr>



        <h3>🔍 Clientes conectados ao MySQL</h3>

        <table class="table table-bordered table-striped">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Usuário</th>
                    <th>Host</th>
                    <th>DB</th>
                    <th>Comando</th>
                    <th>Tempo</th>
                    <th>Estado</th>
                    <th>Info</th>
                </tr>
            </thead>
            <tbody>
                <%    c = null;
                    ps = null;
                    rs = null;

                    try {
                        c = Conexao.getConexao();
                        ps = c.prepareStatement("SHOW FULL PROCESSLIST");
                        rs = ps.executeQuery();

                        while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getString("Id")%></td>
                    <td><%= rs.getString("User")%></td>
                    <td><%= rs.getString("Host")%></td>
                    <td><%= rs.getString("db")%></td>
                    <td><%= rs.getString("Command")%></td>
                    <td><%= rs.getString("Time")%></td>
                    <td><%= rs.getString("State")%></td>
                    <td><%= rs.getString("Info")%></td>
                </tr>
                <%
                        }
                    } catch (Exception e) {
                        out.println("<tr><td colspan='8'>Erro: " + e.getMessage() + "</td></tr>");
                    } finally {
                        Conexao.fecharConexao(c, ps, rs);
                    }
                %>
            </tbody>
        </table>


        <%
            out.println("<h4>📂 Caminhos do Java</h4>");
            out.println("JAVA HOME: " + System.getenv("JAVA_HOME") + "<br>");
            out.println("Java Executable Path: " + System.getProperty("java.home") + "<br>");
            out.println("User Dir (projeto): " + System.getProperty("user.dir") + "<br>");
            out.println("User Home: " + System.getProperty("user.home") + "<br>");

            out.println("<h4>⚙️ Runtime</h4>");
            out.println("Runtime Name: " + System.getProperty("java.runtime.name") + "<br>");
            out.println("Runtime Version: " + System.getProperty("java.runtime.version") + "<br>");
            out.println("VM Name: " + System.getProperty("java.vm.name") + "<br>");
            out.println("VM Version: " + System.getProperty("java.vm.version") + "<br>");

            out.println("<h4>🗂️ Servidor de Aplicação</h4>");
            out.println("Servlet Container: " + application.getServerInfo() + "<br>");
            out.println("Real Path (webapp): " + application.getRealPath("/") + "<br>");

            out.println("<h4>📜 Todas as System Properties</h4>");
            Properties properties = System.getProperties();
            for (String key : properties.stringPropertyNames()) {
                out.println(key + " = " + properties.getProperty(key) + "<br>");
            }
            out.println("<h4>🌍 Variáveis de Ambiente</h4>");
            Map<String, String> env = System.getenv();
            for (String key : env.keySet()) {
                out.println(key + " = " + env.get(key) + "<br>");
            }


        %>



        <%@ include file="footer.jsp" %>
    </body>
</html>

