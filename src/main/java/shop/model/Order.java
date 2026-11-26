/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package shop.model;
import java.io.Serializable;
import java.math.BigDecimal;

public class Order implements Serializable {
    private static final long serialVersionUID = 1L;
    
    private int orderID;
    private int userID;
    private String customerName;
    private String customerEmail;
    private String shippingAddress;
    private BigDecimal totalAmount;
    private String trackingNumber;
    private String orderStatus;
    
    public Order(){}
    
    //getters
    public int getOrderID(){
        return orderID;
    }
    public int getUserID(){
        return userID;
    }
    public String getCustomerName(){
        return customerName;
    }
    public String getCustomerEmail(){
        return customerEmail;
    }
    public String getShippingAddress(){
        return shippingAddress;
    }
    public BigDecimal getTotalAmount(){
        return totalAmount;
    }
    public String getTrackingNumber(){
        return trackingNumber;
    }
    public String getOrderStatus(){
        return orderStatus;
    }
    //setters
    public void setOrderID(int orderID){
        this.orderID=orderID;
    }
    public void setUserID(int userID){
        this.userID=userID;
    }
    public void setCustomerName(String customerName){
        this.customerName=customerName;
    }
    public void setCustomerEmail(String customerEmail){
        this.customerEmail=customerEmail;
    }
    public void setShippingAddress(String shippingAddress){
        this.shippingAddress=shippingAddress;
    }
    public void setTotalAmount(BigDecimal totalAmount){
        this.totalAmount=totalAmount;
    }
    public void setTrackingNumber(String trackingNumber){
        this.trackingNumber=trackingNumber;
    }
    public void setOrderStatus(String orderStatus){
        this.orderStatus=orderStatus;
    }
}
