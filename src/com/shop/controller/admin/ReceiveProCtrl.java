package com.shop.controller.admin;

import com.shop.dto.Product;
import com.shop.dto.Receive;
import com.shop.model.ProductDAO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
@WebServlet("/ReceivePro.do")
public class ReceiveProCtrl extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int pro_no = Integer.parseInt(request.getParameter("pro_no"));
        int receive = Integer.parseInt(request.getParameter("receive"));
        int re_amount = Integer.parseInt(request.getParameter("re_amount"));

        int suc = 0;

        ProductDAO dao = new ProductDAO();
        Receive rec = new Receive();

        rec.setPro_no(pro_no);
        rec.setAmount(re_amount);
        rec.setRe_price(receive);

        suc = dao.addReceive(rec);

        if(suc>0){
            response.sendRedirect(request.getContextPath() + "/getProduct.do?pro_no="+pro_no);
        } else {
            response.sendRedirect(request.getContextPath() + "/ProList.do");
        }

    }
}
