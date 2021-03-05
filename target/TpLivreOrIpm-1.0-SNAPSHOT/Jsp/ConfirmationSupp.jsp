<%-- 
    Document   : ConfirmationSupp
    Created on : 3 mars 2021, 12:08:42
    Author     : 21911890
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css"/>
        <title>Confirmation suppression Page</title>
    </head>
    <body>
        <h3>Vous avez selectionner les messages!</h3>
        <ul>
        <%
         String[] cbMsgIds = (String[])session.getAttribute("cbMsgIds"); 
        for (String id : cbMsgIds ){
            out.println("<li> Le message numéro : "+id+"</li>");
        }
        %>
        </ul>
        <ul>
            <li><a href="CtrlConfirmation?decision=oui">Oui</a></li>
            <li><a href="CtrlConfirmation?decision=non">Non</a></li>
            <li><a href="CtrlConfirmation?decision=retour">Retour</a></li>
       </ul>
    </body>
</html>
