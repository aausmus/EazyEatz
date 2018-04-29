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
        //The value stored in the variable action will determine which page jsp page the control will forward to
        String action = request.getParameter("action");
        String forward="";
        
        //Pathways to get to the manageemployeehome.jsp page and the addemployee.jsp page
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
        
        /* The following code is for inserting, updating, and deleting users.  
           All paths will access the UserDao.java class to perform the operations
           that actually modify the database.
        */
        //Deletion pathway
        if (request.getParameter("action").equalsIgnoreCase("deleteuser")) {
            int userID = parseInt(request.getParameter("userid"));
            dao.deleteUser(userID);
            request.setAttribute("users", dao.getAllUsers());
            RequestDispatcher view = request.getRequestDispatcher("/manageemployeehome.jsp");
            view.forward(request, response);
        } 
        //This pathway actually grabs data from the database to display on the edit page when the user clicks the edit button
        else if (request.getParameter("action").equalsIgnoreCase("edituser")) {
            int userID = parseInt(request.getParameter("edituserid"));
            request.setAttribute("user",dao.getUserById(userID));
            request.setAttribute("editUser", "true");
            RequestDispatcher view = request.getRequestDispatcher("/manageemployee.jsp");
            view.forward(request, response);         
        } 
        //Edit pathway; this is pathway where the database actually gets modified for edits 
        else if (request.getParameter("action").equalsIgnoreCase("submitedituser")) {
            User editUser = new User();
            editUser.setUserid(parseInt(request.getParameter("userID")));
            editUser.setName(request.getParameter("nameEntry"));
            editUser.setAddress(request.getParameter("addressEntry"));
            editUser.setPhone(request.getParameter("phoneEntry"));
            editUser.setRoleID(parseInt(request.getParameter("accessLevel")));
            editUser.setUserPin(parseInt(request.getParameter("pinEntry")));
            
            dao.updateUser(editUser);
            
            request.setAttribute("users", dao.getAllUsers());
            RequestDispatcher view = request.getRequestDispatcher("/manageemployeehome.jsp");
            view.forward(request, response);
        } 
        //Insert pathway
        else {
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
