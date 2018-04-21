/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.avid.model;

/**
 *
 * @author Andrew
 */
public class MenuItem {
    
    private String menuItemName;
    private int menuItemId;
    private double menuItemPrice;

    public void setMenuItemName(String menuItemName) {
        this.menuItemName = menuItemName;
    }

    public void setMenuItemId(int menuItemId) {
        this.menuItemId = menuItemId;
    }

    public void setMenuItemPrice(double menuItemPrice) {
        this.menuItemPrice = menuItemPrice;
    }

    public String getMenuItemName() {
        return menuItemName;
    }

    public int getMenuItemId() {
        return menuItemId;
    }

    public double getMenuItemPrice() {
        return menuItemPrice;
    }
    
    
}
