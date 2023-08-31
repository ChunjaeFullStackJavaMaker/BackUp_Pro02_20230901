package com.shop.controller.notice;

import com.shop.dto.Notice;
import com.shop.model.NoticeDAO;
import com.shop.util.Page;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/NoticeList.do")
public class NoticeListCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("msg", "공지사항 목록을 출력합니다.");

        NoticeDAO dao = new NoticeDAO();
        List<Notice> notiList = dao.getNoticeList();
        Page pg = new Page();
        int total = dao.getCount();
        pg.makeBlock(1);
        pg.makeLastPageNum();
        pg.makePostStart(1);
        notiList = dao.getNoticeList(0);

        int curPageNum = 1;
        if(request.getParameter("page")!=null){
            curPageNum = Integer.parseInt(request.getParameter("page"));
            pg.makeBlock(curPageNum);
            pg.makeLastPageNum();
            pg.makePostStart(curPageNum);
            notiList = dao.getNoticeList(pg.getPostStart()-1);
        }

        request.setAttribute("totalPageCount", pg.getTotalPageCount());
        request.setAttribute("pageBlockNum", pg.getPageBlockNum());
        request.setAttribute("totalBlockNum", pg.getTotalBlockNum());
        request.setAttribute("curPageNum", curPageNum);
        request.setAttribute("blockStartNum", pg.getBlockStartNum());
        request.setAttribute("blockLastNum", pg.getBlockLastNum());
        request.setAttribute("lastPageNum", pg.getLastPageNum());
        request.setAttribute("notiList", notiList);
        RequestDispatcher view = request.getRequestDispatcher("/notice/noticeList.jsp");
        view.forward(request, response);
    }
}
