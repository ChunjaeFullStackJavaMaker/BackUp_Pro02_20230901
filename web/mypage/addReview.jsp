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
    <section class="breadcrumb-section set-bg" style="background-image: url('${path}/img/breadcrumb.jpg')">
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

    <div class="container">
        <div class="row">
            <div class="col col-lg-3 mb-3 p-3">
                <div class="p-4 border">
                    <a href="${path}/mypageInfo.do" class="d-block menu_item"> 개인정보 변경 </a>
                    <a href="${path}/MyOrderList.do" class="d-block mt-2 menu_item"> 주문/배송 조회 </a>
                    <a href="${path}/mypageReview.do" class="d-block mt-2 menu_item" style="color:#7FAD39; font-weight:bold"> 리뷰 관리</a>
                </div>
            </div>
            <div class="col col-lg-9 mt-3">
                <div class="container">
                    <form action="${path }/AddReviewPro.do" method="post">
                        <table class="table">
                            <tbody>
                            <tr>
                                <th><label>상품명</label></th>
                                <td><label>${pro.title}</label></td>
                                <input type="hidden" name="pro_no" id="pro_no" value="${pro.pro_no}">
                                <input type="hidden" name="pay_no" id="pay_no" value="${pay.pay_no}">
                                <input type="hidden" name="cus_id" id="cus_id" value="${pay.cus_id}">
                                <input type="hidden" name="title" id="title" value="${pro.title}">
                            </tr>
                            <tr>
                                <th><label>별점</label></th>
                                <td>
                                    <input type="radio" name="star" id="star1" value="1"><label for="star1" id="lb1">1점</label>&nbsp;&nbsp;
                                    <input type="radio" name="star" id="star2" value="2"><label for="star2" id="lb2">2점</label>&nbsp;&nbsp;
                                    <input type="radio" name="star" id="star3" value="3"><label for="star3" id="lb3">3점</label>&nbsp;&nbsp;
                                    <input type="radio" name="star" id="star4" value="4"><label for="star4" id="lb4">4점</label>&nbsp;&nbsp;
                                    <input type="radio" name="star" id="star5" value="5" checked><label for="star5" id="lb5">5점</label>
                                </td>
                            </tr>

                            <tr>
                                <th><label for="content">후기</label></th>
                                <td><textarea name="content" id="content" class="form-control" style="resize: none; "></textarea></td>
                            </tr>
                            </tbody>
                        </table>
                        <div class="btn-wrap container">
                            <input type="submit" value="구매 확정" class="btn btn-primary mb-5" style="background-color: #7fad39; float: right; border: none;">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>


    <!-- Footer Section Begin -->
    <%@include file="/layout/footer.jsp"%>
    <!-- Footer Section End -->
</div>
</body>

</html>