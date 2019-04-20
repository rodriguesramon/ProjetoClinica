/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.util.ArrayList;
import java.util.List;
import model.bean.Receita;
import model.connection.ConnectionFactory;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * 
 */
public class ReceitaDao {
    Session session;
    Transaction transaction;
    Query query;
    String sql;
    List<Receita> listaReceita = new ArrayList<Receita>();
    
    public ReceitaDao(){
        session = new ConnectionFactory().getSessionFactory();
    }
    
    public boolean salvaReceita(Receita receita) {
        try{
            transaction = session.beginTransaction();
            session.save(receita);
            transaction.commit();
            session.close();
            return true;
        }catch(Exception erro){
            System.out.println(erro.toString());
            return false;
        }
    }
    
    public List<Receita> listaReceita() {
        try{
           listaReceita = session.createCriteria(Receita.class).list();
            return listaReceita;
        }catch(Exception erro){
            System.out.println(erro.toString());
            return null ;
        }
    }
    
    public List<Receita> listaReceitaMedicamentos(int idConsulta) {
        try{
            sql = "SELECT * " + 
                  "  FROM receita " + 
                  " WHERE idConsulta = " + idConsulta;
            query = session.createSQLQuery(sql).addEntity(Receita.class);
            listaReceita = query.list();
            return listaReceita;
        }catch(Exception erro){
            System.out.println(erro.toString());
            return null ;
        }
    }
    
    
    public Receita buscaReceita(int id){
        try{
            query = session.createSQLQuery("SELECT * FROM receita WHERE id = " + id).addEntity(Receita.class);
            listaReceita = query.list();
            return listaReceita.get(0);
        }catch(Exception erro){
            System.out.println(erro.toString());
            return null ;
        }
    }
    
    public void atualizarReceita(Receita receita) {
        transaction = session.beginTransaction();
        session.update(receita);
        transaction.commit();
        session.close();
    }

    public boolean deletaReceita(Receita receita) {
        try{
            transaction = session.beginTransaction();
            session.delete(receita);
            transaction.commit();
            session.close();
            return true;
        }catch(Exception erro){
            System.out.println(erro.toString());
            return false;
        }
    }
}
