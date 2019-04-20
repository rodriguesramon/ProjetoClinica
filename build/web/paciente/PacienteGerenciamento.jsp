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
            <c:import url="../tags/status.jsp"/>
            <div class="well bs-component">
                <%
                    int idPaciente = Integer.parseInt(request.getParameter("idPaciente"));
                    PacienteDao pacienteDao = new PacienteDao();
                    Paciente paciente = pacienteDao.buscaPaciente(idPaciente) ;
                %>
                <legend>Gerenciar - Paciente<button class="btn btn-primary btn-sm pull-right" id="btnAtualizar" style="margin-top:-10px">Atualizar <i class="fas fa-save fa-lg"></i></button> </legend>
                <div class="row">
                    <input type="hidden" id="idPaciente" value="<%= paciente.getId() %>">
                    <div class="form-group col-sm-4">
                        <label for="nome">Nome</label>
                        <div class="input-group input-group-sm">
                            <span class="input-group-addon"><i class="fas fa-grip-horizontal"></i></span>
                            <input type="text" class="form-control" id="nome" autocomplete="off" name="nome" value="<%= paciente.getNome() %>" >
                       </div>
                    </div>
                    <div class="form-group col-md-2">
                        <label for="rg">RG</label>
                        <div class="input-group input-group-sm">
                            <span class="input-group-addon"><i class="fas fa-grip-horizontal"></i></span>
                            <input type="text" class="form-control" id="rg" autocomplete="off" name="rg" value="<%= paciente.getRg() %>">
                        </div>
                    </div>
                    <div class="form-group col-md-2">
                        <label for="cpf">CPF</label>
                        <div class="input-group input-group-sm">
                            <span class="input-group-addon"><i class="fas fa-grip-horizontal"></i></span>
                            <input type="text" class="form-control" id="cpf" autocomplete="off" name="cpf" value="<%= paciente.getCpf() %>">
                        </div>
                    </div>
                     <div class="form-group col-md-2">
                        <label for="dtNascimento">Dt.&nbsp;Nascimento</label>
                        <div class="input-group input-group-sm">
                            <span class="input-group-addon"><i class="fas fa-grip-horizontal"></i></span>
                            <input type="text" class="form-control datepicker" id="dtNascimento" autocomplete="off" name="dtNascimento" value="<%= paciente.getDtNascimento() %>">
                        </div>
                    </div>
                    <div class="form-group col-md-2">
                        <label for="sexo">Sexo</label>
                        <div class="input-group input-group-sm">
                            <span class="input-group-addon"><i class="fas fa-grip-horizontal"></i></span>
                            <select class="form-control" id="sexo">
                                <option></option>
                                <option value="Femenino" <% if(paciente.getSexo().equals("Femenino")){%> selected <% } %> >Femenino</option>
                                <option value="Masculino" <% if(paciente.getSexo().equals("Masculino")){%> selected <% } %> >Masculino</option>
                            </select>
                        </div>
                    </div>    
                </div>
                
                <div class="row">
                    <div class="form-group col-sm-6">
                        <label for="estado">Email</label>
                        <div class="input-group input-group-sm">
                            <span class="input-group-addon"><i class="fas fa-grip-horizontal"></i></span>
                            <input type="text" class="form-control" id="email" autocomplete="off" name="email" value="<%= paciente.getEmail() %>">
                       </div>
                    </div>
                    <div class="form-group col-md-3">
                        <label for="sigla">Fone&nbsp;Residencial</label>
                        <div class="input-group input-group-sm">
                            <span class="input-group-addon"><i class="fas fa-grip-horizontal"></i></span>
                            <input type="text" class="form-control" id="foneResidencial" value="<%= paciente.getFoneResidencial() %>" pattern="\([0-9]{2}\)[\s][0-9]{4}-[0-9]{4,5}" autocomplete="off" name="foneResidencial">
                        </div>
                    </div>
                    <div class="form-group col-md-3">
                        <label for="sigla">Fone&nbsp;Celular</label>
                        <div class="input-group input-group-sm">
                            <span class="input-group-addon"><i class="fas fa-grip-horizontal"></i></span>
                            <input type="text" class="form-control" id="foneCelular" value="<%= paciente.getFoneCelular() %>" autocomplete="off" name="foneCelular">
                        </div>
                    </div>
                </div>
                
                <div class="row">
                    <div class="form-group col-sm-2">
                        <label for="cep">CEP</label>
                        <div class="input-group input-group-sm">
                            <span class="input-group-addon"><i class="fas fa-grip-horizontal"></i></span>
                            <input type="text" class="form-control" id="cep" autocomplete="off" name="cep" value="<%= paciente.getEnderecoCep() %>">
                       </div>
                    </div>
                    
                    <div class="form-group col-sm-4">
                        <label for="estado">Logradouro</label>
                        <div class="input-group input-group-sm">
                            <span class="input-group-addon"><i class="fas fa-grip-horizontal"></i></span>
                            <input type="text" class="form-control" id="logradouro" autocomplete="off" name="logradouro" value="<%= paciente.getEnderecoLogradouro() %>">
                       </div>
                    </div>
                    
                    <div class="form-group col-sm-2">
                        <label for="estado">Nº</label>
                        <div class="input-group input-group-sm">
                            <span class="input-group-addon"><i class="fas fa-grip-horizontal"></i></span>
                            <input type="text" class="form-control" id="numeroEndereco" autocomplete="off" name="numeroEndereco" value="<%= paciente.getEnderecoNumero() %>">
                       </div>
                    </div>
                    
                    <div class="form-group col-sm-2">
                        <label for="cidade">Cidade</label>
                        <div class="input-group input-group-sm">
                            <span class="input-group-addon"><i class="fas fa-grip-horizontal"></i></span>
                            <input type="text" class="form-control" id="cidade" autocomplete="off" name="cidade" disabled value="<%= paciente.getEnderecoCidade() %>">
                       </div>
                    </div>
                     <div class="form-group col-sm-2">
                        <label for="uf">UF</label>
                        <div class="input-group input-group-sm">
                            <span class="input-group-addon"><i class="fas fa-grip-horizontal"></i></span>
                            <input type="text" class="form-control" id="uf" autocomplete="off" name="uf" disabled value="<%= paciente.getEnderecoUf() %>">
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
            setInputFilter(document.getElementById("cep"), function(value) {
                return /^\d*$/.test(value); 
            });
            
            $( "#cep" ).keypress(function(e) {
                if(e.which === 13) {
                    $("#logradouro").val("...");
                    $("#cidade").val("...");
                    $("#uf").val("...");
                    $.getJSON("https://viacep.com.br/ws/"+ $( "#cep" ).val() +"/json/?callback=?", function(dados) {
                         if (!("erro" in dados)) {
                             $("#cep").val(dados.cep);
                             $("#logradouro").val(dados.logradouro + " - " + dados.bairro);
                             $("#cidade").val(dados.localidade);
                             $("#uf").val(dados.uf);
                        }else{
                            //limpa_formulário_cep();
                            alert("CEP não encontrado.");
                        }   
                    });
                }
            });
            
            $("#btnAtualizar").click(function() {
                var contentErro = "";
                if(!$("#nome").val()){ contentErro += "<br>- Nome";}
                if(!$("#sexo").val()){ contentErro += "<br>- Sexo";}
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
                
                if(contentErro){ msgErro("Preencha todos os campos" + contentErro); return false; }
                var dtNascimento = FormataStringData($("#dtNascimento").val());
                
                $("#statusSalvando").css({"display":"block"});
                $.post("../ControllerPaciente", {
                    option          :   "AtualizarPaciente",
                    idPaciente      :   $("#idPaciente").val(),
                    nome            :   $("#nome").val(),
                    sexo            :   $("#sexo").val(),
                    rg              :   $("#rg").val(),
                    cpf             :   $("#cpf").val(),
                    email           :   $("#email").val(),
                    foneCelular     :   $("#foneCelular").val(),
                    foneResidencial :   $("#foneResidencial").val(),
                    dtNascimento    :   dtNascimento,
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
