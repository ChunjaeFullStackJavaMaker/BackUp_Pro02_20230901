package com.shop.controller.payment;

import com.shop.dto.*;
import com.shop.model.CartDAO;
import com.shop.model.MultiPattern;
import com.shop.model.PaymentDAO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/checkoutPro.do")
public class CheckoutProCtrl extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //세션 생성
        HttpSession session = request.getSession();
        String cid = (String) session.getAttribute("sid");

        CartDAO dao = new CartDAO();
        List<CartVO> cartList = dao.getByIdCartList(cid);

        //배송 처리 리스트
        PaymentDAO payDAO = new PaymentDAO();
        List<Delivery> delList = new ArrayList<>();
        for (int i = 0; i < cartList.size(); i++) {
            Delivery del = new Delivery();
            del.setPay_no(payDAO.getPay_no());
            del.setCustom_id(cid);
            del.setDel_addr(request.getParameter("address1") + "<br>" + request.getParameter("address2") + "<br>" + request.getParameter("postcode"));
            del.setCus_tel(request.getParameter("custel"));
            delList.add(del);
        }

        //결제 처리 리스트
        List<Payment> payList = new ArrayList<>();
        for (int i = 0; i < cartList.size(); i++) {
            Payment pay = new Payment();
            pay.setCus_id(cid);
            pay.setPro_no(cartList.get(i).getPro_no());
            pay.setAmount(cartList.get(i).getAmount());
            pay.setPay_method(request.getParameter("pay_method"));
            pay.setPay_com(request.getParameter("pay_com2"));
            pay.setPay_account(request.getParameter("pay_account"));
            pay.setPay_price(cartList.get(i).getPrice());
            payList.add(pay);
        }

        //출고 처리 리스트

        List<Serve> servList = new ArrayList<>();
        for (int i = 0; i < cartList.size(); i++) {
            Serve serv = new Serve();
            serv.setPro_no(cartList.get(i).getPro_no());
            serv.setAmount(cartList.get(i).getAmount());
            serv.setSe_price(cartList.get(i).getPrice());
            servList.add(serv);
        }


        //카트 삭제 리스트
        List<Cart> cartlist = new ArrayList<>();
        for (int i = 0; i < cartList.size(); i++) {
            Cart cart = new Cart();
            cart.setCart_no(cartList.get(i).getCart_no());
            cartlist.add(cart);
        }

        //한번에 처리
        MultiPattern multiDAO = new MultiPattern();
        for(int i =0; i<cartList.size();i++){
            int pno = multiDAO.pay(delList.get(i), payList.get(i), servList.get(i), cartlist.get(i));
        }

        String path = request.getContextPath();
        response.sendRedirect(path + "/MyOrderList.do");

    }

}

