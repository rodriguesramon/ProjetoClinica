package model.bean;
// Generated 07/04/2019 16:25:15 by Hibernate Tools 3.2.1.GA


import java.util.Date;

/**
 * Acesso generated by hbm2java
 */
public class Acesso  implements java.io.Serializable {


     private Integer id;
     private Usuario usuario;
     private Tela tela;
     private String nome;
     private Date dtCadastro;

    public Acesso() {
    }

    public Acesso(Usuario usuario, Tela tela, String nome, Date dtCadastro) {
       this.usuario = usuario;
       this.tela = tela;
       this.nome = nome;
       this.dtCadastro = dtCadastro;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public Usuario getUsuario() {
        return this.usuario;
    }
    
    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }
    public Tela getTela() {
        return this.tela;
    }
    
    public void setTela(Tela tela) {
        this.tela = tela;
    }
    public String getNome() {
        return this.nome;
    }
    
    public void setNome(String nome) {
        this.nome = nome;
    }
    public Date getDtCadastro() {
        return this.dtCadastro;
    }
    
    public void setDtCadastro(Date dtCadastro) {
        this.dtCadastro = dtCadastro;
    }




}

