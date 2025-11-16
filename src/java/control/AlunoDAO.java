package control;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Aluno;
import model.Turma;

public class AlunoDAO {

    // Inserir aluno
    public static boolean inserirAluno(Aluno aluno) {
        String sql = "INSERT INTO aluno (nome, matricula, id_turma, nomeResponsavel) VALUES (?, ?, ?, ?)";

        Connection con = Conexao.getConexao();
        if (con == null) {
            System.err.println("Conexão nula. Falha ao inserir aluno.");
            return false;
        }

        try (PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setString(1, aluno.getNome());
            stmt.setString(2, aluno.getMatricula());
            stmt.setInt(3, aluno.getId_turma());
            stmt.setString(4, aluno.getNomeResponsavel());

            int linhasAfetadas = stmt.executeUpdate();
            return linhasAfetadas > 0;
        } catch (SQLException e) {
            System.err.println("Erro ao inserir aluno: " + e.getMessage());
            return false;
        } finally {
            Conexao.fecharConexao(con);
        }
    }

    // Listar todos os alunos com suas turmas
    public static List<Aluno> listarAlunos() {
        List<Aluno> alunos = new ArrayList<>();

        String sql = "SELECT aluno.id, aluno.nome, aluno.matricula, aluno.id_turma, aluno.nomeResponsavel, "
                   + "turma.id AS turma_id, turma.nome AS turma_nome "
                   + "FROM aluno INNER JOIN turma ON aluno.id_turma = turma.id";

        Connection con = Conexao.getConexao();
        if (con == null) {
            System.err.println("Conexão nula. Falha ao listar alunos.");
            return alunos;
        }

        try (PreparedStatement stmt = con.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Aluno aluno = new Aluno();
                aluno.setId(rs.getInt("id"));
                aluno.setNome(rs.getString("nome"));
                aluno.setMatricula(rs.getString("matricula"));
                aluno.setId_turma(rs.getInt("id_turma"));
                aluno.setNomeResponsavel(rs.getString("nomeResponsavel"));

                // Criar e associar a turma
                Turma turma = new Turma();
                turma.setId(rs.getInt("turma_id"));
                turma.setNome(rs.getString("turma_nome"));
                aluno.setTurma(turma);

                alunos.add(aluno);
            }
        } catch (SQLException e) {
            System.err.println("Erro ao listar alunos: " + e.getMessage());
        } finally {
            Conexao.fecharConexao(con);
        }

        return alunos;
    }

    // Deletar aluno
    public static boolean deletarAluno(int id) {
        String sql = "DELETE FROM aluno WHERE id = ?";

        Connection con = Conexao.getConexao();
        if (con == null) {
            System.err.println("Conexão nula. Falha ao deletar aluno.");
            return false;
        }

        try (PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, id);
            int linhasAfetadas = stmt.executeUpdate();
            return linhasAfetadas > 0;
        } catch (SQLException e) {
            System.err.println("Erro ao deletar aluno: " + e.getMessage());
            return false;
        } finally {
            Conexao.fecharConexao(con);
        }
    }

    // Buscar aluno por ID com turma
    public static Aluno buscarPorId(int id) {
        String sql = "SELECT aluno.id, aluno.nome, aluno.matricula, aluno.id_turma, aluno.nomeResponsavel, "
                   + "turma.id AS turma_id, turma.nome AS turma_nome "
                   + "FROM aluno INNER JOIN turma ON aluno.id_turma = turma.id "
                   + "WHERE aluno.id = ?";

        Aluno aluno = null;

        Connection con = Conexao.getConexao();
        if (con == null) {
            System.err.println("Conexão nula. Falha ao buscar aluno.");
            return null;
        }

        try (PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    aluno = new Aluno();
                    aluno.setId(rs.getInt("id"));
                    aluno.setNome(rs.getString("nome"));
                    aluno.setMatricula(rs.getString("matricula"));
                    aluno.setId_turma(rs.getInt("id_turma"));
                    aluno.setNomeResponsavel(rs.getString("nomeResponsavel"));

                    Turma turma = new Turma();
                    turma.setId(rs.getInt("turma_id"));
                    turma.setNome(rs.getString("turma_nome"));
                    aluno.setTurma(turma);
                }
            }
        } catch (SQLException e) {
            System.err.println("Erro ao buscar aluno: " + e.getMessage());
        } finally {
            Conexao.fecharConexao(con);
        }

        return aluno;
    }

    // Atualizar aluno
    public static boolean atualizarAluno(Aluno aluno) {
        String sql = "UPDATE aluno SET nome = ?, matricula = ?, id_turma = ?, nomeResponsavel = ? WHERE id = ?";

        Connection con = Conexao.getConexao();
        if (con == null) {
            System.err.println("Conexão nula. Falha ao atualizar aluno.");
            return false;
        }

        try (PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setString(1, aluno.getNome());
            stmt.setString(2, aluno.getMatricula());
            stmt.setInt(3, aluno.getId_turma());
            stmt.setString(4, aluno.getNomeResponsavel());
            stmt.setInt(5, aluno.getId());

            int linhasAfetadas = stmt.executeUpdate();
            return linhasAfetadas > 0;
        } catch (SQLException e) {
            System.err.println("Erro ao atualizar aluno: " + e.getMessage());
            return false;
        } finally {
            Conexao.fecharConexao(con);
        }
    }

    // Listar alunos por nome (sem turma)
    public static List<Aluno> listarAlunosPorNome(String nomeParcial) {
        List<Aluno> alunos = new ArrayList<>();
        String sql = "SELECT * FROM aluno WHERE nome LIKE ?";

        Connection con = Conexao.getConexao();
        if (con == null) {
            System.err.println("Conexão nula. Falha ao listar alunos por nome.");
            return alunos;
        }

        try (PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setString(1, "%" + nomeParcial + "%");

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Aluno aluno = new Aluno();
                    aluno.setId(rs.getInt("id"));
                    aluno.setNome(rs.getString("nome"));
                    aluno.setMatricula(rs.getString("matricula"));
                    aluno.setId_turma(rs.getInt("id_turma"));
                    aluno.setNomeResponsavel(rs.getString("nomeResponsavel"));
                    alunos.add(aluno);
                }
            }
        } catch (SQLException e) {
            System.err.println("Erro ao listar alunos por nome: " + e.getMessage());
        } finally {
            Conexao.fecharConexao(con);
        }

        return alunos;
    }

    // Teste rápido
    public static void main(String[] args) {
        Aluno aluno = AlunoDAO.buscarPorId(1);
        if (aluno != null) {
            System.out.println("Aluno: " + aluno.getNome() + " | Turma: " + aluno.getTurma().getNome());
        } else {
            System.out.println("Aluno não encontrado.");
        }
    }
}
