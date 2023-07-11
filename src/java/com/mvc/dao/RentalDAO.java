/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mvc.dao;

import com.mvc.bean.Rental;
import com.mvc.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class RentalDAO 
{
    public RentalDAO() {}
    
    public Connection con = DBConnection.createConnection();
    
    public void addRent(Rental bean)
    {
        String rent_rentdate = bean.getRent_rentdate();
        int rent_days= bean.getRent_days();
        double rent_deposit = bean.getRent_deposit();
        String rent_status = bean.getRent_status();
        int cust_id = bean.getCust_id();
        int car_id = bean.getCar_id();
        int staff_id = bean.getStaff_id();
        String sql = "insert into rental(RENT_RENTDATE, RENT_DAYS, RENT_DEPOSIT, RENT_STATUS, CUST_ID, CAR_ID, STAFF_ID) values (?,?,?,?,?,?,?)";
        
        PreparedStatement ps;
        try
        {
            ps = con.prepareStatement(sql);
            ps.setString(1, rent_rentdate);
            ps.setInt(2, rent_days);
            ps.setDouble(3, rent_deposit);
            ps.setString(4, rent_status);
            ps.setInt(5, cust_id);
            ps.setInt(6, car_id);
            ps.setInt(7, staff_id);
            ps.executeUpdate();
            con.close();
        }
        catch(Exception ex)
        {
            System.out.println(ex);
        }
    }
    
    public Rental getRent(int rent_id)
    {
        try
        {
            String sql = "select * from rental where rent_id ="+rent_id;
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            rs.next();
            String rent_rentdate = rs.getString("rent_rentdate");
            int rent_days = rs.getInt("rent_days");
            Double rent_deposit = rs.getDouble("rent_deposit");
            String rent_status = rs.getString("rent_status");
            int cust_id = rs.getInt("cust_id");
            int car_id = rs.getInt("car_id");
            int staff_id = rs.getInt("staff_id");
            Rental rent = new Rental(rent_id, rent_rentdate, rent_days, rent_deposit, rent_status, cust_id, car_id, staff_id);
            con.close();
            return rent;
        }
        catch(Exception ex)
        {
            System.out.println(ex);
        }
        return null;
    }
    
    public void updateRent(Rental bean)
    {
        int rent_id = bean.getRent_id();
        String rent_rentdate = bean.getRent_rentdate();
        int rent_days= bean.getRent_days();
        double rent_deposit = bean.getRent_deposit();
        String rent_status = bean.getRent_status();
        int cust_id = bean.getCust_id();
        int car_id = bean.getCar_id();
        int staff_id = bean.getStaff_id();
        String sql = "update rental set rent_rentdate=?, rent_days=?, rent_deposit=?, rent_status=?, cust_id=?, car_id=?, staff_id=? where rent_id = "+rent_id;
        
       PreparedStatement ps;
        try
        {
            ps = con.prepareStatement(sql);
            ps.setString(1, rent_rentdate);
            ps.setInt(2, rent_days);
            ps.setDouble(3, rent_deposit);
            ps.setString(4, rent_status);
            ps.setInt(5, cust_id);
            ps.setInt(6, car_id);
            ps.setInt(7, staff_id);
            ps.executeUpdate();
            con.close();
        }
        catch(Exception ex)
        {
            System.out.println(ex);
        }
    }
    
    public void deleteRent(int rent_id)
    {
        String sql = "delete from rental where rent_id ="+rent_id;
        PreparedStatement ps;
        
        try{
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
            con.close();
        }
        catch(Exception ex)
        {
            System.out.println(ex);
        }
    }
    
    public List<Rental> getAllRent()
    {
        List<Rental> rents = new ArrayList<>();
        try
        {
            String sql = "select * from rental";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while(rs.next())
            {
                int rent_id = rs.getInt("rent_id");
                String rent_rentdate = rs.getString("rent_rentdate");
                int rent_days = rs.getInt("rent_days");
                Double rent_deposit = rs.getDouble("rent_deposit");
                String rent_status = rs.getString("rent_status");
                int cust_id = rs.getInt("cust_id");
                int car_id = rs.getInt("car_id");
                int staff_id = rs.getInt("staff_id");
                Rental rent = new Rental(rent_id, rent_rentdate, rent_days, rent_deposit, rent_status, cust_id, car_id, staff_id);
                rents.add(rent);
            }
            con.close();
            return rents;
        }
        catch(Exception ex)
        {
            System.out.println(ex);
        }
        return null;
    }
}
