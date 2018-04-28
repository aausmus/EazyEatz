/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.avid.controller;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.Random;
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
    private static String selectMethod = "/selectmethod.jsp";
    private static String cash = "/cash.jsp";
    private static String credit = "/credit.jsp";
    private UserDao dao;
    private Order order;
    private DecimalFormat df;
    private Random rand;

    public POSController() {
        super();
        dao = new UserDao();
        df = new DecimalFormat("#.##");
        rand = new Random();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String forward="";
        String action = request.getParameter("action");
        if (action.equalsIgnoreCase("orders")) {
            order = new Order();
            request.setAttribute("menuItems", dao.getAllMenuItems());
            request.setAttribute("subtotal", order.getTotalPrice());
            double tax = order.getTotalPrice() * .06;
            double total = order.getTotalPrice() + tax;
            request.setAttribute("tax", df.format(tax));
            request.setAttribute("total", df.format(total));
            forward = POS;
        } else if (action.equalsIgnoreCase("selectmethod")) {
            forward = selectMethod;
        } else if (action.equalsIgnoreCase("cash")) {
            forward = cash;
            double total = (order.getTotalPrice() + (order.getTotalPrice() * .06));
            request.setAttribute("total", df.format(total));
        } else if (action.equalsIgnoreCase("credit")) {
            forward = credit;
            double total = (order.getTotalPrice() + (order.getTotalPrice() * .06));
            request.setAttribute("total", df.format(total));
        }
        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String forward="";
        String action = request.getParameter("action");
        if (action.equalsIgnoreCase("orders")) {
            String menuItemId = request.getParameter("menuItem");
            int id = Integer.parseInt(menuItemId);
            order.addToOrder(dao.getMenuItembyId(id));
            request.setAttribute("orderItems", order.getOrderItems());
            request.setAttribute("menuItems", dao.getAllMenuItems());
            request.setAttribute("subtotal", order.getTotalPrice());
            double tax = order.getTotalPrice() * .06;
            double total = order.getTotalPrice() + tax;
            request.setAttribute("tax", df.format(tax));
            request.setAttribute("total", df.format(total));
            forward = POS;
            
        }  else if (action.equalsIgnoreCase("cash")) {
            forward = cash;
            double total = (order.getTotalPrice() + (order.getTotalPrice() * .06));
            request.setAttribute("total", df.format(total));
            double cashRecieved = Double.parseDouble(request.getParameter("cashRecieved"));
            double change = cashRecieved - total;
            request.setAttribute("cashRecieved", cashRecieved);
            request.setAttribute("change", df.format(change));
        }  else if (action.equalsIgnoreCase("credit")) {
            forward = credit;
            double total = (order.getTotalPrice() + (order.getTotalPrice() * .06));
            request.setAttribute("total", df.format(total));
            int paySuccess = rand.nextInt(100) + 1;
            if (paySuccess >= 11) {
                request.setAttribute("payment","Approved");
            } else {
                request.setAttribute("payment","Declined");
            }
        }
        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
    }   
}
