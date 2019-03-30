<%-- 
    Document   : BairroCadastro
    Created on : 23/02/2019, 21:03:22
    Author     : Ramon Costa
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="stylesheet" href="..\node_modules\bootstrap3\dist\css\bootstrap.min.css">
        <link rel="stylesheet" href="..\src\css\bootstrap.min.bootswatch.css">
        <link rel="stylesheet" href="..\node_modules\@fortawesome\fontawesome-free\css\all.css">
        <title>Projeto Clinica</title>
        <style>
            .input-group-addon {
                background-color: #c1dbe1;
            }
        </style>
    </head>
    <body>
        
       

        
        <div class="container">
           <c:import url="../tags/menu.jsp"/>
           
            <div class="alert alert-info" id="statusSalvando" style="display:none">
                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                <strong>Atenção!</strong> Salvando registro...
            </div>
            
            <div class="alert alert-success" id="statusSalvo" style="display:none">
                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                <strong>Sucesso!</strong> Registro Salvo
            </div>
            
            <div class="well bs-component">
                <legend>Cadastro - Estado</legend>
                <div class="row">
                    <div class="form-group col-sm-4">
                        <label for="estado">Estado</label>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fas fa-grip-horizontal"></i></span>
                            <input type="text" class="form-control" id="nome" autocomplete="off" name="nome">
                       </div>
                    </div>
                    <div class="form-group col-md-2">
                        <label for="sigla">Sigla</label>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fas fa-grip-horizontal"></i></span>
                            <input type="text" class="form-control" id="sigla" autocomplete="off" name="sigla">
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
            
            $('#btnCadastrar').click(function(){
                
                $.post("../ControllerEstado", {
                    option : "CadastrarEstado",
                    nome   : $("#nome").val(),
                    sigla  : $("#sigla").val()
                }, function(){
                    $("#statusSalvando").css({"display":"block"});
                })
                .done(function(data) {
                    $("#statusSalvando").css({"display":"none"});
                    $("#statusSalvo").css({"display":"block"});
                    //alert("Agora realmente chegou  " + data);
                 });
            });
             
        </script>
    </body>
</html>
