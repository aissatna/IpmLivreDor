<%-- 
    Document   : Supprimer
    Created on : 3 mars 2021, 11:15:28
    Author     : 21911890
--%>

<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Metier.MessageDor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css" type="text/css"/>
        <title>Supprimer Page</title>
    </head>
    <body>
        <h1>Liste des messages</h1>
        <form action="CtrlSupprimer" method="GET">
            <table class="container">
                <tr>
                    <th></th>
                    <th>Pseudo</th>
                    <th>Texte</th>
                </tr>
                <%
                    ArrayList<MessageDor> listMsgs = (ArrayList<MessageDor>) request.getAttribute("list_msg");
                    HttpSession sessionListeMsgs = request.getSession(true);
                    // Recuperé les messages cochés pour le re-cochés en cas d'un retour  
                    HttpSession sessionCbMsgIds = request.getSession(false);
                    String[] cbMsgIds = (String[]) sessionCbMsgIds.getAttribute("cbMsgIds");
                    if (listMsgs != null) {
                        sessionListeMsgs.setAttribute("listeMsgs", listMsgs);
                    } else {
                        listMsgs = (ArrayList<MessageDor>) sessionListeMsgs.getAttribute("listeMsgs");
                    }
                    for (MessageDor messageDor : listMsgs) {
                %>
                <tr>
                    <td><input type="checkbox" name="cbMsg" value="<%out.print(messageDor.getNumMsg());%>"
                               <% out.print(isCheked(cbMsgIds,String.valueOf(messageDor.getNumMsg()))); %>   
                               ></td> 
                    <td><%out.print(messageDor.getPseudo()); %></td>
                    <td><% out.print(messageDor.getTexte()); %></td>

                </tr>
                <%}%>
            </table>
            <input type ='submit' value ='Supprimer'/>
            <a href="CtrlCentral?methode=annuler"> Retour </a>
        </form>

        <div class="msg_erreur"> ${requestScope.msg_erreur}</div>
        <div class="msg_erreur">
            <%
                String msgErreur = (String) request.getAttribute("msg_erreur_suppression");
                if (msgErreur != null) {
                    out.print(msgErreur);
                }
            %></div>

        <%!
            private String isCheked(String[] arrayMsgsCheked, String idMsg) {               
                String res = "";
                if (arrayMsgsCheked != null){
                    ArrayList<String> listMsgs = new ArrayList<String>(Arrays.asList(arrayMsgsCheked));
                    if (listMsgs.contains(idMsg)) {
                    res = " checked=\"checked\"";
                }
              } 
                return res;
            }
        %>


    </body>
</html>
