<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.bean.Fabricante"%>
<%@page import="model.dao.FabricanteDao"%>
<%@page import="model.bean.Medicamento"%>
<%@page import="model.dao.MedicamentoDao"%>
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
                <legend>Cadastro - Medicamento<button class="btn btn-primary btn-sm pull-right" id="btnCadastrar" style="margin-top:-10px">Cadastrar <i class="fas fa-save fa-lg"></i></button> </legend>
                <div class="row">
                    <div class="form-group col-sm-3">
                        <label for="estado">Nome G&eacute;nerico</label>
                        <div class="input-group input-group-sm">
                            <span class="input-group-addon"><i class="fas fa-grip-horizontal"></i></span>
                            <input type="text" class="form-control" id="nomeGenerico" autocomplete="off" name="nomeGenerico">
                       </div>
                    </div>
                    <div class="form-group col-md-3">
                        <label for="sigla">Nome de F&aacute;brica</label>
                        <div class="input-group input-group-sm">
                            <span class="input-group-addon"><i class="fas fa-grip-horizontal"></i></span>
                            <input type="text" class="form-control" id="nomeDeFabrica" autocomplete="off" name="nomeDeFabrica">
                        </div>
                    </div>
                    
                    <div class="form-group col-md-3">
                        <label for="sigla">Fabricante</label>
                        <div class="input-group input-group-sm">
                            <span class="input-group-addon"><i class="fas fa-grip-horizontal"></i></span>
                            <select class="form-control input-sm" id="idFabricante" name="idFabricante">
                            <%
                                FabricanteDao fabricanteDao = new FabricanteDao();
                                for(Fabricante fabricante : fabricanteDao.listaFabricante()){
                            %>
                            <option value="<%= fabricante.getId() %>"><%= fabricante.getNome() %></option>
                            <%  }   %>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <table class="table table-bordered table-hover" id="tableData">
                        <thead>
                            <tr>
                                <th>Medicamento [Nome G&ecirc;nerico]</th>
                                <th>Medicamento [Nome de F&aacute;brica]</th>
                                <th>Fabricante</th>
                                <th>Dt. Cadastro</th>
                            </tr>
                        </thead>
                        <tbody>
                        <%
                            MedicamentoDao medicamentoDao = new MedicamentoDao();
                            for(Medicamento medicamento : medicamentoDao.listaMedicamento()){
                                SimpleDateFormat dt = new SimpleDateFormat("dd/MM/yyyy");
                        %>
                            <tr>
                                <td><%= medicamento.getNomeGenerico() %></td>
                                <td><%= medicamento.getNomeDeFabrica() %></td>
                                <td><%= medicamento.getFabricante().getNome() %></td>
                                <td><%= dt.format(medicamento.getDtCadastro()) %></td>
                            </tr>
                        <%  } %>
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
                        "info":"_TOTAL_ registro(s)",
                        "zeroRecords":" "
                    }
                });
            });
            
            $("#btnCadastrar").click(function() {
                $("#statusSalvando").css({"display":"block"});
                $.post("../ControllerMedicamento", {
                    option         :  "CadastrarMedicamento",
                    idFabricante   :  $("#idFabricante").val(),
                    nomeGenerico   :  $("#nomeGenerico").val(),
                    nomeDeFabrica  :  $("#nomeDeFabrica").val()
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
