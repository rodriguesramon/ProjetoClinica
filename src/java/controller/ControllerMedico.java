/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.bean.Especialidade;
import model.bean.Medico;
import model.bean.Medicoespecialidade;
import model.dao.EspecialidadeDao;
import model.dao.MedicoDao;
import model.dao.MedicoespecialidadeDao;

/**
 *
 * 
 */
@WebServlet(name = "ControllerMedico", urlPatterns = {"/ControllerMedico"})
public class ControllerMedico extends HttpServlet {

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
            out.println("<title>Servlet ControllerMedico</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControllerMedico at " + request.getContextPath() + "</h1>");
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
        MedicoDao medicoDao = new MedicoDao();
        Medico medico = new Medico();
        
        Especialidade especialidade = new Especialidade();
        EspecialidadeDao especialidadeDao = new EspecialidadeDao();
        
        Medicoespecialidade medicoEspecialidade  = new Medicoespecialidade();
        MedicoespecialidadeDao medicoEspecialidadeDao = new MedicoespecialidadeDao();
        
        
        PrintWriter printWriter = response.getWriter();
        Map<String, String> mapMedico = new HashMap<String, String>();
        
        if (option.equals("CadastrarMedico")) {
            medico.setNome(request.getParameter("nome"));
            medico.setRg(request.getParameter("rg"));
            medico.setCrm(request.getParameter("crm"));
            medico.setCpf(request.getParameter("cpf"));
            medico.setEmail(request.getParameter("email"));
            medico.setFoneResidencial(request.getParameter("foneResidencial"));
            medico.setFoneCelular(request.getParameter("foneCelular"));
            
            especialidade = especialidadeDao.buscaEspecialidade(Integer.parseInt(request.getParameter("idEspecialidade")));
            
            medicoEspecialidade.setMedico(medico);
            medicoEspecialidade.setDtCadastro(new Date());
            medicoEspecialidade.setEspecialidade(especialidade);
            medicoDao.salvaMedico(medico);
            
            printWriter.print(medicoEspecialidadeDao.salva(medicoEspecialidade));
        }else if (option.equals("BuscarMedico")) {
            medico = medicoDao.buscaMedico(Integer.parseInt(request.getParameter("id")));
            printWriter.print("{"
                                + "\"id\" : \"" + medico.getId() + "\", "
                                + "\"nome\" : \"" + medico.getNome() + "\", "
                                + "\"rg\" : \"" + medico.getRg() + "\", "
                                + "\"cpf\" : \"" + medico.getCpf() + "\" "
                            + "}");
        }else if(option.equals("AdicionarEspecialidade")){
            medico = medicoDao.buscaMedico(Integer.parseInt(request.getParameter("idMedico")));
            especialidade = especialidadeDao.buscaEspecialidade(Integer.parseInt(request.getParameter("idEspecialidade")));
            medicoEspecialidade.setMedico(medico);
            medicoEspecialidade.setEspecialidade(especialidade);
            printWriter.print(medicoEspecialidadeDao.salva(medicoEspecialidade));
        }else if(option.equals("AtualizarMedico")){
            medico = medicoDao.buscaMedico(Integer.parseInt(request.getParameter("idMedico")));
            medico.setNome(request.getParameter("nome"));
            medico.setRg(request.getParameter("rg"));
            medico.setCrm(request.getParameter("crm"));
            medico.setCpf(request.getParameter("cpf"));
            medico.setEmail(request.getParameter("email"));
            medico.setFoneResidencial(request.getParameter("foneResidencial"));
            medico.setFoneCelular(request.getParameter("foneCelular"));
            
            printWriter.print(medicoDao.atualizarMedico(medico));
        }else if(option.equals("DeletarEspecialidade")){
            medicoEspecialidade = medicoEspecialidadeDao.buscaMedicoespecialidade(Integer.parseInt(request.getParameter("idMedicoEspecialidade")));
            printWriter.print(medicoEspecialidadeDao.deleta(medicoEspecialidade));    
            
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
