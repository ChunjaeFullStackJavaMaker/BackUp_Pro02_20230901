package com.shop.controller.admin;

import com.shop.dto.Notice;
import com.shop.model.NoticeDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/UpdateNotice.do")
public class UpdateNoticeCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String msg = "공지사항의 내용을 수정합니다.";
        int no = Integer.parseInt(request.getParameter("no"));

        NoticeDAO dao = new NoticeDAO();
        Notice noti = dao.getNotice(no);

        request.setAttribute("msg", msg);
        request.setAttribute("noti", noti);

        RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/admin/updateNotice.jsp");
        view.forward(request,response);
    }
}
