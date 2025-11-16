package control;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import model.Turma;

public class TurmaDAO {

    public static boolean inserirTurma(Turma turma) {
        String sql = "INSERT INTO turma (nome) VALUES ( ?)";

        try ( Connection con = Conexao.getConexao();  
                PreparedStatement stmt = con.prepareStatement(sql)) {
                if (con == null) {
                    System.err.println("Conexão nula. Falha ao inserir aluno.");
                    return false;
            }

            stmt.setString(1, turma.getNome());
            int linhasAfetadas = stmt.executeUpdate();
            return linhasAfetadas > 0;
        } catch (SQLException e) {
            System.err.println("Erro ao inserir turma: " + e.getMessage());
            return false;
        }
    }
    
    
}
