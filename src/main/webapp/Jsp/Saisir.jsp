<%-- 
    Document   : Saisir
    Created on : 1 mars 2021, 14:15:00
    Author     : 21911890
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css" type="text/css"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <title>Saisir </title>
    </head>
    <body>
        <div class="container">
            <div class="heading">
                <h1>Saisir les informations</h1> 
            </div>
            <div class="row">
                <div class="col-lg-10 offset-lg-1">
                    <form action="CtrlEnregistrer" method="GET" id="container_form">
                        <div class="row">
                            <div class="col-md-3"></div>
                            <div class="col-md-6">
                                <label for="pseudo"> Pseudo </label>
                                <input type="text"  name="pseudo" value="">
                            </div> 
                            <div class="col-md-3"></div>
                        </div>                    
                        <div class="row">
                            <div class="col-md-3"></div>
                            <div class="col-md-6" > 
                                <label for="message"> Message </label>
                                <textarea name="message" rows="4"></textarea>
                            </div> 
                            <div class="col-md-3"></div>  
                        </div>
                        <div class="row">
                            <div class="col-md-4"><input type="submit" value="Enregistrer"></div>
                            <div class="col-md-4"></div>
                            <div class="col-md-4"><a href="CtrlCentral?methode=annuler"> Retour </a></div> 
                        </div> 
                        <div class="msg_info"> ${requestScope.msg_info}</div>
                        <div class="msg_erreur">${requestScope.msg_erreur}</div>
                    </form> 
                </div>
            </div>
        </div>
    </div>



</body>
</html>
