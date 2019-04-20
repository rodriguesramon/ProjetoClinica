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
import model.bean.Fabricante;
import model.bean.Medicamento;
import model.dao.FabricanteDao;
import model.dao.MedicamentoDao;

@WebServlet(name = "ControllerMedicamento", urlPatterns = {"/ControllerMedicamento"})
public class ControllerMedicamento extends HttpServlet {

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
            out.println("<title>Servlet ControllerMedicamento</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControllerMedicamento at " + request.getContextPath() + "</h1>");
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
        Medicamento medicamento = new Medicamento();
        MedicamentoDao medicamentoDao = new MedicamentoDao();
        
        Fabricante fabricante = new Fabricante();
        FabricanteDao fabricanteDao = new FabricanteDao();
        
        if (option.equals("CadastrarMedicamento")){
            fabricante = fabricanteDao.buscaFabricante(Integer.parseInt(request.getParameter("idFabricante")));
            medicamento.setNomeGenerico(request.getParameter("nomeGenerico"));
            medicamento.setFabricante(fabricante);
            medicamento.setNomeDeFabrica(request.getParameter("nomeDeFabrica"));
            medicamento.setDtCadastro(new Date());
            printWriter.print(medicamentoDao.salvaMedicamento(medicamento));
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
