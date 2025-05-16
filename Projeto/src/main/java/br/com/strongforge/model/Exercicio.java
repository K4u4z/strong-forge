package br.com.strongforge.model;
public class Exercicio {
        private String id;
        private String nome;
        private String agrupamento;
        private String nivel;
        private String descricao;
        private String image;
        private String video;

    public Exercicio(String id, String nome, String agrupamento, String nivel, String descricao, String image, String video) {
        this.id = id;
        this.nome = nome;
        this.agrupamento = agrupamento;
        this.nivel = nivel;
        this.descricao = descricao;
        this.image = image;
        this.video = video;
    }
    public Exercicio(String id, String nome){
        this.id = id;
    }

    public String getId() {
        return id;
    }

    public String getNome() {
        return nome;
    }

    public String getAgrupamento() {
        return agrupamento;
    }

    public String getNivel() {
        return nivel;
    }

    public String getDescricao() {
        return descricao;
    }

    public String getImage() {
        return image;
    }

    public String getVideo() {
        return video;
    }
}

