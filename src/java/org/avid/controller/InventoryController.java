/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.avid.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.avid.dao.UserDao;
import org.avid.model.Inventory;

public class InventoryController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static String INSERT_OR_EDIT = "/inventory.jsp";
    private static String LIST_INVENTORY = "/listInventory.jsp";
    private UserDao dao;

    public InventoryController() {
        super();
        dao = new UserDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String forward="";
        String action = request.getParameter("action");
         if (action.equalsIgnoreCase("delete")){
            int inventoryid = Integer.parseInt(request.getParameter("inventoryid"));
            dao.deleteInventory(inventoryid);
            forward = LIST_INVENTORY;
            request.setAttribute("inventories", dao.getAllInventories());   
        } else if (action.equalsIgnoreCase("edit")){
            forward = INSERT_OR_EDIT;
            int inventoryid = Integer.parseInt(request.getParameter("inventoryid"));
            Inventory inventory = dao.getInventoriesById(inventoryid);
            request.setAttribute("inventory", inventory);
        } else if (action.equalsIgnoreCase("listInventory")){
            forward = LIST_INVENTORY;
            request.setAttribute("inventories", dao.getAllInventories());
        } else {
            forward = INSERT_OR_EDIT;
        }
        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Inventory inventory = new Inventory();
        inventory.setItem(request.getParameter("item"));
        Integer stock = new Integer(request.getParameter("stock"));
        inventory.setStock(stock);
        String inventoryid = request.getParameter("inventoryid");
        if(inventoryid == null || inventoryid.isEmpty())
        {
            dao.addInventory(inventory);
        }
        else
        {
            inventory.setInventoryid(Integer.parseInt(inventoryid));
            dao.updateInventory(inventory);
        }
        RequestDispatcher view = request.getRequestDispatcher(LIST_INVENTORY);
        request.setAttribute("inventories", dao.getAllInventories());
        view.forward(request, response);
    }
    
}
