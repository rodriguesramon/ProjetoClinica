<nav class="navbar navbar-default navbar-fixed-top">
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
                <li class="active"><a href="<%= application.getContextPath() + "/mainpage.jsp" %>">Inicio<span class="sr-only">(current)</span></a></li>
                <!--<li><a href="#">Consultas</a></li>-->
                
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Consulta <span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="<%= application.getContextPath() + "/consulta/ConsultaPassoUm.jsp" %>">Marcar Consulta</a></li>
                        <li><a href="<%= application.getContextPath() + "/consulta/ConsultaLista.jsp" %>">Checar Agenda</a></li>
                    </ul>
                </li>
                
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Paciente <span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="<%= application.getContextPath() + "/paciente/PacienteCadastro.jsp" %>">Cadastrar</a></li>
                        <li><a href="<%= application.getContextPath() + "/paciente/PacienteLista.jsp" %>">Gerenciar</a></li>
                    </ul>
                </li>
                
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Cadastros B&aacute;sicos <span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="<%= application.getContextPath() + "/medicamento/MedicamentoCadastro.jsp" %>">Medicamento</a></li>
                        <li><a href="<%= application.getContextPath() + "/fabricante/FabricanteCadastro.jsp" %>">Fabricante</a></li>
                        <li class="divider"></li>
                        <li><a href="<%= application.getContextPath() + "/medico/MedicoCadastro.jsp" %>">M&eacute;dico </a></li>
                        <li><a href="<%= application.getContextPath() + "/medico/MedicoLista.jsp" %>">Gerenciar</a></li>
                        <li><a href="#">Agenda </a></li>
                        <li><a href="<%= application.getContextPath() + "/especialidade/EspecialidadeCadastro.jsp" %>">Especialidades</a></li>
                        <li class="divider"></li>
                        <li><a href="#">Tipo de Exames</a></li>
                    </ul>
                </li>
                
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Gerenciamento<span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="<%= application.getContextPath() + "/medicamento/MedicamentoCadastro.jsp" %>">Acesso - Telas</a></li>
                        <li class="divider"></li>
                        <li><a href="<%= application.getContextPath() + "/medico/MedicoCadastro.jsp" %>">Gerenciar Usuarios </a></li>
                        <li><a href="#">Agenda </a></li>
                        <li><a href="<%= application.getContextPath() + "/especialidade/EspecialidadeCadastro.jsp" %>">Especialidades</a></li>
                        <li class="divider"></li>
                        <li><a href="#">Tipo de Exames</a></li>
                    </ul>
                </li>
            </ul>

            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">Link</a></li>
            </ul>
        </div>
    </div>
</nav>

