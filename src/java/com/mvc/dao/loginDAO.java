/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mvc.dao;

import com.mvc.bean.LoginBean;
import com.mvc.util.DBConnection;
import java.sql.*;

public class loginDAO {
    public loginDAO(){}
    public String[] authenticateUserCust(LoginBean login){
        String userName = login.getUsername();
        String password = login.getPassword();
        String[] data = new String[3];
        Connection con = null;
        Statement stmt = null;
        ResultSet resultSet = null;
        try {
            con = DBConnection.createConnection();
            stmt = con.createStatement();
            String sql;
            sql = "select * from customer where cust_username = '" + userName 
                    + "' and cust_password = '" + password + "'";
            resultSet = stmt.executeQuery(sql);
            if(resultSet.next()) {
                int cust_id = resultSet.getInt("cust_id");
                String cust_name = resultSet.getString("cust_name");
                data[0] = "SUCCESS";
                data[1] = cust_id + "";
                data[2] = cust_name;
                return data;
            }
        }
        catch (SQLException e){
            e.printStackTrace();
        }
        data[0] = "Invalid user credentials";
        return data;
    }
    
    public String authenticateUserStaff(LoginBean login){
        String userName = login.getUsername();
        String password = login.getPassword();
        Connection con = null;
        Statement stmt = null;
        ResultSet resultSet = null;
        try {
            con = DBConnection.createConnection();
            stmt = con.createStatement();
            String sql;
            sql = "select * from staff where staff_username = '" + userName 
                    + "' and staff_password = '" + password + "'";
            resultSet = stmt.executeQuery(sql);
            if(resultSet.next()) {
                return "SUCCESS";
            }
        }
        catch (SQLException e){
            e.printStackTrace();
        }
        return "Invalid user credentials";
    }
}
