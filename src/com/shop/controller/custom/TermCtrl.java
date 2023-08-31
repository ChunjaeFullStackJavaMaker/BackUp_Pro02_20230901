package com.shop.controller.custom;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/Term.do")
public class TermCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String msg = "약관 페이지를 로딩합니다.";
        request.setAttribute("msg", msg);
        RequestDispatcher view = request.getRequestDispatcher("/custom/term.jsp");
        view.forward(request, response);
    }
}
