<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.bean.Acesso"%>
<%@page import="model.dao.AcessoDao"%>
<%@page import="model.dao.UsuarioDao"%>
<%@page import="model.bean.Usuario"%>
<%@page import="model.dao.TelaDao"%>
<%@page import="model.bean.Tela"%>
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
                <legend>Cadastro - Acesso<button type="button" class="btn btn-primary btn-sm pull-right" id="btnProsseguirConsultaPassoUm" style="margin-top:-10px">Cadastrar <i class="far fa-save fa-lg"></i> </button> </legend>
                <div class="row">
                    <input id="idPaciente" type="hidden">
                    <div class="form-group col-md-6">
                        <label for="idUsuario">Usu&aacute;rio</label>
                        <div class="input-group input-group-sm">
                            <span class="input-group-addon"><i class="fas fa-grip-horizontal"></i></span>
                            <select class="form-control" id="idUsuario">
                                <%
                                    UsuarioDao usuarioDao = new UsuarioDao();
                                    for(Usuario usuario : usuarioDao.listarUsuarios()){
                                %>
                                <option value="<%= usuario.getId() %>"><%= usuario.getLogin() %> - <%= usuario.getNome()%></option>
                                <% } %>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-sm-5">
                            <label for="idTela">Especialidade</label>
                            <div class="input-group input-group-sm">
                                <span class="input-group-addon"><i class="fas fa-grip-horizontal"></i></span>
                                <select class="form-control" id="idTela">
                                    <%
                                        TelaDao telaDao = new TelaDao();
                                        for(Tela tela : telaDao.listaTela()){
                                    %>
                                    <option value="<%= tela.getId() %>"><%= tela.getNome()%></option>
                                    <% } %>
                                </select>
                           </div>
                        </div>
                    </div>
                    
                </div>
                <div class="row">
                    <table class="table table-bordered table-hover" id="tableData">
                        <thead>
                            <tr>
                                <th>Tipo de Usu&aacute;rio</th>
                                <th>Usu&aacute;rio</th>
                                <th>Login</th>
                                <th>Tela</th>
                                <th>Dt. Cadastro</th>
                            </tr>
                        </thead>
                        <tbody>
                        <%
                            AcessoDao acessoDao = new AcessoDao();
                            for(Acesso acesso : acessoDao.listaAcesso()){
                               SimpleDateFormat dt = new SimpleDateFormat("dd/MM/yyyy");
                        %>
                            <tr>
                                <td><%= acesso.getUsuario().getTipousuario().getNome() %></td>
                                <td><%= acesso.getUsuario().getNome() %></td>
                                <td><%= acesso.getUsuario().getLogin() %></td>
                                <td><%= acesso.getTela().getNome() %></td>
                                <td><%= dt.format(acesso.getDtCadastro()) %></td>
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
                        "info":"_TOTAL_ registro(s)",
                        "zeroRecords":" "
                    }
                });
            });
            
            $("#btnCadastrar").click(function() {
                $("#statusSalvando").css({"display":"block"});
                $.post("../ControllerAcesso", {
                    option    :  "CadastrarAcesso",
                    idUsuario :  $("#idUsuario").val(),
                    idTela    :  $("#idTela").val()
                })
                .done(function(data) {
                    $("#statusSalvando").css({"display":"none"});
                    var value = JSON.parse(data);
                    console.log(value);
                    if(value == true){
                        $("#nome").val("");
                        $("#descricao   ").val("");
                        processSuccess();
                    }else{
                        processFail();
                    }
                });
            });
            
        </script>
    </body>
</html>
