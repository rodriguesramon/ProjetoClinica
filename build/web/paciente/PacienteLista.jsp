<%-- 
    Document   : PacienteLista
    Created on : 23/02/2019, 23:48:44
    Author     : Ramon Costa
--%>

<%@page import="model.dao.PacienteDao"%>
<%@page import="model.bean.Paciente"%>
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
        <script src="..\node_modules\jquery\dist\jquery.js"></script>
        <script src="..\node_modules\bootstrap3\dist\js\bootstrap.js"></script>
        <script src="..\node_modules\datatables\media\js\jquery.dataTables.js"></script>
        <script src="..\node_modules\datatables-bootstrap3-plugin\media\js\datatables-bootstrap3.js"></script>
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
                <legend>Listagem - Paciente</legend>
                <div class="row">
                    <div class="form-group col-sm-4">
                        <label for="estado">Nome</label>
                        <div class="input-group input-group-sm">
                            <span class="input-group-addon"><i class="fas fa-grip-horizontal"></i></span>
                            <input type="text" class="form-control" id="nome" autocomplete="off" name="nome">
                       </div>
                    </div>
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
                    <div class="form-group col-md-3" style="margin-top:25px">
                        <div class="btn-group btn-group-sm">
                            <button type="button" id="btnBusca" class="btn btn-primary">Buscar <i class="fas fa-search fa-lg"></i></button>
                            <button type="button" id="btnReset" class="btn btn-info">Limpar <i class="fas fa-sync fa-lg"></i></button>
                      </div>
                        
                    </div>
                </div>
                <div class="form-group">
                    <table class="table table-bordered table-hover" id="tableData">
                        <thead>
                            <tr>
                                <th>Nome</th>
                                <th>RG</th>
                                <th>CPF</th>
                                <th>Dt.&nbsp;Nascimento</th>
                                <th>Gerenciar</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                PacienteDao pacienteDao = new PacienteDao();
                                String nome = request.getParameter("nome");
                                String rg = request.getParameter("rg");
                                String cpf = request.getParameter("cpf");
                                
                                for(Paciente paciente : pacienteDao.listaPacientes(nome, rg, cpf)){
                            %>
                            <tr>
                                <td><%= paciente.getNome() %></td>
                                <td><%= paciente.getRg() %></td>
                                <td><%= paciente.getCpf() %></td>
                                <td><%= paciente.getDtNascimento() %></td>
                                <td></td>
                            </tr>
                            <% } %>
                           
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        
        
        
        
        <script>
            $(document).ready(function() {
                $('#tableData').DataTable();
            } );
            $( "#btnBusca" ).click(function() {
                var stringUrl = "PacienteLista.jsp?nome="+$("#nome").val()+"&rg="+$("#rg").val()+"&cpf="+$("#cpf").val();
                window.location = stringUrl;
//                $.get("PacienteLista.jsp", {
//                    nome   :   $("#nome").val(),
//                    rg     :   $("#rg").val(),
//                    cpf    :   $("#cpf").val()
//                }, function(){
//                    //$("#statusSalvando").css({"display":"block"});
//                })
//                .done(function(data) {
//                    //$("#statusSalvando").css({"display":"none"});
//                    //$("#statusSalvo").css({"display":"block"});
//                    //alert("Agora realmente chegou  " + data);
//                });
            });
            
        </script>
    </body>
</html>
