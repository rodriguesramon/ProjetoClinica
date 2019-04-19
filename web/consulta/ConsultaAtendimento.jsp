<%@page import="model.bean.Tipoexame"%>
<%@page import="model.dao.TipoexameDao"%>
<%@page import="model.dao.MedicamentoDao"%>
<%@page import="model.bean.Medicamento"%>
<%@page import="model.bean.Exame"%>
<%@page import="model.dao.ExameDao"%>
<%@page import="model.bean.Receita"%>
<%@page import="model.dao.ReceitaDao"%>
<%@page import="model.dao.AgendaDao"%>
<%@page import="model.bean.Agenda"%>
<%@page import="model.bean.Especialidade"%>
<%@page import="model.dao.EspecialidadeDao"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <c:import url="../tags/metas.jsp"/>
        <c:import url="../tags/stylesheet.jsp"/>
        <title>Projeto Cl&iacute;nica</title>
    </head>
    <body>
        
        <div class="container">            
            <c:import url="../tags/menu.jsp"/>
        </div>
        <div class="container" style='margin-top:80px'>
            
            <div class="modal fade" id="modalMedicamento" role="dialog">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Medicamento</h4>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <p>Selecione um medicamento</p>
                                <select class="form-control input-sm" id="idMedicamento">
                                    <%
                                        MedicamentoDao medicamentoDao = new MedicamentoDao();
                                        for(Medicamento medicamento : medicamentoDao.listaMedicamento()){
                                    %>
                                        <option value="<%= medicamento.getId() %>"><%= medicamento.getNomeGenerico() %></option>
                                    <%  } %>
                                </select>
                            </div>
                            <div class="form-group">
                                <textarea class="form-control" placeholder="Observa&ccedil;&atilde;o"></textarea>
                            </div>    
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                            <button type="button" class="btn btn-success" data-dismiss="modal" id="btnAddMedicamento">Adicionar</button>
                        </div>
                    </div>
                </div>
             </div>
                            
            <div class="modal fade" id="modalExame" role="dialog">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Exame</h4>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <p>Selecione um Exame</p>
                                <select class="form-control input-sm" id="idTipoExame">
                                    <%
                                        TipoexameDao tipoExameDao = new TipoexameDao();
                                        for(Tipoexame tipoExame : tipoExameDao.listaTipoexame() ){
                                    %>
                                        <option value="<%= tipoExame.getId() %>"><%= tipoExame.getNome()%></option>
                                    <%  } %>
                                </select>
                            </div>
                            <div class="form-group">
                                <textarea class="form-control" placeholder="Observa&ccedil;&atilde;o"></textarea>
                            </div>    
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                            <button type="button" class="btn btn-success" data-dismiss="modal" id="btnAddExame">Adicionar</button>
                        </div>
                    </div>
                </div>
             </div>
                            
            <div class="well bs-component">
                <legend>Atendimento - Consulta</legend>
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
                        <label for="estado">Nome</label>
                        <div class="input-group input-group-sm">
                            <span class="input-group-addon"><i class="fas fa-grip-horizontal"></i></span>
                            <input type="text" class="form-control" id="nome" autocomplete="off" name="nome" readonly>
                       </div>
                    </div>
                </div>
                
                <div class="row">
                    <div class="form-group col-sm-5">
                        <label for="estado">Especialidade</label>
                        <div class="input-group input-group-sm">
                            <span class="input-group-addon"><i class="fas fa-grip-horizontal"></i></span>
                            <input class="form-control" id="especialidade" autocomplete="off" readonly>
                       </div>
                    </div>
                    
                    <div class="form-group col-sm-4">
                        <label for="estado">M&eacute;dico</label>
                        <div class="input-group input-group-sm">
                            <span class="input-group-addon"><i class="fas fa-grip-horizontal"></i></span>
                            <input type="text" class="form-control" id="medico" autocomplete="off" readonly>
                       </div>
                    </div>
                    <div class="form-group col-sm-3">
                        <label for="estado">Agenda</label>
                        <div class="input-group input-group-sm">
                            <span class="input-group-addon"><i class="fas fa-grip-horizontal"></i></span>
                            <input type="text" class="form-control" id="agenda" autocomplete="off" readonly>
                       </div>
                    </div>
                </div>
                
                <div class="row">
                    <div class="form-group col-sm-12">
                        <label for="observacao">Observa&ccedil;&atilde;o</label>
                        <textarea class="form-control" rows="2" id="observacao" autocomplete="off"></textarea>
                    </div>
                </div>
                
                <div class="form-group">
                    <div class="panel panel-default">
                        <div class="panel-heading clearfix" style="background: #c1dbe1;">
                            <h5 class="panel-title pull-left" style="padding-top: 7.5px;">Receita</h5>
                            <div class="btn-group pull-right">
                                <button class="btn btn-primary btn-sm" id="btnAdicionarMedicamento">Adicionar</button>
                            </div>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="form-group col-sm-12">
                                    <label for="observacaoReceita">Observa&ccedil;&atilde;o</label>
                                    <textarea class="form-control" id="observacaoReceita" rows="2"></textarea>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-sm-12">
                                    <table class="table table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th>Medicamento</th>
                                                <th>Orienta&ccedil;&atilde;o</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                ReceitaDao receitaDao = new ReceitaDao();
                                                int idConsulta = Integer.parseInt(request.getParameter("idConsulta"));
                                                for(Receita receita : receitaDao.listaReceitaMedicamentos(idConsulta)){
                                            %>
                                            <tr>
                                                <td width="20%"><%= receita.getMedicamento().getNomeGenerico() %></td>
                                                <td width="40%"><%= receita.getObservacao() %></td>
                                            </tr>
                                            <%  }%>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="form-group">
                    <div class="panel panel-default">
                        <div class="panel-heading clearfix" style="background: #c1dbe1;">
                            <h5 class="panel-title pull-left" style="padding-top: 7.5px;">Exame</h5>
                            <div class="btn-group pull-right">
                                <button class="btn btn-primary btn-sm" id="btnAdicionarExame">Adicionar</button>
                            </div>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="form-group col-sm-12">
                                    <label for="estado">Observa&ccedil;&atilde;o</label>
                                    <textarea class="form-control" id="observacaoExame" rows="2"></textarea>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-sm-12">
                                    <table class="table table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th>Exame</th>
                                                <th>Observa&ccedil;&atilde;o</th>
                                                <th>Resultado</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <% 
                                            ExameDao exameDao = new ExameDao();
                                            for(Exame exame :  exameDao.listaExame(idConsulta)){
                                        %>
                                            <tr>
                                                <td><%= exame.getTipoexame().getNome() %></td>
                                                <td><%= exame.getObservacao() %></td>
                                                <td></td>
                                            </tr>
                                        <%  } %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="row">
                    <div class="form-group col-md-2">
                        <button type="button" class="btn btn-primary" id="btnProsseguirConsultaPassoUm">Registrar <i class="far fa-save fa-lg"></i> </button> 
                    </div>  
                </div>
            </div>
        </div>
        <c:import url="../tags/javascript.jsp"/>
        <script>
            $("#btnAddMedicamento").click(function(){
                $.post("../ControllerConsulta", {
                    option        :   "AdicionarMedicamento",
                    id            :   getQueryString('idConsulta'),
                    idMedicamento : $("#idMedicamento").val(),
                    observacaoMedicamento : $("#observacaoMedicamento").val(),
                }, function(){
                  console.log("Processando...");
                })
                .done(function(data){
                    var value = JSON.parse(data);
                    $("#idConsulta").val(value.id);
                });
            });
            
            $("#btnAddExame").click(function(){
                $.post("../ControllerConsulta", {
                    option  :   "AdicionarExame",
                    id      :   getQueryString('idConsulta'),
                    idTipoExame : $("#idTipoExame").val(),
                    observacaoExame : $("#observacaoExame").val()
                }, function(){
                  console.log("Processando...");
                })
                .done(function(data){
                    var value = JSON.parse(data);
                    $("#idConsulta").val(value.id);
                    
                });
            });
            
            $("#btnAdicionarMedicamento").click(function(){
                $("#modalMedicamento").modal();
            });
            
            $("#btnAdicionarExame").click(function(){
                $("#modalExame").modal();
            });
            
            function buscarDadosConsulta(){
                $.post("../ControllerConsulta", {
                    option  :   "BuscarConsulta",
                    id      :   getQueryString('idConsulta')
                }, function(){
                  console.log("Processando...");
                })
                .done(function(data){
                    var value = JSON.parse(data);
                    $("#idConsulta").val(value.id);
                    $("#nome").val(value.paciente);
                    $("#rg").val(value.rg);
                    $("#cpf").val(value.cpf);
                    $("#medico").val(value.medico);
                    $("#especialidade").val(value.especialidade);
                    $("#agenda").val(value.agenda);
                    $("#observacao").val(value.observacao);
                    $("#observacaoReceita").val(value.observacaoReceita);
                    $("#observacaoExame").val(value.observacaoExame);
                });
            }
            
            $(function(){
                buscarDadosConsulta();
            });
        </script>
    </body>
</html>
