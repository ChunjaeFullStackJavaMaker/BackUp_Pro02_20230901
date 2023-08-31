package com.shop.model;

import com.shop.dto.Notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class NoticeDAO {
    static Connection conn = null;
    static PreparedStatement pstmt = null;
    static ResultSet rs = null;

    public List<Notice> getNoticeList(){
        List<Notice> notiList = new ArrayList<>();
        DBConnect con = new MariaDBCon();
        try {
            conn = con.connect();
            pstmt = conn.prepareStatement(DBConnect.NOTICE_SELECT_ALL);
            rs = pstmt.executeQuery();
            while(rs.next()){
                Notice noti = new Notice();
                noti.setNo(rs.getInt("no"));
                noti.setTitle(rs.getString("title"));
                noti.setContent(rs.getString("content"));
                noti.setResdate(rs.getString("resdate"));
                noti.setVisit(rs.getInt("visit"));
                notiList.add(noti);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(rs, pstmt, conn);
        }
        return notiList;
    }

    public List<Notice> getNoticeList(int no){
        List<Notice> notiList = new ArrayList<>();
        DBConnect con = new MariaDBCon();
        try {
            conn = con.connect();
            pstmt = conn.prepareStatement(DBConnect.NOTICE_SELECT_RANGE);
            pstmt.setInt(1, no);
            rs = pstmt.executeQuery();
            while(rs.next()){
                Notice noti = new Notice();
                noti.setNo(rs.getInt("no"));
                noti.setTitle(rs.getString("title"));
                noti.setContent(rs.getString("content"));
                noti.setResdate(rs.getString("resdate"));
                noti.setVisit(rs.getInt("visit"));
                notiList.add(noti);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(rs, pstmt, conn);
        }
        return notiList;
    }

    public Notice getNotice(int no){
        Notice noti = new Notice();
        DBConnect con = new MariaDBCon();
        conn = con.connect();
        if(conn!=null){
            System.out.println("PostgreSQL 연결 성공");
        }

        try {
            pstmt = conn.prepareStatement(DBConnect.NOTICE_SELECT_ONE);
            pstmt.setInt(1, no);
            rs = pstmt.executeQuery();

            if(rs.next()){
                noti.setNo(rs.getInt("no"));
                noti.setTitle(rs.getString("title"));
                noti.setContent(rs.getString("content"));
                noti.setResdate(rs.getString("resdate"));
                noti.setVisit(rs.getInt("visit"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(rs, pstmt, conn);
        }
       return noti;
    }

    public int addNotice(Notice noti){
        int cnt = 0;
        DBConnect con = new MariaDBCon();
        conn = con.connect();
        try {
            pstmt = conn.prepareStatement(DBConnect.NOTICE_INSERT);
            pstmt.setString(1, noti.getTitle());
            pstmt.setString(2, noti.getContent());
            cnt = pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(pstmt, conn);
        }
        return cnt;
    }

    public int updateNotice(Notice noti){
        int cnt = 0;
        DBConnect con = new MariaDBCon();
        conn = con.connect();
        if(conn!=null){
            System.out.println("PostgreSQL 연결 성공");
        }

        String sql = "update notice set title=?, content=? where no=?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, noti.getTitle());
            pstmt.setString(2, noti.getContent());
            pstmt.setInt(3, noti.getNo());
            cnt = pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(pstmt, conn);
        }
        return cnt;
    }

    public int deleteNotice(int no){
        int cnt = 0;
        DBConnect con = new MariaDBCon();
        conn = con.connect();
        if(conn!=null){
            System.out.println("PostgreSQL 연결 성공");
        }

        String sql = "delete from notice where no=?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, no);
            cnt = pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(pstmt, conn);
        }
        return cnt;
    }

    public int getCount(){
        int cnt = 0;
        DBConnect con = new MariaDBCon();
        conn = con.connect();
        if(conn!=null){
            System.out.println("PostgreSQL 연결 성공");
        }

        try {
            pstmt = conn.prepareStatement(DBConnect.NOTICE_COUNT);
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

    public int getCount(String searchType, String kwd){
        int cnt = 0;
        DBConnect con = new MariaDBCon();
        conn = con.connect();
        if(conn!=null){
            System.out.println("PostgreSQL 연결 성공");
        }

        try {
            if(searchType.equals("title")) {
                pstmt = conn.prepareStatement(DBConnect.NOTICE_COUNT_TITLE);
                pstmt.setString(1, "%" + kwd + "%");
            } else if(searchType.equals("content")){
                pstmt = conn.prepareStatement(DBConnect.NOTICE_COUNT_CONTENT);
                pstmt.setString(1, "%" + kwd + "%");
            } else {
                pstmt = conn.prepareStatement(DBConnect.NOTICE_COUNT_ALL);
                pstmt.setString(1, "%" + kwd + "%");
                pstmt.setString(2, "%" + kwd + "%");
            }
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

    public List<Notice> getNoticeList(String searchType, String kwd, int no) {
        List<Notice> notiList = new ArrayList<>();
        DBConnect con = new MariaDBCon();
        try {
            conn = con.connect();
            if(searchType.equals("title")) {
                pstmt = conn.prepareStatement(DBConnect.NOTICE_SELECT_TITLE_RANGE);
                pstmt.setString(1, "%"+kwd+"%");
                pstmt.setInt(2, no);
            } else if(searchType.equals("content")){
                pstmt = conn.prepareStatement(DBConnect.NOTICE_SELECT_CONTENT_RANGE);
                pstmt.setString(1, "%"+kwd+"%");
                pstmt.setInt(2, no);
            } else {
                pstmt = conn.prepareStatement(DBConnect.NOTICE_SELECT_ALL_RANGE);
                pstmt.setString(1, "%"+kwd+"%");
                pstmt.setString(2, "%"+kwd+"%");
                pstmt.setInt(3, no);
            }
            rs = pstmt.executeQuery();
            while(rs.next()){
                Notice noti = new Notice();
                noti.setNo(rs.getInt("no"));
                noti.setTitle(rs.getString("title"));
                noti.setContent(rs.getString("content"));
                noti.setResdate(rs.getString("resdate"));
                noti.setVisit(rs.getInt("visit"));
                notiList.add(noti);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(rs, pstmt, conn);
        }
        return notiList;
    }

    public int getStartPost(String searchType, String kwd){
        int startPost = 0;
        return startPost;
    }
}
