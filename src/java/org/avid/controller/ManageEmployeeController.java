/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.avid.controller;

import java.io.IOException;
import static java.lang.Integer.parseInt;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.avid.dao.UserDao;
import org.avid.model.User;

public class ManageEmployeeController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDao dao;

    public ManageEmployeeController() {
        super();
        dao = new UserDao();
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String forward="";
        if(action.equalsIgnoreCase("manageemployeehome")) {
            forward = "/manageemployeehome.jsp"; 
            request.setAttribute("users", dao.getAllUsers());
        } else if (action.equalsIgnoreCase("addemployee")) {
            forward = "/manageemployee.jsp";
        } 
        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        if (request.getParameter("action").equalsIgnoreCase("deleteuser")) {
            int userID = parseInt(request.getParameter("userid"));
            dao.deleteUser(userID);
            request.setAttribute("users", dao.getAllUsers());
            RequestDispatcher view = request.getRequestDispatcher("/manageemployeehome.jsp");
            view.forward(request, response);
        } else if (request.getParameter("action").equalsIgnoreCase("edituser")) {
            int userID = parseInt(request.getParameter("edituserid"));
            request.setAttribute("user",dao.getUserById(userID));
            RequestDispatcher view = request.getRequestDispatcher("/manageemployee.jsp");
            view.forward(request, response);         
        } else {
        User newUser = new User();
        newUser.setName(request.getParameter("nameEntry"));
        newUser.setAddress(request.getParameter("addressEntry"));
        newUser.setPhone(request.getParameter("phoneEntry"));
        newUser.setRoleID(parseInt(request.getParameter("accessLevel")));
        newUser.setUserPin(parseInt(request.getParameter("pinEntry")));
        
        dao.addUser(newUser);
        
        request.setAttribute("users", dao.getAllUsers());
        RequestDispatcher view = request.getRequestDispatcher("/manageemployeehome.jsp");
        view.forward(request, response);
        }

    }   
}

