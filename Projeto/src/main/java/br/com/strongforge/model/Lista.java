package br.com.strongforge.model;

import java.util.List;

public class Lista {
    private String id;
    private String nome;
    private String data;
    private String dia;
    private List<Exercicio> exercicios;

    public Lista(String id, String nome, String data,String dia) {
        this.id = id;
        this.nome = nome;
        this.data = data;
        this.dia = dia;
    }
    public Lista(String id, String nome) {
        this.id = id;
        this.nome = nome;
    }

    public void setExercicios(List<Exercicio> exercicios) {
        this.exercicios = exercicios;
    }

    public List<Exercicio> getExercicios() {
        return exercicios;
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

    public String getDia() {
        return dia;
    }
}

