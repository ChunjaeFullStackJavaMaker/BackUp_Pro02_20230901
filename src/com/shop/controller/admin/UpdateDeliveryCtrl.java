package com.shop.controller.admin;

import com.shop.dto.Category;
import com.shop.dto.DeliveryVO;
import com.shop.dto.Product;
import com.shop.model.DeliveryDAO;
import com.shop.model.ProductDAO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/UpdateDelivery.do")
public class UpdateDeliveryCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int del_no = Integer.parseInt(request.getParameter("del_no"));

        DeliveryDAO dao = new DeliveryDAO();
        DeliveryVO delivery = dao.getDeliveryVO(del_no);

        request.setAttribute("delivery", delivery);

        RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/admin/updateDelivery.jsp");
        view.forward(request, response);
    }
}
