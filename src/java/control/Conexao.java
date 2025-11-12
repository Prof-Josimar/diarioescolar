package control;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public final class Conexao {
    // Configurações do banco

    private static final String URL = "jdbc:mysql://localhost:3306/diarioescolar";
    private static final String USER = "root";
    private static final String PASSWORD = "";

    // Impede que a classe seja instanciada
    private Conexao() {
        throw new UnsupportedOperationException("Esta classe não pode ser instanciada.");
    }

    public static Connection getConexao() {
        Connection con = null;
        try {
            // Carrega o driver do MySQL (opcional em versões modernas, mas seguro)
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Tenta estabelecer a conexão
            con = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("✅ Conexão bem-sucedida com o banco de dados!");
        } catch (ClassNotFoundException e) {
            System.err.println("❌ Driver JDBC não encontrado: " + e.getMessage());
        } catch (SQLException e) {
            System.err.println("❌ Erro ao conectar ao banco de dados: " + e.getMessage());
        }
        return con;
    }

}
