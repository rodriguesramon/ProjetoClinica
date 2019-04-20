/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.util.ArrayList;
import java.util.List;
import model.bean.Recepcionista;
import model.connection.ConnectionFactory;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * 
 */
public class RecepcionistaDao {
    Session session;
    Transaction transaction;
    Query query;
    String sql;
    List<Recepcionista> listaRecepcionista = new ArrayList<Recepcionista>();
    
    public RecepcionistaDao(){
        session = new ConnectionFactory().getSessionFactory();
        //session = ConnectionFactory.getSessionFactory();
    }
    
    public boolean salvaRecepcionista(Recepcionista recepcionista) {
        try{
            transaction = session.beginTransaction();
            session.save(recepcionista);
            transaction.commit();
            session.close();
            return true;
        }catch(Exception erro){
            System.out.println(erro.toString());
            return false;
        }
    }
    
    public List<Recepcionista> listaRecepcionista() {
        try{
           listaRecepcionista = session.createCriteria(Recepcionista.class).list();
            return listaRecepcionista;
        }catch(Exception erro){
            System.out.println(erro.toString());
            return null ;
        }
    }
    
    public List<Recepcionista> listaRecepcionistas(String nome, String rg, String cpf) {
        try{
            
            sql = "SELECT * FROM recepcionista WHERE 1 = 1";
            String sqlOld = sql;
            if(nome != ""){ sql += " AND nome LIKE '%"+ nome +"%' "; }
            if(rg != "")  { sql += " AND rg LIKE '%"+ rg +"%' "; }
            if(cpf != "") { sql += " AND cpf LIKE '%"+ cpf +"%' "; }
            
            if(sqlOld.equals(sql)){
                sql = "SELECT * FROM recepcionista WHERE id = 0";
            }
            
            query = session.createSQLQuery(sql).addEntity(Recepcionista.class);
            listaRecepcionista = query.list();
            return listaRecepcionista;
        }catch(Exception erro){
            System.out.println(erro.toString());
            return null ;
        }
    }
    
    public Recepcionista buscaRecepcionista(int id) {
        try{
            query = session.createSQLQuery("SELECT * FROM recepcionista WHERE id = " + id).addEntity(Recepcionista.class);
            listaRecepcionista = query.list();
            return listaRecepcionista.get(0);
        }catch(Exception erro){
            System.out.println(erro.toString());
            return null ;
        }
    }
    
     public Recepcionista buscaRecepcionista(String rg, String cpf) {
        try{
            sql = "SELECT * FROM recepcionista WHERE 1 = 1";
            String sqlOld = sql;
            
            if(rg != ""){ sql += " AND rg = '"+ rg +"' "; }
            if(cpf != ""){ sql += " AND cpf = '"+ cpf +"' ";}
            if(sql.equals(sqlOld)){ sql += " AND id = 0 "; }
            
            query = session.createSQLQuery(sql).addEntity(Recepcionista.class);
            listaRecepcionista = query.list();
            return listaRecepcionista.get(0);
        }catch(Exception erro){
            System.out.println(erro.toString());
            return null ;
        }
    }
    
    public boolean atualizarRecepcionista(Recepcionista recepcionista) {
         try{
            transaction = session.beginTransaction();
            session.save(recepcionista);
            transaction.commit();
            session.close();
            return true;
        }catch(Exception erro){
            System.out.println(erro.toString());
            return false;
        }
    }

    public void deletaRecepcionista(Recepcionista recepcionista) {
        transaction = session.beginTransaction();
        session.delete(recepcionista);
        transaction.commit();
        session.close();
    }
}
