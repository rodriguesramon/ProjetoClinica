/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.util.ArrayList;
import java.util.List;
import model.bean.Acesso;
import model.connection.ConnectionFactory;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * 
 */
public class AcessoDao {
    Session session;
    Transaction transaction;
    Query query;
    List<Acesso> listaAcesso = new ArrayList<Acesso>();
    
    public AcessoDao(){
        session = new ConnectionFactory().getSessionFactory();
    }
    
    public boolean salvaAcesso(Acesso acesso) {
        try{
            transaction = session.beginTransaction();
            session.save(acesso);
            transaction.commit();
            session.close();
            return true;
        }catch(Exception erro){
            System.out.println(erro.toString());
            return false;
        }
    }
    
    public List<Acesso> listaAcesso() {
        try{
           listaAcesso = session.createCriteria(Acesso.class).list();
            return listaAcesso;
        }catch(Exception erro){
            System.out.println(erro.toString());
            return null ;
        }
    }
    
    public Acesso buscaAcessoTela(int idUsuario, int idTela) {
        try{
            query = session.createSQLQuery("SELECT * FROM acesso WHERE idUsuario = " + idUsuario + " AND idTela = " + idTela).addEntity(Acesso.class);
            listaAcesso = query.list();
            return listaAcesso.get(0);
        }catch(Exception erro){
            System.out.println(erro.toString());
            return null ;
        }
    }
    
    
    public Acesso buscaAcesso(int id) {
        try{
            query = session.createSQLQuery("SELECT * FROM acesso WHERE id = " + id).addEntity(Acesso.class);
            listaAcesso = query.list();
            return listaAcesso.get(0);
        }catch(Exception erro){
            System.out.println(erro.toString());
            return null ;
        }
    }
    
    public void atualizarAcesso(Acesso acesso) {
        transaction = session.beginTransaction();
        session.update(acesso);
        transaction.commit();
        session.close();
    }

    public void deletaAcesso(Acesso acesso) {
        transaction = session.beginTransaction();
        session.delete(acesso);
        transaction.commit();
        session.close();
    }
}
