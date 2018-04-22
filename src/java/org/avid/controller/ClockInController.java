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
import org.avid.model.User;

public class ClockInController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDao dao;

    public ClockInController() {
        super();
        dao = new UserDao();
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String forward="";
    	String s;
        String action = request.getParameter("action");
        if (action.equalsIgnoreCase("clockin")){
            int userId = Integer.parseInt(request.getParameter("userId"));
            dao.clockIn(userId);
            forward = "clockIn.jsp";
            s = "Clocked In";
            User user = dao.getUserById(userId);
            request.setAttribute("user", user);
            request.setAttribute("status", s);
        } else if (action.equalsIgnoreCase("clockout")){
        	int userId = Integer.parseInt(request.getParameter("userId"));
            dao.clockOut(userId);
            forward = "clockIn.jsp";
            s = "Clocked Out";
            User user = dao.getUserById(userId);
            request.setAttribute("user", user);
            request.setAttribute("status", s);
        } else if (action.equalsIgnoreCase("startbreak")){
        	int userId = Integer.parseInt(request.getParameter("userId"));
            dao.startBreak(userId);
            forward = "clockIn.jsp";
            s = "On Break";
            User user = dao.getUserById(userId);
            request.setAttribute("user", user);
            request.setAttribute("status", s);
        } else if (action.equalsIgnoreCase("endbreak")){
        	int userId = Integer.parseInt(request.getParameter("userId"));
            dao.endBreak(userId);
            forward = "clockIn.jsp";
            s = "Clocked In";
            User user = dao.getUserById(userId);
            request.setAttribute("user", user);
            request.setAttribute("status", s);
        } else {
        	int userId = Integer.parseInt(request.getParameter("userId"));
            s = dao.clockStatus(userId);
        	forward = "/clockIn.jsp";
            User user = dao.getUserById(userId);
            request.setAttribute("user", user);
            request.setAttribute("status", s);
        }
        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
    }
  
}
