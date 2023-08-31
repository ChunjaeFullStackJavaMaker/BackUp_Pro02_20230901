package com.shop.model;

import com.shop.dto.Cart;
import com.shop.dto.Delivery;
import com.shop.dto.Payment;
import com.shop.dto.Serve;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MultiPattern {
    static DBConnect con = new MariaDBCon();
     Connection conn = null;
     PreparedStatement pstmt = null;
     ResultSet rs = null;

    public MultiPattern(){

    }
    public int pay(Delivery delivery, Payment payment, Serve serve, Cart cart){
        int pay_no=0;
        int del_no=0;
        conn = con.connect();
        String sql = "";

        try{
            conn.setAutoCommit(false);
            int cnt =0;

            //배송 처리
            sql ="insert into delivery values (default, 0, ?, ?, ?, '','',default,default,'','')";
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1, delivery.getCustom_id());
            pstmt.setString(2, delivery.getDel_addr());
            pstmt.setString(3, delivery.getCus_tel());
            cnt += pstmt.executeUpdate();

            //배송 번호(del_no) 불러오기
            sql ="select del_no from delivery order by del_no desc limit 1";
            pstmt=conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            if(rs.next()) {
                del_no = rs.getInt("del_no");
            }

            //결제 처리
            sql = "insert into payment(cus_id, cus_num, pro_no, amount, pay_method,pay_com, pay_price, pay_account,del_no) values ( ?, ?, ?, ?, ?, ?, ?, ?,?)";
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1, payment.getCus_id());
            pstmt.setString(2, payment.getCus_num());
            pstmt.setInt(3, payment.getPro_no());
            pstmt.setInt(4, payment.getAmount());
            pstmt.setString(5, payment.getPay_method());
            pstmt.setString(6, payment.getPay_com());
            pstmt.setInt(7, payment.getPay_price());
            pstmt.setString(8, payment.getPay_account());
            pstmt.setInt(9, del_no);
            cnt += pstmt.executeUpdate();

            // 추가된 결제 번호와 배송 번호 가져오기
//            sql = "SELECT pay_count, del_count FROM (SELECT COUNT(*) AS pay_count FROM payment) a, (SELECT COUNT(*) AS del_count FROM delivery) b";
//            pstmt = conn.prepareStatement(sql);
//            rs = pstmt.executeQuery();
//            int pay_count = 0;
//            int del_count = 0;
//            if(rs.next()) {
//                pay_count = rs.getInt("pay_count");
//                del_count = rs.getInt("del_count");
//            }

            // 배송 테이블에 결제 번호 업데이트
            sql = "update delivery set pay_no=del_no where pay_no=0";
            pstmt = conn.prepareStatement(sql);
            cnt += pstmt.executeUpdate();

            //출고 처리
            sql = "insert into serve values(default, ?, ?, ?, default)";
            pstmt=conn.prepareStatement(sql);
            pstmt.setInt(1, payment.getPro_no());
            pstmt.setInt(2, payment.getPay_price());
            pstmt.setInt(3, payment.getAmount());
            cnt += pstmt.executeUpdate();


            //출고 처리후 번호 반환
            sql = "select pay_no from payment order by pay_no desc limit 1";
            pstmt=conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            if(rs.next()){
                pay_no = rs.getInt("pay_no");
            }

            //카트 삭제 처리
            sql = "delete from cart where cart_no=?";
            pstmt=conn.prepareStatement(sql);
            pstmt.setInt(1, cart.getCart_no());
            cnt += pstmt.executeUpdate();

            conn.commit();
            conn.setAutoCommit(true);

            } catch (SQLException e) {
                try{
                    conn.rollback();
                } catch (SQLException ex) {
                    throw new RuntimeException(ex);
                }
        throw new RuntimeException(e);
        }
        return pay_no;
    }
}
