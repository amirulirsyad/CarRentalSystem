/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mvc.dao;

import com.mvc.bean.Car;
import com.mvc.util.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CarDAO 
{

    public CarDAO() {}
    
    public Connection con = DBConnection.createConnection();
    
    public void addCar(Car bean) throws SQLException
    {
        int car_id = bean.getCar_id();
        String car_plateno = bean.getCar_plateno();
        String car_model = bean.getCar_model();
        String car_status = bean.getCar_status();
        int car_rentprice = bean.getCar_rentprice();
        String sql = "insert into car (car_plateno, car_model, car_status, car_rentprice) values (?,?,?,?)";
    
        PreparedStatement ps;
        try
        {
            ps = con.prepareStatement(sql);
            ps.setString(1, car_plateno);
            ps.setString(2, car_model);
            ps.setString(3, car_status);
            ps.setInt(4, car_rentprice); 
            ps.executeUpdate();
            con.close();
        }
        catch(Exception ex)
        {
            System.out.println(ex);
        }
    }
    
    public Car getCar(int car_id) throws SQLException
    {
        try
        {
            String sql = "select * from car where car_id = " + car_id;
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            rs.next();
            String car_plateno = rs.getString("car_plateno");
            String car_model = rs.getString("car_model");
            String car_status = rs.getString("car_status");
            int car_rentprice = rs.getInt("car_rentprice");
            Car car = new Car(car_id, car_plateno, car_model, car_status, car_rentprice);
            con.close();
            return car;
        }
        catch(Exception ex)
        {
            System.out.println(ex);
        }
        return null;
    }
    
    public void updateCar(Car bean)
    {
        int car_id = bean.getCar_id();
        String car_plateno = bean.getCar_plateno();
        String car_model = bean.getCar_model();
        String car_status = bean.getCar_status();
        int car_rentprice = bean.getCar_rentprice();
        String sql = "update car set car_plateno=?, car_model=?, car_status=?, car_rentprice=? where car_id = " + car_id;
        
        PreparedStatement ps;
        try
        {
            ps = con.prepareStatement(sql);
            ps.setString(1, car_plateno);
            ps.setString(2, car_model);
            ps.setString(3, car_status);
            ps.setInt(4, car_rentprice);
            ps.executeUpdate();
            con.close();
        }
        catch(Exception ex)
        {
            System.out.println(ex);
        }
    }
    
    public void deleteCar(int car_id)
    {
        String sql = "delete from car where car_id = " + car_id;
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
    
    public List<Car> getAllCar()
    {
        List<Car> cars = new ArrayList <> ();
        try
        {
            String sql = "select * from car";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while(rs.next())
            {
                int car_id = rs.getInt("car_id");
                String car_plateno = rs.getString("car_plateno");
                String car_model = rs.getString("car_model");
                String car_status = rs.getString("car_status");
                int car_rentprice = rs.getInt("car_rentprice");
                Car car = new Car(car_id, car_plateno, car_model, car_status, car_rentprice);
                cars.add(car);
            }
            con.close();
            return cars;
        }
        catch(Exception ex)
        {
            System.out.println(ex);
        }
        return null;
    }
}
