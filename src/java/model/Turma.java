package model;


public class Turma {
    
    private int id;
    private String nome;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome.toUpperCase();
    }

    @Override
    public String toString() {
        return "Turma{" + "id=" + id + ", nome=" + nome + '}';
    }
    
    
    
    
}
