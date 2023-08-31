package com.shop.dto;

public class Cart {
    private int cart_no;
    private String cus_id;
    private int pro_no;
    private int amount;

    public int getCart_no() {
        return cart_no;
    }

    public void setCart_no(int cart_no) {
        this.cart_no = cart_no;
    }

    public String getCus_id() {
        return cus_id;
    }

    public void setCus_id(String cus_id) {
        this.cus_id = cus_id;
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

    @Override
    public String toString() {
        return "Cart{" +
                "cart_no=" + cart_no +
                ", cus_id='" + cus_id + '\'' +
                ", pro_no=" + pro_no +
                ", amount=" + amount +
                '}';
    }
}
