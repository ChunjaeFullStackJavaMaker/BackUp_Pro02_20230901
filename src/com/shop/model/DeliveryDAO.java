package com.shop.model;

import com.shop.dto.Delivery;
import com.shop.dto.DeliveryVO;
import com.shop.dto.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DeliveryDAO {
    static Connection conn = null;
    static PreparedStatement pstmt = null;
    static ResultSet rs = null;
    String sql = "";

    public int addDelivery(Delivery del){
        int cnt = 0;
        DBConnect con = new MariaDBCon();
        conn = con.connect();
        try {
            pstmt = conn.prepareStatement(DBConnect.DELIVERY_INSERT);
            pstmt.setInt(1, del.getPay_no());
            pstmt.setString(2, del.getCustom_id());
            pstmt.setString(3, del.getDel_addr());
            pstmt.setString(4, del.getCus_tel());
            cnt = pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(pstmt, conn);
        }
        return cnt;
    }

    public Delivery getByPaynoDelivery(int pay_no){
        Delivery del = new Delivery();
        DBConnect con = new MariaDBCon();
        conn = con.connect();
        try {
            pstmt = conn.prepareStatement(DBConnect.DELIVERY_SELECT_PAYNO);
            pstmt.setInt(1, pay_no);
            rs = pstmt.executeQuery();
            if(rs.next()){
                del.setDel_no(rs.getInt("del_no"));
                del.setPay_no(rs.getInt("pay_no"));
                del.setCustom_id(rs.getString("custom_id"));
                del.setDel_addr(rs.getString("del_addr"));
                del.setCus_tel(rs.getString("cus_tel"));
                del.setDel_com(rs.getString("del_com"));
                del.setDel_tel(rs.getString("del_tel"));
                del.setDel_state(rs.getInt("del_state"));
                del.setDel_date(rs.getString("del_date"));
                del.setRes_date(rs.getString("res_date"));
                del.setDel_code(rs.getString("del_code"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(rs, pstmt, conn);
        }
        return del;
    }

    // DeliveryVO 정보 가져오기
    public DeliveryVO getDeliveryVO(int del_no) {
        DeliveryVO del = new DeliveryVO();
        DBConnect con = new MariaDBCon();
        conn = con.connect();
        try {
            pstmt = conn.prepareStatement(DBConnect.DELIVERY_PRODUCT_SELECT_ONE);
            pstmt.setInt(1, del_no);
            rs = pstmt.executeQuery();
            if(rs.next()){
                del.setDel_no(rs.getInt("del_no"));
                del.setTitle(rs.getString("title"));
                del.setCustom_id(rs.getString("custom_id"));
                del.setPay_resdate(rs.getString("pay_resdate"));
                del.setDel_addr(rs.getString("del_addr"));
                del.setCus_tel(rs.getString("cus_tel"));
                del.setDel_com(rs.getString("del_com"));
                del.setDel_tel(rs.getString("del_tel"));
                del.setDel_state(rs.getInt("del_state"));
                del.setDel_date(rs.getString("del_date"));
                del.setRes_date(rs.getString("res_date"));
                del.setDel_code(rs.getString("del_code"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(rs, pstmt, conn);
        }
        return del;
    }

    // 배송 정보 가져오기
    public List<DeliveryVO> getAdminDeliveryList() {
        List<DeliveryVO> delList = new ArrayList<>();
        DBConnect con = new MariaDBCon();

        conn = con.connect();
        try {
            pstmt = conn.prepareStatement(DBConnect.DELIVERY_PRODUCT_SELECT_ALL);
            rs = pstmt.executeQuery();
            while(rs.next()){
                DeliveryVO del = new DeliveryVO();
                del.setDel_no(rs.getInt("del_no"));
                del.setTitle(rs.getString("title"));
                del.setCustom_id(rs.getString("custom_id"));
                del.setDel_state(rs.getInt("del_state"));
                del.setPay_resdate(rs.getString("pay_resdate"));
                delList.add(del);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(rs, pstmt, conn);
        }
        return delList;
    }

    // 배송상태 정보 가져오기
    public List<DeliveryVO> getDelCodeList() {
        List<DeliveryVO> delList = new ArrayList<>();
        DBConnect con = new MariaDBCon();

        conn = con.connect();
        try {
            pstmt = conn.prepareStatement(DBConnect.DELCODE_GROUP_LIST);
            rs = pstmt.executeQuery();
            while (rs.next()){
                DeliveryVO del = new DeliveryVO();
                del.setDel_no(rs.getInt("del_no"));
                del.setDel_code(rs.getString("del_code"));
                del.setTitle(rs.getString("title"));
                del.setCustom_id(rs.getString("custom_id"));
                del.setPay_resdate(rs.getString("pay_resdate"));
                del.setDel_date(rs.getString("del_date"));
                del.setRes_date(rs.getString("res_date"));
                del.setDel_state(rs.getInt("del_state"));
                delList.add(del);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(rs, pstmt, conn);
        }
        return delList;
    }

    public int updateDelivery(Delivery delivery) {
        int cnt =0;
        DBConnect con = new MariaDBCon();
        conn = con.connect();

        try {
            pstmt = conn.prepareStatement(DBConnect.DELIVERY_UPDATE);
            pstmt.setString(1, delivery.getDel_date());
            pstmt.setString(2, delivery.getRes_date());
            pstmt.setString(3, delivery.getDel_com());
            pstmt.setString(4, delivery.getDel_tel());
            pstmt.setString(5, delivery.getDel_code());
            pstmt.setInt(6, delivery.getDel_state());
            pstmt.setInt(7, delivery.getDel_no());
            cnt = pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(pstmt, conn);
        }
        return cnt;
    }

    public int updateDeliveryCode(Delivery delivery) {
        int cnt =0;
        DBConnect con = new MariaDBCon();
        conn = con.connect();

        try {
            pstmt = conn.prepareStatement(DBConnect.DELIVERY_UPDATE_WITH_DELCODE);
            pstmt.setString(1, delivery.getDel_date());
            pstmt.setString(2, delivery.getRes_date());
            pstmt.setString(3, delivery.getDel_com());
            pstmt.setString(4, delivery.getDel_tel());
            pstmt.setString(5, delivery.getDel_code());
            pstmt.setInt(6, delivery.getDel_state());
            pstmt.setString(7, delivery.getDel_code());
            cnt = pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(pstmt, conn);
        }
        return cnt;
    }

}
