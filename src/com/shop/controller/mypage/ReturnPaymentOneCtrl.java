package com.shop.controller.mypage;

import com.shop.dto.Payment;
import com.shop.model.PaymentDAO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/ReturnPaymentOne.do")
public class ReturnPaymentOneCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int pay_no = Integer.parseInt(request.getParameter("pay_no"));

        PaymentDAO payDAO = new PaymentDAO();
        Payment pay = payDAO.getPayment(pay_no);

        int cnt = payDAO.returnPaymentOne(pay_no, pay.getPro_no(), pay.getAmount(), pay.getCus_id());

        String msg = "fail";
        if(cnt >= 4) {
            msg = "success";
        }
        response.sendRedirect(request.getContextPath() + "/MyOrderList.do?msg="+msg);
    }
}
