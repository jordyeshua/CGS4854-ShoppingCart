/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package shop.model;
import java.io.Serializable;

public class User implements Serializable {
    private static final long serialVersionUID = 1L;
    
    private int userID;
    private String fullName;
    private String email;
    private String password;
    
    public User(){}
    
    public User(int userID, String fullName, String email, String password){
        this.userID=userID;
        this.fullName=fullName;
        this.email=email;
        this.password=password;
    }
    
    //getters
    public int getUserID(){
        return userID;
    }
    public String getFullName(){
        return fullName;
    }
    public String getEmail(){
        return email;
    }
    public String getPassword(){
        return password;
    }
    //setters
    public void setUserID(int userID){
        this.userID =userID;
    }
    public void setFullName(String fullName){
        this.fullName=fullName;
    }
    public void setEmail(String email){
        this.email=email;
    }
    public void setPassword(String password){
        this.password=password;
    }
    
    
}
