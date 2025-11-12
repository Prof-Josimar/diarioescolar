package control;

import java.sql.Connection;

public class TesteConexao {

    public static void main(String[] args) {

        try (Connection con = Conexao.getConexao()) {

            if (con != null) {
                System.out.println("Conexão obtida com sucesso!");
            } else {
                System.out.println("Falha ao conectar.");
            }

        } catch (Exception e) {
            System.err.println("❌ Erro ao testar conexão: " + e.getMessage());
        }

    }

}
