package com.shop.controller.product;

import com.shop.dto.AddInfo;
import com.shop.dto.Product;
import com.shop.dto.Review;
import com.shop.model.ProductDAO;
import com.shop.model.ReviewDAO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/getProduct.do")
public class ProductCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("msg","상품리스트를 출력합니다.");

        int pro_no = Integer.parseInt(request.getParameter("pro_no"));
        int amount = 0;

        ProductDAO dao = new ProductDAO();
        ReviewDAO redao = new ReviewDAO();
        Product pro = dao.getProduct(pro_no);
        AddInfo info = dao.getAddInfo(pro_no);
        amount = dao.getAmount(pro_no);

        request.setAttribute("pro",pro);
        request.setAttribute("amount",amount);
        request.setAttribute("info", info);

        List<Review> reviewList = redao.getReview(pro_no);
        request.setAttribute("reviewList",reviewList);

        RequestDispatcher view = request.getRequestDispatcher("/product/getProduct.jsp");
        view.forward(request,response);
    }
}