/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.bean.Consulta;
import model.bean.Medico;
import model.dao.ConsultaDao;
import model.dao.MedicoDao;

/**
 *
 * @author Ramon Costa
 */
@WebServlet(name = "ControllerConsulta", urlPatterns = {"/ControllerConsulta"})
public class ControllerConsulta extends HttpServlet {

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
            out.println("<title>Servlet ControllerConsulta</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControllerConsulta at " + request.getContextPath() + "</h1>");
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
        String respostaJson;
        
        ConsultaDao consultaDao = new ConsultaDao();
        Consulta consulta = new Consulta();
        
        PrintWriter printWriter = response.getWriter();
        Map<String, String> mapMedico = new HashMap<String, String>();
        
        
        if (option.equals("BuscarConsulta")) {
            consulta = consultaDao.buscaConsulta(Integer.parseInt(request.getParameter("id")));
            respostaJson = "{"
                                + "\"id\" : \"" + consulta.getId() + "\", "
                                + "\"paciente\" : \"" + consulta.getPaciente().getNome() + "\", "
                                + "\"rg\" : \"" + consulta.getPaciente().getRg() + "\", "
                                + "\"cpf\" : \"" + consulta.getPaciente().getCpf() + "\", "
                                + "\"medico\" : \"" + consulta.getAgenda().getMedico().getNome() + "\", "
                                + "\"especialidade\" : \"" + consulta.getEspecialidade().getNome() + "\", "
                                + "\"agenda\" : \"" + consulta.getAgenda().getDia() + " - " + consulta.getAgenda().getHora() + "\", "
                                + "\"observacao\" : \"" + consulta.getObservacao() + "\", "
                                + "\"observacaoReceita\" : \"" + consulta.getObservacaoReceita() + "\", "
                                + "\"observacaoExame\" : \"" + consulta.getObservacaoExame() + "\" "
                         + "}";
            printWriter.print(respostaJson);
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
