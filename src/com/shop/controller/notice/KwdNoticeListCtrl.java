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

@WebServlet("/KwdNoticeList.do")
public class KwdNoticeListCtrl extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("msg", "공지사항 목록을 출력합니다.");

        String searchType = request.getParameter("searchType");
        String kwd = request.getParameter("kwd");

        NoticeDAO dao = new NoticeDAO();
        List<Notice> notiList = dao.getNoticeList(searchType, kwd, 0);
        Page pg = new Page();
        int total = dao.getCount(searchType, kwd);
        pg.makeBlock(1);
        pg.makeLastPageNum();
        pg.makePostStart(1);

        int curPageNum = 1;
        if(request.getParameter("page")!=null){
            curPageNum = Integer.parseInt(request.getParameter("page"));
            pg.makeBlock(curPageNum, searchType, kwd);
            pg.makeLastPageNum(searchType, kwd);
            pg.makePostStart(curPageNum, searchType, kwd);
            notiList = dao.getNoticeList(searchType, kwd,pg.getPostStart()-1);
        }

        request.setAttribute("searchType", searchType);
        request.setAttribute("kwd", kwd);
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
