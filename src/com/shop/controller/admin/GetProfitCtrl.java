package com.shop.controller.admin;

import com.shop.dto.ProfitVO;
import com.shop.model.PaymentDAO;
import org.json.*;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import java.util.List;

@WebServlet("/getProfit.do")
public class GetProfitCtrl extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PaymentDAO dao = new PaymentDAO();
        List<ProfitVO> profitList = dao.getSaleList();
        JSONArray jsonArray = new JSONArray();

        for(int i=0; i<profitList.size(); i++) {
            JSONObject obj = new JSONObject();
            obj.put("date", profitList.get(i).getDate());
            obj.put("sales", profitList.get(i).getSales());
            obj.put("profit", profitList.get(i).getProfit());
            jsonArray.put(obj);
        }

        PrintWriter out = response.getWriter();
        out.println(jsonArray);
    }
}
