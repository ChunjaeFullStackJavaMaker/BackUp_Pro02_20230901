<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title> 리뷰관리 </title>
    <c:set var="path" value="<%=request.getContextPath()%>"/>
    <%@ include file="/setting/head.jsp"%>

    <style>
        .menu_item {
            color: #333;
        }
        .menu_item:hover {
            color: #333;
            font-weight: bold;
        }
        .breadcrumb-section {background-image: url("${path }/img/breadcrumb.jpg");}
    </style>
</head>

<body>
<!-- Page Preloder -->
<div id="preloder">
    <div class="loader"></div>
</div>

<div class="container-fluid m-0 p-0">
    <!-- Humberger Begin -->
    <%@include file="/layout/header_top.jsp"%>
    <!-- Humberger End -->

    <!-- Header Section Begin -->
    <%@include file="/layout/header.jsp"%>
    <!-- Header Section End -->

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section" style="background-image: url('${path}/img/breadcrumb.jpg'); background-position: center; background-size: cover">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>MY PAGE</h2>
                        <div class="breadcrumb__option">
                            <a href="${path }">Home</a>
                            <span>리뷰 관리</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <div class="container blog spad">
        <div class="row">
            <div class="col col-lg-3 mb-3 p-3">
                <div class="p-4 border">
                    <a href="${path}/mypageInfo.do" class="d-block menu_item"> 개인정보 변경 </a>
                    <a href="${path}/MyOrderList.do" class="d-block mt-2 menu_item" > 주문/배송 조회 </a>
                    <a href="${path}/mypageReview.do" class="d-block mt-2 menu_item" style="color:#7FAD39; font-weight:bold"> 리뷰 관리</a>
                </div>
            </div>
            <div class="col col-lg-9 mt-3">
                <c:forEach var="re" items="${reviewList }">
                    <div class="product__details__text">
                        <div class="row">
                            <div class="col col-lg-10">
                                <h4> ${re.pro }</h4>
                            </div>
                            <div class="col col-lg-2 d-flex align-items-center">
                                <button type="button" class="btn btn-outline-secondary" onclick="javascript:location.href='${path}/DeleteReview.do?rev_no=${re.rev_no }'"> 삭제 </button>
                            </div>
                        </div>
                        <p>${re.content }</p>
                    </div>
                    <hr class="mb-5">
                </c:forEach>
            </div>
        </div>
    </div>


    <!-- Footer Section Begin -->
    <%@include file="/layout/footer.jsp"%>
    <!-- Footer Section End -->
</div>
</body>

</html>