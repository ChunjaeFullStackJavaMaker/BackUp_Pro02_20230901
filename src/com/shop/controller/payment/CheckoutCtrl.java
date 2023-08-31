package com.shop.controller.payment;

import com.shop.dto.CartVO;
import com.shop.dto.Member;
import com.shop.model.CartDAO;
import com.shop.model.MemberDAO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/checkout.do")
public class CheckoutCtrl extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //세션 생성
        HttpSession session = request.getSession();
        String cid = (String) session.getAttribute("sid");

        CartDAO dao = new CartDAO();
        List<CartVO> cartList = dao.getByIdCartList(cid);

        MemberDAO memDAO = new MemberDAO();
        Member mem = memDAO.getMember(cid);


        request.setAttribute("cartList", cartList);
        request.setAttribute("mem", mem);

        RequestDispatcher view = request.getRequestDispatcher("/payment/checkout.jsp");
        view.forward(request, response);
    }

}
