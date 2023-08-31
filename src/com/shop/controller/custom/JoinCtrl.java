package com.shop.controller.custom;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/Join.do")
public class JoinCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String msg = "회원가입 페이지를 로딩합니다.";
        request.setAttribute("msg", msg);
        RequestDispatcher view = request.getRequestDispatcher("/custom/join.jsp");
        view.forward(request, response);
    }
}
