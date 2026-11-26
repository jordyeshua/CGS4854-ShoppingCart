/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package shop.model;
import java.io.Serializable;
import java.math.BigDecimal;

public class CartItem implements Serializable {
    private static final long serialVersionUID=1L;
    
    private Product product;
    private int quantity;
    
    public CartItem(){}
    
    public CartItem(Product product, int quantity){
        if(product==null){
            throw new IllegalArgumentException("Product cannot be this.");
        }
        this.product=product;
        setQuantity(quantity);
    }
    //getters
    public Product getProduct(){
        return product;
    }
    public int getQuantity(){
        return quantity;
    }
    //setters
    public void setProduct(Product product){
        this.product=product;
    }
    public void setQuantity(int quantity){
        if(quantity < 1){
            throw new IllegalArgumentException("Quantity must be at least 1.");
        }
        this.quantity=quantity;
    }

    //price of this line: product price x quantity
    public BigDecimal getSubtotal(){
        return product.getPrice().multiply(BigDecimal.valueOf(quantity));
    }
    
    //Adds to current quantity if same product is added twice
    public void increaseQuantity(int amount){
        setQuantity(this.quantity+amount);
    }
}
