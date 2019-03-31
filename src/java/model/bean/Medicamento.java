package model.bean;
// Generated 30/03/2019 15:24:47 by Hibernate Tools 3.2.1.GA


import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Medicamento generated by hbm2java
 */
public class Medicamento  implements java.io.Serializable {


     private Integer id;
     private Fabricante fabricante;
     private String nomeGenerico;
     private String nomeDeFabrica;
     private Date dtCadastro;
     private Set receitas = new HashSet(0);

    public Medicamento() {
    }

    public Medicamento(Fabricante fabricante, String nomeGenerico, String nomeDeFabrica, Date dtCadastro, Set receitas) {
       this.fabricante = fabricante;
       this.nomeGenerico = nomeGenerico;
       this.nomeDeFabrica = nomeDeFabrica;
       this.dtCadastro = dtCadastro;
       this.receitas = receitas;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public Fabricante getFabricante() {
        return this.fabricante;
    }
    
    public void setFabricante(Fabricante fabricante) {
        this.fabricante = fabricante;
    }
    public String getNomeGenerico() {
        return this.nomeGenerico;
    }
    
    public void setNomeGenerico(String nomeGenerico) {
        this.nomeGenerico = nomeGenerico;
    }
    public String getNomeDeFabrica() {
        return this.nomeDeFabrica;
    }
    
    public void setNomeDeFabrica(String nomeDeFabrica) {
        this.nomeDeFabrica = nomeDeFabrica;
    }
    public Date getDtCadastro() {
        return this.dtCadastro;
    }
    
    public void setDtCadastro(Date dtCadastro) {
        this.dtCadastro = dtCadastro;
    }
    public Set getReceitas() {
        return this.receitas;
    }
    
    public void setReceitas(Set receitas) {
        this.receitas = receitas;
    }




}


