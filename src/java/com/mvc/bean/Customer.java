/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mvc.bean;

import java.io.Serializable;

public class Customer implements Serializable
{
    String cust_id;
    String cust_name;
    String cust_gender;
    String cust_age;
    String cust_phoneno;
    String cust_email;
    String cust_username;
    String cust_password;
    
    public Customer()
    {
        cust_id = "";
        cust_name = "";
        cust_gender = "";
        cust_age = "";
        cust_phoneno = "";
        cust_email = "";
        cust_username = "";
        cust_password = "";
    }
    
    public Customer(String cust_id, String cust_name, String cust_gender, String cust_age, String cust_phoneno, String cust_email, String cust_username, String cust_password) 
    {
        this.cust_id = cust_id;
        this.cust_name = cust_name;
        this.cust_gender = cust_gender;
        this.cust_age = cust_age;
        this.cust_phoneno = cust_phoneno;
        this.cust_email = cust_email;
        this.cust_username = cust_username;
        this.cust_password = cust_password;
    }

    public String getCust_id() 
    {
        return cust_id;
    }

    public void setCust_id(String cust_id) 
    {
        this.cust_id = cust_id;
    }

    public String getCust_name() 
    {
        return cust_name;
    }

    public void setCust_name(String cust_name) 
    {
        this.cust_name = cust_name;
    }

    public String getCust_gender() 
    {
        return cust_gender;
    }

    public void setCust_gender(String cust_gender) 
    {
        this.cust_gender = cust_gender;
    }

    public String getCust_age() 
    {
        return cust_age;
    }

    public void setCust_age(String cust_age) 
    {
        this.cust_age = cust_age;
    }

    public String getCust_phoneno() 
    {
        return cust_phoneno;
    }

    public void setCust_phoneno(String cust_phoneno) 
    {
        this.cust_phoneno = cust_phoneno;
    }

    public String getCust_email() 
    {
        return cust_email;
    }

    public void setCust_email(String cust_email) 
    {
        this.cust_email = cust_email;
    }

    public String getCust_username() 
    {
        return cust_username;
    }

    public void setCust_username(String cust_username) 
    {
        this.cust_username = cust_username;
    }

    public String getCust_password() 
    {
        return cust_password;
    }

    public void setCust_password(String cust_password) 
    {
        this.cust_password = cust_password;
    }

 
}