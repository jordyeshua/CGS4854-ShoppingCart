/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package shop.model;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class Cart implements Serializable {
    private static final long serialVersionUID = 1L;
    
    public static final int MAX_QUANTITY=99;
    
    private final Map<Integer, CartItem> items=new LinkedHashMap<>();
    
    //Adds items to cart
    public void addItem(Product product, int quantity){
        if(product==null){
            throw new IllegalArgumentException("Product cannot be this.");
        }
        validateQuantity(quantity);
        
        CartItem existing=items.get(product.getProductID());
        if(existing !=null){
            validateQuantity(existing.getQuantity()+quantity);
            existing.increaseQuantity(quantity);
        } else {
            items.put(product.getProductID(), new CartItem(product,quantity));
        }
    }
    //Sets exact quantity. Removes from cart if 0
    public void updateItem(int productID, int quantity){
        if(quantity==0){
            removeItem(productID);
            return;
        }
        validateQuantity(quantity);
        CartItem item = items.get(productID);
        if (item !=null){
            item.setQuantity(quantity);
        }
    }
    public void removeItem(int productID) {
        items.remove(productID);
    }

    public void clear() {
        items.clear();
    }

    //item copy
    public List<CartItem> getItems() {
        return new ArrayList<>(items.values());
    }

    //sum of all subtotals
    public BigDecimal getTotal() {
        BigDecimal total=BigDecimal.ZERO;
        for (CartItem item : items.values()) {
            total=total.add(item.getSubtotal());
        }
        return total;
    }

    //total for live cart count
    public int getItemCount() {
        int count=0;
        for (CartItem item : items.values()) {
            count += item.getQuantity();
        }
        return count;
    }

    public boolean isEmpty() {
        return items.isEmpty();
    }

    private void validateQuantity(int quantity) {
        if (quantity < 1 || quantity > MAX_QUANTITY) {
            throw new IllegalArgumentException(
                "Quantity must be between 1 and " + MAX_QUANTITY + ".");
        }
    }
}
