package com.shop.controller.cart;

import com.shop.dto.CartVO;
import com.shop.model.CartDAO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/CartList.do")
public class CartListCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        String cid = (String) session.getAttribute("sid");

        CartDAO dao = new CartDAO();
        List<CartVO> cartList = dao.getByIdCartList(cid);

        request.setAttribute("cartList", cartList);
        RequestDispatcher view = request.getRequestDispatcher("/Cart/cartList.jsp");
        view.forward(request, response);
    }

}
