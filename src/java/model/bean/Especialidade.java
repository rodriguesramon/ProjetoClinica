package model.bean;
// Generated 07/04/2019 16:25:15 by Hibernate Tools 3.2.1.GA


import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Especialidade generated by hbm2java
 */
public class Especialidade  implements java.io.Serializable {


     private Integer id;
     private String nome;
     private String descricao;
     private Integer status;
     private Date dtCadastro;
     private Set agendas = new HashSet(0);
     private Set medicos = new HashSet(0);
     private Set medicoespecialidades = new HashSet(0);

    public Especialidade() {
    }

    public Especialidade(String nome, String descricao, Integer status, Date dtCadastro, Set agendas, Set medicos, Set medicoespecialidades) {
       this.nome = nome;
       this.descricao = descricao;
       this.status = status;
       this.dtCadastro = dtCadastro;
       this.agendas = agendas;
       this.medicos = medicos;
       this.medicoespecialidades = medicoespecialidades;
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
    public Set getAgendas() {
        return this.agendas;
    }
    
    public void setAgendas(Set agendas) {
        this.agendas = agendas;
    }
    public Set getMedicos() {
        return this.medicos;
    }
    
    public void setMedicos(Set medicos) {
        this.medicos = medicos;
    }
    public Set getMedicoespecialidades() {
        return this.medicoespecialidades;
    }
    
    public void setMedicoespecialidades(Set medicoespecialidades) {
        this.medicoespecialidades = medicoespecialidades;
    }




}


