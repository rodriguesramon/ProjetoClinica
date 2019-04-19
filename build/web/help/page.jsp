<%-- 
    Document   : page
    Created on : 23/02/2019, 21:49:01
    
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="..\node_modules\bootstrap3\dist\css\bootstrap.min.css">
        <link rel="stylesheet" href="..\src\css\bootstrap.min.bootswatch.css">
        <title>Projeto Cl&iacute;nica</title>
    </head>
    <body>


        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">Sistema Cl&iacute;nica</a>
                </div>

                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="#">Link <span class="sr-only">(current)</span></a></li>
                        <li><a href="#">Link</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Cadastros B&aacute;sicos <span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="#">Action</a></li>
                                <li><a href="#">Another action</a></li>
                                <li><a href="#">Something else here</a></li>
                                <li class="divider"></li>
                                <li><a href="#">Separated link</a></li>
                                <li class="divider"></li>
                                <li><a href="#">One more separated link</a></li>
                            </ul>
                        </li>
                    </ul>
                    
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="#">Link</a></li>
                    </ul>
                </div>
            </div>
        </nav>



        <div class="container">
            <div class="well bs-component">
                <form class="form-horizontal">
                    <fieldset>
                        <legend>Legend</legend>
                        <div class="form-group">
                            <label for="inputEmail" class="col-lg-2 control-label">Email</label>
                            <div class="col-lg-10">
                            <input type="text" class="form-control" id="inputEmail" placeholder="Email">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputPassword" class="col-lg-2 control-label">Password</label>
                            <div class="col-lg-10">
                                <input type="password" class="form-control" id="inputPassword" placeholder="Password">
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox"> Checkbox
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="textArea" class="col-lg-2 control-label">Textarea</label>
                            <div class="col-lg-10">
                                <textarea class="form-control" rows="3" id="textArea"></textarea>
                                <span class="help-block">A longer block of help text that breaks onto a new line and may extend beyond one line.</span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label">Radios</label>
                            <div class="col-lg-10">
                                <div class="radio">
                                    <label>
                                    <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked="">
                                    Option one is this
                                    </label>
                                </div>
                                <div class="radio">
                                    <label>
                                    <input type="radio" name="optionsRadios" id="optionsRadios2" value="option2">
                                    Option two can be something else
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="select" class="col-lg-2 control-label">Selects</label>
                            <div class="col-lg-10">
                            <select class="form-control" id="select">
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                                <option>5</option>
                            </select>
                            <br>
                            <select multiple="" class="form-control">
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                                <option>5</option>
                            </select>
                            </div>
                        </div>
                        <div class="form-group">
                        <div class="col-lg-10 col-lg-offset-2">
                        <button type="reset" class="btn btn-default">Cancel</button>
                        <button type="submit" class="btn btn-primary">Submit</button>
                        </div>
                        </div>
                    </fieldset>
                </form>
             </div>
        </div>
        
    
        <div class="container">
            <h2>Estado - Cadastro</h2>
            <div class="well bs-component">
                <div class="row">
                   <div class="form-group col-sm-4">
                    <label for="estado">Estado</label>
                    <input type="text" class="form-control" id="nome" autocomplete="off" name="nome">
                    </div>
                    <div class="form-group col-md-2">
                        <label for="sigla">Sigla</label>
                        <input type="text" class="form-control" id="sigla" autocomplete="off" name="sigla">
                    </div>
                    
                </div>
                <div class="row">
                    <div class="form-group col-md-2">
                        <button type="button" class="btn btn-primary" id="btnCadastrar">Cadastrar</button> 
                    </div>
                    
                </div>
            </div>
        </div>
        
        
        
        
        
        <script src="..\node_modules\jquery\dist\jquery.js"></script>
        <script src="..\node_modules\bootstrap3\dist\js\bootstrap.js"></script>
        <script>
             function salvarEstado(){
                $.post("ControllerEstado", {
                    option : "CadastrarEstado",
                    nome   : "Amazonas",
                    sigla  : "AM"
                })
                .done(function(data) {
                    alert("Agora realmente chegou lรก " + data);
                 });
            }
        </script>
    </body>
</html>
