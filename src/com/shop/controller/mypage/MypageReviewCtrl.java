package com.shop.controller.mypage;

import com.shop.dto.Review;
import com.shop.model.ReviewDAO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/mypageReview.do")
public class MypageReviewCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        String cid = (String) session.getAttribute("sid");

        ReviewDAO dao = new ReviewDAO();
        List<Review> reviewList = dao.getByIdReview(cid);

        request.setAttribute("reviewList", reviewList);

        RequestDispatcher view = request.getRequestDispatcher("/mypage/mypageReview.jsp");
        view.forward(request, response);


    }

}
