package com.shop.controller.admin;

import com.shop.dto.Product;
import com.shop.model.ProductDAO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/UpdateProductPro.do")
public class UpdateProductProCtrl extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int pro_no = Integer.parseInt(request.getParameter("pro_no"));

        Product product = new Product();
        product.setPro_no(pro_no);
        product.setCate_id(request.getParameter("cate_id"));
        product.setTitle(request.getParameter("title"));
        product.setPrice(Integer.parseInt(request.getParameter("price")));
        product.setDescription(request.getParameter("description"));
        product.setPro_content(request.getParameter("pro_content"));

        ProductDAO dao = new ProductDAO();
        int a = dao.updateProduct(product);

        PrintWriter out = response.getWriter();

        if(a>0){
            response.sendRedirect(request.getContextPath() + "/AdminProductList.do");
        } else {
            out.println("<script>history.go(-1);</script>");
        }
    }
}
