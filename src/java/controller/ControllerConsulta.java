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
import model.bean.Agenda;
import model.bean.Consulta;
import model.bean.Exame;
import model.bean.Medicamento;
import model.bean.Paciente;
import model.bean.Receita;
import model.bean.Tipoexame;
import model.dao.AgendaDao;
import model.dao.ConsultaDao;
import model.dao.ExameDao;
import model.dao.MedicamentoDao;
import model.dao.PacienteDao;
import model.dao.ReceitaDao;
import model.dao.TipoexameDao;

/**
 *
 * 
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
        
        Agenda agenda = new Agenda();
        AgendaDao agendaDao = new AgendaDao();
        
        Paciente paciente = new Paciente();
        PacienteDao pacienteDao = new PacienteDao();
        
        Exame exame = new Exame();
        ExameDao exameDao = new ExameDao();
        
        Tipoexame tipoExame = new Tipoexame();
        TipoexameDao tipoExameDao = new TipoexameDao();
        
        Medicamento medicamento = new Medicamento();
        MedicamentoDao medicamentoDao = new MedicamentoDao();
        
        Receita receita = new Receita();
        ReceitaDao receitaDao = new ReceitaDao();
        
        PrintWriter printWriter = response.getWriter();
        Boolean resultado;
        
        if(option.equals("BuscarConsulta")){
            consulta = consultaDao.buscaConsulta(Integer.parseInt(request.getParameter("id")));
            respostaJson = "{"
                                + "\"id\" : \"" + consulta.getId() + "\", "
                                + "\"paciente\" : \"" + consulta.getPaciente().getNome() + "\", "
                                + "\"sexo\" : \"" + consulta.getPaciente().getSexo() + "\", "
                                + "\"rg\" : \"" + consulta.getPaciente().getRg() + "\", "
                                + "\"cpf\" : \"" + consulta.getPaciente().getCpf() + "\", "
                                + "\"medico\" : \"" + consulta.getAgenda().getMedico().getNome() + "\", "
                                + "\"especialidade\" : \"" + consulta.getAgenda().getEspecialidade().getNome() + "\", "
                                + "\"agenda\" : \"" + consulta.getAgenda().getDia() + " - " + consulta.getAgenda().getHora() + "\", "
                                + "\"observacao\" : \"" + consulta.getObservacao() + "\", "
                                + "\"observacaoReceita\" : \"" + consulta.getObservacaoReceita() + "\", "
                                + "\"observacaoExame\" : \"" + consulta.getObservacaoExame() + "\" "
                         + "}";
            printWriter.print(respostaJson);
        }else if(option.equals("CadastrarConsulta")){
            agenda = agendaDao.buscaAgenda(Integer.parseInt(request.getParameter("idAgenda")));
            paciente = pacienteDao.buscaPaciente(Integer.parseInt(request.getParameter("idPaciente")));
            
            consulta.setObservacao(request.getParameter("observacao"));
            consulta.setAgenda(agenda);
            consulta.setPaciente(paciente);
            consulta.setDtCadastro(new Date());
            
            resultado = consultaDao.salvaConsulta(consulta);
            if(resultado){
                agenda.setStatus(1);
                agendaDao.atualizarAgenda(agenda);
            }
            printWriter.print(resultado);
            
            
        }else if(option.equals("RegistrarAtendimento")){
            
            consulta = consultaDao.buscaConsulta(Integer.parseInt(request.getParameter("idConsulta")));
            consulta.setObservacao(request.getParameter("observacao"));
            consulta.setObservacaoExame(request.getParameter("observacaoExame"));
            consulta.setObservacaoReceita(request.getParameter("observacaoReceita"));
            consulta.setStatus(1);//Define como atendido
            printWriter.print(consultaDao.atualizarConsulta(consulta));
            
        }else if(option.equals("AdicionarMedicamento")){
            consulta = consultaDao.buscaConsulta(Integer.parseInt(request.getParameter("idConsulta")));
            medicamento = medicamentoDao.buscaMedicamento(Integer.parseInt(request.getParameter("idMedicamento")));
            receita.setConsulta(consulta);
            receita.setDtCadastro(new Date());
            receita.setMedicamento(medicamento);
            receita.setObservacao(request.getParameter("obsMedicamento"));
            printWriter.print(receitaDao.salvaReceita(receita));
            
        }else if(option.equals("AdicionarExame")){
            consulta = consultaDao.buscaConsulta(Integer.parseInt(request.getParameter("idConsulta")));
            tipoExame = tipoExameDao.buscaTipoexame(Integer.parseInt(request.getParameter("idTipoExame")));
            
            exame.setConsulta(consulta);
            exame.setTipoexame(tipoExame);
            exame.setObservacao(request.getParameter("obsExame"));
            exame.setDtCadastro(new Date());
            printWriter.print(exameDao.salvaExame(exame));
       }else if(option.equals("RemoverExame")){
           exame = exameDao.buscaExame(Integer.parseInt(request.getParameter("idExame")));
            printWriter.print(exameDao.deletaExame(exame));
       }else if(option.equals("RemoverMedicamento")){
           receita = receitaDao.buscaReceita(Integer.parseInt(request.getParameter("idReceita")));
           printWriter.print(receitaDao.deletaReceita(receita));
       }else if(option.equals("RemoverConsulta")){
           consulta = consultaDao.buscaConsulta(Integer.parseInt(request.getParameter("idConsulta")));
           printWriter.print(consultaDao.deletaConsulta(consulta));
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
