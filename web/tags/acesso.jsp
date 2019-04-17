<%@page import="java.net.URL"%>
<%@page import="model.dao.AcessoDao"%>
<%@page import="model.bean.Acesso"%>
<%@page import="model.dao.TelaDao"%>
<%@page import="model.bean.Tela"%>
<%@page import="model.bean.Usuario"%>

<%
    TelaDao telaDao = new TelaDao();
    Acesso acesso = new Acesso();
    AcessoDao acessoDao = new AcessoDao();
    URL url = new URL(request.getRequestURL().toString());

    Tela tela        =  telaDao.buscaTelaPorNome(request.getRequestURI());
    Usuario usuario  =  (Usuario) session.getAttribute("sessionSistema");

    if((tela != null) && (usuario != null)){
        acesso = acessoDao.buscaAcessoTela(usuario.getId(), tela.getId());    
    }
%>
<%  if(acesso.getId() == null || usuario == null){ %>
    <script> window.location.href = "<%= application.getContextPath() %>/mainpage.jsp"; </script>
<%  }   %>