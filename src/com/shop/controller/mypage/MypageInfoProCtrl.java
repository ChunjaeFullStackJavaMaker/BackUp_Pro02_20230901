package com.shop.controller.mypage;

import com.shop.dto.Member;
import com.shop.model.MemberDAO;
import com.shop.util.AES256;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.InvalidParameterSpecException;

@WebServlet("/mypageInfoPro.do")
public class MypageInfoProCtrl extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String pw = request.getParameter("pw");
        String addr1 = request.getParameter("address1");
        String addr2 = request.getParameter("address2");
        String postcode = request.getParameter("postcode");
        String tel = request.getParameter("tel");
        String email = request.getParameter("email");
        String birth = request.getParameter("birth");

        boolean result = false;
        int suc = 0;

        String key = "%02x";
        String encrypted ="";
        try{
            encrypted = AES256.encryptAES256(pw, key);
        } catch (Exception e) {
            e.printStackTrace();
        }

        MemberDAO dao = new MemberDAO();
        Member user = new Member();

        user.setId(id);
        user.setPw(encrypted);
        user.setAddress(addr1+"<br>"+addr2+"<br>"+postcode);
        user.setTel(tel);
        user.setEmail(email);
        user.setBirth(birth);
        suc=dao.updateMember(user);

        if(suc > 0){
            response.sendRedirect(request.getContextPath()+"/mypageInfo.do?id="+id);
        }

    }
}
