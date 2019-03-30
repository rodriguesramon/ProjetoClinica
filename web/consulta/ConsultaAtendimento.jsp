<%-- 
    Document   : BairroLista
    Created on : 23/02/2019, 23:48:44
    Author     : Ramon Costa
--%>

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
                <legend>Atendimento - Consulta</legend>
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
                            <input class="form-control" id="especialidade" autocomplete="off">
                       </div>
                    </div>
                    
                    <div class="form-group col-sm-4">
                        <label for="estado">M&eacute;dico</label>
                        <div class="input-group input-group-sm">
                            <span class="input-group-addon"><i class="fas fa-grip-horizontal"></i></span>
                            <input type="text" class="form-control" id="medico" autocomplete="off">
                       </div>
                    </div>
                    <div class="form-group col-sm-3">
                        <label for="estado">Agenda</label>
                        <div class="input-group input-group-sm">
                            <span class="input-group-addon"><i class="fas fa-grip-horizontal"></i></span>
                            <input type="text" class="form-control" id="agenda" autocomplete="off">
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
                                <button class="btn btn-primary btn-sm">Adicionar</button>
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
                            <h5 class="panel-title pull-left" style="padding-top: 7.5px;">observacaoExame</h5>
                            <div class="btn-group pull-right">
                                <button class="btn btn-primary btn-sm">Adicionar</button>
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
        
        <script src="..\node_modules\jquery\dist\jquery.js"></script>
        <script src="..\node_modules\bootstrap3\dist\js\bootstrap.js"></script>
        <script>
            
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
            
            var getQueryString = function ( field, url ) {
                     var href = url ? url : window.location.href;
                     var reg = new RegExp( '[?&]' + field + '=([^&#]*)', 'i' );
                     var string = reg.exec(href);
                     return string ? string[1] : null;
            };
            
            $(function(){
                buscarDadosConsulta();
            });
        </script>
    </body>
</html>
