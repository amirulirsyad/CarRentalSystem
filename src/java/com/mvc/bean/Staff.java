/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mvc.bean;

import java.io.Serializable;

public class Staff implements Serializable
{
    private int staff_id;
    private String staff_name;
    private String staff_gender;
    private int staff_age;
    private String staff_phoneno;
    private String staff_email;
    private String staff_username;
    private String staff_password;

   public Staff(int staff_id, String staff_name,String staff_gender, int staff_age, String staff_phoneno, String staff_email, String staff_username, String staff_password)
   {
       this.staff_id = staff_id;
       this.staff_name = staff_name;
       this.staff_gender = staff_gender;
       this.staff_age = staff_age;
       this.staff_phoneno = staff_phoneno;
       this.staff_email = staff_email;
       this.staff_username = staff_username;
       this.staff_password = staff_password;
   }
   
   public Staff()
   {
       staff_id = 0;
       staff_name = " ";
       staff_gender = " ";
       staff_age = 0;
       staff_phoneno = " ";
       staff_email = " ";
       staff_username = " ";
       staff_password = " ";
   }

    public int getStaff_id() {
        return staff_id;
    }

    public String getStaff_name() {
        return staff_name;
    }

    public String getStaff_gender() {
        return staff_gender;
    }

    public int getStaff_age() {
        return staff_age;
    }

    public String getStaff_phoneno() {
        return staff_phoneno;
    }

    public String getStaff_email() {
        return staff_email;
    }

    public String getStaff_username() {
        return staff_username;
    }

    public String getStaff_password() {
        return staff_password;
    }

    public void setStaff_id(int staff_id) {
        this.staff_id = staff_id;
    }

    public void setStaff_name(String staff_name) {
        this.staff_name = staff_name;
    }

    public void setStaff_gender(String staff_gender) {
        this.staff_gender = staff_gender;
    }

    public void setStaff_age(int staff_age) {
        this.staff_age = staff_age;
    }

    public void setStaff_phoneno(String staff_phoneno) {
        this.staff_phoneno = staff_phoneno;
    }

    public void setStaff_email(String staff_email) {
        this.staff_email = staff_email;
    }

    public void setStaff_username(String staff_username) {
        this.staff_username = staff_username;
    }

    public void setStaff_password(String staff_password) {
        this.staff_password = staff_password;
    }
}
