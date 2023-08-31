package com.shop.dto;

public class AdminHotProVO {

    private String title;
    private int sum_amount;
    private int sum_price;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getSum_amount() {
        return sum_amount;
    }

    public void setSum_amount(int sum_amount) {
        this.sum_amount = sum_amount;
    }

    public int getSum_price() {
        return sum_price;
    }

    public void setSum_price(int sum_price) {
        this.sum_price = sum_price;
    }

    @Override
    public String toString() {
        return "AdminHotProVO{" +
                "title='" + title + '\'' +
                ", sum_amount=" + sum_amount +
                ", sum_price=" + sum_price +
                '}';
    }
}
