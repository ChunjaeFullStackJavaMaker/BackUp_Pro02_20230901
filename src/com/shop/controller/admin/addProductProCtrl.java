package com.shop.controller.admin;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.shop.dto.AddInfo;
import com.shop.dto.Product;
import com.shop.model.ProductDAO;

import javax.mail.Multipart;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;

@WebServlet("/AddProductPro.do")
public class addProductProCtrl extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String msg = "";
        ServletContext application = request.getServletContext();
        try {
            String saveDirectory = application.getRealPath("/storage"); //실제 저장 경로
            int maxSize = 1024*1024*10;     //10MB
            String encoding = "UTF-8";

            MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxSize, encoding, new DefaultFileRenamePolicy());

            AddInfo addInfo = new AddInfo();

            Product add = new Product();
            add.setCate_id(mr.getParameter("cate_id"));
            add.setTitle(mr.getParameter("title"));
            add.setPrice(Integer.parseInt(mr.getParameter("price")));
            add.setDescription(mr.getParameter("description"));
            add.setPro_content(mr.getParameter("pro_content"));

            File upfile = null;
            Enumeration files = mr.getFileNames();

            int idx = 1;
            String item;
            String oriFile = "";
            String fileName = "";
            while(files.hasMoreElements()) {
                item = (String) files.nextElement();
                oriFile = mr.getOriginalFileName(item);         // 실제 첨부된 파일 경로와 이름
                fileName = mr.getFilesystemName(item);          // 파일 이름만 추출
                if(fileName != null) {
                    upfile = mr.getFile(item);
                    if(upfile.exists()) {
                        long filesize = upfile.length();
                        if(idx == 1) {
                            addInfo.setMovie(upfile.getName());
                        } else if(idx == 2) {
                            add.setImg_src(upfile.getName());
                        } else if(idx == 3) {
                            add.setThumb(upfile.getName());
                        }
                        msg = "파일 업로드 성공";
                    } else {
                        msg = "파일 업로드 실패";
                    }
                }
                idx++;
            }

            ProductDAO dao = new ProductDAO();
            int cnt = dao.addProduct(add);

            // 상품의 동영상 정보 추가하기
            addInfo.setTitle(mr.getParameter("title"));
            addInfo.setPro_no(dao.latestProNo());
            cnt += dao.addAddInfo(addInfo);

            if(cnt>0){
                response.sendRedirect(request.getContextPath()+"/AdminProductList.do");
            } else {
                response.sendRedirect(request.getContextPath()+"/AddProduct.do");
            }
        } catch(Exception e){
            System.out.println(e.getMessage());
        }
    }
}
