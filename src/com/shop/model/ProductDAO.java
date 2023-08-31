package com.shop.model;

import com.shop.dto.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ProductDAO {
    static Connection conn = null;
    static PreparedStatement pstmt = null;
    static ResultSet rs = null;
    String sql = "";

    public List<Product> getProductList() {
        List<Product> proList = new ArrayList<>();
        DBConnect con = new MariaDBCon();
        try {
            conn = con.connect();
            pstmt = conn.prepareStatement(DBConnect.PRODUCT_SELECT_ALL);
            rs = pstmt.executeQuery();
            while(rs.next()){
                Product pro = new Product();
                pro.setPro_no(rs.getInt("pro_no"));
                pro.setCate_id(rs.getString("cate_id"));
                pro.setPro_cate_no(rs.getString("pro_cate_no"));
                pro.setPrice(rs.getInt("price"));
                pro.setTitle(rs.getString("title"));
                pro.setDescription(rs.getString("description"));
                pro.setPro_content(rs.getString("pro_content"));
                pro.setThumb(rs.getString("thumb"));
                pro.setImg_src(rs.getString("img_src"));
                pro.setRegdate(rs.getString("regdate"));
                proList.add(pro);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(rs, pstmt, conn);
        }
        return proList;
    }

    //상품 목록
    public List<Product> getProductList(int no){
        List<Product> proList = new ArrayList<>();
        DBConnect con = new MariaDBCon();
        try {
            conn = con.connect();
            pstmt = conn.prepareStatement(DBConnect.PRODUCT_SELECT_RANGE);
            pstmt.setInt(1, no);
            rs = pstmt.executeQuery();
            while(rs.next()){
                Product pro = new Product();
                pro.setPro_no(rs.getInt("pro_no"));
                pro.setCate_id(rs.getString("cate_id"));
                pro.setPro_cate_no(rs.getString("pro_cate_no"));
                pro.setPrice(rs.getInt("price"));
                pro.setTitle(rs.getString("title"));
                pro.setDescription(rs.getString("description"));
                pro.setPro_content(rs.getString("pro_content"));
                pro.setThumb(rs.getString("thumb"));
                pro.setImg_src(rs.getString("img_src"));
                pro.setRegdate(rs.getString("regdate"));
                proList.add(pro);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(rs, pstmt, conn);
        }
        return proList;
    }

    public int getCount() {
        DBConnect con = new MariaDBCon();
        int cnt = 0;
        try {
            conn = con.connect();
            pstmt = conn.prepareStatement(DBConnect.PRODUCT_COUNT_ALL);
            rs = pstmt.executeQuery();
            if(rs.next()){
                cnt = rs.getInt("cnt");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(rs, pstmt, conn);
        }
        return cnt;
    }

    //카테고리
    public List<Product> getCateProductList(String cate){
        List<Product> proList = new ArrayList<>();
        DBConnect con = new MariaDBCon();
        try {
            conn = con.connect();
            pstmt = conn.prepareStatement(DBConnect.PRODUCT_SELECT_CATE);
            pstmt.setString(1, cate);
            rs = pstmt.executeQuery();
            while(rs.next()){
                Product pro = new Product();
                pro.setPro_no(rs.getInt("pro_no"));
                pro.setCate_id(rs.getString("cate_id"));
                pro.setPro_cate_no(rs.getString("pro_cate_no"));
                pro.setPrice(rs.getInt("price"));
                pro.setTitle(rs.getString("title"));
                pro.setDescription(rs.getString("description"));
                pro.setPro_content(rs.getString("pro_content"));
                pro.setThumb(rs.getString("thumb"));
                pro.setImg_src(rs.getString("img_src"));
                pro.setRegdate(rs.getString("regdate"));
                proList.add(pro);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(rs, pstmt, conn);
        }
        return proList;
    }

    public Product getProduct(int pro_no){
        Product pro = new Product();
        DBConnect con = new MariaDBCon();
        try {
            conn = con.connect();
            pstmt = conn.prepareStatement(DBConnect.PRODUCT_SELECT_ONE);
            pstmt.setInt(1, pro_no);
            rs = pstmt.executeQuery();
            if(rs.next()){
                pro.setPro_no(rs.getInt("pro_no"));
                pro.setPro_cate_no(rs.getString("pro_cate_no"));
                pro.setCate_id(rs.getString("cate_id"));
                pro.setPrice(rs.getInt("price"));
                pro.setTitle(rs.getString("title"));
                pro.setDescription(rs.getString("description"));
                pro.setPro_content(rs.getString("pro_content"));
                pro.setThumb(rs.getString("thumb"));
                pro.setImg_src(rs.getString("img_src"));
                pro.setRegdate(rs.getString("regdate"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(rs, pstmt, conn);
        }
        return pro;
    }

    public AddInfo getAddInfo(int pro_no){
        AddInfo info = new AddInfo();
        DBConnect con = new MariaDBCon();
        try {
            conn = con.connect();
            pstmt = conn.prepareStatement(DBConnect.PRODUCT_VIDEO);
            pstmt.setInt(1, pro_no);
            rs = pstmt.executeQuery();
            if (rs.next()){
                info.setAdd_no(rs.getInt("add_no"));
                info.setPro_no(rs.getInt("pro_no"));
                info.setTitle(rs.getString("title"));
                info.setMovie(rs.getString("movie"));
                info.setResdate(rs.getString("resdate"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(rs, pstmt, conn);
        }
        return info;
    }

    //상품 등록
    public int addProduct(Product add){
        int cnt = 0;
        DBConnect con = new MariaDBCon();
        try {
            conn = con.connect();
            pstmt = conn.prepareStatement(DBConnect.PRODUCT_INSERT);
            pstmt.setString(1,add.getCate_id());
            pstmt.setInt(2, add.getPrice());
            pstmt.setString(3, add.getTitle());
            pstmt.setString(4, add.getDescription());
            pstmt.setString(5, add.getPro_content());
            pstmt.setString(6, add.getThumb());
            pstmt.setString(7, add.getImg_src());
            cnt = pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(pstmt, conn);
        }

        con = new MariaDBCon();
        conn = con.connect();
        try {
            pstmt = conn.prepareStatement(DBConnect.PRODUCT_INSERT_UPDATE);
            cnt = cnt + pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(pstmt, conn);
        }
        return cnt;
    }

    public int addAddInfo(AddInfo addInfo) {
        int cnt = 0;
        DBConnect con = new MariaDBCon();
        conn = con.connect();
        try {
            pstmt = conn.prepareStatement(DBConnect.INSERT_ADDINFO);
            pstmt.setInt(1, addInfo.getPro_no());
            pstmt.setString(2, addInfo.getTitle());
            pstmt.setString(3, addInfo.getMovie());
            cnt = pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return cnt;
    }

    public int latestProNo() {
        int result = 0;

        DBConnect con = new MariaDBCon();
        conn = con.connect();
        try {
            pstmt = conn.prepareStatement(DBConnect.LATEST_PRO_NO);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                result = rs.getInt("pro_no");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return result;
    }

    public List<Category> getCategoryList(){
        List<Category> cateList = new ArrayList<Category>();
        DBConnect con = new MariaDBCon();
        conn = con.connect();
        try {
            pstmt = conn.prepareStatement(DBConnect.CATEGORY_LOAD);
            rs = pstmt.executeQuery();
            while(rs.next()){
                Category cate = new Category();
                cate.setCate_no(rs.getString("cate_no"));
                cate.setCate_name(rs.getString("cate_name"));
                cateList.add(cate);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(pstmt, conn);
        }
        return cateList;
    }

    //상품 정보 수정
    public int updateProduct(Product pro){
        int cnt =0;
        DBConnect con = new MariaDBCon();
        conn = con.connect();

        try {
            pstmt = conn.prepareStatement(DBConnect.PRODUCT_UPDATE);
            pstmt.setInt(1, pro.getPrice());
            pstmt.setString(2, pro.getTitle());
            pstmt.setString(3, pro.getDescription());
            pstmt.setString(4, pro.getPro_content());
            pstmt.setInt(5, pro.getPro_no());
            cnt = pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(pstmt, conn);
        }
        return cnt;
    }

    //상품 삭제
    public int delProduct(int pro_no){
        int cnt =0;
        DBConnect con = new MariaDBCon();
        conn = con.connect();
        try {
            pstmt = conn.prepareStatement(DBConnect.PRODUCT_DELETE);
            pstmt.setInt(1, pro_no);
            cnt = pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(pstmt, conn);
        }
        return cnt;
    }

    //재고
    public int getAmount(int pro_no){
        int amount = 0;
        DBConnect con = new MariaDBCon();
        try {
            conn = con.connect();
            pstmt = conn.prepareStatement(DBConnect.INVENTORY_SELECT_ONE);
            pstmt.setInt(1, pro_no);
            rs = pstmt.executeQuery();
            if(rs.next()){
                amount = rs.getInt("amount");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(rs, pstmt, conn);
        }
        return amount;
    }

    public List<AdminHotProVO> getAdminHotProduct() {
        List<AdminHotProVO> hotList = new ArrayList<>();
        DBConnect con = new MariaDBCon();
        conn = con.connect();
        try {
            pstmt = conn.prepareStatement(DBConnect.ADMIN_HOT_PRODUCT_LIST);
            rs = pstmt.executeQuery();
            while(rs.next()) {
                AdminHotProVO adminHotProduct = new AdminHotProVO();
                adminHotProduct.setTitle(rs.getString("title"));
                adminHotProduct.setSum_amount(rs.getInt("sum_amount"));
                adminHotProduct.setSum_price(rs.getInt("sum_price"));
                hotList.add(adminHotProduct);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return hotList;
    }

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

    //출고 관리
    public int addReceive(Receive rec){
        int cnt =0;
        DBConnect con = new MariaDBCon();
        conn=con.connect();

        try {
            pstmt= conn.prepareStatement(DBConnect.RECEIVE_INSERT);
            pstmt.setInt(1, rec.getPro_no());
            pstmt.setInt(2,rec.getAmount());
            pstmt.setInt(3,rec.getRe_price());
            cnt=pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally {
            con.close(pstmt,conn);
        }
        return cnt;
    }
}