package com.shop.dto;

public class Receive {
    private int re_no;
    private int pro_no;
    private int amount;
    private int re_price;
    private String resdate;

    public int getRe_no() {
        return re_no;
    }

    public void setRe_no(int re_no) {
        this.re_no = re_no;
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

    public int getRe_price() {
        return re_price;
    }

    public void setRe_price(int re_price) {
        this.re_price = re_price;
    }

    public String getResdate() {
        return resdate;
    }

    public void setResdate(String resdate) {
        this.resdate = resdate;
    }

    @Override
    public String toString() {
        return "Receive{" +
                "re_no=" + re_no +
                ", pro_no=" + pro_no +
                ", amount=" + amount +
                ", re_price=" + re_price +
                ", resdate='" + resdate + '\'' +
                '}';
    }
}
