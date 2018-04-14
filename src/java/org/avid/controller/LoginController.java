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

public class LoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDao dao;

    public LoginController() {
        super();
        dao = new UserDao();
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String forward="";
            forward = "/login.jsp";  
        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pin = request.getParameter("pin");
        String t = dao.Validate(Integer.parseInt(pin));
        RequestDispatcher view = request.getRequestDispatcher(t);
        view.forward(request, response);
    }   
}
