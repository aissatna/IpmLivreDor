<%-- 
    Document   : Modifier
    Created on : 5 mars 2021, 12:29:35
    Author     : 21911890
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Metier.MessageDor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" href="css/style.css"/>
        <title>Modification Page</title>
    </head>
    <body>
        <h3>Veuillez choisir un message à modifier </h3>
         <form action="CtrlModifier" method="GET">
            <table class="container">
                <tr>
                    <th></th>
                    <th>Pseudo</th>
                    <th>Texte</th>
                </tr>
                <%
                    ArrayList<MessageDor> listMsgs = (ArrayList<MessageDor>) request.getAttribute("list_msg");
                    HttpSession sessionListeMsgs = request.getSession(true);
                    if (listMsgs != null) {
                        sessionListeMsgs.setAttribute("listeMsgs", listMsgs);
                    } else {
                        listMsgs = (ArrayList<MessageDor>) sessionListeMsgs.getAttribute("listeMsgs");
                    }
                    for (MessageDor messageDor : listMsgs) {
                %>
                <tr>
                    <td><input type="radio" name="radioMsg" value="<%out.print(messageDor.getNumMsg());%>" ></td> 
                    <td><%out.print(messageDor.getPseudo()); %></td>
                    <td><% out.print(messageDor.getTexte()); %></td>

                </tr>
                <%}%>
            </table>
             <div><input type="hidden" value="pageChoixDeMessage" name="source"></div>
            <input type ='submit' value ='modifier'/>
            <a href="CtrlCentral?methode=annuler"> Retour </a>
        </form>
                <div>${requestScope.info_Modif}</div>
                 <div>${requestScope.erreur}</div>
            
    </body>
</html>
