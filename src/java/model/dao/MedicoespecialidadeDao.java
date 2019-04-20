/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.util.ArrayList;
import java.util.List;
import model.bean.Medicoespecialidade;
import model.connection.ConnectionFactory;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * 
 */
public class MedicoespecialidadeDao {
 Session session;
    Transaction transaction;
    Query query;
    String sql;
    List<Medicoespecialidade> lista = new ArrayList<Medicoespecialidade>();
    
    public MedicoespecialidadeDao(){
        session = new ConnectionFactory().getSessionFactory();
    }
    
    public boolean salva(Medicoespecialidade medicoespecialidade ) {
        try{
            transaction = session.beginTransaction();
            session.save(medicoespecialidade);
            transaction.commit();
            session.close();
            return true;
        }catch(Exception erro){
            System.out.println(erro.toString());
            return false;
        }
    }
    
    public List<Medicoespecialidade> lista() {
        try{
           lista = session.createCriteria(Medicoespecialidade.class).list();
            return lista;
        }catch(Exception erro){
            System.out.println(erro.toString());
            return null ;
        }
    }
    
    public List<Medicoespecialidade> listaMedicoPorEspecialidade(int idEspecialidade) {
        try{
            sql = "SELECT * " + 
                  "  FROM  medicoespecialidade" + 
                  " WHERE idEspecialidade = "+ idEspecialidade ;
                  
            query = session.createSQLQuery(sql).addEntity(Medicoespecialidade.class);
            lista = query.list();
            return lista;
        }catch(Exception erro){
            System.out.println(erro.toString());
            return null ;
        }
    }
    
    public Medicoespecialidade buscaMedicoespecialidade(int id) {
        try{
            query = session.createSQLQuery("SELECT * FROM medicoespecialidade WHERE id = " + id).addEntity(Medicoespecialidade.class);
            lista = query.list();
            return lista.get(0);
        }catch(Exception erro){
            System.out.println(erro.toString());
            return null ;
        }
    }
    
    public List<Medicoespecialidade> buscaEspecialidades(int idMedico) {
        try{
            query = session.createSQLQuery("SELECT * FROM medicoespecialidade WHERE idMedico = " + idMedico).addEntity(Medicoespecialidade.class);
            lista = query.list();
            return lista;
        }catch(Exception erro){
            System.out.println(erro.toString());
            return null ;
        }
    }
    
    public void atualizar(Medicoespecialidade medicoespecialidade ) {
        transaction = session.beginTransaction();
        session.update(medicoespecialidade);
        transaction.commit();
        session.close();
    }

    public boolean deleta(Medicoespecialidade medicoespecialidade) {
        try{
            transaction = session.beginTransaction();
            session.delete(medicoespecialidade);
            transaction.commit();
            session.close();
            return true;
        }catch(Exception erro){
            System.out.println(erro.toString());
            return false;
        }
    }   
}
