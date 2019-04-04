package model.bean;
// Generated 31/03/2019 16:11:57 by Hibernate Tools 3.2.1.GA


import java.util.Date;

/**
 * Resultado generated by hbm2java
 */
public class Resultado  implements java.io.Serializable {


     private Integer id;
     private Exame exame;
     private String parecer;
     private Integer status;
     private Date dtCadastro;

    public Resultado() {
    }

    public Resultado(Exame exame, String parecer, Integer status, Date dtCadastro) {
       this.exame = exame;
       this.parecer = parecer;
       this.status = status;
       this.dtCadastro = dtCadastro;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public Exame getExame() {
        return this.exame;
    }
    
    public void setExame(Exame exame) {
        this.exame = exame;
    }
    public String getParecer() {
        return this.parecer;
    }
    
    public void setParecer(String parecer) {
        this.parecer = parecer;
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




}


