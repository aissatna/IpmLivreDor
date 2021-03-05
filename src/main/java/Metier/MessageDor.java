/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Metier;

/**
 *
 * @author 21911890
 */
public class MessageDor {
    private int numMsg ;
    private String pseudo ;
    private String texte ;

    //Constructeurs
    
    public MessageDor(int numMsg, String pseudo, String texte) {
        this.numMsg = numMsg;
        this.pseudo = pseudo;
        this.texte = texte;
    }

    public MessageDor(String pseudo, String texte) {
        this.pseudo = pseudo;
        this.texte = texte;
    }

    public MessageDor() {
    }

    
    //Getters et Setters 
    public int getNumMsg() { return numMsg;}
    public void setNumMsg(int numMsg) {this.numMsg = numMsg;}
    public String getPseudo() {return pseudo;}
    public void setPseudo(String pseudo) {this.pseudo = pseudo;}
    public String getTexte() {return texte;}
    public void setTexte(String texte) {this.texte = texte;}

    //Redéfinition méthode

    @Override
    public String toString() {
        return "MessageDor{" + "numMsg=" + numMsg + ", pseudo=" + pseudo + ", texte=" + texte + '}';
    }
    
    
}



