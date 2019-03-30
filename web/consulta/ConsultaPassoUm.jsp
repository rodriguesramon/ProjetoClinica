<%-- 
    Document   : BairroLista
    Created on : 23/02/2019, 23:48:44
    Author     : Ramon Costa
--%>

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
                
                <div class="row">
                    <div class="form-group col-sm-5">
                        <label for="estado">Especialidade</label>
                        <div class="input-group input-group-sm">
                            <span class="input-group-addon"><i class="fas fa-grip-horizontal"></i></span>
                            <select class="form-control" id="especialidade">
                                <%
                                    EspecialidadeDao especialidadeDao = new EspecialidadeDao();
                                    for(Especialidade especialidade : especialidadeDao.listaEspecialidade()){
                                %>
                                <option value="<%= especialidade.getId() %>"><%= especialidade.getNome()%></option>
                                <% } %>
                            </select>
                       </div>
                    </div>
                </div>
                
                <div class="row">
                    <div class="form-group col-md-2">
                        <button type="button" class="btn btn-primary" id="btnProsseguirConsultaPassoUm">Prosseguir <i class="far fa-save fa-lg"></i> </button> 
                    </div>  
                </div>
            </div>
        </div>
        
        <script src="..\node_modules\jquery\dist\jquery.js"></script>
        <script src="..\node_modules\bootstrap3\dist\js\bootstrap.js"></script>
        <script>
            $( "#btnCadastrar" ).click(function() {
                $.post("../ControllerMedico", {
                    option  :   "CadastrarMedico",
                    nome    :   $("#nome").val(),
                    rg      :   $("#rg").val(),
                    cpf     :   $("#cpf").val(),
                    crm     :   $("#crm").val(),
                    email   :   $("#email").val(),
                    foneCelular       :   $("#foneCelular").val(),
                    foneResidencial   :   $("#foneResidencial").val()
                }, function(){
                    //$("#statusSalvando").css({"display":"block"});
                })
                .done(function(data) {
                    
                    
                    //if(){}
                    
                    //$("#statusSalvando").css({"display":"none"});
                    //$("#statusSalvo").css({"display":"block"});
                    //alert("Agora realmente chegou  " + data);
                });
            });
            
            function buscarDadosPaciente(){
                $.post("../ControllerPaciente", {
                    option  :   "BuscarPaciente",
                    rg      :   $("#rg").val(),
                    cpf     :   $("#cpf").val()
                }, function(data){
                  
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
            
            function buscarDadosPacienteId(){
                $.post("../ControllerPaciente", {
                    option  :   "BuscarPacienteId",
                    id      :   location.search.split('id=')[1]
                }, function(data){
                  
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
            
            $( "#btnProsseguirConsultaPassoUm" ).click(function() {
                var stringUrl = "ConsultaPassoDois.jsp?nome="+$("#nome").val()+"&rg="+$("#rg").val()+"&cpf="+$("#cpf").val();
                window.location = stringUrl;
            });
            
           $(function() {
                 var valor =  location.search.split('id=')[1];
                 console.log("vain: " + valor);
           });
            
        </script>
    </body>
</html>
