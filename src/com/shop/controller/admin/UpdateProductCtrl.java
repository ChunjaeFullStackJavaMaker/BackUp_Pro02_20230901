package com.shop.controller.admin;

import com.shop.dto.Category;
import com.shop.dto.Product;
import com.shop.model.ProductDAO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/UpdateProduct.do")
public class UpdateProductCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int pro_no = Integer.parseInt(request.getParameter("pro_no"));

        ProductDAO proDAO = new ProductDAO();

        List<Category> cateList = proDAO.getCategoryList();
        Product product = proDAO.getProduct(pro_no);

        request.setAttribute("cateList", cateList);
        request.setAttribute("product", product);

        RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/admin/updateProduct.jsp");
        view.forward(request, response);
    }
}
