package com.shop.dto;

public class Payment {
    private int pay_no;
    private String cus_id;
    private String cus_num;
    private int pro_no;
    private int amount;
    private String pay_method;
    private String pay_com;
    private int pay_price;
    private String pay_account;
    private int del_no;
    private String pay_resdate;

    public int getPay_no() {
        return pay_no;
    }

    public void setPay_no(int pay_no) {
        this.pay_no = pay_no;
    }

    public String getCus_id() {
        return cus_id;
    }

    public void setCus_id(String cus_id) {
        this.cus_id = cus_id;
    }

    public String getCus_num() {
        return cus_num;
    }

    public void setCus_num(String cus_num) {
        this.cus_num = cus_num;
    }

    public int getPro_no() {
        return pro_no;
    }

    public void setPro_no(int pro_no) {
        this.pro_no = pro_no;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public String getPay_method() {
        return pay_method;
    }

    public void setPay_method(String pay_method) {
        this.pay_method = pay_method;
    }

    public String getPay_com() {
        return pay_com;
    }

    public void setPay_com(String pay_com) {
        this.pay_com = pay_com;
    }

    public int getPay_price() {
        return pay_price;
    }

    public void setPay_price(int pay_price) {
        this.pay_price = pay_price;
    }

    public String getPay_account() {
        return pay_account;
    }

    public void setPay_account(String pay_account) {
        this.pay_account = pay_account;
    }

    public int getDel_no() {
        return del_no;
    }

    public void setDel_no(int del_no) {
        this.del_no = del_no;
    }

    public String getPay_resdate() {
        return pay_resdate;
    }

    public void setPay_resdate(String pay_resdate) {
        this.pay_resdate = pay_resdate;
    }

    @Override
    public String toString() {
        return "Payment{" +
                "pay_no=" + pay_no +
                ", cus_id='" + cus_id + '\'' +
                ", cus_num='" + cus_num + '\'' +
                ", pro_no=" + pro_no +
                ", amount=" + amount +
                ", pay_method='" + pay_method + '\'' +
                ", pay_com='" + pay_com + '\'' +
                ", pay_price=" + pay_price +
                ", pay_account='" + pay_account + '\'' +
                ", del_no=" + del_no +
                ", pay_resdate='" + pay_resdate + '\'' +
                '}';
    }
}
