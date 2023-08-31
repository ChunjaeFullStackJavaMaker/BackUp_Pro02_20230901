package com.shop.model;

import com.shop.dto.Qna;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class QnaDAO {
    static Connection conn = null;
    static PreparedStatement pstmt = null;
    static ResultSet rs = null;

    public List<Qna> getQnaList(){
        List<Qna> qnaList = new ArrayList<>();
        DBConnect con = new MariaDBCon();
        try {
            conn = con.connect();
            pstmt = conn.prepareStatement(DBConnect.QNA_SELECT_ALL);
            rs = pstmt.executeQuery();
            while(rs.next()){
                Qna qna = new Qna();
                qna.setQno(rs.getInt("qno"));
                qna.setTitle(rs.getString("title"));
                qna.setContent(rs.getString("content"));
                qna.setAuthor(rs.getString("author"));
                qna.setResdate(rs.getString("resdate"));
                qna.setVisit(rs.getInt("visit"));
                qna.setLev(rs.getInt("lev"));
                qna.setPar(rs.getInt("par"));
                qnaList.add(qna);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(rs, pstmt, conn);
        }
        return qnaList;
    }
}

