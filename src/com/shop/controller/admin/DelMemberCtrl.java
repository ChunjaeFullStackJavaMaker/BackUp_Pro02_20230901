package com.shop.controller.admin;

import com.shop.model.MemberDAO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/DelMember.do")
public class DelMemberCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");

        MemberDAO dao = new MemberDAO();
        int cnt = dao.deleteMember(id);

        if(cnt > 0) {
            response.sendRedirect(request.getContextPath() + "/MemberMgmt.do");
        } else {
            PrintWriter out = response.getWriter();
            out.println("<script> history.go(-1); </script>");
        }
    }
}
