/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mvc.bean;

public class Car 
{
    private int car_id;
    private String car_plateno;
    private String car_model;
    private String car_status;
    private int car_rentprice;

    public Car(int car_id, String car_plateno, String car_model, String car_status, int car_rentprice) 
    {
        this.car_id = car_id;
        this.car_plateno = car_plateno;
        this.car_model = car_model;
        this.car_status = car_status;
        this.car_rentprice = car_rentprice;
    }
    
    public Car() 
    {
        car_id = 0;
        car_plateno = " ";
        car_model = " ";
        car_status = " ";
        car_rentprice = 0;
    }

    public int getCar_id() {
        return car_id;
    }

    public String getCar_plateno() {
        return car_plateno;
    }

    public String getCar_model() {
        return car_model;
    }

    public String getCar_status() {
        return car_status;
    }

    public int getCar_rentprice() {
        return car_rentprice;
    }

    public void setCar_id(int car_id) {
        this.car_id = car_id;
    }

    public void setCar_plateno(String car_plateno) {
        this.car_plateno = car_plateno;
    }

    public void setCar_model(String car_model) {
        this.car_model = car_model;
    }

    public void setCar_status(String car_status) {
        this.car_status = car_status;
    }

    public void setCar_rentprice(int car_rentprice) {
        this.car_rentprice = car_rentprice;
    }
}
