/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.util.ArrayList;
import java.util.List;
import model.bean.Medicamento;
import model.connection.ConnectionFactory;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * 
 */
public class MedicamentoDao {
    Session session;
    Transaction transaction;
    Query query;
    String sql;
    List<Medicamento> listaMedicamento = new ArrayList<Medicamento>();
    
    public MedicamentoDao(){
        session = new ConnectionFactory().getSessionFactory();
    }
    
    public boolean salvaMedicamento(Medicamento medicamento) {
        try{
            transaction = session.beginTransaction();
            session.save(medicamento);
            transaction.commit();
            session.close();
            return true;
        }catch(Exception erro){
            System.out.println(erro.toString());
            return false;
        }
    }
    
    public List<Medicamento> listaMedicamento() {
        try{
           listaMedicamento = session.createCriteria(Medicamento.class).list();
            return listaMedicamento;
        }catch(Exception erro){
            System.out.println(erro.toString());
            return null ;
        }
    }
    
    
    public Medicamento buscaMedicamento(int id){
        try{
            query = session.createSQLQuery("SELECT * FROM medicamento WHERE id = " + id).addEntity(Medicamento.class);
            listaMedicamento = query.list();
            return listaMedicamento.get(0);
        }catch(Exception erro){
            System.out.println(erro.toString());
            return null ;
        }
    }
    
    public void atualizarMedicamento(Medicamento medicamento) {
        transaction = session.beginTransaction();
        session.update(medicamento);
        transaction.commit();
        session.close();
    }

    public void deletaMedicamento(Medicamento medicamento) {
        transaction = session.beginTransaction();
        session.delete(medicamento);
        transaction.commit();
        session.close();
    }
}
