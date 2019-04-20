/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.util.ArrayList;
import java.util.List;
import model.bean.Exame;
import model.connection.ConnectionFactory;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * 
 */
public class ExameDao {
    Session session;
    Transaction transaction;
    Query query;
    String sql;
    List<Exame> listaExame = new ArrayList<Exame>();
    
    public ExameDao(){
        session = new ConnectionFactory().getSessionFactory();
    }
    
    public boolean salvaExame(Exame exame) {
        try{
            transaction = session.beginTransaction();
            session.save(exame);
            transaction.commit();
            session.close();
            return true;
        }catch(Exception erro){
            System.out.println(erro.toString());
            return false;
        }
    }
    
    public List<Exame> listaExame() {
        try{
           listaExame = session.createCriteria(Exame.class).list();
            return listaExame;
        }catch(Exception erro){
            System.out.println(erro.toString());
            return null ;
        }
    }
    
    public List<Exame> listaExame(int idConsulta) {
        try{
            sql = "SELECT * FROM exame WHERE idConsulta = " + idConsulta;
            query = session.createSQLQuery(sql).addEntity(Exame.class);
            listaExame = query.list();
            return listaExame;
        }catch(Exception erro){
            System.out.println(erro.toString());
            return null ;
        }
    }
    
    public Exame buscaExame(int id) {
        try{
            query = session.createSQLQuery("SELECT * FROM exame WHERE id = " + id).addEntity(Exame.class);
            listaExame = query.list();
            return listaExame.get(0);
        }catch(Exception erro){
            System.out.println(erro.toString());
            return null ;
        }
    }
    
    public void atualizarExame(Exame exame) {
        transaction = session.beginTransaction();
        session.update(exame);
        transaction.commit();
        session.close();
    }

    public boolean deletaExame(Exame exame) {
        try{
            transaction = session.beginTransaction();
            session.delete(exame);
            transaction.commit();
            session.close();
            return true;
        }catch(Exception erro){
            System.out.println(erro.toString());
            return false;
        }
    }
}
