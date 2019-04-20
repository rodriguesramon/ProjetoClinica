/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.util.ArrayList;
import java.util.List;
import model.bean.Consulta;
import model.connection.ConnectionFactory;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * 
 */
public class ConsultaDao {
    Session session;
    Transaction transaction;
    Query query;
    String sql;
    List<Consulta> listaConsulta = new ArrayList<Consulta>();
    
    public ConsultaDao(){
        session = new ConnectionFactory().getSessionFactory();
    }
    
    public boolean salvaConsulta(Consulta consulta) {
        try{
            transaction = session.beginTransaction();
            session.save(consulta);
            transaction.commit();
            session.close();
            return true;
        }catch(Exception erro){
            System.out.println(erro.toString());
            return false;
        }
    }
    
    public List<Consulta> listaConsulta() {
        try{
           listaConsulta = session.createCriteria(Consulta.class).list();
            return listaConsulta;
        }catch(Exception erro){
            System.out.println(erro.toString());
            return null ;
        }
    }
    
    
    public List<Consulta> listaConsultaFiltro() {
        try{
           query = session.createSQLQuery("SELECT * FROM consulta").addEntity(Consulta.class);
           listaConsulta = query.list();
            return listaConsulta;
        }catch(Exception erro){
            System.out.println(erro.toString());
            return null ;
        }
    }
    
    public Consulta buscaConsulta(int id){
        try{
            query = session.createSQLQuery("SELECT * FROM consulta WHERE id = " + id).addEntity(Consulta.class);
            listaConsulta = query.list();
            return listaConsulta.get(0);
        }catch(Exception erro){
            System.out.println(erro.toString());
            return null ;
        }
    }
    
    public boolean atualizarConsulta(Consulta consulta) {
        try{
            transaction = session.beginTransaction();
            session.update(consulta);
            transaction.commit();
            session.close();
            return true;
        }catch(Exception erro){
            System.out.println(erro.toString());
            return false;
        }
    }

    public boolean deletaConsulta(Consulta consulta) {
        try{
            transaction = session.beginTransaction();
            session.delete(consulta);
            transaction.commit();
            session.close();
            return true;
        }catch(Exception erro){
            System.out.println(erro.toString());
            return false;
        }
    }
}
