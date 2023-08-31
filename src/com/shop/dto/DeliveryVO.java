package com.shop.dto;

public class DeliveryVO {

    private int del_no;
    private String title;
    private String custom_id;
    private String pay_resdate;
    private String del_addr;
    private String cus_tel;
    private String del_com;
    private String del_tel;
    private int del_state;
    private String current_state;
    private String del_date;
    private String res_date;
    private String del_code;

    @Override
    public String toString() {
        return "DeliveryVO{" +
                "del_no=" + del_no +
                ", title='" + title + '\'' +
                ", custom_id='" + custom_id + '\'' +
                ", pay_resdate='" + pay_resdate + '\'' +
                ", del_addr='" + del_addr + '\'' +
                ", cus_tel='" + cus_tel + '\'' +
                ", del_com='" + del_com + '\'' +
                ", del_tel='" + del_tel + '\'' +
                ", del_state=" + del_state +
                ", del_date='" + del_date + '\'' +
                ", res_date='" + res_date + '\'' +
                ", del_code='" + del_code + '\'' +
                '}';
    }

    public int getDel_no() {
        return del_no;
    }

    public void setDel_no(int del_no) {
        this.del_no = del_no;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getCustom_id() {
        return custom_id;
    }

    public void setCustom_id(String custom_id) {
        this.custom_id = custom_id;
    }

    public String getPay_resdate() {
        return pay_resdate;
    }

    public void setPay_resdate(String pay_resdate) {
        this.pay_resdate = pay_resdate;
    }

    public String getDel_addr() {
        return del_addr;
    }

    public void setDel_addr(String del_addr) {
        this.del_addr = del_addr;
    }

    public String getCus_tel() {
        return cus_tel;
    }

    public void setCus_tel(String cus_tel) {
        this.cus_tel = cus_tel;
    }

    public String getDel_com() {
        return del_com;
    }

    public void setDel_com(String del_com) {
        this.del_com = del_com;
    }

    public String getDel_tel() {
        return del_tel;
    }

    public void setDel_tel(String del_tel) {
        this.del_tel = del_tel;
    }

    public int getDel_state() {
        return del_state;
    }

    public void setDel_state(int del_state) {
        this.del_state = del_state;
        String[] state_list = {"입고 중", "출하 중", "상차", "하차", "캠프 도착", "배송 중", "배송 도착"};
        this.current_state = state_list[del_state];
    }

    public String getCurrent_state() {
        return current_state;
    }

    public void setCurrent_state(String current_state) {
        this.current_state = current_state;
    }

    public String getDel_date() {
        return del_date;
    }

    public void setDel_date(String del_date) {
        this.del_date = del_date;
    }

    public String getRes_date() {
        return res_date;
    }

    public void setRes_date(String res_date) {
        this.res_date = res_date;
    }

    public String getDel_code() {
        return del_code;
    }

    public void setDel_code(String del_code) {
        this.del_code = del_code;
    }
}
