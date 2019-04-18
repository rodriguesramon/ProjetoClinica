/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.util.ArrayList;
import java.util.List;
import model.bean.Tela;
import model.connection.ConnectionFactory;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * 
 */
public class TelaDao {
    String sql;
    Session session;
    Transaction transaction;
    Query query;
    List<Tela> listaTela = new ArrayList<Tela>();
    
    public TelaDao(){
        session = new ConnectionFactory().getSessionFactory();
    }
    
    public boolean salvaTela(Tela tela) {
        try{
            transaction = session.beginTransaction();
            session.save(tela);
            transaction.commit();
            session.close();
            return true;
        }catch(Exception erro){
            System.out.println(erro.toString());
            return false;
        }
    }
    
    public List<Tela> listaTela() {
        try{
           listaTela = session.createCriteria(Tela.class).list();
            return listaTela;
        }catch(Exception erro){
            System.out.println(erro.toString());
            return null ;
        }
    }
    
    public Tela buscaTela(int id) {
        try{
            query = session.createSQLQuery("SELECT * FROM tela WHERE id = " + id).addEntity(Tela.class);
            listaTela = query.list();
            return listaTela.get(0);
        }catch(Exception erro){
            System.out.println(erro.toString());
            return null ;
        }
    }
    
    public Tela buscaTelaPorNome(String tela) {
        try{
            sql = "SELECT * FROM tela WHERE nome = '" + tela + "' ";
            query = session.createSQLQuery(sql).addEntity(Tela.class);
            listaTela = query.list();
            return listaTela.get(0);
        }catch(Exception erro){
            System.out.println(erro.toString());
            return null ;
        }
    }
    
    public void atualizarTela(Tela tela) {
        transaction = session.beginTransaction();
        session.update(tela);
        transaction.commit();
        session.close();
    }

    public void deletaTela(Tela tela) {
        transaction = session.beginTransaction();
        session.delete(tela);
        transaction.commit();
        session.close();
    }
}
