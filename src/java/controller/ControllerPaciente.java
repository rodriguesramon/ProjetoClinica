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
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.bean.Paciente;
import model.dao.PacienteDao;

/**
 *
 * 
 */
@WebServlet(name = "ControllerPaciente", urlPatterns = {"/ControllerPaciente"})
public class ControllerPaciente extends HttpServlet {

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
            out.println("<title>Servlet ControllerPaciente</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControllerPaciente at " + request.getContextPath() + "</h1>");
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
        PacienteDao pacienteDao = new PacienteDao();
        Paciente paciente = new Paciente();
        PrintWriter printWriter = response.getWriter();
        
        String pattern = "yyyy-MM-dd";
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);

        //Date date = simpleDateFormat.parse("2018-09-09");
        
        if (option.equals("CadastrarPaciente")) {
            paciente.setNome(request.getParameter("nome"));
            paciente.setSexo(request.getParameter("sexo"));
            paciente.setRg(request.getParameter("rg"));
            paciente.setCpf(request.getParameter("cpf"));
            try {
                paciente.setDtNascimento(simpleDateFormat.parse(request.getParameter("dtNascimento")));
            } catch (ParseException ex) {
                Logger.getLogger(ControllerPaciente.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            paciente.setEmail(request.getParameter("email"));
            paciente.setFoneResidencial(request.getParameter("foneResidencial"));
            paciente.setFoneCelular(request.getParameter("foneCelular"));
            paciente.setEnderecoCep(request.getParameter("cep"));
            paciente.setEnderecoLogradouro(request.getParameter("logradouro"));
            paciente.setEnderecoNumero(request.getParameter("numeroEndereco"));
            paciente.setEnderecoCidade(request.getParameter("cidade"));
            paciente.setEnderecoUf(request.getParameter("uf"));
            paciente.setDtCadastro(new Date());
            printWriter.print(pacienteDao.salvaPaciente(paciente));
        }else if(option.equals("BuscarPaciente")) {
            paciente = pacienteDao.buscaPaciente(request.getParameter("rg"), request.getParameter("cpf"));
            printWriter.print("{"
                                + "\"id\" : \"" + paciente.getId() + "\", "
                                + "\"nome\" : \"" + paciente.getNome() + "\", "
                                + "\"sexo\" : \"" + paciente.getSexo()+ "\", "
                                + "\"rg\" : \"" + paciente.getRg() + "\", "
                                + "\"cpf\" : \"" + paciente.getCpf() + "\" "
                            + "}");
        }else if (option.equals("BuscarPacienteId")) {
            paciente = pacienteDao.buscaPaciente(Integer.parseInt(request.getParameter("id")));
            printWriter.print("{"
                                + "\"id\" : \"" + paciente.getId() + "\", "
                                + "\"nome\" : \"" + paciente.getNome() + "\", "
                                + "\"sexo\" : \"" + paciente.getSexo()+ "\", "
                                + "\"rg\" : \"" + paciente.getRg() + "\", "
                                + "\"cpf\" : \"" + paciente.getCpf() + "\" "
                            + "}");
        }else if (option.equals("AtualizarPaciente")){
            paciente = pacienteDao.buscaPaciente(Integer.parseInt(request.getParameter("idPaciente")));
            paciente.setNome(request.getParameter("nome"));
            paciente.setSexo(request.getParameter("sexo"));
            paciente.setRg(request.getParameter("rg"));
            paciente.setCpf(request.getParameter("cpf"));
            
           try {
                paciente.setDtNascimento(simpleDateFormat.parse(request.getParameter("dtNascimento")));
            } catch (ParseException ex) {
                Logger.getLogger(ControllerPaciente.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            paciente.setEmail(request.getParameter("email"));
            paciente.setFoneResidencial(request.getParameter("foneResidencial"));
            paciente.setFoneCelular(request.getParameter("foneCelular"));
            paciente.setEnderecoCep(request.getParameter("cep"));
            paciente.setEnderecoLogradouro(request.getParameter("logradouro"));
            paciente.setEnderecoNumero(request.getParameter("numeroEndereco"));
            paciente.setEnderecoCidade(request.getParameter("cidade"));
            paciente.setEnderecoUf(request.getParameter("uf"));
            paciente.setDtCadastro(new Date());
            printWriter.print(pacienteDao.atualizarPaciente(paciente));
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
