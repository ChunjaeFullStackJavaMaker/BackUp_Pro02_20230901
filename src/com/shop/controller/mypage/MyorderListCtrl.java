package com.shop.controller.mypage;

import com.shop.model.MyPageDAO;
import com.shop.dto.MyOrderVO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/MyOrderList.do")
public class MyorderListCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String msg = request.getParameter("msg");

        HttpSession session = request.getSession();
        String sid = (String) session.getAttribute("sid");

        MyPageDAO dao = new MyPageDAO();
        List<MyOrderVO> orderList = dao.getMyOrderList(sid);

        request.setAttribute("msg", msg);
        request.setAttribute("orderList", orderList);

        RequestDispatcher view = request.getRequestDispatcher("/mypage/myorderList.jsp");
        view.forward(request, response);
    }
}
