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
        <h1>Le livre d'or</h1>
        
         <ul>
            <li> <a href="CtrlCentral?methode=afficher" class="">Afficher</a></li>
            <li> <a href="CtrlCentral?methode=saisir">Saisir</a></li>
            <li> <a href="CtrlCentral?methode=modifier">Modifier</a></li>
            <li> <a href="CtrlCentral?methode=supprimer">Supprimer</a> avec confirmation</li>
        </ul>

    <div class="msg_erreur"> ${requestScope.msg_erreur}</div>

</body>
</html>
