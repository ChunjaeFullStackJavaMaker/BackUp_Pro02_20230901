package com.shop.dto;

public class PaymentVO {
    private int pay_no;
    private String cus_id;
    private int Pro_no;
    private int amount;
    private String Pay_method;
    private String Pay_com;
    private String Cus_num;
    private int pay_price;
    private String title;
    private int del_state;

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

    public int getPro_no() {
        return Pro_no;
    }

    public void setPro_no(int pro_no) {
        Pro_no = pro_no;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public String getPay_method() {
        return Pay_method;
    }

    public void setPay_method(String pay_method) {
        Pay_method = pay_method;
    }

    public String getPay_com() {
        return Pay_com;
    }

    public void setPay_com(String pay_com) {
        Pay_com = pay_com;
    }

    public String getCus_num() {
        return Cus_num;
    }

    public void setCus_num(String cus_num) {
        Cus_num = cus_num;
    }

    public int getPay_price() {
        return pay_price;
    }

    public void setPay_price(int pay_price) {
        this.pay_price = pay_price;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getDel_state() {
        return del_state;
    }

    public void setDel_state(int del_state) {
        this.del_state = del_state;
    }

    @Override
    public String toString() {
        return "PaymentVO{" +
                "pay_no=" + pay_no +
                ", cus_id='" + cus_id + '\'' +
                ", Pro_no=" + Pro_no +
                ", amount=" + amount +
                ", Pay_method='" + Pay_method + '\'' +
                ", Pay_com='" + Pay_com + '\'' +
                ", Cus_num='" + Cus_num + '\'' +
                ", pay_price=" + pay_price +
                ", title='" + title + '\'' +
                ", del_state=" + del_state +
                '}';
    }
}
