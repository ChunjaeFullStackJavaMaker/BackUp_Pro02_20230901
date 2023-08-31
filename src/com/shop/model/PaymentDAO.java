package com.shop.model;

import com.shop.dto.*;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PaymentDAO {
    static Connection conn = null;
    static PreparedStatement pstmt = null;
    static ResultSet rs = null;
    String sql = "";

    public Payment getPayment(int pay_no) {
        Payment pay = new Payment();
        DBConnect con = new MariaDBCon();
        conn = con.connect();
        try {
            pstmt = conn.prepareStatement(DBConnect.PAYMENT_SELECT_ONE);
            pstmt.setInt(1, pay_no);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                pay.setPay_no(rs.getInt("pay_no"));
                pay.setCus_id(rs.getString("cus_id"));
                pay.setPro_no(rs.getInt("pro_no"));
                pay.setAmount(rs.getInt("amount"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(rs, pstmt, conn);
        }
        return pay;
    }

    public List<Payment> getMyPaymentList(String resdate, String cus_id) {
        List<Payment> payList = new ArrayList<>();
        DBConnect con = new MariaDBCon();
        conn = con.connect();
        try {
            System.out.println(resdate.concat(".000000"));
            System.out.println(resdate.concat(".999999"));
            pstmt = conn.prepareStatement(DBConnect.PAYMENT_SELECT_LIST);
            pstmt.setString(1, cus_id);
            pstmt.setTimestamp(2, Timestamp.valueOf(resdate));
            rs = pstmt.executeQuery();
            while(rs.next()) {
                Payment pay = new Payment();
                pay.setPay_no(rs.getInt("pay_no"));
                pay.setCus_id(rs.getString("cus_id"));
                pay.setPro_no(rs.getInt("pro_no"));
                pay.setAmount(rs.getInt("amount"));
                payList.add(pay);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return payList;
    }

    public int returnPaymentOne(int pay_no, int pro_no, int amount, String cus_id) {
        int cnt = 0;
        DBConnect con = new MariaDBCon();
        conn = con.connect();
        try {
            conn.setAutoCommit(false);

            // 1. 반품 시 결제 내용 제거
            pstmt = conn.prepareStatement(DBConnect.RETURN_PAYMENT);
            pstmt.setInt(1, pay_no);
            cnt = cnt + pstmt.executeUpdate();

            // 2. 반품 시 배송 정보 제거
            pstmt = conn.prepareStatement(DBConnect.RETURN_DELIVERY);
            pstmt.setInt(1, pay_no);
            cnt = cnt + pstmt.executeUpdate();

            // 3. 반품 시 출고 제거
            pstmt = conn.prepareStatement(DBConnect.RETURN_SERVE);
            pstmt.setInt(1, pay_no);
            cnt = cnt + pstmt.executeUpdate();

            // 4. 반품 시 장바구니에 다시 담기
            pstmt = conn.prepareStatement(DBConnect.RETURN_CART);
            pstmt.setString(1, cus_id);
            pstmt.setInt(2, pro_no);
            pstmt.setInt(3, amount);
            cnt = cnt + pstmt.executeUpdate();

            conn.commit();
            conn.setAutoCommit(true);
        } catch (SQLException e) {
            try {
                conn.rollback();
            } catch (SQLException ex) {
                throw new RuntimeException(ex);
            }
            throw new RuntimeException(e);
        } finally {
            con.close(pstmt, conn);
        }
        return cnt;
    }

    // 전체 취소/환불 처리
    public int returnPayments(String resdate, String cus_id, List<Payment> payList) {
        int cnt = 0;
        DBConnect con = new MariaDBCon();
        conn = con.connect();
        try {
            conn.setAutoCommit(false);

            // 1. 반품 시 배송 정보 제거
            pstmt = conn.prepareStatement(DBConnect.RETURN_DELIVERIES);
            pstmt.setTimestamp(1, Timestamp.valueOf(resdate));
            pstmt.setString(2, cus_id);
            cnt = cnt + pstmt.executeUpdate();

            // 2. 반품 시 출고 제거
            pstmt = conn.prepareStatement(DBConnect.RETURN_SERVES);
            pstmt.setTimestamp(1, Timestamp.valueOf(resdate));
            pstmt.setString(2, cus_id);
            cnt = cnt + pstmt.executeUpdate();

            // 3. 반품 시 결제 내용 제거
            pstmt = conn.prepareStatement(DBConnect.RETURN_PAYMENTS);
            pstmt.setString(1, cus_id);
            pstmt.setTimestamp(2, Timestamp.valueOf(resdate));
            cnt = cnt + pstmt.executeUpdate();

            // 4. 반품 시 장바구니에 다시 담기
            for(Payment pay:payList) {
                pstmt = conn.prepareStatement(DBConnect.RETURN_CART);
                pstmt.setString(1, cus_id);
                pstmt.setInt(2, pay.getPro_no());
                pstmt.setInt(3, pay.getAmount());
                cnt = cnt + pstmt.executeUpdate();
            }
            conn.commit();
            conn.setAutoCommit(true);
        } catch (SQLException e) {
            try {
                conn.rollback();
            } catch (SQLException ex) {
                throw new RuntimeException(ex);
            }
            throw new RuntimeException(e);
        } finally {
            con.close(pstmt, conn);
        }
        return cnt;
    }

    //결제 처리(PaymentDAO.addPayment(pay))
    public int addPayment(Payment pay){
        int cnt = 0;
        DBConnect con = new MariaDBCon();
        conn = con.connect();
        try {
            pstmt = conn.prepareStatement(DBConnect.SERVE_PAYMENT);
            pstmt.setString(1, pay.getCus_id());
            pstmt.setInt(2, pay.getPro_no());
            pstmt.setInt(3, pay.getAmount());
            pstmt.setString(4, pay.getPay_method());
            pstmt.setString(5, pay.getPay_com());
            pstmt.setString(6, pay.getCus_num());
            pstmt.setInt(7, pay.getPay_price());
            cnt = pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(pstmt, conn);
        }
        return cnt;
    }

    //출고 처리(PaymentDAO.addServe(serv))
    public int addServe(Serve serv){
        int cnt = 0;
        DBConnect con = new MariaDBCon();
        conn = con.connect();
        try {
            pstmt = conn.prepareStatement(DBConnect.SERVE_INSERT);
            pstmt.setInt(1, serv.getPro_no());
            pstmt.setInt(2, serv.getAmount());
            pstmt.setInt(3, serv.getSe_price());
            cnt = pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(pstmt, conn);
        }
        return cnt;
    }
    public int getPay_no(){
        int Pay_no = 0;
        DBConnect con = new MariaDBCon();
        conn = con.connect();
        try {
            pstmt = conn.prepareStatement(DBConnect.GET_PAY_NO);
            rs = pstmt.executeQuery();
            if(rs.next()){
                Pay_no = rs.getInt("pay_no");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(rs, pstmt, conn);
        }
        return Pay_no;
    }

    public List<PaymentVO> getCidPaymentList(String cid){
        List<PaymentVO> payList = new ArrayList<>();
        DBConnect con = new MariaDBCon();
        conn = con.connect();
        try {
            pstmt = conn.prepareStatement(DBConnect.PAYMENT_SELECT_CID);
            pstmt.setString(1, cid);
            rs = pstmt.executeQuery();
            while(rs.next()){
                PaymentVO pay = new PaymentVO();
                pay.setPay_no(rs.getInt("pay_no"));
                pay.setCus_id(rs.getString("cus_id"));
                pay.setPro_no(rs.getInt("pro_no"));
                pay.setAmount(rs.getInt("amount"));
                pay.setPay_method(rs.getString("pay_method"));
                pay.setPay_com(rs.getString("pay_com"));
                pay.setCus_num(rs.getString("cus_num"));
                pay.setPay_price(rs.getInt("pay_price"));
                pay.setTitle(getTitle(pay.getPro_no()));
                pay.setDel_state(getDel_state(pay.getPay_no()));
                payList.add(pay);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(rs, pstmt, conn);
        }
        return payList;
    }

    public String getTitle(int pno){
        ProductDAO dao = new ProductDAO();
        Product pro  = dao.getProduct(pno);
        return pro.getTitle();
    }

    public int getDel_state(int pay_no){
        DeliveryDAO dao = new DeliveryDAO();
        Delivery del  = dao.getByPaynoDelivery(pay_no);
        return del.getDel_state();
    }

    // 지난 1년 간의 매출액 불러오기
    public List<ProfitVO> getSaleList() {
        List<ProfitVO> voList = new ArrayList<>();
        DBConnect con = new MariaDBCon();
        conn = con.connect();
        try {
            pstmt = conn.prepareStatement(DBConnect.GET_SALES_LIST);
            rs = pstmt.executeQuery();
            while(rs.next()){
                ProfitVO vo = new ProfitVO();
                vo.setDate(rs.getString("pay_resdate"));
                vo.setSales(rs.getInt("sum"));
                voList.add(vo);
            }
            rs.close();
            pstmt.close();

            pstmt = conn.prepareStatement(DBConnect.GET_PROFIT_LIST);
            rs = pstmt.executeQuery();
            int idx = 0;
            while(rs.next()) {
                voList.get(idx).setProfit(rs.getInt("gross_profit"));
                idx++;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(rs, pstmt, conn);
        }
        return voList;
    }

}