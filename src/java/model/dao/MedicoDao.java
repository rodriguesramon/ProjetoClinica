/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.util.ArrayList;
import java.util.List;
import model.bean.Medico;
import model.connection.ConnectionFactory;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * 
 */
public class MedicoDao {
    Session session;
    Transaction transaction;
    Query query;
    String sql;
    List<Medico> listaMedico = new ArrayList<Medico>();
    
    public MedicoDao(){
        session = new ConnectionFactory().getSessionFactory();
    }
    
    public boolean salvaMedico(Medico medico) {
        try{
            transaction = session.beginTransaction();
            session.save(medico);
            transaction.commit();
            session.close();
            return true;
        }catch(Exception erro){
            System.out.println(erro.toString());
            return false;
        }
    }
    
    public List<Medico> listaMedico() {
        try{
           listaMedico = session.createCriteria(Medico.class).list();
            return listaMedico;
        }catch(Exception erro){
            System.out.println(erro.toString());
            return null ;
        }
    }
    
    public List<Medico> lista(int idEspecialidade) {
        try{
            sql = "SELECT m.* " + 
                  "  FROM medico m " + 
                  " INNER JOIN especialidade e ON m.idEspecialidade = e.id " + 
                  " WHERE e.id = "+ idEspecialidade  ;
                  
            query = session.createSQLQuery(sql).addEntity(Medico.class);
            listaMedico = query.list();
            return listaMedico;
        }catch(Exception erro){
            System.out.println(erro.toString());
            return null ;
        }
    }
    
    public List<Medico> listaMedicos(String nome, String rg, String cpf, String crm) {
        try{
            sql = "SELECT * FROM medico WHERE 1 = 1";
            String sqlOld = sql;
            if(nome != ""){ sql += " AND nome LIKE '%"+ nome +"%' "; }
            if(rg != "")  { sql += " AND rg LIKE '%"+ rg +"%' "; }
            if(cpf != "") { sql += " AND cpf LIKE '%"+ cpf +"%' "; }
            if(crm != "") { sql += " AND crm LIKE '%"+ crm +"%' "; }
            
            if(sqlOld.equals(sql)){
                sql = "SELECT * FROM medico WHERE id = 0";
            }
            
            query = session.createSQLQuery(sql).addEntity(Medico.class);
            listaMedico = query.list();
            return listaMedico;
        }catch(Exception erro){
            System.out.println(erro.toString());
            return null ;
        }
    }
    
    public Medico buscaMedico(int id) {
        try{
            query = session.createSQLQuery("SELECT * FROM medico WHERE id = " + id).addEntity(Medico.class);
            listaMedico = query.list();
            return listaMedico.get(0);
        }catch(Exception erro){
            System.out.println(erro.toString());
            return null ;
        }
    }
    
    public boolean atualizarMedico(Medico medico) {
        try{
            transaction = session.beginTransaction();
            session.update(medico);
            transaction.commit();
            session.close();
            return true;
        }catch(Exception erro){
            System.out.println(erro.toString());
            return false;
        }
    }

    public void deletaMedico(Medico medico) {
        transaction = session.beginTransaction();
        session.delete(medico);
        transaction.commit();
        session.close();
    }
}
