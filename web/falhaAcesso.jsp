<%@page import="java.net.URI"%>
<%@page import="java.net.URL"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <c:import url="tags/metas.jsp"/>
        <c:import url="tags/stylesheet.jsp"/>
        <title>Projeto Cl&iacute;nica</title>
    </head>
    <%
        //session.invalidate();
    %>
    <body>
        <div class="container">            
            <c:import url="tags/menu.jsp"/>
        </div>
        <div class="container" style='margin-top:80px'>
            <c:import url="tags/status.jsp"/> 
            <div class="alert alert-danger">
                <h3><strong>Erro!</strong> Voc&ecirc; n&atilde;o possui acesso.</h3>
              </div>
        </div>
        <c:import url="tags/javascript.jsp"/>
        
    </body>
</html>
