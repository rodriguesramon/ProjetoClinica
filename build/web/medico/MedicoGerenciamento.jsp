<%@page import="model.bean.Medico"%>
<%@page import="model.dao.MedicoDao"%>
<%@page import="model.dao.MedicoespecialidadeDao"%>
<%@page import="model.bean.Medicoespecialidade"%>
<%@page import="model.bean.Acesso"%>
<%@page import="model.dao.AcessoDao"%>
<%@page import="model.dao.TelaDao"%>
<%@page import="model.bean.Tela"%>
<%@page import="java.net.URL"%>
<%@page import="model.bean.Usuario"%>
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
            <c:import url="../tags/status.jsp"/>
            <div class="well bs-component">
                <%
                    int idMedico = Integer.parseInt(request.getParameter("idMedico"));
                    MedicoDao medicoDao = new MedicoDao();
                    Medico medico = medicoDao.buscaMedico(idMedico);
                %>
                
                <legend>Gerenciar - M&eacute;dico<button class="btn btn-primary btn-sm pull-right" id="btnAtualizar" style="margin-top:-10px">Atualizar <i class="fas fa-save fa-lg"></i></button> </legend>
                <div class="row">
                    <input type="hidden" id="idMedico" value="<%= medico.getId() %>">
                    <div class="form-group col-sm-5">
                        <label for="estado">Nome</label>
                        <div class="input-group input-group-sm">
                            <span class="input-group-addon"><i class="fas fa-grip-horizontal"></i></span>
                            <input type="text" class="form-control" id="nome" autocomplete="off" name="nome" value="<%= medico.getNome() %>">
                       </div>
                    </div>
                    
                     <div class="form-group col-md-2">
                        <label for="sigla">CRM</label>
                        <div class="input-group input-group-sm">
                            <span class="input-group-addon"><i class="fas fa-grip-horizontal"></i></span>
                            <input type="text" class="form-control" id="crm" autocomplete="off" name="crm" value="<%= medico.getCrm()%>">
                        </div>
                    </div>
                        
                    <div class="form-group col-md-3">
                        <label for="sigla">Especialidade</label>
                        <div class="input-group input-group-sm">
                            <!--<span class="input-group-addon"><i class="fas fa-grip-horizontal"></i></span>-->
                            <select class="form-control" id="idEspecialidade" name="idEspecialidade">
                            <%
                                EspecialidadeDao especialidadeDao = new EspecialidadeDao();
                                for(Especialidade especialidade : especialidadeDao.listaEspecialidade()){
                            %>
                                <option value="<%= especialidade.getId() %>"><%= especialidade.getNome() %></option>
                            <%  }   %>
                            </select>
                            <div class="input-group-btn  input-group-sm ">
                                <button class="btn btn-success btn-sm" type="button" id="btnAddEspecialidade">
                                    <i class="fa fa-plus"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="row">
                    <div class="form-group col-md-2">
                        <label for="sigla">RG</label>
                        <div class="input-group input-group-sm">
                            <span class="input-group-addon"><i class="fas fa-grip-horizontal"></i></span>
                            <input type="text" class="form-control" id="rg" autocomplete="off" name="rg" value="<%= medico.getRg() %>">
                        </div>
                    </div>
                    <div class="form-group col-md-2">
                        <label for="sigla">CPF</label>
                        <div class="input-group input-group-sm">
                            <span class="input-group-addon"><i class="fas fa-grip-horizontal"></i></span>
                            <input type="text" class="form-control" id="cpf" autocomplete="off" name="cpf" value="<%= medico.getCpf()%>">
                        </div>
                    </div>
                    <div class="form-group col-sm-4">
                        <label for="estado">Email</label>
                        <div class="input-group input-group-sm">
                            <span class="input-group-addon"><i class="fas fa-grip-horizontal"></i></span>
                            <input type="text" class="form-control" id="email" autocomplete="off" name="email" value="<%= medico.getEmail()%>">
                       </div>
                    </div>
                    <div class="form-group col-md-2">
                        <label for="sigla">Fone&nbsp;Residencial</label>
                        <div class="input-group input-group-sm">
                            <span class="input-group-addon"><i class="fas fa-grip-horizontal"></i></span>
                            <input type="text" class="form-control" id="foneResidencial" autocomplete="off" name="foneResidencial" value="<%= medico.getFoneResidencial() %>"> 
                        </div>
                    </div>
                    <div class="form-group col-md-2">
                        <label for="sigla">Fone&nbsp;Celular</label>
                        <div class="input-group input-group-sm">
                            <span class="input-group-addon"><i class="fas fa-grip-horizontal"></i></span>
                            <input type="text" class="form-control" id="foneCelular" autocomplete="off" name="foneCelular" value="<%= medico.getFoneCelular() %>">
                        </div>
                    </div>
                </div>
                
                <div class="row">
                    <table class="table table-bordered table-hover" id="tableData">
                        <thead>
                            <tr>
                                <th>Especialidade</th>
                                <th>Excluir</th>
                            </tr>
                        </thead>
                        <tbody>
                        <%  
                            MedicoespecialidadeDao medicoespecialidadeDao = new MedicoespecialidadeDao();
                            for(Medicoespecialidade medicoespecialidade : medicoespecialidadeDao.buscaEspecialidades(medico.getId())){
                        %>
                            <tr>
                                <td><%= medicoespecialidade.getEspecialidade().getNome() %></td>
                                <td width="5%"> <button class="btn btn-danger btn-sm" onclick="deletarEspecialidade(<%= medicoespecialidade.getId() %>)" id="btnDeleteEspecialidade">Excluir</button> </td>
                            </tr>
                        <%  } %>
                        </tbody>
                    </table>
                </div>
            </div>
                            
        </div>
        <c:import url="../tags/javascript.jsp"/>
        <script>
            $(document).ready(function() {
                $('#tableData').DataTable({
                    scrollY:        '40vh',
                    scrollCollapse: true,
                    paging:         false,
                    bFilter: false,
                    "language": {
                        "info":"_TOTAL_ registros",
                        "infoEmpty" : "0 registros",
                        "zeroRecords":" "
                    }
                });
            });
            setInputFilter(document.getElementById("rg"), function(value) {
                return /^\d*$/.test(value); 
            });
            setInputFilter(document.getElementById("cpf"), function(value) {
                return /^\d*$/.test(value); 
            });
            
            setInputFilter(document.getElementById("crm"), function(value) {
                return /^\d*$/.test(value); 
            });
            
            function deletarEspecialidade(idMedicoEspecialidade){
                $.post("../ControllerMedico",{
                    option  :   "DeletarEspecialidade",
                    idMedicoEspecialidade  :   idMedicoEspecialidade
                }, function(){
                    console.log("Processando...");
                }).done(function(data){
                    var value = JSON.parse(data);
                    if(value == true){
                        location.reload();
                    }
                });
            };
            
            $("#btnAddEspecialidade").click(function(){
                $.post("../ControllerMedico",{
                    option  :   "AdicionarEspecialidade",
                    idMedico         :   $("#idMedico").val(),
                    idEspecialidade  :   $("#idEspecialidade").val()
                }, function(){
                    console.log("Processando...");
                }).done(function(data){
                    $("#statusSalvando").css({"display":"none"});
                    var value = JSON.parse(data);
                    console.log(value);
                    if(value == true){
                        processSuccess();
                        location.reload();
                    }else{
                        processFail();
                    }
                });
            });
            
            $( "#btnAtualizar" ).click(function() {
                $.post("../ControllerMedico", {
                    option   :   "AtualizarMedico",
                    idMedico :   $("#idMedico").val(),
                    nome     :   $("#nome").val(),
                    status   :   $("#status").val(),
                    rg       :   $("#rg").val(),
                    cpf      :   $("#cpf").val(),
                    crm      :   $("#crm").val(),
                    email               :   $("#email").val(),
                    foneCelular         :   $("#foneCelular").val(),
                    foneResidencial     :   $("#foneResidencial").val()
                }, function(){
                    console.log("Processando...");
                }).done(function(data) {
                    $("#statusSalvando").css({"display":"none"});
                    var value = JSON.parse(data);
                    console.log(value);
                    if(value == true){
                        processSuccess();
                        location.reload();
                    }else{
                        processFail();
                    }
                });
            });
            
        </script>
    </body>
</html>
