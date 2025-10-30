package control;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import model.Aluno;

public class AlunoDAO {

    public static boolean inserirAluno(Aluno aluno) {
        String sql = "INSERT INTO aluno (nome, matricula, id_turma, nomeResposavel) VALUES (?, ?, ?, ?)";

        try (Connection con = Conexao.getConexao(); PreparedStatement stmt = con.prepareStatement(sql)) {

            if (con == null) {
                System.err.println("Conexão nula. Falha ao inserir aluno.");
                return false;
            }

            stmt.setString(1, aluno.getNome());
            stmt.setString(2, aluno.getMatricula());
            stmt.setInt(3, aluno.getId_turma());
            stmt.setString(4, aluno.getNomeResposavel());

            int linhasAfetadas = stmt.executeUpdate();
            return linhasAfetadas > 0;

        } catch (SQLException e) {
            System.err.println("Erro ao inserir aluno: " + e.getMessage());
            return false;
        }
    }
}
