package com.shop.dto;

public class Member {
    private String id;
    private String pw;
    private String NAME;
    private String email;
    private String tel;
    private String birth;
    private String address;
    private String resdate;
    private int POINT;
    private String grade;
    private int per;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPw() {
        return pw;
    }

    public void setPw(String pw) {
        this.pw = pw;
    }

    public String getNAME() {
        return NAME;
    }

    public void setNAME(String NAME) {
        this.NAME = NAME;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getBirth() {
        return birth;
    }

    public void setBirth(String birth) {
        this.birth = birth;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String addresss) {
        this.address = addresss;
    }

    public String getResdate() {
        return resdate;
    }

    public void setResdate(String resdate) {
        this.resdate = resdate;
    }

    public int getPOINT() {
        return POINT;
    }

    public void setPOINT(int POINT) {
        this.POINT = POINT;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public int getPer() {
        return per;
    }

    public void setPer(int per) {
        this.per = per;
    }

    @Override
    public String toString() {
        return "Member{" +
                "id='" + id + '\'' +
                ", pw='" + pw + '\'' +
                ", NAME='" + NAME + '\'' +
                ", email='" + email + '\'' +
                ", tel='" + tel + '\'' +
                ", birth='" + birth + '\'' +
                ", address='" + address + '\'' +
                ", resdate='" + resdate + '\'' +
                ", POINT=" + POINT +
                ", grade='" + grade + '\'' +
                ", per=" + per +
                '}';
    }
}
