/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.util.ArrayList;
import java.util.List;
import model.bean.Paciente;
import model.connection.ConnectionFactory;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * 
 */
public class PacienteDao {
    Session session;
    Transaction transaction;
    Query query;
    String sql;
    List<Paciente> listaPaciente = new ArrayList<Paciente>();
    
    public PacienteDao(){
        session = new ConnectionFactory().getSessionFactory();
        //session = ConnectionFactory.getSessionFactory();
    }
    
    public boolean salvaPaciente(Paciente paciente) {
        try{
            transaction = session.beginTransaction();
            session.save(paciente);
            transaction.commit();
            session.close();
            return true;
        }catch(Exception erro){
            System.out.println(erro.toString());
            return false;
        }
    }
    
    public List<Paciente> listaPaciente() {
        try{
           listaPaciente = session.createCriteria(Paciente.class).list();
            return listaPaciente;
        }catch(Exception erro){
            System.out.println(erro.toString());
            return null ;
        }
    }
    
    public List<Paciente> listaPacientes(String nome, String rg, String cpf) {
        try{
            
            sql = "SELECT * FROM paciente WHERE 1 = 1";
            String sqlOld = sql;
            if(nome != ""){ sql += " AND nome LIKE '%"+ nome +"%' "; }
            if(rg != "")  { sql += " AND rg LIKE '%"+ rg +"%' "; }
            if(cpf != "") { sql += " AND cpf LIKE '%"+ cpf +"%' "; }
            
            if(sqlOld.equals(sql)){
                sql = "SELECT * FROM paciente WHERE id = 0";
            }
            
            query = session.createSQLQuery(sql).addEntity(Paciente.class);
            listaPaciente = query.list();
            return listaPaciente;
        }catch(Exception erro){
            System.out.println(erro.toString());
            return null ;
        }
    }
    
    public Paciente buscaPaciente(int id) {
        try{
            query = session.createSQLQuery("SELECT * FROM paciente WHERE id = " + id).addEntity(Paciente.class);
            listaPaciente = query.list();
            return listaPaciente.get(0);
        }catch(Exception erro){
            System.out.println(erro.toString());
            return null ;
        }
    }
    
     public Paciente buscaPaciente(String rg, String cpf) {
        try{
            sql = "SELECT * FROM paciente WHERE 1 = 1";
            String sqlOld = sql;
            
            if(rg != ""){ sql += " AND rg = '"+ rg +"' "; }
            if(cpf != ""){ sql += " AND cpf = '"+ cpf +"' ";}
            if(sql.equals(sqlOld)){ sql += " AND id = 0 "; }
            
            query = session.createSQLQuery(sql).addEntity(Paciente.class);
            listaPaciente = query.list();
            return listaPaciente.get(0);
        }catch(Exception erro){
            System.out.println(erro.toString());
            return null ;
        }
    }
    
    public boolean atualizarPaciente(Paciente paciente) {
         try{
            transaction = session.beginTransaction();
            session.save(paciente);
            transaction.commit();
            session.close();
            return true;
        }catch(Exception erro){
            System.out.println(erro.toString());
            return false;
        }
    }

    public void deletaPaciente(Paciente paciente) {
        transaction = session.beginTransaction();
        session.delete(paciente);
        transaction.commit();
        session.close();
    }
}
