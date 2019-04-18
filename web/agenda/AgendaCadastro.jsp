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
                            <select class="form-control" id="idMedicoEspecialidade" name="idMedicoEspecialidade">
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
                        <label for="sigla">Dia</label>
                        <div class="input-group input-group-sm">
                            <span class="input-group-addon"><i class="fas fa-grip-horizontal"></i></span>
                            <input type="text" class="form-control datepicker" id="dia" autocomplete="off" name="dia">
                        </div>
                    </div>
                            
                    <div class="form-group col-md-2">
                        <label for="sigla">Hora</label>
                        <div class="input-group input-group-sm">
                            <span class="input-group-addon"><i class="fas fa-grip-horizontal"></i></span>
                            <input type="text" class="form-control" id="hora" autocomplete="off" name="hora">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <c:import url="../tags/javascript.jsp"/>
        <script>
            
            $("#btnCadastrar").click(function() {
                var contentErro = "";
                if(!$("#dia").val()){ contentErro += "<br>- Dia";}
                if(!$("#hora").val()){ contentErro += "<br>- Hora";}
                
                console.log(contentErro);
                if(contentErro){ msgErro("Preencha todos os campos" + contentErro); return false; }
                
                $("#statusSalvando").css({"display":"block"});
                
                $.post("../ControllerAgenda", {
                    option          :   "CadastrarAgenda",
                    idMedicoEspecialidade :   $("#idMedicoEspecialidade").val(),
                    dia     :   $("#dia").val(),
                    hora    :   $("#hora").val()
                })
                .done(function(data) {
                    $("#statusSalvando").css({"display":"none"});
                    var value = JSON.parse(data);
                    console.log(value);
                    if(value == true){
                        processSuccess();
                        limparCamposCadastroAgenda();
                    }else{
                        processFail();
                    }
                });
            });
            
            function limparCamposCadastroAgenda(){
                $("#dia").val("");
                $("#hora").val("");
            }            
        </script>
    </body>
</html>
