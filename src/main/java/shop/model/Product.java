/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package shop.model;
import java.io.Serializable;
import java.math.BigDecimal;

public class Product implements Serializable {
    private static final long serialVersionUID = 1L;
    
    private int productID;
    private String name;
    private String description;
    private BigDecimal price;
    private String image;
    private int stock; 
    
    public Product(){
    }
    
    public Product(int productID, String name, String description, BigDecimal price, String image){
        this.productID = productID;
        this.name=name;
        this.description=description;
        this.price=price;
        this.image=image;
    }
    
    //getters
    public int getProductID(){
        return productID;
    }
    public String getName(){
        return name;
    }
    public String getDescription(){
        return description;
    }
    public BigDecimal getPrice(){
        return price;
    }  
    public String getImage(){
        return image;
    }
    public int getStock(){
        return stock;
    }
   //setters
    public void setProductID(int productID){
        this.productID=productID;
    }
    public void setName( String name ){
        this.name=name;
    }
    public void setDescription(String description){
        this.description=description;
    }
    public void setPrice( BigDecimal price ){
        this.price=price;
    }
    public void setImage(String image){
        this.image=image;
    }
    public void setStock(int stock){
        this.stock=stock;
    }
}

