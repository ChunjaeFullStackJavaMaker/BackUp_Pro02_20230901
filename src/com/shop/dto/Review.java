package com.shop.dto;

public class Review {
    private int rev_no;
    private String mem_id;
    private int pay_no;
    private String pro;
    private int star;
    private String content;
    private String regdate;
    private int pro_no;

    public int getRev_no() {
        return rev_no;
    }

    public void setRev_no(int rev_no) {
        this.rev_no = rev_no;
    }

    public String getMem_id() {
        return mem_id;
    }

    public void setMem_id(String mem_id) {
        this.mem_id = mem_id;
    }

    public int getPay_no() {
        return pay_no;
    }

    public void setPay_no(int pay_no) {
        this.pay_no = pay_no;
    }

    public String getPro() {
        return pro;
    }

    public void setPro(String pro) {
        this.pro = pro;
    }

    public int getStar() {
        return star;
    }

    public void setStar(int star) {
        this.star = star;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getRegdate() {
        return regdate;
    }

    public void setRegdate(String regdate) {
        this.regdate = regdate;
    }

    public int getPro_no() {
        return pro_no;
    }

    public void setPro_no(int pro_no) {
        this.pro_no = pro_no;
    }

    @Override
    public String toString() {
        return "Review{" +
                "rev_no=" + rev_no +
                ", mem_id='" + mem_id + '\'' +
                ", pay_no=" + pay_no +
                ", pro='" + pro + '\'' +
                ", star=" + star +
                ", content='" + content + '\'' +
                ", regdate='" + regdate + '\'' +
                ", pro_no=" + pro_no +
                '}';
    }
}
