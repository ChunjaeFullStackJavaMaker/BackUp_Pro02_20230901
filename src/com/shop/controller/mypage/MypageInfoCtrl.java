package com.shop.controller.mypage;

import com.shop.dto.Member;
import com.shop.model.MemberDAO;
import com.shop.util.AES256;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
@WebServlet("/mypageInfo.do")
public class MypageInfoCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        String id = (String) session.getAttribute("sid");
        System.out.println(id);

            MemberDAO dao = new MemberDAO();
            Member mem = dao.getMember(id);

            String key = "%02x";
            String pw ="" ;
            try {
                pw = AES256.decryptAES256(mem.getPw(), key);
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }

            String address = mem.getAddress();
            String []  addr = address.split("<br>");
            String addr1 = addr[0];
            String addr2 = addr[1];
            String postcode = addr[2];


            request.setAttribute("mem", mem);
            request.setAttribute("pw",pw);
            request.setAttribute("addr1", addr1);
            request.setAttribute("addr2", addr2);
            request.setAttribute("postcode", postcode);
            RequestDispatcher view = request.getRequestDispatcher("/mypage/mypageInfo.jsp");
            view.forward(request, response);
    }
}
