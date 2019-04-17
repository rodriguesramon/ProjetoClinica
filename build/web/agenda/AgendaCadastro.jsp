<%@page import="model.dao.MedicamentoDao"%>
<%@page import="model.dao.MedicoespecialidadeDao"%>
<%@page import="model.bean.Medicoespecialidade"%>
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
                <legend>Cadastro - Agenda<button class="btn btn-primary btn-sm pull-right" id="btnCadastrar" style="margin-top:-10px">Cadastrar <i class="fas fa-save fa-lg"></i></button> </legend>
                
                <div class="row">
                    <div class="form-group col-sm-5">
                        <label for="estado">M&eacute;dico</label>
                        <div class="input-group input-group-sm">
                            <span class="input-group-addon"><i class="fas fa-grip-horizontal"></i></span>
                            <select class="form-control" id="medicoEspecialidade" name="medicoEspecialidade">
                                <%
                                    MedicoespecialidadeDao medicoEspecialidadeDao = new MedicoespecialidadeDao();
                                    for(Medicoespecialidade medicoEspecialidade : medicoEspecialidadeDao.lista() ){
                                %>
                                <option value="<%= medicoEspecialidade.getId() %>"><%= medicoEspecialidade.getMedico().getNome() %> - <%= medicoEspecialidade.getEspecialidade().getNome() %> </option>

                                <%  }   %>
                            </select>
                       </div>
                    </div>
                    <div class="form-group col-md-2">
                        <label for="sigla">Dt.&nbsp;Nascimento</label>
                        <div class="input-group input-group-sm">
                            <span class="input-group-addon"><i class="fas fa-grip-horizontal"></i></span>
                            <input type="text" class="form-control datepicker" id="dtNascimento" autocomplete="off" name="dtNascimento">
                        </div>
                    </div>
                            
                    <div class="form-group col-md-2">
                        <label for="sigla">Hora</label>
                        <div class="input-group input-group-sm">
                            <span class="input-group-addon"><i class="fas fa-grip-horizontal"></i></span>
                            <input type="text" class="form-control" id="dtNascimento" autocomplete="off" name="dtNascimento">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <c:import url="../tags/javascript.jsp"/>
        <script>
            
            $("#btnCadastrar").click(function() {
                var contentErro = "";
                if(!$("#nome").val()){ contentErro += "<br>- Nome";}
                if(!$("#rg").val()){ contentErro += "<br>- RG";}
                if(!$("#cpf").val()){ contentErro += "<br>- CPF ";}
                
                if(!$("#email").val()){ contentErro += "<br>- Email ";}
                if(!$("#foneResidencial").val()){ contentErro += "<br>- Fone Residencial ";}
                if(!$("#foneCelular").val()){ contentErro += "<br>- Fone Celular ";}
                
                if(!$("#dtNascimento").val()){ contentErro += "<br>- Dt. Nascimento ";}
                if(!$("#cep").val()){ contentErro += "<br>- CEP";}
                if(!$("#logradouro").val()){ contentErro += "<br>- Logradouro ";}
                if(!$("#logradouro").val()){ contentErro += "<br>- Logradouro";}
                if(!$("#numeroEndereco").val()){ contentErro += "<br>- N&#186; da Endere&ccedil;o";}
                if(!$("#cidade").val()){ contentErro += "<br>- Cidade";}
                if(!$("#uf").val()){ contentErro += "<br>- UF ";}
                
                console.log(contentErro);
                if(contentErro){ msgErro("Preencha todos os campos" + contentErro); return false; }
                
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
                        limparCamposCadastroPaciente();
                    }else{
                        processFail();
                    }
                });
            });
            
            function limparCamposCadastroPaciente(){
                $("#nome").val("");
                $("#rg").val("");
                $("#cpf").val("");
                $("#email").val("");
                $("#foneCelular").val("");
                $("#foneResidencial").val("");
                $("#dtNascimento").val("");
                $("#cep").val("");
                $("#logradouro").val("");
                $("#numeroEndereco").val("");
                $("#cidade").val("");
                $("#uf").val("");
            }
            
        </script>
    </body>
</html>
