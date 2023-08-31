package com.shop.controller.admin;

import com.shop.dto.Product;
import com.shop.model.DBConnect;
import com.shop.model.MariaDBCon;
import com.shop.model.ProductDAO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
@WebServlet("/Receive.do")
public class ReceiveCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int pro_no = Integer.parseInt(request.getParameter("pro_no"));

        ProductDAO dao = new ProductDAO();
        Product pro = dao.getProduct(pro_no);
        int amount = dao.getAmount(pro_no);

        request.setAttribute("pro_no",pro_no);
        request.setAttribute("pro", pro);
        request.setAttribute("amount",amount);

        RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/admin/receive.jsp");
        view.forward(request,response);

    }
}
