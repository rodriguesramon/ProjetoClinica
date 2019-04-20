<%@page import="model.dao.AgendaDao"%>
<%@page import="model.bean.Agenda"%>
<%@page import="model.bean.Medico"%>
<%@page import="model.dao.MedicoDao"%>
<%@page import="model.bean.Especialidade"%>
<%@page import="model.dao.EspecialidadeDao"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <c:import url="../tags/metas.jsp"/>
        <c:import url="../tags/stylesheet.jsp"/><c:import url="../tags/validasessao.jsp"/>
        <title>Projeto Cl&iacute;nica</title>
    </head>
    <body>
        
        <div class="container">            
            <c:import url="../tags/menu.jsp"/>
        </div>
        <div class="container" style='margin-top:80px'>
            <div class="well bs-component">
                <legend>Cadastro - Consulta <button class="btn btn-primary btn-sm pull-right" style="margin-top:-10px" id="btnCadastrar" >Cadastrar <i class="far fa-save fa-lg"></i></button></legend>
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
                    <div class="form-group col-sm-2">
                        <label for="sexo">Sexo</label>
                        <div class="input-group input-group-sm">
                            <span class="input-group-addon"><i class="fas fa-grip-horizontal"></i></span>
                            <input type="text" class="form-control" id="sexo" autocomplete="off" name="sexo" readonly>
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
                            <select id="idAgenda" class="form-control">
                            <%
                                AgendaDao agendaDao = new AgendaDao();
                                int idMedico = Integer.parseInt(request.getParameter("idMedico"));
                                int idEspecialidade = Integer.parseInt(request.getParameter("idEspecialidade"));
                                for(Agenda agenda : agendaDao.listaAgendaMedico(idMedico, idEspecialidade) ){
                            %>
                                <option value="<%= agenda.getId() %>"><%= agenda.getDia() %> - <%= agenda.getHora() %></option>
                            <% } %>
                            </select>
                       </div>
                    </div>
                </div>
                
                <div class="row">
                    <div class="form-group col-sm-12">
                        <label for="observacao">Observa&ccedil;&atilde;o</label>
                        <textarea class="form-control" rows="2" id="observacao" autocomplete="off"></textarea>
                    </div>
                </div>
                
            </div>
        </div>
        <c:import url="../tags/javascript.jsp"/>
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
                    $("#sexo").val(value.sexo);
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
            
            $( "#btnCadastrar" ).click(function() {
                $.post("../ControllerConsulta", {
                    option  :   "CadastrarConsulta",
                    idPaciente  :  $("#idPaciente").val(),
                    idAgenda    :  $("#idAgenda").val(),
                    observacao  :  $("#observacao").val()
                })
                .done(function(data) {
                    var value = JSON.parse(data);
                    if(value == true){
                        msgSucessoRedirect("Consulta Cadastrada", "ConsultaPassoUm.jsp");
                    }
                     
                });
            });
            
            $(function() {
                buscarDadosPacienteId();
                buscarEspecialidade();
                buscarMedico();
           });
        </script>
    </body>
</html>
