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
                <legend>Cadastro - Consulta<button type="button" class="btn btn-primary btn-sm pull-right" id="btnProsseguirConsultaPassoUm" style="margin-top:-10px">Prosseguir <i class="fas fa-arrow-circle-right"></i> </button> </legend>
                <div class="row">
                    <input id="idPaciente" type="hidden">
                    <div class="form-group col-md-2">
                        <label for="rg">RG</label>
                        <div class="input-group input-group-sm">
                            <span class="input-group-addon"><i class="fas fa-grip-horizontal"></i></span>
                            <input type="text" class="form-control" id="rg" autocomplete="off" name="rg">
                        </div>
                    </div>
                    <div class="form-group col-md-3">
                        <label for="cpf">CPF</label>
                        <div class="input-group input-group-sm">
                            <span class="input-group-addon"><i class="fas fa-grip-horizontal"></i></span>
                            <input type="text" class="form-control" id="cpf" autocomplete="off" name="cpf">
                        </div>
                    </div>
                    <div class="form-group col-sm-5">
                        <label for="nome">Nome</label>
                        <div class="input-group input-group-sm">
                            <span class="input-group-addon"><i class="fas fa-grip-horizontal"></i></span>
                            <input type="text" class="form-control" id="nome" autocomplete="off" name="nome" readonly>
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
                
                <div class="row">
                    <div class="form-group col-sm-5">
                        <label for="especialidade">Especialidade</label>
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
            </div>
        </div>
        
        <c:import url="../tags/javascript.jsp"/>
        <script>
            $( "#rg, #cpf" ).keypress(function(e) {
                if(e.which === 13) {
                    buscarDadosPaciente();
                }
            });
            
            function buscarDadosPaciente(){
                $.post("../ControllerPaciente", {
                    option  :   "BuscarPaciente",
                    rg      :   $("#rg").val(),
                    cpf     :   $("#cpf").val()
                }).done(function(data) {
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
            
            function buscarDadosPacienteId(){
                $.post("../ControllerPaciente", {
                    option  :   "BuscarPacienteId",
                    id      :   location.search.split('id=')[1]
                })
                .done(function(data) {
                    var value = JSON.parse(data);
                    
                    $("#idPaciente").val(value.id);
                    $("#nome").val(value.nome);
                    $("#sexo").val(value.sexo);
                    $("#rg").val(value.rg);
                    $("#cpf").val(value.cpf);
                });
            }
            
            $( "#btnProsseguirConsultaPassoUm" ).click(function() {
                if($("#nome").val() == ""){
                    msgErro("Defina um paciente!<br>Busque pelo RG ou CPF");
                    return;
                }
                
                var stringUrl = "ConsultaPassoDois.jsp?idPaciente="+$("#idPaciente").val()+"&idEspecialidade="+$("#especialidade").val();
                window.location = stringUrl;
            });
            
           $(function() {
                 var valor =  location.search.split('id=')[1];
                 console.log("vain: " + valor);
           });
            
        </script>
    </body>
</html>
