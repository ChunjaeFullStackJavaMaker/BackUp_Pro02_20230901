package com.shop.dto;

import java.util.Arrays;

public class MyOrderVO {
    private int pay_no;
    private String resdate;
    private String thumb;
    private String description;
    private String title;
    private int amount;
    private int pay_price;
    private String del_state;
    private String[] state_list = {"입고 중", "출하 중", "상차", "하차", "캠프 도착", "배송 중", "배송 도착"};

    @Override
    public String toString() {
        return "MyOrderVO{" +
                "pay_no=" + pay_no +
                ", resdate='" + resdate + '\'' +
                ", thumb='" + thumb + '\'' +
                ", description='" + description + '\'' +
                ", title='" + title + '\'' +
                ", amount=" + amount +
                ", pay_price=" + pay_price +
                ", del_state='" + del_state + '\'' +
                ", state_list=" + Arrays.toString(state_list) +
                '}';
    }

    public int getPay_no() {
        return pay_no;
    }

    public void setPay_no(int pay_no) {
        this.pay_no = pay_no;
    }

    public String getResdate() {
        return resdate;
    }

    public void setResdate(String resdate) {
        this.resdate = resdate;
    }

    public String getThumb() {
        return thumb;
    }

    public void setThumb(String thumb) {
        this.thumb = thumb;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public int getPay_price() {
        return pay_price;
    }

    public void setPay_price(int pay_price) {
        this.pay_price = pay_price;
    }

    public String getDel_state() {
        return del_state;
    }

    public void setDel_state(String del_state) {
        this.del_state = del_state;
    }

    public String[] getState_list() {
        return state_list;
    }

    public void setState_list(String[] state_list) {
        this.state_list = state_list;
    }

}
