/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.util.ArrayList;
import java.util.List;
import model.bean.Medico;
import model.connection.ConnectionFactory;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * 
 */
public class MedicoDao {
    Session session;
    Transaction transaction;
    Query query;
    String sql;
    List<Medico> listaMedico = new ArrayList<Medico>();
    
    public MedicoDao(){
        session = new ConnectionFactory().getSessionFactory();
    }
    
    public boolean salvaMedico(Medico medico) {
        try{
            transaction = session.beginTransaction();
            session.save(medico);
            transaction.commit();
            session.close();
            return true;
        }catch(Exception erro){
            System.out.println(erro.toString());
            return false;
        }
    }
    
    public List<Medico> listaMedico() {
        try{
           listaMedico = session.createCriteria(Medico.class).list();
            return listaMedico;
        }catch(Exception erro){
            System.out.println(erro.toString());
            return null ;
        }
    }
    
    public List<Medico> lista(int idEspecialidade) {
        try{
            sql = "SELECT m.* " + 
                  "  FROM medico m " + 
                  " INNER JOIN especialidade e ON m.idEspecialidade = e.id " + 
                  " WHERE e.id = "+ idEspecialidade  ;
                  
            query = session.createSQLQuery(sql).addEntity(Medico.class);
            listaMedico = query.list();
            return listaMedico;
        }catch(Exception erro){
            System.out.println(erro.toString());
            return null ;
        }
    }
    
    public List<Medico> listaMedicos(String nome, String rg, String cpf) {
        try{
            sql = "SELECT * " + 
                  "  FROM medico " + 
                  " WHERE nome LIKE '%"+ nome +"%' " + 
                  "    OR nome LIKE '%"+ rg +"%' " + 
                  "    OR cpf LIKE '%"+ cpf +"%'";
            query = session.createSQLQuery(sql).addEntity(Medico.class);
            listaMedico = query.list();
            return listaMedico;
        }catch(Exception erro){
            System.out.println(erro.toString());
            return null ;
        }
    }
    
    public Medico buscaMedico(int id) {
        try{
            query = session.createSQLQuery("SELECT * FROM medico WHERE id = " + id).addEntity(Medico.class);
            listaMedico = query.list();
            return listaMedico.get(0);
        }catch(Exception erro){
            System.out.println(erro.toString());
            return null ;
        }
    }
    
    public void atualizarMedico(Medico medico) {
        transaction = session.beginTransaction();
        session.update(medico);
        transaction.commit();
        session.close();
    }

    public void deletaMedico(Medico medico) {
        transaction = session.beginTransaction();
        session.delete(medico);
        transaction.commit();
        session.close();
    }
}
