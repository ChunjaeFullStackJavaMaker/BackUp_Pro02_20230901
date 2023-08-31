package com.shop.controller.cart;

import com.shop.dto.Cart;
import com.shop.model.CartDAO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/AddCart.do")
public class AddCartCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int pro_no = Integer.parseInt(request.getParameter("pro_no"));
        HttpSession session = request.getSession();
        String cid = (String) session.getAttribute("sid");
        int amount = Integer.parseInt(request.getParameter("amount"));

        Cart cart = new Cart();
        cart.setCus_id(cid);
        cart.setPro_no(pro_no);
        cart.setAmount(amount);

        CartDAO dao = new CartDAO();
        int cnt = dao.addCart(cart);

        PrintWriter out = response.getWriter();

        if(cnt>0){
            response.sendRedirect(request.getContextPath()+"/CartList.do");
        } else {
            out.println("<script>history.go(-1);</script>");
        }
    }
}