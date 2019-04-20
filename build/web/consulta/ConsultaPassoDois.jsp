<%@page import="model.bean.Medicoespecialidade"%>
<%@page import="model.dao.MedicoespecialidadeDao"%>
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
                <legend>
                    Cadastro - Consulta
                    <button type="button" class="btn btn-primary btn-sm pull-right" id="btnProsseguirConsultaPassoDois" style="margin-top:-10px">
                        Prosseguir <i class="fas fa-arrow-circle-right"></i>
                    </button>
                </legend>
                <div class="row">
                    <input id="idPaciente" type="hidden">
                    <div class="form-group col-md-2">
                        <label for="rg">RG</label>
                        <div class="input-group input-group-sm">
                            <span class="input-group-addon"><i class="fas fa-grip-horizontal"></i></span>
                            <input type="text" class="form-control" id="rg" autocomplete="off" name="rg" readonly>
                        </div>
                    </div>
                    <div class="form-group col-md-3">
                        <label for="cpf">CPF</label>
                        <div class="input-group input-group-sm">
                            <span class="input-group-addon"><i class="fas fa-grip-horizontal"></i></span>
                            <input type="text" class="form-control" id="cpf" autocomplete="off" name="cpf" readonly>
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
                
                <input id="idEspecialidade" type="hidden">
                <div class="row">
                    <div class="form-group col-sm-5">
                        <label for="estado">Especialidade</label>
                        <div class="input-group input-group-sm">
                            <span class="input-group-addon"><i class="fas fa-grip-horizontal"></i></span>
                            <input class="form-control" id="especialidade" readonly>
                       </div>
                    </div>
                    
                    <div class="form-group col-sm-5">
                        <label for="estado">M&eacute;dico</label>
                        <div class="input-group input-group-sm">
                            <span class="input-group-addon"><i class="fas fa-grip-horizontal"></i></span>
                            <select id="idMedico" class="form-control">
                            <%
                                MedicoespecialidadeDao medicoEspecialidadeDao = new MedicoespecialidadeDao();
                                int idEspecialidade = Integer.parseInt(request.getParameter("idEspecialidade"));
                                for(Medicoespecialidade medico : medicoEspecialidadeDao.listaMedicoPorEspecialidade(idEspecialidade)){
                            %>
                                <option value="<%= medico.getMedico().getId() %>"><%= medico.getMedico().getNome() %></option>
                            <% } %>
                            </select>
                       </div>
                    </div>
                </div>
                
                
            </div>
        </div>
        
        <c:import url="../tags/javascript.jsp"/>
        <script>
            
            $( "#btnProsseguirConsultaPassoDois" ).click(function() {
                var stringUrl = "ConsultaPassoTres.jsp?";
                stringUrl += "idPaciente=" + $("#idPaciente").val();
                stringUrl +="&idEspecialidade=" + getQueryString('idEspecialidade');
                stringUrl +="&idMedico=" + $("#idMedico").val();
                window.location = stringUrl;
            });
            function buscarDadosPacienteId(){
                $.post("../ControllerPaciente", {
                    option  :   "BuscarPacienteId",
                    id      :   getQueryString('idPaciente')
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
            
            $(function() {
                buscarDadosPacienteId();
                buscarEspecialidade();
           });
            
        </script>
    </body>
</html>
