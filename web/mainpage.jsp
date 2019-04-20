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
    <body>
        <div class="container">            
            <c:import url="tags/menu.jsp"/>
        </div>
        <div class="container" style='margin-top:80px'>
            <p>
                <span style=" font-size:200%; font-style:italic;color:#f00;">G</span>erenciar um projeto de 
                forma adequada traz benefícios financeiros e de
                crescimento, o que possibilita a sobrevivência de uma empresa no mercado de
                trabalho. O Sistema de Gestão de Clinica Médica (SGCM) propõe uma solução para
                centralizar a gestão de clinicas em uma única plataforma e padronizar as
                informações de acompanhamento de consultas, cadastros, etc., possibilitando assim
                se ter uma gestão simples e objetiva, o que viabiliza tomada de decisões mais
                assertivas.
            </p>
            <p>
                <span style=" font-size:200%; font-style:italic;color:#f00;">C</span>om o SGCM é possível cadastrar medicamentos informando o seu
                fabricante para que o médico possa ter a visibilidade da adição do mesmo na
                prescrição, atendendo as expectativas do usuário manipulando o sistema. Além da
                emissão da prescrição médica que conterá os medicamentos e os exames a ser
                solicitados os tornando gerenciáveis. Para se ter segurança e confiabilidade dos
                dados o SGCM possui controle de usuários e perfis, onde o acesso a cada
                funcionalidade do sistema depende do perfil associado ao usuário. O sistema foi
                desenvolvido utilizando o framework Hibernate e a linguagem Java juntamente com
                os IDE’S NetBeans e MySQL Workbench e o banco de dados MySQL Server, o
                sistema é responsivo, podendo ser operado por computadores, tablets ou
                smartphones
            </p>
        </div>
        <c:import url="tags/javascript.jsp"/>
        
    </body>
</html>
