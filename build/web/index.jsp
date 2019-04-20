<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Projeto Cl&iacute;nica</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="apple-touch-icon" sizes="57x57" href="/apple-icon-57x57.png">
        <link rel="apple-touch-icon" sizes="60x60" href="src/img/apple-icon-60x60.png">
        <link rel="apple-touch-icon" sizes="72x72" href="src/img/apple-icon-72x72.png">
        <link rel="apple-touch-icon" sizes="76x76" href="src/img/apple-icon-76x76.png">
        <link rel="apple-touch-icon" sizes="114x114" href="src/img/apple-icon-114x114.png">
        <link rel="apple-touch-icon" sizes="120x120" href="src/img/apple-icon-120x120.png">
        <link rel="apple-touch-icon" sizes="144x144" href="src/img/apple-icon-144x144.png">
        <link rel="apple-touch-icon" sizes="152x152" href="src/img/apple-icon-152x152.png">
        <link rel="apple-touch-icon" sizes="180x180" href="src/img/apple-icon-180x180.png">
        <link rel="icon" type="image/png" sizes="192x192"  href="src/img/android-icon-192x192.png">
        <link rel="icon" type="image/png" sizes="32x32" href="src/img/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="96x96" href="src/img/favicon-96x96.png">
        <link rel="icon" type="image/png" sizes="16x16" href="src/img/favicon-16x16.png">
        <link rel="manifest" href="src/img/manifest.json">


        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
        <style type="text/css">
            body {
                    color: #fff;
                    background: #2c3e50;
            }
            .form-control {
            min-height: 41px;
                    background: #fff;
                    box-shadow: none !important;
                    border-color: #e3e3e3;
            }
            .form-control:focus {
                    border-color: #70c5c0;
            }
            .form-control, .btn {        
                border-radius: 2px;
            }
                .login-form {
                        width: 350px;
                        margin: 0 auto;
                        padding: 100px 0 30px;		
                }
                .login-form form {
                        color: #7a7a7a;
                        border-radius: 2px;
                margin-bottom: 15px;
                font-size: 13px;
                background: #ececec;
                box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
                padding: 30px;	
                position: relative;	
            }
                .login-form h2 {
                        font-size: 22px;
                margin: 35px 0 25px;
            }
                .login-form .avatar {
                        position: absolute;
                        margin: 0 auto;
                        left: 0;
                        right: 0;
                        top: -50px;
                        width: 95px;
                        height: 95px;
                        border-radius: 50%;
                        z-index: 9;
                        background: #70c5c0;
                        padding: 15px;
                        box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.1);
                }
                .login-form .avatar img {
                        width: 100%;
                }	
            .login-form input[type="checkbox"] {
                margin-top: 2px;
            }
            .login-form .btn {        
                font-size: 16px;
                font-weight: bold;
                        background: #70c5c0;
                        border: none;
                        margin-bottom: 20px;
            }
                .login-form .btn:hover, .login-form .btn:focus {
                        background: #50b8b3;
                outline: none !important;
                }    
                .login-form a {
                        color: #fff;
                        text-decoration: underline;
                }
                .login-form a:hover {
                        text-decoration: none;
                }
                .login-form form a {
                        color: #7a7a7a;
                        text-decoration: none;
                }
                .login-form form a:hover {
                        text-decoration: underline;
                }
        </style>
    </head>
    <body>
        <div class="login-form">
            <form>
                <div class="avatar">
                        <!--<img src="/examples/images/avatar.png" alt="Avatar">-->
                </div>
                <h2 class="text-center">Sistema - Login</h2>   
                <div class="form-group">
                    <input type="text" class="form-control" name="login" id="login"  placeholder="Login" required="required" autocomplete="off" >
                </div>
                        <div class="form-group">
                    <input type="password" class="form-control" name="senha" id="senha" placeholder="Senha" required="off">
                </div>        
                <div class="form-group">
                    <button type="button" id="btnEntrar" class="btn btn-primary btn-lg btn-block">Entrar</button>
                </div>
                <div class="clearfix">
                    <p style="padding: 0px; display: none" id="statusLogin" >...</p>
                </div>            
                <!--    <p class="text-center small">Don't have an account? <a href="#">Sign up here!</a></p>-->
            </form>
        </div>
    </body>
    <script>
        
        $( "#senha" ).keypress(function(e) {
            if(e.which === 13) {
                autentica();
            }
        });
        
        function autentica(){
            $("#statusLogin").css({"display":"block"});
            $("#statusLogin").text("Autenticando...");
            
            $.post("ControllerUsuario", {
                option  :  "Autenticar",
                login   :  $("#login").val(),
                senha   :  $("#senha").val()
            })
            .done(function(data) {
                var value = JSON.parse(data);
                console.log(value);
                console.log(value.result);
                if(value.result == "true"){
                    window.location.href = "mainpage.jsp";
                }else{
                    $("#statusLogin").css({"color":"red"});
                    $("#statusLogin").text("Autenticação inválida, cheque os dados e tente novamente!");
                }
            });
        }
        
        $( "#btnEntrar" ).click(function() {
            autentica();
        });
    </script>
</html>                            