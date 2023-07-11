/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mvc.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection 
{
    public static Connection createConnection()
    {
        Connection conn = null;
        String driver = "org.apache.derby.jdbc.ClientDriver";//java db driver
        String url = "jdbc:derby://localhost:1527/CarRentalDB";//java db
        String dbUser = "app", dbPassword = "app";
        
//        Connection conn = null;;
//        String driver = "org.mysql.jdbc.Driver";//mysql driver
//        String url = "jdbc:mysql://localhost:3306/carental";//mysql url
//        String dbUser = "root", dbPassword = "";
        
        try
        {
            try
            {
                Class.forName(driver);
            }
            catch(ClassNotFoundException e)
            {
                e.printStackTrace();
            }
            //connect tp db
            conn = DriverManager.getConnection(url, dbUser, dbPassword);
            System.out.println("Printing connection object" + conn);
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return conn;
    }
}
