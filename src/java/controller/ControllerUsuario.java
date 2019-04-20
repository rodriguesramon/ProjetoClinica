/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.bean.Usuario;
import model.dao.UsuarioDao;

/**
 *
 * 
 */
@WebServlet(name = "ControllerUsuario", urlPatterns = {"/ControllerUsuario"})
public class ControllerUsuario extends HttpServlet {

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
            out.println("<title>Servlet ControllerUsuario</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControllerUsuario at " + request.getContextPath() + "</h1>");
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        Usuario usuario = new Usuario();
        UsuarioDao usuarioDao = new UsuarioDao();
        HttpSession httpSession = request.getSession();
        PrintWriter printWriter = response.getWriter();
        String option = request.getParameter("option");

        if(option.equals("Cadastrar")){
        }else if(option.equals("Atualizar")){
        }else if(option.equals("Excluir")){
        }else if(option.equals("Desativar")) {
        }else if(option.equals("Autenticar")){            
            //Trecho do codigo onde são capturados os valores que vem da view
            String login = request.getParameter("login"), senha = request.getParameter("senha");
            //É realizado a verificação atraves do método verificaLoginSenha, este metodo retorna null ou o proprio objeto
            usuario = usuarioDao.verificaLoginSenha(login, senha);
            //Se for diferente de nulo, cria um atributo e diz qual é o seu valor
            if (usuario != null) {                
                httpSession.setAttribute("sessionSistema", usuario);
                //Aqui é feito o redirecionamento para a pagina mainpage com a autenticacao realizada
                //printWriter.print("<script>location='mainpage.jsp';</script>");
                
                 printWriter.print("{"
                                    + "\"result\" : \"" + true + "\" "
                                 + "}");
                
            } else {
                //Se a autenticacao não estiver correta, o usuario fica na mesma pagina., 
                httpSession.setAttribute("sessionSistema", "loginOff");
                //printWriter.print("<script>location='index.jsp'</script>");
                
                printWriter.print("{"
                                    + "\"result\" : \"" + false + "\" "
                                 + "}");
                
            }
        }else if (option.equals("Logoff")) {
            httpSession.invalidate();
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
