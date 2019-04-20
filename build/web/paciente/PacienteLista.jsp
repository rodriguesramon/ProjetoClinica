<%@page import="java.text.SimpleDateFormat"%>
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
                <legend>Listagem - Paciente
                    <div class="btn-group btn-group-sm pull-right" style="margin-top:-10px">
                        <button type="button" id="btnBusca" class="btn btn-primary ">Buscar <i class="fas fa-search fa-lg"></i></button>
                        <button type="button" id="btnReset" class="btn btn-info ">Limpar <i class="fas fa-sync fa-lg"></i></button>
                    </div>
                </legend>
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
                </div>
                <div class="form-group">
                    <table class="table table-bordered table-hover" id="tableData">
                        <thead>
                            <tr>
                                <th>Nome</th>
                                <th>RG</th>
                                <th>CPF</th>
                                <th>Dt.&nbsp;Nascimento</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                PacienteDao pacienteDao = new PacienteDao();
                                String nome = request.getParameter("nome");
                                String rg = request.getParameter("rg");
                                String cpf = request.getParameter("cpf");
                                
                                for(Paciente paciente : pacienteDao.listaPacientes(nome, rg, cpf)){
                                    SimpleDateFormat dt = new SimpleDateFormat("dd/MM/yyyy");
                            %>
                            <tr>
                                <td><%= paciente.getNome() %></td>
                                <td><%= paciente.getRg() %></td>
                                <td><%= paciente.getCpf() %></td>
                                <td><%= dt.format(paciente.getDtNascimento())  %></td>
                                <td width="5%"><button class="btn btn-success btn-sm" onclick="gerenciarPaciente(<%= paciente.getId() %>)" >Gerenciar</button></td>
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
            
            function gerenciarPaciente(idPaciente){
                var stringUrl = "PacienteGerenciamento.jsp?idPaciente="+idPaciente;
                window.location = stringUrl;
            }
            
            $( "#btnBusca" ).click(function() {
                var stringUrl = "PacienteLista.jsp?nome="+$("#nome").val()+"&rg="+$("#rg").val()+"&cpf="+$("#cpf").val();
                window.location = stringUrl;
            });
            
            $( "#btnReset" ).click(function() {resetPagina();});
            
        </script>
    </body>
</html>
