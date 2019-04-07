    
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
        //$("#statusErro").fadeOut(5000);
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
     
     function msgErro(msg){
         $.confirm({
            title: 'Sistema Cl&iacute;nico',
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
     
     // Restricts input for the given textbox to the given inputFilter.
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