<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FAQ</title>
    <%@ include file="/setting/head.jsp" %>
    <%@ include file="/setting/encoding.jsp" %>
    <c:set var="path" value="<%=request.getContextPath()%>"/>
    <!-- 스타일 초기화 : reset.css 또는 normalize.css -->
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">

    <!-- 필요한 폰트를 로딩 : 구글 웹 폰트에서 폰트를 선택하여 해당 내용을 붙여 넣기 -->
    <link rel="stylesheet" href="${path}/css/fonts-awesome.min.css">

    <!-- 필요한 플러그인 연결 -->
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <link rel="stylesheet" href="${path}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${path}/css/elegant-icons.css">
    <link rel="stylesheet" href="${path}/css/jquery-ui.min.css">
    <link rel="stylesheet" href="${path}/css/nice-select.css">
    <link rel="stylesheet" href="${path}/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${path}/css/slicknav.min.css">
    <link rel="stylesheet" href="${path}/css/style.css">
    <style>
        /* 본문 영역 스타일 */

        .contents {
            clear: both;
            min-height: 100vh;

        }

        .contents::after {
            content: "";
            clear: both;
            display: block;
            width: 100%;
        }

        .title {
            text-align: center;
            padding-top: 3rem;
            padding-bottom: 2rem;
        }

        .faqlist li {
            padding: 20px;
            margin: 10px 0;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s, box-shadow 0.2s;
            cursor: pointer;
        }

        .faqlist li:hover {
            transform: translateY(-3px);
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
        }

        .faqlist li .ans {
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
<div class="container-fluid m-0 p-0">
    <header class="hd" id="hd">
        <%@include file="/layout/header_top.jsp"%>
        <%@ include file="/layout/header.jsp" %>
    </header>
    <div class="contents" id="contents">

        <!-- Breadcrumb Section Begin -->
        <section class="breadcrumb-section set-bg" style="background-image: url('${path}/img/breadcrumb.jpg')">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <div class="breadcrumb__text">
                            <h2>F A Q</h2>
                            <div class="breadcrumb__option">
                                <a href="${path}">Home</a>
                                <span>고객지원</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Breadcrumb Section End -->
        <h2 class="title">자주 묻는 질문</h2>
        <section class="page" id="page1">
            <div class="page_wrap">
                <hr>
                <div class="container">
                <ul class="faqlist">
                    <c:forEach var="faq" items="${faqList }" varStatus="status">
                    <li>
                        <div class="que">${faq.question }</div>
                        <div class="ans">${faq.answer }</div>
                    </li>
                    </c:forEach>
                </ul>
                </div>
                <script>
                    $(document).ready(function(){
                        $(".faqlist li").click(function(){
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
