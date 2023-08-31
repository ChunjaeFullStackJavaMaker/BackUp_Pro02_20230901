package com.shop.controller.custom;

import com.shop.dto.Member;
import com.shop.dto.Member;
import com.shop.model.MemberDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/MyInfoUpdate.do")
public class MyInfoUpdateCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = (String) request.getParameter("id");

        MemberDAO dao = new MemberDAO();
        Member mem = dao.getMember(id);

        request.setAttribute("mem", mem);
        RequestDispatcher view = request.getRequestDispatcher("/custom/myinfoUpdate.jsp");
        view.forward(request, response);
    }
}