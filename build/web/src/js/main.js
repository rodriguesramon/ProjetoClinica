    
    var getQueryString = function ( field, url ) {
        var href = url ? url : window.location.href;
        var reg = new RegExp( '[?&]' + field + '=([^&#]*)', 'i' );
        var string = reg.exec(href);
        return string ? string[1] : null;
    };

    function processSuccess(){
        $("#statusSalvando").fadeOut();
        $("#statusSalvo").fadeIn(600);
        $("#statusSalvo").fadeOut(600);
    }
    
    function processFail(){
        $("#statusSalvando").fadeOut(600);
        $("#statusErro").show( "fast").delay(5000).fadeOut('fast', function() {
          $(this).fadeOut(600);
        });    
    }
    
    $(function(){
        $('.datepicker').datepicker({
           format: 'dd/mm/yyyy',
           Readonly: false
         }).on('changeDate', function(e){
            $(this).datepicker('hide');
        }).attr("readonly", "readonly");
        
        $("#foneResidencial, #foneCelular").mask("(00) 00000-0000");
     });
    
    function FormataStringData(data) {
        var dia  = data.split("/")[0];
        var mes  = data.split("/")[1];
        var ano  = data.split("/")[2];
        return ano + '-' + ("0"+mes).slice(-2) + '-' + ("0"+dia).slice(-2);
      }

    
    function msgSucessoRedirect(msg, link){
         $.confirm({
            title: 'Sistema Cl&iacute;nica',
            content: msg,
            type: 'green',
            typeAnimated: true,
            buttons: {
                btn: {
                    text: 'Ok',
                    btnClass: 'btn-red',
                    action: function(){
                        location.href = link;
                    }
                }
            }
        });
     }
 
    function msgErro(msg){
         $.confirm({
            title: 'Sistema Cl&iacute;nica',
            content: msg,
            type: 'red',
            typeAnimated: true,
            buttons: {
                btn: {
                    text: 'Ok',
                    btnClass: 'btn-red',
                    action: function(){
                    }
                }
            }
        });
     }
    
    function resetPagina(){
        window.location.href = window.location.pathname;
    }
    
    function setInputFilter(textbox, inputFilter) {
      ["input", "keydown", "keyup", "mousedown", "mouseup", "select", "contextmenu", "drop"].forEach(function(event) {
        textbox.addEventListener(event, function() {
          if (inputFilter(this.value)) {
            this.oldValue = this.value;
            this.oldSelectionStart = this.selectionStart;
            this.oldSelectionEnd = this.selectionEnd;
          } else if (this.hasOwnProperty("oldValue")) {
            this.value = this.oldValue;
            this.setSelectionRange(this.oldSelectionStart, this.oldSelectionEnd);
          }
        });
      });
    }
    
    function logoff(){
        $.post("http://clinica.kinghost.net/ProjetoClinica/ControllerUsuario", {
            option  :   "Logoff"
        }).done(function() {
          msgSucessoRedirect("Realize a autenticação para acessar o sistema!", "http://clinica.kinghost.net/ProjetoClinica/index.jsp");
        });
    }