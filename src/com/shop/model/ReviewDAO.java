package com.shop.model;

import com.shop.dto.PaymentVO;
import com.shop.dto.Review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ReviewDAO {
    static Connection conn = null;
    static PreparedStatement pstmt = null;
    static ResultSet rs = null;
    String sql = "";

    //상품 리뷰 불러오기
    public List<Review> getReview(int pro_no){
        List<Review> reviewList = new ArrayList<>();
        DBConnect con = new MariaDBCon();

        try {
            conn = con.connect();
            pstmt = conn.prepareStatement(DBConnect.REVIEW_SELECT);
            pstmt.setInt(1, pro_no);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                Review rev = new Review();
                rev.setRev_no(rs.getInt("rev_no"));
                rev.setMem_id(rs.getString("mem_id"));
                rev.setPay_no(rs.getInt("pay_no"));
                rev.setPro(rs.getString("pro"));
                rev.setStar(rs.getInt("star"));
                rev.setContent(rs.getString("content"));

                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                Date d = sdf.parse(rs.getString("regdate"));
                rev.setRegdate(sdf.format(d));

                rev.setPro_no(rs.getInt("pro_no"));
                reviewList.add(rev);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(rs,pstmt,conn);
        } return reviewList;
    }

    //상품 리뷰 등록하기
    public int addReview(Review rev) {
        int cnt = 0;
        DBConnect con = new MariaDBCon();
        conn = con.connect();

        try {
            pstmt = conn.prepareStatement(DBConnect.REVIEW_INSERT);
            pstmt.setString(1, rev.getMem_id());
            pstmt.setInt(2,rev.getPay_no());
            pstmt.setString(3, rev.getPro());
            pstmt.setInt(4,rev.getStar());
            pstmt.setString(5, rev.getContent());
            pstmt.setInt(6, rev.getPro_no());
            cnt = pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(pstmt, conn);
        }
        return cnt;
    }

    //리뷰 리스트
    public List<Review>  getByIdReview(String id){
        List<Review> reviewList = new ArrayList<>();
        DBConnect con = new MariaDBCon();
        conn = con.connect();
        try {
            pstmt = conn.prepareStatement(DBConnect.REVIEW_SELECT_CID);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            if(rs.next()){
                Review re = new Review();
                re.setRev_no(rs.getInt("rev_no"));
                re.setMem_id(rs.getString("mem_id"));
                re.setPay_no(rs.getInt("pay_no"));
                re.setPro(rs.getString("pro"));
                re.setStar(rs.getInt("star"));
                re.setContent(rs.getString("content"));
                re.setRegdate(rs.getString("regdate"));
                re.setPro_no(rs.getInt("pro_no"));
                reviewList.add(re);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(rs, pstmt, conn);
        }
        return reviewList;
    }

    //리뷰 삭제
    public int delReview(int rev_no){
        int cnt =0;
        DBConnect con = new MariaDBCon();
        conn = con.connect();
        try {
            pstmt = conn.prepareStatement(DBConnect.REVIEW_DELETE);
            pstmt.setInt(1, rev_no);
            cnt = pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(pstmt, conn);
        }
        return cnt;
    }
}