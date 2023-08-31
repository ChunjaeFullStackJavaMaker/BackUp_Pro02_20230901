package com.shop.controller.admin;

import com.shop.dto.Notice;
import com.shop.model.NoticeDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/AddNoticePro.do")
public class AddNoticeProCtrl extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //String title = request.getParameter("title");
        //String content = request.getParameter("content");

        Notice noti = new Notice();
        //noti.setTitle(title);
        noti.setTitle(request.getParameter("title"));
        noti.setContent(request.getParameter("content"));

        PrintWriter out = response.getWriter();

        NoticeDAO dao = new NoticeDAO();
        int a = dao.addNotice(noti);
        if(a>0) {
            response.sendRedirect(request.getContextPath()+"/NoticeList.do");
        } else {
            //request.sendRedirect("/AddNotice.do");
            out.println("<script>history.go(-1);</script>");
        }
    }
}
