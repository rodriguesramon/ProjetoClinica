<%@page import="model.bean.Usuario"%>
<%
    Usuario usuario  =  (Usuario) session.getAttribute("sessionSistema");
    if(usuario == null){
%>
    <script> window.location.href = "<%= application.getContextPath() %>/falhaAcesso.jsp"; </script>
<%  }   %>
