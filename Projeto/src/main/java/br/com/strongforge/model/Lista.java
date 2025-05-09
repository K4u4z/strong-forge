package br.com.strongforge.model;

public class Lista {
    private String id;
    private String nome;
    private String data;

    public Lista(String id, String nome, String data) {
        this.id = id;
        this.nome = nome;
        this.data = data;
    }

    public String getId() {
        return id;
    }

    public String getNome() {
        return nome;
    }

    public String getData() {
        return data;
    }
}
