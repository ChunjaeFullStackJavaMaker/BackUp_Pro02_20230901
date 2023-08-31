package com.shop.dto;

public class AddInfo {
    private int add_no;
    private int pro_no; //상품 번호
    private String title; //상품 등록 제목
    private String movie; //상품 동영상
    private String resdate; //상품 등록일

    public int getAdd_no() {
        return add_no;
    }

    public void setAdd_no(int add_no) {
        this.add_no = add_no;
    }

    public int getPro_no() {
        return pro_no;
    }

    public void setPro_no(int pro_no) {
        this.pro_no = pro_no;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getMovie() {
        return movie;
    }

    public void setMovie(String movie) {
        this.movie = movie;
    }

    public String getResdate() {
        return resdate;
    }

    public void setResdate(String resdate) {
        this.resdate = resdate;
    }

    @Override
    public String toString() {
        return "AddInfo{" +
                "add_no=" + add_no +
                ", pro_no=" + pro_no +
                ", title='" + title + '\'' +
                ", movie='" + movie + '\'' +
                ", resdate='" + resdate + '\'' +
                '}';
    }
}
