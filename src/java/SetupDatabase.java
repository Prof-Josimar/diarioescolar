package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/setup")
public class SetupDatabase extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            try (Connection con = Conexao.getConexao(); Statement stmt = con.createStatement()) {

                // Criação do banco e tabelas
                String sql = """
                    CREATE DATABASE IF NOT EXISTS diarioescolar;
                    USE diarioescolar;

                    CREATE TABLE IF NOT EXISTS turma (
                        id INT AUTO_INCREMENT PRIMARY KEY,
                        nome VARCHAR(100) NOT NULL
                    );

                    CREATE TABLE IF NOT EXISTS aluno (
                        id INT AUTO_INCREMENT PRIMARY KEY,
                        nome VARCHAR(100) NOT NULL,
                        matricula VARCHAR(50) NOT NULL UNIQUE,
                        id_turma INT NOT NULL,
                        nomeResponsavel VARCHAR(100),
                        created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
                        updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                        FOREIGN KEY (id_turma) REFERENCES turma(id)
                    );
                """;

                // Executa múltiplos comandos (MySQL permite isso se o driver suportar)
                for (String command : sql.split(";")) {
                    if (!command.trim().isEmpty()) {
                        stmt.execute(command);
                    }
                }

                out.println("<h3 style='color:green;'>✅ Banco e tabelas criados (ou já existentes).</h3>");
            } catch (SQLException e) {
                out.println("<h3 style='color:red;'>❌ Erro ao configurar o banco: " + e.getMessage() + "</h3>");
            }
        }
    }
}
