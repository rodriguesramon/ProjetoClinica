/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.util.ArrayList;
import java.util.List;
import model.bean.Especialidade;
import model.connection.ConnectionFactory;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * 
 */
public class EspecialidadeDao {
    Session session;
    Transaction transaction;
    Query query;
    String sql;
    List<Especialidade> listaEspecialidade = new ArrayList<Especialidade>();
    
    public EspecialidadeDao(){
        session = new ConnectionFactory().getSessionFactory();
    }
    
    public boolean salvaEspecialidade(Especialidade especialidade) {
        try{
            transaction = session.beginTransaction();
            session.save(especialidade);
            transaction.commit();
            session.close();
            return true;
        }catch(Exception erro){
            System.out.println(erro.toString());
            return false;
        }
    }
    
    public List<Especialidade> listaEspecialidade() {
        try{
           listaEspecialidade = session.createCriteria(Especialidade.class).list();
            return listaEspecialidade;
        }catch(Exception erro){
            System.out.println(erro.toString());
            return null ;
        }
    }
    
    public List<Especialidade> listaEspecialidades(String nome, String rg, String cpf) {
        try{
            sql = "SELECT * " + 
                  "  FROM especialidade " + 
                  " WHERE nome LIKE '%"+ nome +"%' " + 
                  "    OR nome LIKE '%"+ rg +"%' " + 
                  "    OR cpf LIKE '%"+ cpf +"%'";
            query = session.createSQLQuery(sql).addEntity(Especialidade.class);
            listaEspecialidade = query.list();
            return listaEspecialidade;
        }catch(Exception erro){
            System.out.println(erro.toString());
            return null ;
        }
    }
    
    public Especialidade buscaEspecialidade(int id) {
        try{
            query = session.createSQLQuery("SELECT * FROM especialidade WHERE id = " + id).addEntity(Especialidade.class);
            listaEspecialidade = query.list();
            return listaEspecialidade.get(0);
        }catch(Exception erro){
            System.out.println(erro.toString());
            return null ;
        }
    }
    
    public void atualizarEspecialidade(Especialidade especialidade) {
        transaction = session.beginTransaction();
        session.update(especialidade);
        transaction.commit();
        session.close();
    }

    public void deletaEspecialidade(Especialidade especialidade) {
        transaction = session.beginTransaction();
        session.delete(especialidade);
        transaction.commit();
        session.close();
    }
}
