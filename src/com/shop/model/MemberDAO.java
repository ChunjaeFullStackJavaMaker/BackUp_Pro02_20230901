package com.shop.model;

import com.shop.dto.Member;
import com.shop.dto.Product;
import com.shop.util.AES256;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


// 완료
public class MemberDAO {
    static Connection conn = null;
    static PreparedStatement pstmt = null;
    static ResultSet rs = null;
    String key = "%02x";

    public int getCount() {
        DBConnect con = new MariaDBCon();
        int cnt = 0;
        try {
            conn = con.connect();
            pstmt = conn.prepareStatement(DBConnect.MEMBER_COUNT_ALL);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                cnt = rs.getInt("cnt");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(rs, pstmt, conn);
        }
        return cnt;
    }

    public List<Member> getMemberList(int no) {
        List<Member> memList = new ArrayList<>();
        DBConnect con = new MariaDBCon();
        try {
            conn = con.connect();
            pstmt = conn.prepareStatement(DBConnect.MEMBER_SELECT_ALL);
            pstmt.setInt(1, no);
            rs = pstmt.executeQuery();
            while(rs.next()){
                Member member = new Member();
                member.setId(rs.getString("id"));
                member.setNAME(rs.getString("name"));
                member.setEmail(rs.getString("email"));
                member.setBirth(rs.getString("birth"));
                memList.add(member);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(rs, pstmt, conn);
        }
        return memList;
    }

    public Member getMember(String id) {
        Member mem = new Member();
        DBConnect con = new MariaDBCon();
        try {
            conn = con.connect();

            pstmt = conn.prepareStatement(DBConnect.MEMBER_SELECT_LOG);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                mem.setId(rs.getString("id"));
                mem.setPw(rs.getString("pw"));
                mem.setNAME(rs.getString("NAME"));
                mem.setEmail(rs.getString("email"));
                mem.setTel(rs.getString("tel"));
                mem.setBirth(rs.getString("birth"));
                mem.setAddress(rs.getString("address"));
                mem.setResdate(rs.getString("resdate"));
                mem.setPOINT(rs.getInt("POINT"));
                mem.setGrade(rs.getString("grade"));
                mem.setPer(rs.getInt("per"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(rs, pstmt, conn);
        }
        return mem;
    }

    public boolean login(String id, String pw) {
        boolean pass = false;
        DBConnect con = new MariaDBCon();
        String qpw = "";

        try {
            conn = con.connect();
            pstmt = conn.prepareStatement(DBConnect.MEMBER_SELECT_LOG);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                try {
                    qpw = AES256.decryptAES256(rs.getString("pw"), key);
                } catch (Exception e) {
                    throw new RuntimeException(e);
                }
                if (pw.equals(qpw)) {
                    pass = true;
                } else {
                    pass = false;
                }
            } else {
                pass = false;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(rs, pstmt, conn);
        }
        return pass;
    }

    public boolean idCheck(String id) {
        Member member = new Member();
        DBConnect con = new MariaDBCon();
        boolean pass = false;
        try {
            conn = con.connect();
            pstmt = conn.prepareStatement(DBConnect.MEMBER_SELECT_ONE);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                pass = false;
            } else {
                pass = true;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(rs, pstmt, conn);
        }
        return pass;
    }

    public int addMember(Member user) {
        int cnt = 0;
        DBConnect con = new MariaDBCon();
        try {
            conn = con.connect();
            System.out.println(user.toString());
            pstmt = conn.prepareStatement(DBConnect.MEMBER_INSERT);
            pstmt.setString(1, user.getId());
            pstmt.setString(2, user.getPw());
            pstmt.setString(3, user.getNAME());
            pstmt.setString(4, user.getTel());
            pstmt.setString(5, user.getEmail());
            pstmt.setString(6, user.getBirth());
            pstmt.setString(7, user.getAddress());
            cnt = pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(pstmt, conn);
        }
        return cnt;
    }


    public int updateMember(Member user){
        int cnt =0;
        DBConnect con = new MariaDBCon();
        try{
            conn = con.connect();
            pstmt = conn.prepareStatement(DBConnect.MEMBER_UPDATE);
            pstmt.setString(1,user.getPw());
            pstmt.setString(2,user.getAddress());
            pstmt.setString(3,user.getTel());
            pstmt.setString(4,user.getEmail());
            pstmt.setString(5,user.getBirth());
            pstmt.setString(6,user.getId());
            cnt = pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally{
            con.close(pstmt,conn);
        }
        return cnt;
    }





    public int deleteMember(String id) {
        int cnt = 0;
        DBConnect con = new MariaDBCon();
        try {
            conn = con.connect();
            pstmt = conn.prepareStatement(DBConnect.MEMBER_DELETE);
            pstmt.setString(1, id);
            cnt = pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(pstmt, conn);
            con.close(rs, pstmt, conn);
        }
        return cnt;
    }
}
