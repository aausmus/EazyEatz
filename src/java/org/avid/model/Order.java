/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.avid.model;

import java.util.ArrayList;

/**
 *
 * @author Andrew
 */
public class Order {
    
    private ArrayList<MenuItem> orderItems;
    private Double totalPrice;
    
    public Order() {
       orderItems = new ArrayList<>();
       this.totalPrice = 0.00;
    }
    
    public void addToOrder(MenuItem menuItem) {
        orderItems.add(menuItem);
        this.totalPrice += menuItem.getMenuItemPrice();
    }
    
    public ArrayList<MenuItem> getOrderItems() {
        return orderItems;
    }
    
    public Double getTotalPrice() {
        return totalPrice;
    }
     
}
