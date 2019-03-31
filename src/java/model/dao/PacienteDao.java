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
 * @author Ramon Costa
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
            sql = "SELECT * " + 
                  "  FROM paciente " + 
                  " WHERE nome LIKE '%"+ nome +"%' " + 
                  "    OR nome LIKE '%"+ rg +"%' " + 
                  "    OR cpf LIKE '%"+ cpf +"%'";
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
            query = session.createSQLQuery("SELECT * FROM paciente WHERE rg = '" + rg + "'  OR cpf = '" + cpf + "' ").addEntity(Paciente.class);
            listaPaciente = query.list();
            return listaPaciente.get(0);
        }catch(Exception erro){
            System.out.println(erro.toString());
            return null ;
        }
    }
    
    public void atualizarPaciente(Paciente paciente) {
        transaction = session.beginTransaction();
        session.update(paciente);
        transaction.commit();
        session.close();
    }

    public void deletaPaciente(Paciente paciente) {
        transaction = session.beginTransaction();
        session.delete(paciente);
        transaction.commit();
        session.close();
    }
}
