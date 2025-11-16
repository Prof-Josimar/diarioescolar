package control;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Turma;

public class TurmaDAO {

    public static boolean inserirTurma(Turma turma) {
        String sql = "INSERT INTO turma (nome) VALUES (?)";

        Connection con = Conexao.getConexao();
        if (con == null) {
            System.err.println("Conexão nula. Falha ao inserir turma.");
            return false;
        }

        try (PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setString(1, turma.getNome());
            int linhasAfetadas = stmt.executeUpdate();
            return linhasAfetadas > 0;
        } catch (SQLException e) {
            System.err.println("Erro ao inserir turma: " + e.getMessage());
            return false;
        } finally {
            Conexao.fecharConexao(con); // fecha a conexão manualmente
        }
    }

    public static boolean inserirTurma0(Turma turma) {
        String sql = "INSERT INTO turma (nome) VALUES ( ?)";

        try (Connection con = Conexao.getConexao();
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

    public static List<Turma> listarTodas() {
        List<Turma> turmas = new ArrayList<>();
        String sql = "SELECT id, nome FROM turma";

        Connection con = Conexao.getConexao();
        if (con == null) {
            System.err.println("Conexão nula. Falha ao listar turmas.");
            return turmas;
        }

        try (PreparedStatement stmt = con.prepareStatement(sql);
                ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Turma turma = new Turma();
                turma.setId(rs.getInt("id"));
                turma.setNome(rs.getString("nome"));
                turmas.add(turma);
            }

        } catch (SQLException e) {
            System.err.println("Erro ao listar turmas: " + e.getMessage());
        } finally {
            Conexao.fecharConexao(con); // fecha a conexão manualmente
        }

        return turmas;
    }

    public static List<Turma> listarTodas0() {
        List<Turma> turmas = new ArrayList<>();
        String sql = "SELECT id, nome FROM turma";

        try (Connection con = Conexao.getConexao();
                PreparedStatement stmt = con.prepareStatement(sql);
                ResultSet rs = stmt.executeQuery()) {

            if (con == null) {
                System.err.println("Conexão nula. Falha ao listar turmas.");
                return turmas;
            }

            while (rs.next()) {
                Turma turma = new Turma();
                turma.setId(rs.getInt("id"));
                turma.setNome(rs.getString("nome"));
                turmas.add(turma);
            }

        } catch (SQLException e) {
            System.err.println("Erro ao listar turmas: " + e.getMessage());
        }

        return turmas;
    }

    public static void main(String[] args) {
        List<Turma> listaTurmas = TurmaDAO.listarTodas();
        System.out.println(listaTurmas);

    }

}
