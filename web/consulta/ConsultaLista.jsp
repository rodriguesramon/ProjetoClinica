<%-- 
    Document   : ...
    Created on : 23/02/2019, 23:48:44
    Author     : Ramon Costa
--%>

<%@page import="model.bean.Medico"%>
<%@page import="model.dao.MedicoDao"%>
<%@page import="model.bean.Consulta"%>
<%@page import="model.dao.ConsultaDao"%>
<%@page import="model.bean.Exame"%>
<%@page import="model.dao.ExameDao"%>
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
    </head>
    <body>
        <div class="container">            
            <c:import url="../tags/menu.jsp"/>
        </div>
        <div class="container" style='margin-top:80px'>
            <div class="well bs-component">
                <legend>Lista - Consulta <button class="btn btn-primary btn-sm pull-right" style="margin-top:-10px">Buscar <i class="fas fa-search fa-lg"></i></button> </legend>
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
                            <select class="form-control" id="idEspecialidade">
                                <option></option>
                            <%
                                EspecialidadeDao especialidadeDao = new EspecialidadeDao();
                                for(Especialidade especialidade : especialidadeDao.listaEspecialidade()){
                            %>
                                <option value="<%= especialidade.getId() %>"><%= especialidade.getNome() %></option>
                            <%  } %>
                            </select>
                       </div>
                    </div>
                    
                    <div class="form-group col-sm-4">
                        <label for="estado">M&eacute;dico</label>
                        <div class="input-group input-group-sm">
                            <span class="input-group-addon"><i class="fas fa-grip-horizontal"></i></span>
                            <select class="form-control" id="idMedico">
                                <option></option>
                            <%
                                MedicoDao medicoDao = new MedicoDao();
                                for(Medico medico : medicoDao.listaMedico()){
                            %>
                                <option value="<%= medico.getId() %>"><%= medico.getNome() %></option>
                            <%  } %>
                            </select>
                       </div>
                    </div>
                    <div class="form-group col-sm-3">
                        <label for="estado">Agenda</label>
                        <div class="input-group input-group-sm">
                            <span class="input-group-addon"><i class="fas fa-grip-horizontal"></i></span>
                            <select class="form-control" id="idAgenda">
                                <option></option>
                            <%
                                AgendaDao agendaDao = new AgendaDao();
                                for(Agenda agenda : agendaDao.listaAgendaDisponivel()){
                            %>
                                <option value="<%= agenda.getId() %>"><%= agenda.getDia() %> - <%= agenda.getHora() %></option>
                            <%  } %>
                            </select>
                       </div>
                    </div>
                </div>
                
                <div class="form-group">
                    <table class="table table-bordered table-hover" id="tableData">
                        <thead>
                            <tr>
                                <th>Paciente</th>
                                <th>Especialidade</th>
                                <th>M&eacute;dico</th>
                                <th>Dia</th>
                                <th>Hora</th>
                                <th></th>
                            </tr>
                        </thead> 
                        <tbody>
                            <%
                                ConsultaDao consultaDao = new ConsultaDao();
                                for(Consulta consulta : consultaDao.listaConsulta()){
                            %>
                            <tr>
                                <td><%= consulta.getPaciente().getNome() %></td>
                                <td><%= consulta.getEspecialidade().getNome() %></td>
                                <td><%= consulta.getAgenda().getMedico().getNome() %></td>
                                <td><%= consulta.getAgenda().getDia() %></td>
                                <td><%= consulta.getAgenda().getHora() %></td>
                                <td width="15%" align="center" style="padding-bottom: 0px; padding-top: 0px; padding-right: 0px; padding-left: 0px;">
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-success btn-sm">Atender</button>
                                        <button type="button" class="btn btn-danger btn-sm">Cancelar</button>
                                    </div>
                                </td>
                            </tr>
                            <%  }   %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        
        <c:import url="../tags/javascript.jsp"/>
        <script>
            $(function(){
                //OnLoad
            });
        </script>
    </body>
</html>
