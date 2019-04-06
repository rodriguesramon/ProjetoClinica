    
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