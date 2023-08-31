package com.shop.controller.admin;

import com.shop.dto.Member;
import com.shop.model.MemberDAO;
import com.shop.util.Page;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/MemberMgmt.do")
public class MemberMgmt extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        MemberDAO dao = new MemberDAO();

        List<Member> memList = dao.getMemberList(0);
        Page pg = new Page();
        int total = dao.getCount();
        pg.makeBlock(1, total);
        pg.makeLastPageNum(total);
        pg.makePostStart(1, total);

        int curPageNum = 1;
        if(request.getParameter("page") != null) {
            curPageNum = Integer.parseInt(request.getParameter("page"));
            pg.makeBlock(curPageNum, total);
            pg.makeLastPageNum(total);
            pg.makePostStart(curPageNum, total);
            memList = dao.getMemberList(pg.getPostStart()-1);
        }

        request.setAttribute("memberList", memList);
        request.setAttribute("totalPageCount", pg.getTotalPageCount());
        request.setAttribute("pageBlockNum", pg.getPageBlockNum());
        request.setAttribute("totalBlockNum", pg.getTotalBlockNum());
        request.setAttribute("curPageNum", curPageNum);
        request.setAttribute("blockStartNum", pg.getBlockStartNum());
        request.setAttribute("blockLastNum", pg.getBlockLastNum());
        request.setAttribute("lastPageNum", pg.getLastPageNum());

        RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/admin/memberMgmt.jsp");
        view.forward(request, response);

    }
}
