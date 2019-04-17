<%@page import="java.net.URI"%>
<%@page import="java.net.URL"%>
<%@page import="model.bean.Estado"%>
<%@page import="model.dao.EstadoDao"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <c:import url="tags/metas.jsp"/>
        <c:import url="tags/stylesheet.jsp"/>
        <title>Projeto Clinica</title>
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
            <%
                URL url = new URL(request.getRequestURL().toString());
            %>
            <%= request.getRequestURI() %><br>
            <%= request.getRequestURL().toString() %><br>
            <%= url.getHost() %><br>
            <%= url.getRef() %><br>
            <%= url.getFile().toString() %><br>
            <%= url.getPath().toString() %>
            
        </div>
        <c:import url="tags/javascript.jsp"/>
        
    </body>
</html>
