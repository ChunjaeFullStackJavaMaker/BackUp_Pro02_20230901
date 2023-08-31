package com.shop.controller.admin;

import com.shop.dto.AdminHotProVO;
import com.shop.dto.Product;
import com.shop.model.ProductDAO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/AdminDashboard.do")
public class AdminDashboardCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("msg", "관리자 메인 페이지입니다.");

        ProductDAO dao = new ProductDAO();
        List<AdminHotProVO> proList = dao.getAdminHotProduct();
        request.setAttribute("hotProducts", proList);

        RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/admin/adminDashboard.jsp");
        view.forward(request, response);
    }
}
