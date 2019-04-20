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
                <legend>Cadastro - Especialidade<button class="btn btn-primary btn-sm pull-right" id="btnCadastrar" style="margin-top:-10px">Cadastrar <i class="fas fa-save fa-lg"></i></button> </legend>
                <div class="row">
                    <div class="form-group col-sm-5">
                        <label for="estado">Nome</label>
                        <div class="input-group input-group-sm">
                            <span class="input-group-addon"><i class="fas fa-grip-horizontal"></i></span>
                            <input type="text" class="form-control" id="nome" autocomplete="off" name="nome">
                       </div>
                    </div>
                    <div class="form-group col-md-7">
                        <label for="sigla">Descri&ccedil;&atilde;o</label>
                        <div class="input-group input-group-sm">
                            <span class="input-group-addon"><i class="fas fa-grip-horizontal"></i></span>
                            <input type="text" class="form-control" id="descricao" autocomplete="off" name="descricao">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <table class="table table-bordered table-hover" id="tableData">
                        <thead>
                            <tr>
                                <th>Especialidade</th>
                                <th>Descri&ccedil;&atilde;o</th>
                                <th>Dt. Cadastro</th>
                                <th>Gerenciar</th>
                            </tr>
                        </thead>
                        <tbody>
                        <%
                             EspecialidadeDao especialidadeDao = new EspecialidadeDao();
                             for(Especialidade especialidade : especialidadeDao.listaEspecialidade()){
                        %>
                            <tr>
                                <td><%= especialidade.getNome() %></td>
                                <td><%= especialidade.getDescricao() %></td>
                                <td><%= especialidade.getDtCadastro() %></td>
                                <td width="5%"><button class="btn btn-success btn-sm">Gerenciar</button></td>
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
                $.post("../ControllerEspecialidade", {
                    option      :   "CadastrarEspecialidade",
                    nome        :   $("#nome").val(),
                    descricao   :   $("#descricao").val()
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
