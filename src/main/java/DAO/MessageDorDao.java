package DAO;

import Metier.MessageDor;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author 21911890
 */
public class MessageDorDao {

    //---proprietes-----
    private static String URL = "jdbc:mysql://localhost:3307/db_21911890";
    private static String LOGIN = "21911890";
    private static String PASSWORD = "R00XU4";
    private static Connection Conx;

//---Fonction de connexion----
    private static void connexion() throws Exception {
        // chargement de driver
        try {
            Class.forName("com.mysql.jdbc.Driver");

        } catch (ClassNotFoundException cnfe) {
            throw new Exception("Exception driver" + cnfe.getMessage());
        }
        // création de la connexion
        try {
            Conx = DriverManager.getConnection(URL, LOGIN, PASSWORD);
        } catch (SQLException sqle) {
            throw new Exception("Exception connexion - " + sqle.getMessage());
        }
    }
//----Insertion d'un message-----

    public static void createMessage(MessageDor msg) throws Exception {
        if (Conx == null) {
            MessageDorDao.connexion();
        }

        String sql = "INSERT INTO Message(Pseudo, Texte) VALUES (?,?)";
        try (PreparedStatement st = Conx.prepareStatement(sql)) {
            st.setString(1, msg.getPseudo());
            st.setString(2, msg.getTexte());
            st.executeUpdate();

        } catch (SQLException sqle) {
            throw new Exception("Exception createMessage() - " + sqle.getMessage());
        }
    }
//----Lecture d'un message-----

    public static MessageDor readSingleMessage(String idMsg) throws Exception {
        if (Conx == null) {
            MessageDorDao.connexion();
        }
        String sql = "SELECT Pseudo,Texte FROM Message where NumMsg = ? ";
        MessageDor msg = null;
        try (PreparedStatement st = Conx.prepareStatement(sql)) {
            st.setString(1,idMsg );
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                msg = new MessageDor (rs.getString("Pseudo"),rs.getString("Texte"));
              
            }

        } catch (Exception sqle) {
            throw new Exception("Exception readSingleMessage() - " + sqle.getMessage());
        }
        return msg;
    }

//----Lecture des messages -----
    public static ArrayList<MessageDor> readMessages() throws Exception {
        if (Conx == null) {
            MessageDorDao.connexion();
        }
        ArrayList<MessageDor> listMessage = new ArrayList<>();
        String sql = "SELECT NumMsg,Pseudo,Texte FROM Message";
        try (Statement stmt = Conx.createStatement()) {
            try (ResultSet rs = stmt.executeQuery(sql)) {
                while (rs.next()) {
                    listMessage.add(new MessageDor(rs.getInt("NumMsg"),
                            rs.getString("Pseudo"), rs.getString("Texte")));
                }
            } catch (SQLException sqle) {
                throw new Exception("Exception executeQuery - " + sqle.getMessage());
            }

        } catch (SQLException sqle) {
            throw new Exception("Exception createStatement() - " + sqle.getMessage());
        }
        return listMessage;
    }
//----Suppression des messages -----

    public static void deleteMessages(String[] idsMsgs) throws Exception {
        if (Conx == null) {
            MessageDorDao.connexion();
        }
        String sql = "DELETE FROM Message WHERE NumMsg = ?";
        try (PreparedStatement st = Conx.prepareStatement(sql)) {
            for (int i = 0; i < idsMsgs.length; i++) {
                st.setString(1, idsMsgs[i]);
                st.executeUpdate();
            }

        } catch (SQLException sqle) {
            throw new Exception("Exception deleteMessages() - " + sqle.getMessage());

        }
    }
// --- Mise a jour des informations d'un message
    public static void updateMessage (MessageDor msg) throws Exception{
         if (Conx == null) {
            MessageDorDao.connexion();
        }
        String sql = "UPDATE Message SET Pseudo = ?, Texte = ? WHERE  NumMsg = ?";
        try  (PreparedStatement st = Conx.prepareStatement(sql)) {
            st.setString(1, msg.getPseudo());
            st.setString(2, msg.getTexte());
            st.setInt(1, msg.getNumMsg());
            st.executeUpdate();
        } catch (SQLException sqle) {
            throw new Exception("Exception deleteMessages() - " + sqle.getMessage());
        }
    }
//---- Programme de test -------
    public static void main(String[] args) {
        try {
            MessageDorDao.connexion();
            System.out.println("connexion reussie");
            String[]idsMsgs = {"4","5"};
            MessageDor m = new MessageDor("Salut c'est moi", "Fin d'après-midi");
            //MessageDorDao.createMessage(m);
            for (MessageDor msg : MessageDorDao.readMessages()) {
                System.out.println("Message -- NumMsg : " + msg.getNumMsg()
                        + " - Pseudo : " + msg.getPseudo()
                        + " - Texte :" + msg.getTexte());

            }
            //deleteMessages(idsMsgs);
            MessageDor msg = readSingleMessage("7");
            System.out.println("pseudo"+msg.getPseudo());
            System.out.println("txt"+msg.getTexte());
            
            
            System.out.println("Fin excution ");
        } catch (Exception ex) {
            System.out.println("Exception main() -" + ex.getMessage());
        }
    }
}
