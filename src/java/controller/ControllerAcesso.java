/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.bean.Acesso;
import model.bean.Tela;
import model.bean.Usuario;
import model.dao.AcessoDao;
import model.dao.TelaDao;
import model.dao.UsuarioDao;

@WebServlet(name = "ControllerAcesso", urlPatterns = {"/ControllerAcesso"})
public class ControllerAcesso extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ControllerAcesso</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControllerAcesso at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } finally {            
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Acesso acesso = new Acesso();
        AcessoDao acessoDao = new AcessoDao();
        
        Tela tela = new Tela();
        TelaDao telaDao = new TelaDao();
        
        Usuario usuario = new Usuario();
        UsuarioDao usuarioDao = new UsuarioDao();
        
        String option = request.getParameter("option");
        PrintWriter printWriter = response.getWriter();
        
        if(option.equals("CadastrarAcesso")){
            tela = telaDao.buscaTela(Integer.parseInt(request.getParameter("idTela")));
            usuario = usuarioDao.consultaPorId(Integer.parseInt(request.getParameter("idUsuario")));
            acesso.setTela(tela);
            acesso.setUsuario(usuario);
            acesso.setDtCadastro(new Date());
            printWriter.print(acessoDao.salvaAcesso(acesso));
            
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
