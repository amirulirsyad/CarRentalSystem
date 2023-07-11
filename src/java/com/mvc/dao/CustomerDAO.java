/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mvc.dao;

import com.mvc.bean.Customer;
import com.mvc.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class CustomerDAO 
{
        public CustomerDAO()
        {
            
        }
        public Connection con = DBConnection.createConnection();
        
        public void addCustomer(Customer bean)
        {
            String cust_name = bean.getCust_name();
            String cust_gender = bean.getCust_gender();
            String cust_age = bean.getCust_age();
            String cust_phoneno = bean.getCust_phoneno();
            String cust_email = bean.getCust_email();
            String cust_username = bean.getCust_username();
            String cust_password = bean.getCust_password();
            String sql = "insert into customer(cust_name, cust_gender, cust_age, cust_phoneno, cust_email, cust_username, cust_password)" + " values (?,?,?,?,?,?,?)";
            
            PreparedStatement ps;
            try
            {
                //create preparestatement
                ps = con.prepareStatement(sql);
                ps.setString(1, cust_name);
                ps.setString(2, cust_gender);
                ps.setString(3, cust_age);
                ps.setString(4, cust_phoneno);
                ps.setString(5, cust_email);
                ps.setString(6, cust_username);
                ps.setString(7, cust_password);
                ps.executeUpdate();
                con.close();  
            }
            catch(Exception ex)
            {
                System.out.println(ex);
            }
        }
        
        public Customer getCustomer(String cust_id)
        {
            try
            {
                String sql = "select * from customer where cust_id = "+cust_id;
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery(sql);
                rs.next();
                String cust_name = rs.getString("cust_name");
                String cust_gender = rs.getString("cust_gender");
                String cust_age = rs.getString("cust_age");
                String cust_phoneno = rs.getString("cust_phoneno");
                String cust_email = rs.getString("cust_email");
                String cust_username = rs.getString("cust_username");
                String cust_password = rs.getString("cust_password");
                Customer cust = new Customer(cust_id, cust_name, cust_gender, cust_age, cust_phoneno, cust_email, cust_username, cust_password);
                con.close();
                return cust;
            }
            catch(Exception ex)
            {
                System.out.println(ex);
            }
            return null;
        }
        
        public void updateCustomer(Customer bean)
        {
            String cust_id = bean.getCust_id();
            String cust_name = bean.getCust_name();
            String cust_gender = bean.getCust_gender();
            String cust_age = bean.getCust_age();
            String cust_phoneno = bean.getCust_phoneno();
            String cust_email = bean.getCust_email();
            String cust_username = bean.getCust_username();
            String cust_password = bean.getCust_password();
            String sql = "update customer set cust_name=?, cust_gender=?, cust_age=?, cust_phoneno=?, cust_email=?, cust_username=?, cust_password=? where cust_id = " + cust_id;
            
            PreparedStatement ps;
            try
            {
                //create preparestatement
                ps = con.prepareStatement(sql);
                ps.setString(1, cust_name);
                ps.setString(2, cust_gender);
                ps.setString(3, cust_age);
                ps.setString(4, cust_phoneno);
                ps.setString(5, cust_email);
                ps.setString(6, cust_username);
                ps.setString(7, cust_password);
                ps.executeUpdate();
                con.close(); 
            }
            catch (Exception ex)
            {
                System.out.println(ex);
            }
             
        }
        
        public void deleteCustomer(Customer bean)
        {
            String cust_id = bean.getCust_id();
            String sql = "delete from customer where cust_id = "+cust_id;
            PreparedStatement ps;
            try
            {
                ps = con.prepareStatement(sql);
                ps.executeUpdate();
                con.close();
            }
            catch(Exception ex)
            {
                System.out.println(ex);
            }
        }
        
        public List<Customer> getAllCustomer()
        {
            List<Customer> customers = new ArrayList<>();
            try
            {
                String sql = "select * from customer";
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery(sql);
                while(rs.next())
                {
                    String cust_id = rs.getString("cust_id");
                    String cust_name = rs.getString("cust_name");
                    String cust_gender = rs.getString("cust_gender");
                    String cust_age = rs.getString("cust_age");
                    String cust_phoneno = rs.getString("cust_phoneno");
                    String cust_email = rs.getString("cust_email");
                    String cust_username = rs.getString("cust_username");
                    String cust_password = rs.getString("cust_password");
                    //String dept = rs.getString("deptcode")+"-"+rs.getString("deptname");
                    Customer cust = new Customer(cust_id, cust_name, cust_gender, cust_age, cust_phoneno, cust_email, cust_username, cust_password);
                    customers.add(cust);
                }
                con.close();
                return customers;
            }
            catch(Exception ex)
            {
                System.out.println(ex);
            }
            return null;
        }
    
}