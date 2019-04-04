package model.bean;
// Generated 31/03/2019 16:11:57 by Hibernate Tools 3.2.1.GA


import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Agenda generated by hbm2java
 */
public class Agenda  implements java.io.Serializable {


     private Integer id;
     private Medico medico;
     private Date dia;
     private String hora;
     private Integer status;
     private Date dtCadastro;
     private Set consultas = new HashSet(0);

    public Agenda() {
    }

    public Agenda(Medico medico, Date dia, String hora, Integer status, Date dtCadastro, Set consultas) {
       this.medico = medico;
       this.dia = dia;
       this.hora = hora;
       this.status = status;
       this.dtCadastro = dtCadastro;
       this.consultas = consultas;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public Medico getMedico() {
        return this.medico;
    }
    
    public void setMedico(Medico medico) {
        this.medico = medico;
    }
    public Date getDia() {
        return this.dia;
    }
    
    public void setDia(Date dia) {
        this.dia = dia;
    }
    public String getHora() {
        return this.hora;
    }
    
    public void setHora(String hora) {
        this.hora = hora;
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
    public Set getConsultas() {
        return this.consultas;
    }
    
    public void setConsultas(Set consultas) {
        this.consultas = consultas;
    }




}


