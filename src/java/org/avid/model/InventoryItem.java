package org.avid.model;

public class InventoryItem {
	private int inventoryid;
	private int stock;
	private String item;
	private Double cost;
	public int getInventoryid() {
        return inventoryid;
    }
    public void setInventoryid(int inventoryid) {
        this.inventoryid = inventoryid;
    }
	public int getStock() {
        return stock;
    }
	public Double getCost() {
		return cost;
	}
	public void setCost(Double cost) {
		this.cost = cost;
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
        return "Inventory [id= " + inventoryid + ", item= " + item + ", stock=" + stock + ", cost= " + cost + "]";
    }
}

