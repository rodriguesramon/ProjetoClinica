/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.bean.Agenda;
import model.bean.Medicoespecialidade;
import model.dao.AgendaDao;
import model.dao.MedicoespecialidadeDao;

/**
 *
 * 
 */
@WebServlet(name = "ControllerAgenda", urlPatterns = {"/ControllerAgenda"})
public class ControllerAgenda extends HttpServlet {

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
            out.println("<title>Servlet ControllerAgenda</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControllerAgenda at " + request.getContextPath() + "</h1>");
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
        PrintWriter printWriter = response.getWriter();
        Agenda agenda = new Agenda();
        AgendaDao agendaDao = new AgendaDao();
        String pattern = "yyyy-MM-dd";
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
        
        
        Medicoespecialidade medicoEspecialidade = new Medicoespecialidade();
        MedicoespecialidadeDao medicoEspecialidadeDao = new MedicoespecialidadeDao();
        
        if (option.equals("CadastrarAgenda")) {
            medicoEspecialidade = medicoEspecialidadeDao.buscaMedicoespecialidade(Integer.parseInt(request.getParameter("idMedicoEspecialidade")));
            agenda.setEspecialidade(medicoEspecialidade.getEspecialidade());
            agenda.setMedico(medicoEspecialidade.getMedico());
            
             try {
                agenda.setDia(simpleDateFormat.parse(request.getParameter("dia")));
            } catch (ParseException ex) {
                Logger.getLogger(ControllerPaciente.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            agenda.setHora(request.getParameter("hora"));
            agenda.setDtCadastro(new Date());
            printWriter.print(agendaDao.salvaAgenda(agenda));
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
