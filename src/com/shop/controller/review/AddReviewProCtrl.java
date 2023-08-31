package com.shop.controller.review;

import com.shop.dto.Review;
import com.shop.model.ReviewDAO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

import static java.lang.System.out;

@WebServlet("/AddReviewPro.do")
public class AddReviewProCtrl extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int pay_no = Integer.parseInt(request.getParameter("pay_no"));
        String cus_id = request.getParameter("cus_id");
        String content = request.getParameter("content");
        int star = Integer.parseInt(request.getParameter("star"));
        String pro = request.getParameter("title");
        String pro_no=request.getParameter("pro_no");

        Review rev = new Review();
        rev.setPro_no(Integer.parseInt(pro_no));
        rev.setPro(pro);
        rev.setPay_no(pay_no);
        rev.setMem_id(cus_id);
        rev.setContent(content);
        rev.setStar(star);

        ReviewDAO dao = new ReviewDAO();
        int cnt = dao.addReview(rev);
        if (cnt>0){
            response.sendRedirect(request.getContextPath()+"/MyOrderList.do");
        } else {
            out.println("<script>${path}/AddReview.do?pay_no=${order.pay_no}</script>");
        }

    }


}
