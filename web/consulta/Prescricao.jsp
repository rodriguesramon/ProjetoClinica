
<%@page import="model.bean.Consulta"%>
<%@page import="model.dao.ConsultaDao"%>
<%@page import="model.bean.Tipoexame"%>
<%@page import="model.dao.TipoexameDao"%>
<%@page import="model.bean.Medicamento"%>
<%@page import="model.dao.MedicamentoDao"%>
<%@page import="model.bean.Receita"%>
<%@page import="model.dao.ReceitaDao"%>
<%@page import="model.bean.Exame"%>
<%@page import="model.dao.ExameDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Impressao</title>
        <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <style>
           .table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th {
                padding: 3px;
            }
        </style>
    </head>
    <body>
        <div class="container-fluid" style='margin-top:10px'>
            
                <legend><span>Prescri&ccedil;&atilde;o</span>
                    <div class="btn-group btn-group-sm pull-right" style="margin-top:-10px">
                    <a class="printit" href="javascript:window.print()"> <img src="<%=application.getContextPath()%>\src\img\printImg.jpg" width="57" height="53" alt="Impress&atilde;o"> </a> 
                    </div>
                </legend>
                <div class="form-group">
                    <%
                        int idConsulta = Integer.parseInt(request.getParameter("idConsulta"));
                        ConsultaDao consultaDao = new ConsultaDao();
                        Consulta consulta = consultaDao.buscaConsulta(idConsulta);
                            
                        
                    %>
                    <table class="table table-bordered" >
                        <tr style="background: #c1dbe1;">
                            <th>RG</th>
                            <th>CPF</th>
                            <th>Nome</th>
                            <th>Sexo</th>
                        </tr>
                        <tr>
                            <td><%= consulta.getPaciente().getRg() %></td>
                            <td><%= consulta.getPaciente().getCpf()%></td>
                            <td><%= consulta.getPaciente().getNome()%></td>
                            <td><%= consulta.getPaciente().getSexo()%></td>
                        </tr>
                    </table>
                </div>
                    
                <div class="form-group">
                    <table class="table table-bordered">
                        <tr style="background: #c1dbe1;">
                            <th>Especialidade</th>
                            <th>M&eacute;dico</th>
                            <th>Atendimento</th>
                        </tr>
                        <tr>
                            <td><%= consulta.getAgenda().getEspecialidade().getNome() %></td>
                            <td><%= consulta.getAgenda().getMedico().getNome() %></td>
                            <td><%= consulta.getObservacao() %></td>
                        </tr>
                    </table>
                </div>    
                
                <div class="form-group">
                    <div class="panel panel-default">
                        <div class="panel-heading clearfix" style="background: #c1dbe1;">
                            <h5 class="panel-title pull-left" style="padding-top: 7.5px;">Receita</h5>
                            
                        </div>
                        <div class="panel-body">
                             <div class="form-group">
                                <table class="table table-bordered">
                                    <tr style="background: #c1dbe1;">
                                        <th>Obs. Receita</th>
                                    </tr>
                                    <tr>
                                        <td><%= consulta.getObservacaoReceita() %></td>
                                    </tr>
                                </table>
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
                        </div>
                        <div class="panel-body">
                            <div class="form-group">
                                <table class="table table-bordered">
                                    <tr style="background: #c1dbe1;">
                                        <th>Obs. Exame</th>
                                    </tr>
                                    <tr>
                                        <td><%= consulta.getObservacaoExame()%></td>
                                    </tr>
                                </table>
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
        </div>
        
    </body>
</html>
