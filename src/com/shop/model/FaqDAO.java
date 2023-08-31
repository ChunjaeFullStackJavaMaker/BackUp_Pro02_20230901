package com.shop.model;

import com.shop.dto.Faq;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FaqDAO {
    static Connection conn = null;
    static PreparedStatement pstmt = null;
    static ResultSet rs = null;

    public List<Faq> getFaqList(){
        List<Faq> faqList = new ArrayList<>();
        DBConnect con = new MariaDBCon();
        try {
            conn = con.connect();
            pstmt = conn.prepareStatement(DBConnect.FAQ_SELECT_ALL);
            rs = pstmt.executeQuery();
            while(rs.next()){
                Faq faq = new Faq();
                faq.setFno(rs.getInt("fno"));
                faq.setQuestion(rs.getString("question"));
                faq.setAnswer(rs.getString("answer"));
                faq.setCnt(rs.getInt("cnt"));
                faqList.add(faq);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(rs, pstmt, conn);
        }
        return faqList;
    }
}
