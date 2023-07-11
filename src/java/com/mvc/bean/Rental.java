/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mvc.bean;

public class Rental
{
    private int rent_id;
    private String rent_rentdate;
    private int rent_days;
    private double rent_deposit;
    private String rent_status;
    private int cust_id;
    private int car_id;
    private int staff_id;

    public Rental() 
    {
        rent_id = 0;
        rent_rentdate = null;
        rent_days = 0;
        rent_deposit = 0;
        rent_status = " ";
        cust_id = 0;
        car_id = 0;
        staff_id = 0;
    }
    
    public Rental(int rent_id, String rent_rentdate, int rent_days, double rent_deposit, String rent_status, int cust_id, int car_id, int staff_id) {
        this.rent_id = rent_id;
        this.rent_rentdate = rent_rentdate;
        this.rent_days = rent_days;
        this.rent_deposit = rent_deposit;
        this.rent_status = rent_status;
        this.cust_id = cust_id;
        this.car_id = car_id;
        this.staff_id = staff_id;
    }

    public int getRent_id() {
        return rent_id;
    }

    public String getRent_rentdate() {
        return rent_rentdate;
    }

    public int getRent_days() {
        return rent_days;
    }

    public double getRent_deposit() {
        return rent_deposit;
    }

    public String getRent_status() {
        return rent_status;
    }

    public int getCust_id() {
        return cust_id;
    }

    public int getCar_id() {
        return car_id;
    }

    public int getStaff_id() {
        return staff_id;
    }

    public void setRent_id(int rent_id) {
        this.rent_id = rent_id;
    }

    public void setRent_rentdate(String rent_rentdate) {
        this.rent_rentdate = rent_rentdate;
    }

    public void setRent_days(int rent_days) {
        this.rent_days = rent_days;
    }

    public void setRent_deposit(double rent_deposit) {
        this.rent_deposit = rent_deposit;
    }

    public void setRent_status(String rent_status) {
        this.rent_status = rent_status;
    }

    public void setCust_id(int cust_id) {
        this.cust_id = cust_id;
    }

    public void setCar_id(int car_id) {
        this.car_id = car_id;
    }

    public void setStaff_id(int staff_id) {
        this.staff_id = staff_id;
    }

    @Override
    public String toString() {
        return "Rental{" + "rent_id=" + rent_id + ", rent_rentdate=" + rent_rentdate + ", rent_days=" + rent_days + ", rent_deposit=" + rent_deposit + ", rent_status=" + rent_status + ", cust_id=" + cust_id + ", car_id=" + car_id + ", staff_id=" + staff_id + '}';
    }

    
}