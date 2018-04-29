package org.avid.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.avid.dao.UserDao;
import org.avid.model.InventoryItem;

public class InventoryController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static String INSERT_OR_EDIT = "/inventory.jsp";
    private static String LIST_INVENTORY = "/listinventory.jsp";
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
            request.setAttribute("inventoryItems", dao.getAllInventoryItems());   
        } else if (action.equalsIgnoreCase("edit")){
            forward = INSERT_OR_EDIT;
            int inventoryid = Integer.parseInt(request.getParameter("inventoryid"));
            InventoryItem inventoryItem = dao.getInventoryById(inventoryid);
            request.setAttribute("inventoryItem", inventoryItem);
            request.setAttribute("inventoryItems", dao.getAllInventoryItems());
        } else if (action.equalsIgnoreCase("listInventory")){
            forward = LIST_INVENTORY;
            request.setAttribute("inventoryItems", dao.getAllInventoryItems());
        } else {
            forward = INSERT_OR_EDIT;
            request.setAttribute("inventoryItems", dao.getAllInventoryItems());
        }
        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        InventoryItem inventoryItem = new InventoryItem();
        inventoryItem.setItem(request.getParameter("item"));
        Integer stock = new Integer(request.getParameter("stock"));
        inventoryItem.setStock(stock);
        Double cost = new Double(request.getParameter("cost"));
        inventoryItem.setCost(cost);
        String inventoryid = request.getParameter("inventoryid");
        if(inventoryid == null || inventoryid.isEmpty())
        {
            dao.addInventory(inventoryItem);
        }
        else
        {
            inventoryItem.setInventoryid(Integer.parseInt(inventoryid));
            dao.updateInventory(inventoryItem);
        }
        RequestDispatcher view = request.getRequestDispatcher(LIST_INVENTORY);
        request.setAttribute("inventoryItems", dao.getAllInventoryItems());
        view.forward(request, response);
    }
    
}