<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%-- 1. 필요한 라이브러리 임포트 --%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="com.shop.dto.Notice" %>
<%@ page import="com.shop.util.*" %>
<%@ page import="com.shop.model.*" %>
<%@ page import="com.shop.dto.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.shop.model.MariaDBCon" %>
<%@ page import="com.shop.model.DBConnect" %>

<%
    String path5 = request.getContextPath();
%>

<%
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=UTF-8");
    response.setCharacterEncoding("UTF-8");
%>
<%
    //2. DB 연결
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    DBConnect con = new MariaDBCon();
    conn = con.connect();

    //3. SQL을 실행하여 결과셋(ResultSet) 받아오기
    String sql = "select * from faq order by fno asc";
    pstmt = conn.prepareStatement(sql);
    rs = pstmt.executeQuery();

    //4. 받아온 결과셋(ResultSet) 을 질문및답변 목록(qnaList)에 불러와 하나의 레코드씩 담기
    List<Faq> faqList = new ArrayList<>();
    while(rs.next()){
        Faq faq = new Faq();
        faq.setFno(rs.getInt("fno"));
        faq.setQuestion(rs.getString("question"));
        faq.setAnswer(rs.getString("answer"));
        faq.setCnt(rs.getInt("cnt"));
        faqList.add(faq);
    }
    con.close(rs, pstmt, conn);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>자주하는 질문</title>
    <%@ include file="/setting/head.jsp" %>
    <!-- 스타일 초기화 : reset.css 또는 normalize.css -->
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">

    <!-- 필요한 폰트를 로딩 : 구글 웹 폰트에서 폰트를 선택하여 해당 내용을 붙여 넣기 -->
    <link rel="stylesheet" href="<%=path5%>/css/fonts-awesome.min.css">

    <!-- 필요한 플러그인 연결 -->
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <link rel="stylesheet" href="<%=path5%>/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=path5%>/css/elegant-icons.css">
    <link rel="stylesheet" href="<%=path5%>/css/jquery-ui.min.css">
    <link rel="stylesheet" href="<%=path5%>/css/nice-select.css">
    <link rel="stylesheet" href="<%=path5%>/css/owl.carousel.min.css">
    <link rel="stylesheet" href="<%=path5%>/css/slicknav.min.css">
    <link rel="stylesheet" href="<%=path5%>/css/style.css">
    <style>
        /* 본문 영역 스타일 */
        .contents {
            clear: both;
            min-height: 100vh;
            background-image: linear-gradient(to bottom, #f7f7f7, #e2e2e2);
        }

        .contents::after {
            content: "";
            clear: both;
            display: block;
            width: 100%;
        }

        .content_tit {
            font-weight: bold;
            font-size: 25px;
            margin: 80px 30px 30px 10px;
        }
        /* 나머지 스타일 */

        .qnalist li {
            padding: 20px;
            margin: 10px 0;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s, box-shadow 0.2s;
            cursor: pointer;
        }

        .qnalist li:hover {
            transform: translateY(-3px);
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
        }

        .qnalist li .ans {
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 8px;
            margin-top: 10px;
            display: none;
        }

        .que:before {
            content: "Q";
            display: inline-block;
            width: 20px;
            height: 20px;
            line-height: 20px;
            text-align: center;
            background-color: #7fad39;
            color: #fff;
            border-radius: 50%;
            margin-right: 10px;
        }

        .ans:before {
            content: "A";
            display: inline-block;
            width: 20px;
            height: 20px;
            line-height: 20px;
            text-align: center;
            background-color: #ffd500;
            color: #fff;
            border-radius: 50%;
            margin-right: 10px;
        }
    </style>

</head>
<body>
<div class="container">
    <header class="hd" id="hd">
        <%@ include file="/layout/header.jsp" %>
    </header>
    <div class="contents" id="contents">
        <div class="content_header">
            <div class="breadcrumb">
                <h2 class="page_tit"> </h2>
            </div>
        </div>
        <nav aria-label="breadcrumb container-fluid" style="padding-top:28px; border-bottom:2px solid #666;">
            <div class="container">
                <ol class="breadcrumb justify-content-end">
                    <li class="breadcrumb-item"><a href="${path }">Home</a></li>
                    <li class="breadcrumb-item"><a href="#">고객지원</a></li>
                    <li class="breadcrumb-item active" aria-current="page">FAQ</li>
                </ol>
            </div>
        </nav>
        <section class="page" id="page1">
            <div class="page_wrap">
                <p class="content_tit"> FAQ </p>
                <hr>
                <ul class="qnalist">
                    <% for(Faq f:faqList) { %>
                    <li>
                        <div class="que"><%=f.getQuestion() %></div>
                        <div class="ans"><%=f.getAnswer() %></div>
                    </li>
                    <% } %>
                </ul>
                <script>
                    $(document).ready(function(){
                        $(".qnalist li").click(function(){
                            $(this).find(".ans").slideToggle(500);
                            $(this).find(".que").toggleClass("on");
                        });
                    });
                </script>
            </div>
        </section>
    </div>
    <footer class="ft" id="ft">
        <%@ include file="/layout/footer.jsp" %>
    </footer>
</div>
</body>
</html>
