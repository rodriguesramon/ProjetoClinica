/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.util.ArrayList;
import java.util.List;
import model.bean.Estado;
import model.connection.ConnectionFactory;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * 
 */
public class EstadoDao {
    Session session;
    Transaction transaction;
    Query query;
    List<Estado> listaEstado = new ArrayList<Estado>();
    
    public EstadoDao(){
        session = new ConnectionFactory().getSessionFactory();
    }
    
    public boolean salvaEstado(Estado estado) {
        try{
            transaction = session.beginTransaction();
            session.save(estado);
            transaction.commit();
            session.close();
            return true;
        }catch(Exception erro){
            System.out.println(erro.toString());
            return false;
        }
    }
    
    public List<Estado> listaEstado() {
        try{
           listaEstado = session.createCriteria(Estado.class).list();
            return listaEstado;
        }catch(Exception erro){
            System.out.println(erro.toString());
            return null ;
        }
    }
    
    public Estado buscaEstado(int id) {
        try{
            query = session.createSQLQuery("SELECT * FROM estado WHERE id = " + id).addEntity(Estado.class);
            listaEstado = query.list();
            return listaEstado.get(0);
        }catch(Exception erro){
            System.out.println(erro.toString());
            return null ;
        }
    }
    
    public void atualizarEstado(Estado estado) {
        transaction = session.beginTransaction();
        session.update(estado);
        transaction.commit();
        session.close();
    }

    public void deletaEstado(Estado estado) {
        transaction = session.beginTransaction();
        session.delete(estado);
        transaction.commit();
        session.close();
    }
}
