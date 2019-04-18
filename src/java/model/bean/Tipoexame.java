package model.bean;
// Generated 17/04/2019 22:26:13 by Hibernate Tools 3.2.1.GA


import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Tipoexame generated by hbm2java
 */
public class Tipoexame  implements java.io.Serializable {


     private Integer id;
     private String nome;
     private String descricao;
     private Integer status;
     private Date dtCadastro;
     private Set exames = new HashSet(0);

    public Tipoexame() {
    }

    public Tipoexame(String nome, String descricao, Integer status, Date dtCadastro, Set exames) {
       this.nome = nome;
       this.descricao = descricao;
       this.status = status;
       this.dtCadastro = dtCadastro;
       this.exames = exames;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public String getNome() {
        return this.nome;
    }
    
    public void setNome(String nome) {
        this.nome = nome;
    }
    public String getDescricao() {
        return this.descricao;
    }
    
    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }
    public Integer getStatus() {
        return this.status;
    }
    
    public void setStatus(Integer status) {
        this.status = status;
    }
    public Date getDtCadastro() {
        return this.dtCadastro;
    }
    
    public void setDtCadastro(Date dtCadastro) {
        this.dtCadastro = dtCadastro;
    }
    public Set getExames() {
        return this.exames;
    }
    
    public void setExames(Set exames) {
        this.exames = exames;
    }




}


