/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controleur;

import DAO.MessageDorDao;
import Metier.MessageDor;
import java.io.IOException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author 21911890
 */
public class CtrlCentral extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // récupération de la méthode 
        String methode = request.getParameter("methode");

        //Traitement
        switch (methode) {
            //Chainage vers la page saisir.jsp
            case "saisir":
                request.getRequestDispatcher("Saisir").forward(request, response);
                break;
            case "afficher":   
                
                try {
                ArrayList<MessageDor> listMessages = MessageDorDao.readMessages();
                request.setAttribute("list_msg", listMessages);
                request.getRequestDispatcher("Lecture").forward(request, response);
            } catch (Exception ex) {
                request.setAttribute("msg_erreur", ex.getMessage());
                request.getRequestDispatcher("Accueil").forward(request, response);
            }

            break;
            case "modifier":
                try {
                ArrayList<MessageDor> listMessages = MessageDorDao.readMessages();
                request.setAttribute("list_msg", listMessages);
                request.getRequestDispatcher("Modifier").forward(request, response);
            } catch (Exception ex) {
                request.setAttribute("msg_erreur", ex.getMessage());
                request.getRequestDispatcher("Accueil").forward(request, response);
            }
                
            case "supprimer":
                try {
                ArrayList<MessageDor> listMessages = MessageDorDao.readMessages();
                request.setAttribute("list_msg", listMessages);
                request.getRequestDispatcher("Supprimer").forward(request, response);

            } catch (Exception e) {
                request.setAttribute("msg_erreur", e.getMessage());
                request.getRequestDispatcher("Accueil").forward(request, response);
            }

            break;
            //Chainage vers la page Accueil.jsp
            case "annuler":
                request.getRequestDispatcher("Accueil").forward(request, response);
                break;

        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
