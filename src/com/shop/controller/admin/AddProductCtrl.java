package com.shop.controller.admin;

import com.shop.dto.Category;
import com.shop.model.ProductDAO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/AddProduct.do")
public class AddProductCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String msg = "관리자의 상품 등록 폼이 로딩되었습니다.";

        request.setAttribute("msg", msg);

        ProductDAO dao = new ProductDAO();
        List<Category> cateList = dao.getCategoryList();

        request.setAttribute("cateList", cateList);
        RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/admin/addProduct.jsp");
        view.forward(request, response);
    }
}
