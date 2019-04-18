/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.util.ArrayList;
import java.util.List;
import model.bean.Tipoexame;
import model.connection.ConnectionFactory;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * 
 */
public class TipoexameDao {
    Session session;
    Transaction transaction;
    Query query;
    List<Tipoexame> listaTipoexame = new ArrayList<Tipoexame>();
    
    public TipoexameDao(){
        session = new ConnectionFactory().getSessionFactory();
    }
    
    public boolean salvaTipoexame(Tipoexame tipoexame) {
        try{
            transaction = session.beginTransaction();
            session.save(tipoexame);
            transaction.commit();
            session.close();
            return true;
        }catch(Exception erro){
            System.out.println(erro.toString());
            return false;
        }
    }
    
    public List<Tipoexame> listaTipoexame() {
        try{
           listaTipoexame = session.createCriteria(Tipoexame.class).list();
            return listaTipoexame;
        }catch(Exception erro){
            System.out.println(erro.toString());
            return null ;
        }
    }
    
    public Tipoexame buscaTipoexame(int id) {
        try{
            query = session.createSQLQuery("SELECT * FROM tipoexame WHERE id = " + id).addEntity(Tipoexame.class);
            listaTipoexame = query.list();
            return listaTipoexame.get(0);
        }catch(Exception erro){
            System.out.println(erro.toString());
            return null ;
        }
    }
    
    public void atualizarTipoexame(Tipoexame tipoexame) {
        transaction = session.beginTransaction();
        session.update(tipoexame);
        transaction.commit();
        session.close();
    }

    public void deletaTipoexame(Tipoexame tipoexame) {
        transaction = session.beginTransaction();
        session.delete(tipoexame);
        transaction.commit();
        session.close();
    }
}
