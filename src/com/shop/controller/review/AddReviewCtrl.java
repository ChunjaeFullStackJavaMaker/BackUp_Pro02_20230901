package com.shop.controller.review;

import com.shop.dto.*;
import com.shop.model.*;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/AddReview.do")
public class AddReviewCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int pay_no = Integer.parseInt(request.getParameter("pay_no"));

        PaymentDAO payDAO = new PaymentDAO();
        Payment pay = payDAO.getPayment(pay_no);

        DeliveryDAO delDAO = new DeliveryDAO();
        Delivery del = delDAO.getByPaynoDelivery(pay.getPay_no());

        ProductDAO proDAO = new ProductDAO();
        Product pro = proDAO.getProduct(pay.getPro_no());

        MemberDAO memDAO = new MemberDAO();
        Member mem = memDAO.getMember(pay.getCus_id());

        request.setAttribute("pay", pay);
        request.setAttribute("del", del);
        request.setAttribute("pro", pro);
        request.setAttribute("mem", mem);

        RequestDispatcher view = request.getRequestDispatcher("/mypage/addReview.jsp");
        view.forward(request, response);
    }
}
