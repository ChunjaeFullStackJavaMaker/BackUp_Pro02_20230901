package com.shop.dto;

public class ProfitVO {

    private String date;
    private int sales = 0;
    private int profit = 0;

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getSales() {
        return sales;
    }

    public void setSales(int sales) {
        this.sales = sales;
    }

    public int getProfit() {
        return profit;
    }

    public void setProfit(int profit) {
        this.profit = profit;
    }

    @Override
    public String toString() {
        return "ProfitVO{" +
                "date='" + date + '\'' +
                ", sales=" + sales +
                ", profit=" + profit +
                '}';
    }
}
