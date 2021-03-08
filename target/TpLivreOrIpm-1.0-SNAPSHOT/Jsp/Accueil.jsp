<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Livre d'or IPM MIAGE  </title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="css/style.css"/> 
        
    </head>
    <body>
        <div class="row header">
             <h1>Le livre d'or ipm miage</h1>
            
        </div>
        
        <div class="container">
            <div class="row">
                <div class="col-md-3">
                    <img src="css/img/logo.png" class="logo-ipm" alt="logo-ipm">
                </div>
                <div class="col-md-6 text-center">
             <a href="CtrlCentral?methode=afficher" class="btn btn-info">Afficher</a>
             <a href="CtrlCentral?methode=saisir" class="btn btn-info">Saisir</a>
             <a href="CtrlCentral?methode=modifier" class="btn btn-info">Modifier</a>
             <a href="CtrlCentral?methode=supprimer" class="btn btn-info">Supprimer </a> 
                <div class="msg_erreur"> ${requestScope.msg_erreur}</div>     
                </div>
                <div class="col-md-3">
                     <img src="css/img/logo-univ.png" class="logo-univ" alt="logo-ipm">
                    
                </div>    
                
                
            </div>
            
   
            
            
        </div>
         

</body>
</html>
