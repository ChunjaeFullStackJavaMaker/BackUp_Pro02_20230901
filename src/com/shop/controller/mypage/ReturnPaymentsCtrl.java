package com.shop.controller.mypage;

import com.shop.dto.Payment;
import com.shop.model.PaymentDAO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/ReturnPayments.do")
public class ReturnPaymentsCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String resdate = request.getParameter("resdate");

        HttpSession session = request.getSession();
        String cus_id = (String) session.getAttribute("sid");

        PaymentDAO payDAO = new PaymentDAO();
        List<Payment> payList = payDAO.getMyPaymentList(resdate, cus_id);

        for(Payment pay : payList) {
            System.out.println(pay.toString());
        }

        int cnt = payDAO.returnPayments(resdate, cus_id, payList);

        String msg = "fail";
        if(cnt > 1) {
            msg = "success";
        }
        response.sendRedirect(request.getContextPath() + "/MyOrderList.do?msg="+msg);
    }
}
