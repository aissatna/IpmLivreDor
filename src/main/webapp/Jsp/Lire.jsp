
<%@page import="java.util.ArrayList"%>
<%@page import="Metier.MessageDor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css"/>
        <title>Lire</title>
    </head>
    <body>
        <h1>Liste des messages</h1>
        <table class="container">
            <tr>
                <th>NumMsg</th>
                <th>Pseudo</th>
                <th>Texte</th>
            </tr>
            <%
                ArrayList<MessageDor> list = (ArrayList<MessageDor>) request.getAttribute("list_msg");
                for (MessageDor messageDor : list) {
            %>
            <tr>
                <td><% out.print(messageDor.getNumMsg()); %></td> 
                <td><%out.print(messageDor.getPseudo()); %></td>
                <td><% out.print(messageDor.getTexte()); %></td>

            </tr>
            <%}%>
        </table>
        <a href="CtrlCentral?methode=annuler"> Retour </a>
    </body>
</html>
