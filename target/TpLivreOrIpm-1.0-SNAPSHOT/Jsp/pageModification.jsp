<%-- 
    Document   : pageModification
    Created on : 5 mars 2021, 13:27:54
    Author     : 21911890
--%>

<%@page import="Metier.MessageDor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css"/>
        <title>Page de modofication </title>
    </head>
    <body>
        <h1>choisir les informations a modifier </h1>
        <% 
        HttpSession sessionMsgModif = request.getSession(false);
        MessageDor msg = (MessageDor) sessionMsgModif.getAttribute("msg");
        String ps = msg.getPseudo();
        String txt = msg.getTexte();
        
        %>
        <form method="Get" action="CtrlModifier" >
            <div>
                <label for="pseudo"> Pseudo </label>
                <input type="text"  name="pseudo" value="<% out.print(ps); %>">
            </div> 
            <div> 
                <label for="message"> Message </label>
                <textarea name="message" rows="4"><% out.print(txt); %></textarea>
            </div> 

            <div><input type="submit" value="Modifier"></div>
             <a href="CtrlCentral?methode=annuler"> Retour </a>
             <div><input type="hidden" value="pageModifications" name="source"></div>
             <div class="msg_erreur">${requestScope.msg_erreur}</div>
        </form>

    </body>
</html>
