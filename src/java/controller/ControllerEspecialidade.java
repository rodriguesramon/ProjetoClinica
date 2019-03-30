/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.sun.faces.facelets.tag.jsf.core.ConvertDateTimeHandler;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.bean.Especialidade;
import model.dao.EspecialidadeDao;

/**
 *
 * @author Ramon Costa
 */
@WebServlet(name = "ControllerEspecialidade", urlPatterns = {"/ControllerEspecialidade"})
public class ControllerEspecialidade extends HttpServlet {

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
            out.println("<title>Servlet ControllerEspecialidade</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControllerEspecialidade at " + request.getContextPath() + "</h1>");
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
        String option = request.getParameter("option");
        EspecialidadeDao especialidadeDao = new EspecialidadeDao();
        Especialidade especialidade = new Especialidade();
        PrintWriter printWriter = response.getWriter();
        Map<String, String> mapEspecialidade = new HashMap<String, String>();
        
        if (option.equals("CadastrarEspecialidade")) {
            
        }
        
        if (option.equals("BuscarEspecialidade")) {
            especialidade = especialidadeDao.buscaEspecialidade(Integer.parseInt(request.getParameter("id")));
            printWriter.print("{"
                            + "\"id\" : \"" + especialidade.getId() + "\", "
                            + "\"nome\" : \"" + especialidade.getNome() + "\" "
                        + "}");
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
