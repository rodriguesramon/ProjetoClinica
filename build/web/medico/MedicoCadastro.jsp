<%-- 
    Document   : BairroLista
    Created on : 23/02/2019, 23:48:44
    Author     : Ramon Costa
--%>

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
                <legend>Cadastro - Medico</legend>
                <div class="row">
                    <div class="form-group col-sm-5">
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
                     <div class="form-group col-md-2">
                        <label for="sigla">CRM</label>
                        <div class="input-group input-group-sm">
                            <span class="input-group-addon"><i class="fas fa-grip-horizontal"></i></span>
                            <input type="text" class="form-control" id="crm" autocomplete="off" name="crm">
                        </div>
                    </div>
                </div>
                
                <div class="row">
                    <div class="form-group col-sm-6">
                        <label for="estado">Email</label>
                        <div class="input-group input-group-sm">
                            <span class="input-group-addon"><i class="fas fa-grip-horizontal"></i></span>
                            <input type="text" class="form-control" id="email" autocomplete="off" name="email">
                       </div>
                    </div>
                    <div class="form-group col-md-3">
                        <label for="sigla">Fone&nbsp;Residencial</label>
                        <div class="input-group input-group-sm">
                            <span class="input-group-addon"><i class="fas fa-grip-horizontal"></i></span>
                            <input type="text" class="form-control" id="foneResidencial" autocomplete="off" name="foneResidencial">
                        </div>
                    </div>
                    <div class="form-group col-md-3">
                        <label for="sigla">Fone&nbsp;Celular</label>
                        <div class="input-group input-group-sm">
                            <span class="input-group-addon"><i class="fas fa-grip-horizontal"></i></span>
                            <input type="text" class="form-control" id="foneCelular" autocomplete="off" name="foneCelular">
                        </div>
                    </div>
                </div>
                
                <div class="row">
                    <div class="form-group col-md-2">
                        <button type="button" class="btn btn-primary" id="btnCadastrar">Cadastrar <i class="far fa-save fa-lg"></i> </button> 
                    </div>
                    
                </div>
            </div>
            
        </div>
        
        <script src="..\node_modules\jquery\dist\jquery.js"></script>
        <script src="..\node_modules\bootstrap3\dist\js\bootstrap.js"></script>
        <script>
            $( "#btnCadastrar" ).click(function() {
                $.post("../ControllerMedico", {
                    option  :   "CadastrarMedico",
                    nome    :   $("#nome").val(),
                    rg      :   $("#rg").val(),
                    cpf     :   $("#cpf").val(),
                    crm     :   $("#crm").val(),
                    email   :   $("#email").val(),
                    foneCelular       :   $("#foneCelular").val(),
                    foneResidencial   :   $("#foneResidencial").val()
                }, function(){
                    //$("#statusSalvando").css({"display":"block"});
                })
                .done(function(data) {
                    //$("#statusSalvando").css({"display":"none"});
                    //$("#statusSalvo").css({"display":"block"});
                    //alert("Agora realmente chegou  " + data);
                });
            });
            
        </script>
    </body>
</html>
