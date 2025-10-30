package control;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Aluno;

public class AlunoDAO {

    public static boolean inserirAluno(Aluno aluno) {
        String sql = "INSERT INTO aluno (nome, matricula, id_turma, nomeResponsavel) VALUES (?, ?, ?, ?)";

        try (Connection con = Conexao.getConexao(); PreparedStatement stmt = con.prepareStatement(sql)) {

            if (con == null) {
                System.err.println("Conexão nula. Falha ao inserir aluno.");
                return false;
            }

            stmt.setString(1, aluno.getNome());
            stmt.setString(2, aluno.getMatricula());
            stmt.setInt(3, aluno.getId_turma());
            stmt.setString(4, aluno.getNomeResponsavel());

            int linhasAfetadas = stmt.executeUpdate();
            return linhasAfetadas > 0;

        } catch (SQLException e) {
            System.err.println("Erro ao inserir aluno: " + e.getMessage());
            return false;
        }
    }

    public static List<Aluno> listarAlunos() {
        List<Aluno> alunos = new ArrayList<>();
        String sql = "SELECT * FROM aluno";

        try (Connection con = Conexao.getConexao(); PreparedStatement stmt = con.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Aluno aluno = new Aluno();
                aluno.setId(rs.getInt("id")); // caso exista um campo id
                aluno.setNome(rs.getString("nome"));
                aluno.setMatricula(rs.getString("matricula"));
                aluno.setId_turma(rs.getInt("id_turma"));
                aluno.setNomeResponsavel(rs.getString("nomeResponsavel"));

                alunos.add(aluno);
            }

        } catch (SQLException e) {
            System.err.println("Erro ao listar alunos: " + e.getMessage());
        }

        return alunos;
    }
    
    
    public static boolean deletarAluno(int id) {
    String sql = "DELETE FROM aluno WHERE id = ?";

    try (Connection con = Conexao.getConexao();
         PreparedStatement stmt = con.prepareStatement(sql)) {

        stmt.setInt(1, id);
        int linhasAfetadas = stmt.executeUpdate();
        return linhasAfetadas > 0;

    } catch (SQLException e) {
        System.err.println("Erro ao deletar aluno: " + e.getMessage());
        return false;
    }
}


}
