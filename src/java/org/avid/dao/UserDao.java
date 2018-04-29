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
import org.avid.model.DateTime;

import org.avid.model.InventoryItem;
import org.avid.model.MenuItem;
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
    public void addInventory(InventoryItem item) {
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("insert into InventoryItem(InventoryItem_Name,InventoryItem_Quantity,InventoryItem_SingleUnitCost) values (?, ?, ? )");
            // Parameters start with 1
            preparedStatement.setString(1, item.getItem());
            preparedStatement.setInt(2, item.getStock());
            preparedStatement.setDouble(3, item.getCost());
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void deleteInventory(int inventoryid) {
        try {
        	PreparedStatement preparedStatement = connection
                    .prepareStatement("delete from MenuItemInventoryComposition where InventoryItem_ID=?");
            // Parameters start with 1
            preparedStatement.setInt(1, inventoryid);
            preparedStatement.executeUpdate();
            PreparedStatement preparedStatement1 = connection
                    .prepareStatement("delete from InventoryItem where InventoryItem_ID=?");
            // Parameters start with 1
            preparedStatement1.setInt(1, inventoryid);
            preparedStatement1.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void updateInventory(InventoryItem item) {
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("update InventoryItem set InventoryItem_Quantity=?, InventoryItem_SingleUnitCost=? where InventoryItem_ID=?");
            // Parameters start with 1
            preparedStatement.setInt(1, item.getStock());
            preparedStatement.setDouble(2, item.getCost());
            preparedStatement.setInt(3, item.getInventoryid());
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public List<InventoryItem> getAllInventoryItems() {
        List<InventoryItem> inventoryItems = new ArrayList<InventoryItem>();
        try {
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("select * from InventoryItem");
            while (rs.next()) {
                InventoryItem item = new InventoryItem();
                item.setInventoryid(rs.getInt("InventoryItem_ID"));
                item.setItem(rs.getString("InventoryItem_Name"));
                item.setStock(rs.getInt("InventoryItem_Quantity"));
                item.setCost(rs.getDouble("InventoryItem_SingleUnitCost"));
                inventoryItems.add(item);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return inventoryItems;
    }
    public InventoryItem getInventoryById(int inventoryid) {
        InventoryItem item = new InventoryItem();
        try {
            PreparedStatement preparedStatement = connection.
                    prepareStatement("select * from InventoryItem where InventoryItem_ID=?");
            preparedStatement.setInt(1, inventoryid);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                item.setInventoryid(rs.getInt("InventoryItem_ID"));
                item.setItem(rs.getString("InventoryItem_Name"));
                item.setStock(rs.getInt("InventoryItem_Quantity"));
                item.setCost(rs.getDouble("InventoryItem_SingleUnitCost"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return item;
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
    
    public List<MenuItem> getAllMenuItems() {
        List<MenuItem> menuItems = new ArrayList<MenuItem>();
        try {
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("select MenuItem_ID, MenuItem_Name, MenuItem_Cost from eazyeatz.MenuItem;");
            while (rs.next()) {
                MenuItem menuItem = new MenuItem();
                menuItem.setMenuItemId(rs.getInt("MenuItem_ID"));
                menuItem.setMenuItemName(rs.getString("MenuItem_Name"));
                menuItem.setMenuItemPrice(rs.getDouble("MenuItem_Cost"));
                menuItems.add(menuItem);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return menuItems;
    }
    
    public MenuItem getMenuItembyId(int id) {
        MenuItem menuItem = new MenuItem();
        try {
            PreparedStatement preparedStatement = connection.
                    prepareStatement("Select MenuItem_ID, MenuItem_Name, "
                            + "MenuItem_Cost from eazyeatz.MenuItem where MenuItem_ID=?;");
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
         
            while (rs.next()) {
                menuItem.setMenuItemId(rs.getInt("MenuItem_ID"));
                menuItem.setMenuItemName(rs.getString("MenuItem_Name"));
                menuItem.setMenuItemPrice(rs.getDouble("MenuItem_Cost"));
            }
                    
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return menuItem;
        
    }
    
    public String clockStatus(int userID) {
    	String t = "Clocked Out";
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("select EmployeeTimeLog_Type from EmployeeTimeLog where Employee_ID=? order by EmployeeTimeLog_LogTime desc limit 1");
            // Parameters start with 1
            preparedStatement.setInt(1, userID);
            ResultSet rs = preparedStatement.executeQuery();
            while(rs.next()) {
            if(rs.getInt("EmployeeTimeLog_Type") == 1)         
                t = "Clocked In";        
            else if(rs.getInt("EmployeeTimeLog_Type") == 2) 
            	t = "Clocked Out"; 
            else if(rs.getInt("EmployeeTimeLog_Type") == 3) 
            	t = "On Break"; 
            else if(rs.getInt("EmployeeTimeLog_Type") == 4) 
            	t = "Clocked In";
            else 
            	t = "Clocked Out";
       }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return t;
    }
    public void clockIn(int userID) {
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("insert into EmployeeTimeLog(Employee_ID,EmployeeTimeLog_LogTime,EmployeeTimeLog_Type) values (?, ?, ? )");
            // Parameters start with 1
            preparedStatement.setInt(1, userID);
            preparedStatement.setString(2, DateTime.getDateTime());
            preparedStatement.setInt(3, 1);
            preparedStatement.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void clockOut(int userID) {
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("insert into EmployeeTimeLog(Employee_ID,EmployeeTimeLog_LogTime,EmployeeTimeLog_Type) values (?, ?, ? )");
            // Parameters start with 1
            preparedStatement.setInt(1, userID);
            preparedStatement.setString(2, DateTime.getDateTime());
            preparedStatement.setInt(3, 2);
            preparedStatement.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void startBreak(int userID) {
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("insert into EmployeeTimeLog(Employee_ID,EmployeeTimeLog_LogTime,EmployeeTimeLog_Type) values (?, ?, ? )");
            // Parameters start with 1
            preparedStatement.setInt(1, userID);
            preparedStatement.setString(2, DateTime.getDateTime());
            preparedStatement.setInt(3, 3);
            preparedStatement.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void endBreak(int userID) {
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("insert into EmployeeTimeLog(Employee_ID,EmployeeTimeLog_LogTime,EmployeeTimeLog_Type) values (?, ?, ? )");
            // Parameters start with 1
            preparedStatement.setInt(1, userID);
            preparedStatement.setString(2, DateTime.getDateTime());
            preparedStatement.setInt(3, 4);
            preparedStatement.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}