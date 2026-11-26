/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package shop.model;
import java.io.Serializable;
import java.math.BigDecimal;

public class OrderItem implements Serializable {
    private static final long serialVersionUID =1L;
    
    private int orderID;
    private int productID;
    private int quantity;
    private BigDecimal price;
    
    public OrderItem(){}
    
    public OrderItem(int orderID, int productID, int quantity, BigDecimal price){
        this.orderID=orderID;
        this.productID=productID;
        this.quantity=quantity;
        this.price=price;
    }
    
    //getters
    public int getOrderID(){
        return orderID;
    }
    public int getProductID(){
        return productID;
    }
    public int getQuantity(){
        return quantity;
    }
    public BigDecimal getPrice(){
        return price;
    }
    //setters
    public void setOrderID(int orderID){
        this.orderID=orderID;
    }
    public void setProductID(int productID){
        this.productID=productID;
    }
    public void setQuantity(int quantity){
        this.quantity=quantity;
    }
    public void setPrice(BigDecimal price){
        this.price=price;
    }
}
