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
        <!-- Modal -->
        <div class="modal fade" id="modalEditEstado" role="dialog">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Estado - Editar</h4>
                    </div>
                    <div class="modal-body">
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
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-dismiss="modal">Alterar <i class="far fa-save fa-lg"></i> </button>
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar <i class="fas fa-times fa-lg"></i></button>
                    </div>
                </div>
            </div>
        </div>


        
        <div class="container">            
            <div class="alert alert-info" id="statusSalvando" style="display:none">
                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                <strong>Atenção!</strong> Salvando registro...
            </div>
            
            <div class="alert alert-success" id="statusSalvo" style="display:none">
                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                <strong>Sucesso!</strong> Registro Salvo
            </div>
            
            <div class="well bs-component">
                <legend>Estado - Lista</legend>
                <div class="row">
                    <div class="form-group col-sm-12">
                        <table class="table table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th>Estado</th>
                                    <th style="text-align: center">Sigla</th>
                                    <th style="text-align: center" colspan="2">Gerenciar</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    EstadoDao estadoDao = new EstadoDao();
                                    for(Estado estado : estadoDao.listaEstado() ){
                                %>
                                <tr>
                                    <td><%= estado.getNome() %></td>
                                    <td width="10%" style="text-align: center"><%= estado.getSigla() %></td>
                                    <td width="5%" onclick="editarEstado(<%= estado.getId() %>)" style="text-align: center"><button class="btn btn-info btn-sm" data-toggle="modal" data-target="#modalEditEstado"><i class="fas fa-pencil-alt fa-lg"></i></button> </td>
                                    <td width="5%" style="text-align: center"><button class="btn btn-danger btn-sm"><i class="fas fa-times-circle fa-lg"></i></button> </td>
                                </tr>
                                <%  } %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        
        <script src="..\node_modules\jquery\dist\jquery.js"></script>
        <script src="..\node_modules\bootstrap3\dist\js\bootstrap.js"></script>
        <script>
            
            function editarEstado(idEstado){
                $.post("../ControllerEstado", {
                    option : "BuscarEstado",
                    id     : idEstado
                })
                .done(function(data) {
                    var value = JSON.parse(data);
                    
                    $("#nome").val(value["estado"]);
                    $("#sigla").val(value["sigla"]);
                    
                    console.log(data);
                    console.log(value);
                    
                 });
            } 
        </script>
    </body>
</html>
