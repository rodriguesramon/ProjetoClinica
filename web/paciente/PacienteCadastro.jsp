<%-- 
    Document   : ...
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
        <c:import url="../tags/stylesheet.jsp"/>
        <title>Projeto Clinica</title>
    </head>
    <body>
        <div class="container">            
            <c:import url="../tags/menu.jsp"/>
        </div>
        <div class="container" style='margin-top:80px'>
            <c:import url="../tags/status.jsp"/>
            <div class="well bs-component">
                <legend>Cadastro - Paciente<button class="btn btn-primary btn-sm pull-right" id="btnCadastrar" style="margin-top:-10px">Cadastrar <i class="fas fa-save fa-lg"></i></button> </legend>
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
                        <label for="sigla">Dt.&nbsp;Nascimento</label>
                        <div class="input-group input-group-sm">
                            <span class="input-group-addon"><i class="fas fa-grip-horizontal"></i></span>
                            <input type="text" class="form-control" id="dtNascimento" autocomplete="off" name="dtNascimento">
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
                    <div class="form-group col-sm-2">
                        <label for="estado">CEP</label>
                        <div class="input-group input-group-sm">
                            <span class="input-group-addon"><i class="fas fa-grip-horizontal"></i></span>
                            <input type="text" class="form-control" id="cep" autocomplete="off" name="cep">
                       </div>
                    </div>
                    
                    <div class="form-group col-sm-4">
                        <label for="estado">Logradouro</label>
                        <div class="input-group input-group-sm">
                            <span class="input-group-addon"><i class="fas fa-grip-horizontal"></i></span>
                            <input type="text" class="form-control" id="logradouro" autocomplete="off" name="logradouro">
                       </div>
                    </div>
                    
                    <div class="form-group col-sm-2">
                        <label for="estado">Nº</label>
                        <div class="input-group input-group-sm">
                            <span class="input-group-addon"><i class="fas fa-grip-horizontal"></i></span>
                            <input type="text" class="form-control" id="numeroEndereco" autocomplete="off" name="numeroEndereco">
                       </div>
                    </div>
                    
                    <div class="form-group col-sm-2">
                        <label for="estado">Cidade</label>
                        <div class="input-group input-group-sm">
                            <span class="input-group-addon"><i class="fas fa-grip-horizontal"></i></span>
                            <input type="text" class="form-control" id="cidade" autocomplete="off" name="cidade" disabled>
                       </div>
                    </div>
                     <div class="form-group col-sm-2">
                        <label for="estado">UF</label>
                        <div class="input-group input-group-sm">
                            <span class="input-group-addon"><i class="fas fa-grip-horizontal"></i></span>
                            <input type="text" class="form-control" id="uf" autocomplete="off" name="uf" disabled>
                       </div>
                    </div>
                </div>
            </div>
        </div>
        
        <c:import url="../tags/javascript.jsp"/>
        <script>
            $( "#cep" ).keypress(function(e) {
                if(e.which === 13) {
                    $("#logradouro").val("...");
                    $("#cidade").val("...");
                    $("#uf").val("...");
                    $.getJSON("https://viacep.com.br/ws/"+ $( "#cep" ).val() +"/json/?callback=?", function(dados) {
                         if (!("erro" in dados)) {
                             $("#cep").val(dados.cep);
                             $("#logradouro").val(dados.logradouro);
                             $("#cidade").val(dados.localidade);
                             $("#uf").val(dados.uf);
                        }else{
                            //limpa_formulário_cep();
                            alert("CEP não encontrado.");
                        }   
                    });
                }
            });
            
            $( "#btnCadastrar" ).click(function() {
                $("#statusSalvando").css({"display":"block"});
                $.post("../ControllerPaciente", {
                    option          :   "CadastrarPaciente",
                    nome            :   $("#nome").val(),
                    rg              :   $("#rg").val(),
                    cpf             :   $("#cpf").val(),
                    email           :   $("#email").val(),
                    foneCelular     :   $("#foneCelular").val(),
                    foneResidencial :   $("#foneResidencial").val(),
                    dtNascimento    :   $("#dtNascimento").val(),
                    cep             :   $("#cep").val(),
                    logradouro      :   $("#logradouro").val(),
                    numeroEndereco  :   $("#numeroEndereco").val(),
                    cidade          :   $("#cidade").val(),
                    uf              :   $("#uf").val()
                })
                .done(function(data) {
                    $("#statusSalvando").css({"display":"none"});
                    var value = JSON.parse(data);
                    console.log(value);
                    if(value == true){
                        processSuccess();
                    }else{
                        processFail();
                    }
                });
            });
            
        </script>
    </body>
</html>
