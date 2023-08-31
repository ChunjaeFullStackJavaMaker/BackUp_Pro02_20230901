package com.shop.dto;

public class Serve {
    private int se_no;
    private int pro_no;
    private int se_price;
    private int amount;
    private int resdate;

    public int getSe_no() {
        return se_no;
    }

    public void setSe_no(int se_no) {
        this.se_no = se_no;
    }

    public int getPro_no() {
        return pro_no;
    }

    public void setPro_no(int pro_no) {
        this.pro_no = pro_no;
    }

    public int getSe_price() {
        return se_price;
    }

    public void setSe_price(int se_price) {
        this.se_price = se_price;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public int getResdate() {
        return resdate;
    }

    public void setResdate(int resdate) {
        this.resdate = resdate;
    }

    @Override
    public String toString() {
        return "Serve{" +
                "se_no=" + se_no +
                ", pro_no=" + pro_no +
                ", se_price=" + se_price +
                ", amount=" + amount +
                ", resdate=" + resdate +
                '}';
    }
}
