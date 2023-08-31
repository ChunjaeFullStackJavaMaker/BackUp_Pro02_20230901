package com.shop.controller.faq;

import com.shop.dto.Faq;
import com.shop.model.FaqDAO;
import com.shop.util.Page;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/FaqList.do")
public class FaqListCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("msg", "FAQ 목록을 출력합니다.");

        FaqDAO dao = new FaqDAO();
        List<Faq> faqList = dao.getFaqList();

        request.setAttribute("faqList", faqList);
        RequestDispatcher view = request.getRequestDispatcher("/faq/faqList.jsp");
        view.forward(request, response);
    }
}
