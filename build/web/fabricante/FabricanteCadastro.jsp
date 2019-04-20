<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.bean.Fabricante"%>
<%@page import="model.dao.FabricanteDao"%>
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
                <legend>Cadastro - Fabricante<button class="btn btn-primary btn-sm pull-right" id="btnCadastrar" style="margin-top:-10px">Cadastrar <i class="fas fa-save fa-lg"></i></button> </legend>
                <div class="row">
                    <div class="form-group col-sm-12">
                        <label for="estado">Nome</label>
                        <div class="input-group input-group-sm">
                            <span class="input-group-addon"><i class="fas fa-grip-horizontal"></i></span>
                            <input type="text" class="form-control" id="nome" autocomplete="off" name="nome">
                       </div>
                    </div>
                </div>
                
                <div class="row">
                    <table class="table table-bordered table-hover" id="tableData">
                        <thead>
                            <tr>
                                <th>Especialidade</th>
                                <th>Dt. Cadastro</th>
                            </tr>
                        </thead>
                        <tbody>
                        <%
                             FabricanteDao fabricanteDao = new FabricanteDao();
                             for(Fabricante fabricante : fabricanteDao.listaFabricante()){
                                 SimpleDateFormat dt = new SimpleDateFormat("dd/MM/yyyy");
                        %>
                            <tr>
                                <td><%= fabricante.getNome() %></td>
                                <td><%= dt.format(fabricante.getDtCadastro()) %></td>
                            </tr>
                        <%
                             }
                        %>
                        </tbody>
                    </table>
                </div>
                
            </div>
        </div>
        
        <c:import url="../tags/javascript.jsp"/>
        <script>
            
            $( "#btnCadastrar" ).click(function() {
                $("#statusSalvando").css({"display":"block"});
                $.post("../ControllerFabricante", {
                    option      :   "CadastrarFabricante",
                    nome        :   $("#nome").val()
                })
                .done(function(data) {
                    $("#statusSalvando").css({"display":"none"});
                    var value = JSON.parse(data);
                    console.log(value);
                    if(value == true){
                        $("#nome").val("");
                        processSuccess();
                    }else{
                        processFail();
                    }
                });
            });
            
        </script>
    </body>
</html>
