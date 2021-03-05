/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controleur;

import DAO.MessageDorDao;
import Metier.MessageDor;
import java.io.IOException;
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
public class CtrlEnregistrer extends HttpServlet {

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
        // Recuperation des parametre
        String pseudo = request.getParameter("pseudo");
        String message = request.getParameter("message");
        String info_erreur="";
        if(pseudo.isEmpty() && message.isEmpty()){
            info_erreur= "Le Pseudo et le message sont vide !!";
            //chinage vers saisir.jsp
            request.setAttribute("msg_erreur",info_erreur );
            request.getRequestDispatcher("Saisir").forward(request, response);
             
        }else if (pseudo.isEmpty() && !message.isEmpty()){
             info_erreur= "Le Pseudo est vide !!";
            //chinage vers saisir.jsp
            request.setAttribute("msg_erreur", info_erreur);
            request.getRequestDispatcher("Saisir").forward(request, response);
            
        } else if (!pseudo.isEmpty() && message.isEmpty()){
             info_erreur= "Le message est vide !!";
            //chinage vers saisir.jsp
            request.setAttribute("msg_erreur", info_erreur);
            request.getRequestDispatcher("Saisir").forward(request, response);
            
        }
        else{
            // création d'objet MessageDor
            MessageDor msg = new MessageDor(pseudo, message); 
            try {
                // Enregistrement dans la bd
                MessageDorDao.createMessage(msg);
                // rederiction 
                response.sendRedirect("CtrlCentral?methode=annuler");
            } catch (Exception ex) {
                //chinage vers saisir.jsp
            request.setAttribute("msg_erreur", ex.getMessage());
            request.getRequestDispatcher("Saisir").forward(request, response);
            }
            
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
