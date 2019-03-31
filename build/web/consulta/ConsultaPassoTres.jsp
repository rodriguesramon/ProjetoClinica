<%-- 
    Document   : ...
    Created on : 23/02/2019, 23:48:44
    Author     : Ramon Costa
--%>

<%@page import="model.dao.AgendaDao"%>
<%@page import="model.bean.Agenda"%>
<%@page import="model.bean.Medico"%>
<%@page import="model.dao.MedicoDao"%>
<%@page import="model.bean.Especialidade"%>
<%@page import="model.dao.EspecialidadeDao"%>
<%@page import="model.bean.Estado"%>
<%@page import="model.dao.EstadoDao"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <c:import url="../tags/metas.jsp"/>
        <c:import url="../tags/metas.jsp"/>
        <c:import url="../tags/stylesheet.jsp"/>
        
        <title>Projeto Clinica</title>
        <style>
            .input-group-addon {
                background-color: #c1dbe1;
            }
            
            table{
                background-color:#FFFFFF
            }
            
            thead{
                background-color: #c1dbe1 !important;
            }

        </style>
    </head>
    <body>
        
        <div class="container">            
            <c:import url="../tags/menu.jsp"/>
        </div>
        <div class="container" style='margin-top:80px'>
            <div class="well bs-component">
                <legend>Cadastro - Consulta</legend>
                <div class="row">
                    <input id="idPaciente" type="hidden">
                    <div class="form-group col-md-2">
                        <label for="sigla">RG</label>
                        <div class="input-group input-group-sm">
                            <span class="input-group-addon"><i class="fas fa-grip-horizontal"></i></span>
                            <input type="text" class="form-control" id="rg" autocomplete="off" name="rg">
                        </div>
                    </div>
                    <div class="form-group col-md-3">
                        <label for="sigla">CPF</label>
                        <div class="input-group input-group-sm">
                            <span class="input-group-addon"><i class="fas fa-grip-horizontal"></i></span>
                            <input type="text" class="form-control" id="cpf" autocomplete="off" name="cpf">
                        </div>
                    </div>
                    <div class="form-group col-sm-5">
                        <label for="estado">Nome</label>
                        <div class="input-group input-group-sm">
                            <span class="input-group-addon"><i class="fas fa-grip-horizontal"></i></span>
                            <input type="text" class="form-control" id="nome" autocomplete="off" name="nome">
                       </div>
                    </div>
                </div>
                
                <input id="idEspecialidade" type="hidden">
                <div class="row">
                    <div class="form-group col-sm-5">
                        <label for="estado">Especialidade</label>
                        <div class="input-group input-group-sm">
                            <span class="input-group-addon"><i class="fas fa-grip-horizontal"></i></span>
                            <input class="form-control" id="especialidade">
                       </div>
                    </div>
                    <input type="hidden" id="idMedico">
                    <div class="form-group col-sm-4">
                        <label for="estado">M&eacute;dico</label>
                        <div class="input-group input-group-sm">
                            <span class="input-group-addon"><i class="fas fa-grip-horizontal"></i></span>
                            <input type="text" class="form-control" id="medico">
                       </div>
                    </div>
                    
                    <div class="form-group col-sm-3">
                        <label for="estado">Agenda</label>
                        <div class="input-group input-group-sm">
                            <span class="input-group-addon"><i class="fas fa-grip-horizontal"></i></span>
                            <select id="idMedico" class="form-control">
                            <%
                                AgendaDao agendaDao = new AgendaDao();
                                int idMedico = Integer.parseInt(request.getParameter("idMedico"));
                                for(Agenda agenda : agendaDao.listaAgendaMedico(idMedico) ){
                            %>
                                <option value="<%= agenda.getId() %>"><%= agenda.getDia() %> - <%= agenda.getHora() %></option>
                            <% } %>
                            </select>
                       </div>
                    </div>
                    
                </div>
                
                <div class="row">
                    <div class="form-group col-md-2">
                        <button type="button" class="btn btn-primary" id="btnProsseguirConsultaPassoUm">Cadastrar <i class="far fa-save fa-lg"></i> </button> 
                    </div>  
                </div>
            </div>
        </div>
        
        <script src="..\node_modules\jquery\dist\jquery.js"></script>
        <script src="..\node_modules\bootstrap3\dist\js\bootstrap.js"></script>
        <script>
            function buscarDadosPacienteId(){
                $.post("../ControllerPaciente", {
                    option  :   "BuscarPacienteId",
                    id      :   getQueryString('idPaciente')
                }, function(data){
                  console.log("Processando...");
                })
                .done(function(data) {
                    var value = JSON.parse(data);
                    console.log(value.id);
                    console.log(value.nome);
                    
                    $("#idPaciente").val(value.id);
                    $("#nome").val(value.nome);
                    $("#rg").val(value.rg);
                    $("#cpf").val(value.cpf);
                });
            }
            
            function buscarEspecialidade(){
                $.post("../ControllerEspecialidade", {
                    option  :   "BuscarEspecialidade",
                    id      :   getQueryString('idEspecialidade')
                }, function(data){
                    console.log("Processando...");
                })
                .done(function(data) {
                    var value = JSON.parse(data);
                    console.log(value.id);
                    console.log(value.nome);
                    $("#idEspecialidade").val(value.id);
                    $("#especialidade").val(value.nome);
                });
            }
            
            function buscarMedico(){
                $.post("../ControllerMedico", {
                    option  :   "BuscarMedico",
                    id      :   getQueryString('idMedico')
                }, function(data){
                    console.log("Processando...");
                })
                .done(function(data) {
                    var value = JSON.parse(data);
                    console.log(value.id);
                    console.log(value.nome);
                    $("#idMedico").val(value.id);
                    $("#medico").val(value.nome);
                });
            }
            
           var getQueryString = function ( field, url ) {
                    var href = url ? url : window.location.href;
                    var reg = new RegExp( '[?&]' + field + '=([^&#]*)', 'i' );
                    var string = reg.exec(href);
                    return string ? string[1] : null;
            };
            
            $(function() {
                buscarDadosPacienteId();
                buscarEspecialidade();
                buscarMedico();
           });
        </script>
    </body>
</html>
