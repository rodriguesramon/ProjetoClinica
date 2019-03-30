    
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
        $("#statusErro").fadeIn(600);
        $("#statusErro").fadeOut(600);
    }