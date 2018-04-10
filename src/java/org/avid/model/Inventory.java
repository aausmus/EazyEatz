/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.avid.model;

public class Inventory {
	private int inventoryid;
	private int stock;
	private String item;
	public int getInventoryid() {
        return inventoryid;
    }
    public void setInventoryid(int inventoryid) {
        this.inventoryid = inventoryid;
    }
	public int getStock() {
        return stock;
    }
    public void setStock(int stock) {
        this.stock = stock;
    }
    public String getItem() {
        return item;
    }
    public void setItem(String item) {
        this.item = item;
    }
    public String toString() {
        return "Inventory [id= " + inventoryid + ", item= " + item + ", stock=" + stock + "]";
    }
}

