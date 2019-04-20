<%@page import="model.bean.Agenda"%>
<%@page import="model.dao.AgendaDao"%>
<%@page import="model.dao.MedicamentoDao"%>
<%@page import="model.dao.MedicoespecialidadeDao"%>
<%@page import="model.bean.Medicoespecialidade"%>
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
                <div class="row">
                    <table class="table table-bordered table-hover" id="tableData">
                        <thead>
                            <tr>
                                <th>M&eacute;dico</th>
                                <th>Especialidade</th>
                                <th>Dia</th>
                                <th>Hora</th>
                            </tr>
                        </thead>
                        <tbody>
                        <%
                             AgendaDao agendaDao = new AgendaDao();
                             for(Agenda agenda : agendaDao.listaAgendaDisponivel()){
                        %>
                            <tr>
                                <td><%= agenda.getMedico().getNome() %></td>
                                <td><%= agenda.getEspecialidade().getNome() %></td>
                                <td><%= agenda.getDia() %></td>
                                <td><%= agenda.getHora() %></td>
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
            $(document).ready(function() {
                $('#tableData').DataTable({
                    scrollY:        '40vh',
                    scrollCollapse: true,
                    paging:         false,
                    bFilter: false,
                    "language": {
                        "info":"_TOTAL_ registros",
                        "zeroRecords":" "
                    }
                });
            });
            
            $("#btnCadastrar").click(function() {
                var contentErro = "";
                if(!$("#dia").val()){ contentErro += "<br>- Dia";}
                if(!$("#hora").val()){ contentErro += "<br>- Hora";}
                
                console.log(contentErro);
                if(contentErro){ msgErro("Preencha todos os campos" + contentErro); return false; }
                
                $("#statusSalvando").css({"display":"block"});
                
                 var dia = FormataStringData($("#dia").val());
                
                $.post("../ControllerAgenda", {
                    option          :   "CadastrarAgenda",
                    idMedicoEspecialidade :   $("#idMedicoEspecialidade").val(),
                    dia     :   dia,
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
