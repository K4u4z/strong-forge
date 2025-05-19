package br.com.strongforge.model;

public class Usuario {
    private String id;
    private String nome;
    private String email;
    private String senha;
    private String tipoUsuario;
    private String contato;
    private String especialidade;
    private String descricao;
    private String image;


    public Usuario(String id, String nome, String email, String senha, String tipoUsuario) {
        this.id = id;
        this.nome = nome;
        this.email = email;
        this.senha = senha;
        this.tipoUsuario = tipoUsuario;
    }

    public Usuario(String id, String nome, String email, String senha, String tipoUsuario, String contato, String especialidade, String descricao, String image) {
        this.id = id;
        this.nome = nome;
        this.email = email;
        this.senha = senha;
        this.tipoUsuario = tipoUsuario;
        this.contato = contato;
        this.especialidade = especialidade;
        this.descricao = descricao;
        this.image = image;
    }

    public Usuario(String email, String senha) {
        this.email = email;
        this.senha = senha;
    }

    public String getId() {
        return id;
    }

    public String getNome() {
        return nome;
    }


    public String getEmail() {
        return email;
    }


    public String getSenha() {
        return senha;
    }

    public String getTipoUsuario() {
        return tipoUsuario;
    }

    public String getContato() {
        return contato;
    }

    public String getEspecialidade() {
        return especialidade;
    }

    public String getDescricao() {
        return descricao;
    }

    public String getImage() {
        return image;
    }
}
