<%@page import="model.bean.Acesso"%>
<%@page import="model.dao.AcessoDao"%>
<%@page import="model.dao.TelaDao"%>
<%@page import="model.bean.Tela"%>
<%@page import="java.net.URL"%>
<%@page import="model.bean.Usuario"%>
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
                <legend>Cadastro - M&eacute;dico<button class="btn btn-primary btn-sm pull-right" id="btnCadastrar" style="margin-top:-10px">Cadastrar <i class="fas fa-save fa-lg"></i></button> </legend>
                <div class="row">
                    <div class="form-group col-sm-5">
                        <label for="estado">Nome</label>
                        <div class="input-group input-group-sm">
                            <span class="input-group-addon"><i class="fas fa-grip-horizontal"></i></span>
                            <input type="text" class="form-control" id="nome" autocomplete="off" name="nome">
                       </div>
                    </div>
                    
                     <div class="form-group col-md-2">
                        <label for="sigla">CRM</label>
                        <div class="input-group input-group-sm">
                            <span class="input-group-addon"><i class="fas fa-grip-horizontal"></i></span>
                            <input type="text" class="form-control" id="crm" autocomplete="off" name="crm">
                        </div>
                    </div>
                    
                    <div class="form-group col-md-3">
                        <label for="sigla">Especialidade</label>
                        <div class="input-group input-group-sm">
                            <span class="input-group-addon"><i class="fas fa-grip-horizontal"></i></span>
                            <select class="form-control" id="idEspecialidade">
                            <%
                                EspecialidadeDao especialidadeDao = new EspecialidadeDao();
                                for(Especialidade especialidade : especialidadeDao.listaEspecialidade() ){
                            %>
                                <option value="<%= especialidade.getId()%>"><%= especialidade.getNome()%></option>
                            <%  }   %>
                            </select>
                        </div>
                    </div>
                    
                </div>
                
                <div class="row">
                    <div class="form-group col-md-2">
                        <label for="sigla">RG</label>
                        <div class="input-group input-group-sm">
                            <span class="input-group-addon"><i class="fas fa-grip-horizontal"></i></span>
                            <input type="text" class="form-control" id="rg" autocomplete="off" name="rg">
                        </div>
                    </div>
                    <div class="form-group col-md-2">
                        <label for="sigla">CPF</label>
                        <div class="input-group input-group-sm">
                            <span class="input-group-addon"><i class="fas fa-grip-horizontal"></i></span>
                            <input type="text" class="form-control" id="cpf" autocomplete="off" name="cpf">
                        </div>
                    </div>
                    <div class="form-group col-sm-4">
                        <label for="estado">Email</label>
                        <div class="input-group input-group-sm">
                            <span class="input-group-addon"><i class="fas fa-grip-horizontal"></i></span>
                            <input type="text" class="form-control" id="email" autocomplete="off" name="email">
                       </div>
                    </div>
                    <div class="form-group col-md-2">
                        <label for="sigla">Fone&nbsp;Residencial</label>
                        <div class="input-group input-group-sm">
                            <span class="input-group-addon"><i class="fas fa-grip-horizontal"></i></span>
                            <input type="text" class="form-control" id="foneResidencial" autocomplete="off" name="foneResidencial">
                        </div>
                    </div>
                    <div class="form-group col-md-2">
                        <label for="sigla">Fone&nbsp;Celular</label>
                        <div class="input-group input-group-sm">
                            <span class="input-group-addon"><i class="fas fa-grip-horizontal"></i></span>
                            <input type="text" class="form-control" id="foneCelular" autocomplete="off" name="foneCelular">
                        </div>
                    </div>
                </div>
            </div>
                            
        </div>
        <c:import url="../tags/javascript.jsp"/>
        <script>
            
            setInputFilter(document.getElementById("rg"), function(value) {
                return /^\d*$/.test(value); 
            });
            setInputFilter(document.getElementById("cpf"), function(value) {
                return /^\d*$/.test(value); 
            });
            
            setInputFilter(document.getElementById("crm"), function(value) {
                return /^\d*$/.test(value); 
            });
            
            $( "#btnCadastrar" ).click(function() {
                $.post("../ControllerMedico", {
                    option  :   "CadastrarMedico",
                    nome    :   $("#nome").val(),
                    rg      :   $("#rg").val(),
                    cpf     :   $("#cpf").val(),
                    crm     :   $("#crm").val(),
                    idEspecialidade     :   $("#idEspecialidade").val(),
                    email               :   $("#email").val(),
                    foneCelular         :   $("#foneCelular").val(),
                    foneResidencial     :   $("#foneResidencial").val()
                }, function(){
                    console.log("Processando...");
                })
                .done(function(data) {
                    $("#statusSalvando").css({"display":"none"});
                    var value = JSON.parse(data);
                    console.log(value);
                    if(value == true){
                        processSuccess();
                        limparCamposCadastroMedico();
                    }else{
                        processFail();
                    }
                });
            });
            
            function limparCamposCadastroMedico(){
                $("#nome").val("");
                $("#rg").val("");
                $("#crm").val("");
                $("#cpf").val("");
                $("#email").val("");
                $("#foneCelular").val("");
                $("#foneResidencial").val("");
            }
        </script>
    </body>
</html>
