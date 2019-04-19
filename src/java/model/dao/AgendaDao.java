/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.util.ArrayList;
import java.util.List;
import model.bean.Agenda;
import model.connection.ConnectionFactory;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * 
 */
public class AgendaDao {
    Session session;
    Transaction transaction;
    Query query;
    String sql;
    List<Agenda> listaAgenda = new ArrayList<Agenda>();
    
    public AgendaDao(){
        session = new ConnectionFactory().getSessionFactory();
    }
    
    public boolean salvaAgenda(Agenda agenda) {
        try{
            transaction = session.beginTransaction();
            session.save(agenda);
            transaction.commit();
            session.close();
            return true;
        }catch(Exception erro){
            System.out.println(erro.toString());
            return false;
        }
    }
    
    public List<Agenda> listaAgenda() {
        try{
           listaAgenda = session.createCriteria(Agenda.class).list();
            return listaAgenda;
        }catch(Exception erro){
            System.out.println(erro.toString());
            return null ;
        }
    }
    
    public List<Agenda> listaAgendaMedico(int idMedico, int idEspecialidade) {
        try{
            sql = "SELECT a.* " + 
                  "  FROM agenda a " + 
                  " WHERE idMedico = " + idMedico +
                  "   AND idEspecialidade = " + idEspecialidade +
                  "   AND dia > CURDATE() AND status IS NULL ";
            query = session.createSQLQuery(sql).addEntity(Agenda.class);
            listaAgenda = query.list();
            return listaAgenda;
        }catch(Exception erro){
            System.out.println(erro.toString());
            return null ;
        }
    }
    
    public List<Agenda> listaAgendaDisponivel() {
        try{
            sql = "SELECT a.* " + 
                  "  FROM agenda a " + 
                  " WHERE dia > CURDATE() ";
            query = session.createSQLQuery(sql).addEntity(Agenda.class);
            listaAgenda = query.list();
            return listaAgenda;
        }catch(Exception erro){
            System.out.println(erro.toString());
            return null ;
        }
    }
    
    public Agenda buscaAgenda(int id) {
        try{
            query = session.createSQLQuery("SELECT * FROM agenda WHERE id = " + id).addEntity(Agenda.class);
            listaAgenda = query.list();
            return listaAgenda.get(0);
        }catch(Exception erro){
            System.out.println(erro.toString());
            return null ;
        }
    }
    
    public void atualizarAgenda(Agenda agenda) {
        transaction = session.beginTransaction();
        session.update(agenda);
        transaction.commit();
        session.close();
    }

    public void deletaAgenda(Agenda agenda) {
        transaction = session.beginTransaction();
        session.delete(agenda);
        transaction.commit();
        session.close();
    }
}
