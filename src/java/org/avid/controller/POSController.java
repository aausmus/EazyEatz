/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.avid.controller;

import java.io.IOException;
import java.text.DecimalFormat;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.avid.dao.UserDao;
import org.avid.model.Order;

/**
 *
 * @author Andrew
 */
public class POSController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static String POS = "/orders.jsp";
    private UserDao dao;
    private Order order;
    private double tax;
    private double total;
    private DecimalFormat df;

    public POSController() {
        super();
        dao = new UserDao();
        order = new Order();
        df = new DecimalFormat("##.##");
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("menuItems", dao.getAllMenuItems());
        request.setAttribute("subtotal", order.getTotalPrice());
        tax = Math.floor(((order.getTotalPrice() * .06) * 10000.00) / 10000.00);
        request.setAttribute("tax", tax);
        request.setAttribute("total", (order.getTotalPrice() + tax));
        RequestDispatcher view = request.getRequestDispatcher(POS);
        view.forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String menuItemId = request.getParameter("menuItem");
        int id = Integer.parseInt(menuItemId);
        order.addToOrder(dao.getMenuItembyId(id));
        request.setAttribute("orderItems", order.getOrderItems());
        request.setAttribute("menuItems", dao.getAllMenuItems());
        request.setAttribute("subtotal", order.getTotalPrice());
        tax = Math.floor(((order.getTotalPrice() * .06) * 10000.00) / 10000.00);
        request.setAttribute("tax", tax);
        request.setAttribute("total", (order.getTotalPrice() + tax));
        RequestDispatcher view = request.getRequestDispatcher(POS);
        view.forward(request, response);
    }   
}
