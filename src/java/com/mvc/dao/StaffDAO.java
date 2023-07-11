/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mvc.dao;

import com.mvc.bean.Staff;
import com.mvc.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class StaffDAO 
{
    public StaffDAO()
    {   
    }
    
    public Connection con = DBConnection.createConnection();
    
    public void addStaff(Staff bean)
    {
        String staff_name = bean.getStaff_name();
        String staff_gender = bean.getStaff_gender();
        int staff_age = bean.getStaff_age();
        String staff_phoneno = bean.getStaff_phoneno();
        String staff_email = bean.getStaff_email();
        String staff_username = bean.getStaff_username();
        String staff_password = bean.getStaff_password();
        String sql = "insert into staff (staff_name, staff_gender, staff_age, staff_phoneno, staff_email, staff_username, staff_password)" 
                + " values (?,?,?,?,?,?,?)";
        PreparedStatement ps;
        try
        {
            ps = con.prepareStatement(sql);
            ps.setString(1, staff_name);
            ps.setString(2, staff_gender);
            ps.setInt(3, staff_age);
            ps.setString(4, staff_phoneno);
            ps.setString(5, staff_email);
            ps.setString(6, staff_username);
            ps.setString(7, staff_password);
            ps.executeUpdate();
            con.close();
        }
        catch (Exception ex)
        {
            System.out.println(ex);
        }   
    }
    
    public Staff getStaff(int staff_id)
    {
        try
        {
            String sql = "select * from staff where staff_id = " + staff_id;
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            rs.next();
            String staff_name = rs.getString("staff_name");
            String staff_gender = rs.getString("staff_gender");
            int staff_age = rs.getInt("staff_age");
            String staff_phoneno = rs.getString("staff_phoneno");
            String staff_email = rs.getString("staff_email");
            String staff_username = rs.getString("staff_username");
            String staff_password = rs.getString("staff_password");
            Staff stf = new Staff(staff_id, staff_name, staff_gender, staff_age, staff_phoneno, staff_email, staff_username, staff_password);
            con.close();
            return stf;
        }
        catch(Exception ex)
        {
            System.out.println(ex);
        }
        return null;
    }
    
    public void updateStaff(Staff bean)
    {
        int staff_id = bean.getStaff_id();
        String staff_name = bean.getStaff_name();
        String staff_gender = bean.getStaff_gender();
        int staff_age = bean.getStaff_age();
        String staff_phoneno = bean.getStaff_phoneno();
        String staff_email = bean.getStaff_email();
        String staff_username = bean.getStaff_username();
        String staff_password = bean.getStaff_password();
        String sql = "update staff set staff_name=?, staff_gender=?, staff_age=?, staff_phoneno=?, staff_email=?, staff_username=?, staff_password=? where staff_id = " + staff_id;
        
        PreparedStatement ps;
        try
        {
            //create preparedstatement
            ps = con.prepareStatement(sql);
            ps.setString(1, staff_name);
            ps.setString(2, staff_gender);
            ps.setInt(3, staff_age);
            ps.setString(4, staff_phoneno);
            ps.setString(5, staff_email);
            ps.setString(6, staff_username);
            ps.setString(7, staff_password);
            ps.executeUpdate();
            con.close();
        }
        catch (Exception ex)
        {
            System.out.println(ex);
        }
    }
    
    public void deleteStaff(int staff_id)
    {
        String sql = "delete from staff where staff_id = " + staff_id;
        PreparedStatement ps;
        try
        {
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
            con.close();
        }
        catch (Exception ex)
        {
            System.out.println(ex);
        }
    }
    
    public List<Staff> getAllStaff()
    {
        List<Staff> staffs = new ArrayList<>();
        try
        {
            String sql = "select * from staff";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next())
            {
                int staff_id = rs.getInt("staff_id");
                String staff_name = rs.getString("staff_name");
                String staff_gender = rs.getString("staff_gender");
                int staff_age = rs.getInt("staff_age");
                String staff_phoneno = rs.getString("staff_phoneno");
                String staff_email = rs.getString("staff_email");
                String staff_username = rs.getString("staff_username");
                String staff_password = rs.getString("staff_password");
                Staff stf = new Staff(staff_id, staff_name, staff_gender, staff_age, staff_phoneno, staff_email, staff_username, staff_password);
                staffs.add(stf);
            }
            con.close();
            return staffs;
        }
        catch(Exception ex)
        {
            System.out.println(ex);
        }
        return null;
    }
}
