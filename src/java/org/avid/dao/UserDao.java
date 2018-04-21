/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.avid.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.avid.model.Inventory;
import org.avid.model.User;
import org.avid.util.DbUtil;

public class UserDao {

    private Connection connection;

    public UserDao() {
        connection = DbUtil.getConnection();
    }

    public void addUser(User user) {
        try {
            
            
//            PreparedStatement preparedStatement = connection
//                    .prepareStatement("insert into eazyeatz.employee values (@lastEmpID, ?, ?, ?, ?, ?);");
            // Parameters start with 1
            //preparedStatement.setInt(1, user.getUserid());
            CallableStatement preparedStatement = connection.prepareCall("call eazyeatz.usp_Insert_Employee(?,?,?,?,?);");
            
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getAddress());
            preparedStatement.setString(3, user.getPhone());
            preparedStatement.setInt(4, user.getRoleID());
            preparedStatement.setInt(5, user.getUserPin());
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteUser(int userId) {
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("delete from eazyeatz.Employee where Employee_ID=?;");
            // Parameters start with 1
            preparedStatement.setInt(1, userId);
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateUser(User user) {
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("update users set firstname=?, lastname=?, address=?, phone=?, payrate=?, jobtitle=?, role=?" +
                            "where userid=?");
            // Parameters start with 1
//            preparedStatement.setString(1, user.getFirstName());
//            preparedStatement.setString(2, user.getLastName());
            preparedStatement.setString(3, user.getAddress());
            preparedStatement.setString(4, user.getPhone());
//            preparedStatement.setDouble(5, user.getPayrate());
//            preparedStatement.setString(6, user.getJobtitle());
            preparedStatement.setString(7, user.getRole());
            preparedStatement.setInt(8, user.getUserid());
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    public List<User> getAllUsers() {
        List<User> users = new ArrayList<User>();
        try {
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("select Employee_ID, Employee_Name, Employee_Address, Employee_Phone from eazyeatz.Employee;");
            while (rs.next()) {
                User user = new User();
                user.setUserid(rs.getInt("Employee_ID"));
                user.setName(rs.getString("Employee_Name"));
                user.setAddress(rs.getString("Employee_Address"));
                user.setPhone(rs.getString("Employee_Phone"));
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return users;
    }
    public User getUserById(int userId) {
        User user = new User();
        try {
            PreparedStatement preparedStatement = connection.
                    prepareStatement("select * from eazyeatz.Employee where Employee_ID=?");
            preparedStatement.setInt(1, userId);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                user.setUserid(rs.getInt("Employee_ID"));
                user.setName(rs.getString("Employee_Name"));
                user.setAddress(rs.getString("Employee_Address"));
                user.setPhone(rs.getString("Employee_Phone"));
                user.setRoleID(rs.getInt("EmployeeType_ID"));
                user.setUserPin(rs.getInt("EmployeePin"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user;
    }
    public void addInventory(Inventory inventory) {
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("insert into inventory(item,stock) values (?, ? )");
            // Parameters start with 1
            preparedStatement.setString(1, inventory.getItem());
            preparedStatement.setInt(2, inventory.getStock());
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void deleteInventory(int inventoryid) {
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("delete from inventories where inventoryid=?");
            // Parameters start with 1
            preparedStatement.setInt(1, inventoryid);
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void updateInventory(Inventory inventory) {
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("update inventories set item=?, stock=?" +
                            "where inventoryid=?");
            // Parameters start with 1
            preparedStatement.setString(1, inventory.getItem());
            preparedStatement.setInt(2, inventory.getStock());
            preparedStatement.setInt(3, inventory.getInventoryid());
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public List<Inventory> getAllInventories() {
        List<Inventory> inventories = new ArrayList<Inventory>();
        try {
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("select * from inventory");
            while (rs.next()) {
                Inventory inventory = new Inventory();
                inventory.setInventoryid(rs.getInt("inventoryid"));
                inventory.setItem(rs.getString("item"));
                inventory.setStock(rs.getInt("stock"));
                inventories.add(inventory);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return inventories;
    }
    public Inventory getInventoriesById(int inventoryid) {
        Inventory inventory = new Inventory();
        try {
            PreparedStatement preparedStatement = connection.
                    prepareStatement("select * from inventories where inventoryid=?");
            preparedStatement.setInt(1, inventoryid);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                inventory.setInventoryid(rs.getInt("inventoryid"));
                inventory.setItem(rs.getString("item"));
                inventory.setStock(rs.getInt("stock"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return inventory;
    }
    
    public String Validate(int pin) {
    	String t = "/failure.jsp";
    	try {
    	PreparedStatement preparedStatement = connection
    			.prepareStatement("Select EmployeeType_ID from EazyEatz.Employee where EmployeePin=?;");
    	preparedStatement.setInt(1, pin);
        ResultSet rs = preparedStatement.executeQuery();
        while(rs.next()) {
        if(rs.getInt("EmployeeType_ID") == 1) {      
            t = "/manager.jsp";                
        } else if(rs.getInt("EmployeeType_ID") == 2) {
        	t = "/sales.jsp"; 
        } else if(rs.getInt("EmployeeType_ID") == 3) {
        	t = "/cook.jsp"; 
        } else
        	t = "/failure.jsp";
            }
    	}
        catch(SQLException e){       
            e.printStackTrace();  
        }
		return t;
    }

}