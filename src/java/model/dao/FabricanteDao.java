/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.util.ArrayList;
import java.util.List;
import model.bean.Fabricante;
import model.connection.ConnectionFactory;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * 
 */
public class FabricanteDao {
    Session session;
    Transaction transaction;
    Query query;
    List<Fabricante> listaFabricante = new ArrayList<Fabricante>();
    
    public FabricanteDao(){
        session = new ConnectionFactory().getSessionFactory();
    }
    
    public boolean salvaFabricante(Fabricante fabricante) {
        try{
            transaction = session.beginTransaction();
            session.save(fabricante);
            transaction.commit();
            session.close();
            return true;
        }catch(Exception erro){
            System.out.println(erro.toString());
            return false;
        }
    }
    
    public List<Fabricante> listaFabricante() {
        try{
           listaFabricante = session.createCriteria(Fabricante.class).list();
            return listaFabricante;
        }catch(Exception erro){
            System.out.println(erro.toString());
            return null ;
        }
    }
    
    public Fabricante buscaFabricante(int id) {
        try{
            query = session.createSQLQuery("SELECT * FROM fabricante WHERE id = " + id).addEntity(Fabricante.class);
            listaFabricante = query.list();
            return listaFabricante.get(0);
        }catch(Exception erro){
            System.out.println(erro.toString());
            return null ;
        }
    }
    
    public void atualizarFabricante(Fabricante fabricante) {
        transaction = session.beginTransaction();
        session.update(fabricante);
        transaction.commit();
        session.close();
    }

    public void deletaFabricante(Fabricante fabricante) {
        transaction = session.beginTransaction();
        session.delete(fabricante);
        transaction.commit();
        session.close();
    }
}
