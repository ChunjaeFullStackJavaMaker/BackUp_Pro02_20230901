package com.shop.controller.admin;

import com.shop.dto.Delivery;
import com.shop.dto.Product;
import com.shop.model.DeliveryDAO;
import com.shop.model.ProductDAO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/UpdateDeliveryPro.do")
public class UpdateDeliveryProCtrl extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int del_no = Integer.parseInt(request.getParameter("del_no"));
        int type = Integer.parseInt(request.getParameter("type"));
        int cnt = 0;

        Delivery del = new Delivery();
        del.setDel_no(del_no);
        del.setDel_date(request.getParameter("del_date"));
        del.setRes_date(request.getParameter("res_date"));
        del.setDel_com(request.getParameter("del_com"));
        del.setDel_tel(request.getParameter("del_tel"));
        del.setDel_code(request.getParameter("del_code"));
        del.setDel_state(Integer.parseInt(request.getParameter("del_state")));
        DeliveryDAO dao = new DeliveryDAO();

        cnt = (type == 1) ? dao.updateDelivery(del) : dao.updateDeliveryCode(del);

        PrintWriter out = response.getWriter();

        if(cnt>0){
            response.sendRedirect(request.getContextPath() + "/DeliveryList.do");
        } else {
            out.println("<script>history.go(-1);</script>");
        }
    }
}
