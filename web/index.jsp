<%-- 
    Document   : index
    Created on : 23/02/2019, 14:57:10
    Author     : Ramon Costa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <link rel="stylesheet" href="node_modules\bootstrap3\dist\css\bootstrap.min.css">
        <link rel="stylesheet" href="src\css\bootstrap.min.bootswatch.css">
        
        <title>Projeto Clinica</title>
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



        


       
        <script src="node_modules\jquery\dist\jquery.js"></script>
        <script src="node_modules\bootstrap3\dist\js\bootstrap.js"></script>
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
