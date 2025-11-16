package control;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public final class Conexao {
    // Configurações do banco
    private static final String URL = "jdbc:mysql://localhost:3306/diarioescolar";
    private static final String USER = "root";
    private static final String PASSWORD = "bty780";

    // Impede instanciamento
    private Conexao() {
        throw new UnsupportedOperationException("Esta classe não pode ser instanciada.");
    }

    // Método para obter conexão
    public static Connection getConexao() {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("✅ Conexão bem-sucedida com o banco de dados!");
        } catch (ClassNotFoundException e) {
            System.err.println("❌ Driver JDBC não encontrado: " + e.getMessage());
        } catch (SQLException e) {
            System.err.println("❌ Erro ao conectar ao banco de dados: " + e.getMessage());
        }
        return con;
    }

    // ===== MÉTODOS DE FECHAMENTO =====
    public static void fecharConexao(Connection con) {
        if (con != null) {
            try {
                con.close();
            } catch (SQLException e) {
                System.err.println("❌ Erro ao fechar conexão: " + e.getMessage());
            }
        }
    }

    public static void fecharConexao(Connection con, PreparedStatement stmt) {
        fecharConexao(con);
        if (stmt != null) {
            try {
                stmt.close();
            } catch (SQLException e) {
                System.err.println("❌ Erro ao fechar PreparedStatement: " + e.getMessage());
            }
        }
    }

    public static void fecharConexao(Connection con, PreparedStatement stmt, ResultSet rs) {
        fecharConexao(con, stmt);
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                System.err.println("❌ Erro ao fechar ResultSet: " + e.getMessage());
            }
        }
    }
}
