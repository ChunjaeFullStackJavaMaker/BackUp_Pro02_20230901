package com.shop.controller.review;

import com.shop.model.ReviewDAO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
@WebServlet("/DeleteReview.do")
public class DeleteReviewCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int rev_no = Integer.parseInt(request.getParameter("rev_no"));

        ServletContext application = request.getServletContext();
        String home = application.getContextPath();

        ReviewDAO dao = new ReviewDAO();
        int cnt = dao.delReview(rev_no);

        response.sendRedirect(home+"/mypageReview.do");
    }
}
