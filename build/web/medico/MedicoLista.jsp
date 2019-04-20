<%@page import="model.dao.MedicoDao"%>
<%@page import="model.bean.Medico"%>
<%@page import="model.dao.PacienteDao"%>
<%@page import="model.bean.Paciente"%>
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
                <legend>Listagem - M&eacute;dico
                    <div class="btn-group btn-group-sm pull-right" style="margin-top:-10px">
                        <button type="button" id="btnBusca" class="btn btn-primary ">Buscar <i class="fas fa-search fa-lg"></i></button>
                        <button type="button" id="btnReset" class="btn btn-info ">Limpar <i class="fas fa-sync fa-lg"></i></button>
                    </div></legend>
                <div class="row">
                    <div class="form-group col-sm-3">
                        <label for="estado">Nome</label>
                        <div class="input-group input-group-sm">
                            <span class="input-group-addon"><i class="fas fa-grip-horizontal"></i></span>
                            <input type="text" class="form-control" id="nome" autocomplete="off" name="nome">
                       </div>
                    </div>
                    <div class="form-group col-md-2">
                        <label for="crm">CRM</label>
                        <div class="input-group input-group-sm">
                            <span class="input-group-addon"><i class="fas fa-grip-horizontal"></i></span>
                            <input type="text" class="form-control" id="crm" autocomplete="off" name="crm">
                        </div>
                    </div>
                    <div class="form-group col-md-2">
                        <label for="rg">RG</label>
                        <div class="input-group input-group-sm">
                            <span class="input-group-addon"><i class="fas fa-grip-horizontal"></i></span>
                            <input type="text" class="form-control" id="rg" autocomplete="off" name="rg">
                        </div>
                    </div>
                    <div class="form-group col-md-2">
                        <label for="cpf">CPF</label>
                        <div class="input-group input-group-sm">
                            <span class="input-group-addon"><i class="fas fa-grip-horizontal"></i></span>
                            <input type="text" class="form-control" id="cpf" autocomplete="off" name="cpf">
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <table class="table table-bordered table-hover" id="tableData">
                        <thead>
                            <tr>
                                <th>Nome</th>
                                <th>CRM</th>
                                <th>RG</th>
                                <th>CPF</th>
                                <th>Email</th>
                                <th>Fone Cel.</th>
                                <th>Fone Res.</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                MedicoDao medicoDao = new MedicoDao();
                                String nome = request.getParameter("nome");
                                String rg = request.getParameter("rg");
                                String crm = request.getParameter("crm");
                                String cpf = request.getParameter("cpf");
                                
                                for(Medico medico : medicoDao.listaMedicos(nome, rg, cpf, crm)){
                            %>
                            <tr>
                                <td><%= medico.getNome() %></td>
                                <td><%= medico.getCrm() %></td>
                                <td><%= medico.getRg() %></td>
                                <td><%= medico.getCpf() %></td>
                                <td><%= medico.getEmail() %></td>
                                <td><%= medico.getFoneCelular() %></td>
                                <td><%= medico.getFoneResidencial() %></td>
                                <td width="5%"><button class="btn btn-success btn-sm" onclick="gerenciarMedico(<%= medico.getId() %>)">Gerenciar</button> </td>
                            </tr>
                            <% } %>
                           
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
            
            function gerenciarMedico(idMedico){
                var stringUrl = "MedicoGerenciamento.jsp?idMedico="+idMedico;
                window.location = stringUrl;
            }
            
            $("#btnBusca").click(function() {
                var stringUrl = "MedicoLista.jsp?nome="+$("#nome").val()+"&rg="+$("#rg").val()+"&cpf="+$("#cpf").val()+"&crm="+$("#crm").val();
                window.location = stringUrl;
            });
            
            $("#btnReset").click(function(){
                resetPagina();
            });
            
        </script>
    </body>
</html>
