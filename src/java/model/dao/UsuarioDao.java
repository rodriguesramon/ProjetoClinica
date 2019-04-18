/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.util.ArrayList;
import java.util.List;
import model.bean.Usuario;
import model.connection.ConnectionFactory;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * 
 */
public class UsuarioDao {
    Session session;
    Transaction transaction;
    Query query;
    List<Usuario> listaUsuario = new ArrayList<Usuario>();

    public UsuarioDao() {
        session = new ConnectionFactory().getSessionFactory();
    }

    public void insereUsuario(Usuario usuario) {
        transaction = session.beginTransaction();
        session.save(usuario);
        transaction.commit();
        session.close();
    }

    public void atualizaUsuario(Usuario usuario) {
        transaction = session.beginTransaction();
        session.update(usuario);
        transaction.commit();
        session.close();
    }

    public void deletaUsuario(Usuario usuario) {
        transaction = session.beginTransaction();
        session.delete(usuario);
        transaction.commit();
        session.close();
    }

    public List<Usuario> listarUsuarios() {
        listaUsuario = session.createCriteria(Usuario.class).list();
        return listaUsuario;
    }

    public Usuario consultaPorId(int idUsuario) {
        query = session.createSQLQuery("SELECT * FROM usuario WHERE id = " + idUsuario).addEntity(Usuario.class);
        listaUsuario = query.list();
        return listaUsuario.get(0);
    }

    public boolean validaLogin(String login) {
        query = session.createSQLQuery("SELECT * FROM usuario WHERE login = '" + login + "'").addEntity(Usuario.class);
        listaUsuario = query.list();
        if (listaUsuario.isEmpty()) {
            return true;
        } else {
            return false;
        }
    }

    public Usuario verificaLoginSenha(String login, String senha) {
        query = session.createSQLQuery("SELECT * FROM usuario WHERE login = '" + login + "' AND senha = '" + senha + "'").addEntity(Usuario.class);
        listaUsuario = query.list();
        session.close();

        if (listaUsuario.isEmpty()) {
            return null;
        } else {
            return listaUsuario.get(0);
        }

    }
}
