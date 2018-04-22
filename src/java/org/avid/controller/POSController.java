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
import org.avid.model.Order;
import org.avid.model.User;

/**
 *
 * @author Andrew
 */
public class POSController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static String POS = "/orders.jsp";
    private UserDao dao;
    private Order order;

    public POSController() {
        super();
        dao = new UserDao();
        order = new Order();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("menuItems", dao.getAllMenuItems());
        RequestDispatcher view = request.getRequestDispatcher(POS);
        view.forward(request, response);
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String menuItemName = request.getParameter("menuItem");
        order.addToOrder(dao.getMenuItem(menuItemName));
        request.setAttribute("orderItems", order.getOrderItems());
        RequestDispatcher view = request.getRequestDispatcher(POS);
        view.forward(request, response);
    }   
}
