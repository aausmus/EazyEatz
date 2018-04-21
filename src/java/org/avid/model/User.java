/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.avid.model;

public class User {

    private int userid;
    private String name;
    private String address;
    private String phone;
    private String role;
    private int userPin;
    private int roleID;
    
    public int getUserid() {
        return userid;
    }
    public void setUserid(int userid) {
        this.userid = userid;
    }
    public String getName() {
        return name;
    }
    public void setName(String firstName) {
        this.name = firstName;
    }
    public String getAddress() {
        return address;
    }
    public void setAddress(String address) {
        this.address = address;
    }
    public String getPhone() {
        return phone;
    }
    public void setPhone(String phone) {
        this.phone = phone;
    }
    public String getRole() {
        return role;
    }
    public void setRole(String role) {
    		this.role = role;
    }
    public int getUserPin() {
        return userPin;
    }
    public void setUserPin(int pin) {
        this.userPin = pin;
    }
    public int getRoleID() {
        return roleID;
    }
    public void setRoleID(int roleID) {
        this.roleID = roleID;
    }
//    @Override
//    public String toString() {
//        return "User [userid=" + userid + ", firstName=" + firstName
//                + ", lastName=" + lastName + ", address=" + address + ", phone="
//                + phone + ", payrate=" + payrate + ", jobtitle=" + jobtitle + 
//                ", role=" + role + "]";
//    }   
}

