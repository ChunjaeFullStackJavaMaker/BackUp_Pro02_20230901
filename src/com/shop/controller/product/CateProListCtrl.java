package com.shop.controller.product;

import com.shop.dto.Product;
import com.shop.model.ProductDAO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/CateProList.do")
public class CateProListCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("msg", "상품 리스트를 출력합니다.");

        String[] cateIds = request.getParameterValues("cate_id");
        ProductDAO dao = new ProductDAO();
        List<Product> proList;

        if (cateIds == null || cateIds.length == 0) {
            proList = dao.getProductList();
        } else {
            proList = new ArrayList<>();

            for (String cate : cateIds) {
                List<Product> productsForCategory = dao.getCateProductList(cate);
                proList.addAll(productsForCategory);
            }
        }

        request.setAttribute("proList", proList);
        RequestDispatcher view = request.getRequestDispatcher("/product/productList.jsp");
        view.forward(request, response);
    }

}