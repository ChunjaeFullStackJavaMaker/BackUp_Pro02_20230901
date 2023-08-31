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
    <title> 주문/배송 조회 </title>
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

    <c:if test="${msg eq 'success'}">
        <script>
            alert("취소/반품이 처리되었습니다.");
        </script>
    </c:if>
    <c:if test="${msg eq 'fail'}">
        <script>
            alert("취소/반품 처리에 실패하였습니다.");
        </script>
    </c:if>
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
                            <span>주문/배송 조회</span>
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
                    <a href="${path}/MyOrderList.do" class="d-block mt-2 menu_item" style="color:#7FAD39; font-weight:bold"> 주문/배송 조회 </a>
                    <a href="${path}/mypageReview.do" class="d-block mt-2 menu_item"> 리뷰 관리</a>
                </div>
            </div>
            <div class="col col-lg-9 mt-3">
                <c:set var="resdate" value=""/>
                <c:forEach var="order" items="${orderList}">
                    <c:if test="${resdate eq order.resdate}">
                        <div class="row">
                            <div class="col col-lg-2 d-flex align-items-center">
                                <img src="${path}/storage/${order.thumb}" alt="상품 이미지" width="90px" height="auto">
                            </div>
                            <div class="col col-lg-5">
                                <h4> ${order.title} </h4>
                                <p> 총 ${order.amount}권 / ${order.pay_price}원 </p>
                            </div>
                            <div class="col col-lg-2 d-flex align-items-center">
                                    ${order.del_state}
                            </div>
                            <div class="col col-lg-3 d-flex align-items-center">
                                <c:if test="${order.del_state eq '입고 중'}">
                                    <button type="button" class="btn btn-outline-secondary" onclick="javascript:location.href='${path}/ReturnPaymentOne.do?pay_no=${order.pay_no}'"> 취소 </button>
                                </c:if>
                                <c:if test="${order.del_state eq '배송 도착'}">
                                    <button type="button" class="btn btn-outline-secondary" onclick="javascript:location.href='${path}/AddReview.do?pay_no=${order.pay_no}'"> 구매 확정 </button>
                                    <button type="button" class="btn btn-outline-secondary" onclick="javascript:location.href='${path}/ReturnPaymentOne.do?pay_no=${order.pay_no}'"> 환불 </button>
                                </c:if>
                            </div>
                        </div>
                        <hr class="mb-5">
                    </c:if>
                    <c:if test="${resdate ne order.resdate}">
                        <c:set var="resdate" value="${order.resdate}"></c:set>
                        <div class="row">
                            <div class="col col-lg-10 d-flex align-items-center">
                                <h4> ${order.resdate} </h4>
                            </div>
                            <c:if test="${order.del_state eq '입고 중'}">
                                <button type="button" class="btn btn-secondary" onclick="javascript:location.href='${path}/ReturnPayments.do?resdate=${order.resdate}'"> 전체 취소 </button>
                            </c:if>
                            <c:if test="${order.del_state eq '배송 도착'}">
                                <button type="button" class="btn btn-secondary" onclick="javascript:location.href='${path}/ReturnPayments.do?resdate=${order.resdate}'"> 전체 환불 </button>
                            </c:if>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col col-lg-2 d-flex align-items-center">
                                <img src="${path}/storage/${order.thumb}" alt="상품이미지" width="90px" height="auto">
                            </div>
                            <div class="col col-lg-5">
                                <h4> ${order.title} </h4>
                                <p> 총 ${order.amount}권 / ${order.pay_price}원 </p>
                            </div>
                            <div class="col col-lg-2 d-flex align-items-center">
                                    ${order.del_state}
                            </div>
                            <div class="col col-lg-3 d-flex align-items-center">
                                <c:if test="${order.del_state eq '입고 중'}">
                                    <button type="button" class="btn btn-outline-secondary" onclick="javascript:location.href='${path}/ReturnPaymentOne.do?pay_no=${order.pay_no}'"> 취소 </button>
                                </c:if>
                                <c:if test="${order.del_state eq '배송 도착'}">
                                    <button type="button" class="btn btn-outline-secondary" onclick="javascript:location.href='${path}/AddReview.do?pay_no=${order.pay_no}'"> 구매 확정 </button>
                                    <button type="button" class="btn btn-outline-secondary" onclick="javascript:location.href='${path}/ReturnPaymentOne.do?pay_no=${order.pay_no}'"> 환불 </button>
                                </c:if>
                            </div>
                        </div>
                        <hr class="mb-5">
                    </c:if>
                </c:forEach>
                <c:if test="${empty orderList}">
                    <div class="text-center">
                        <h4> 주문 내역이 없습니다 : ) </h4>
                    </div>
                </c:if>
            </div>
        </div>
    </div>

    <!-- Footer Section Begin -->
    <%@include file="/layout/footer.jsp"%>
    <!-- Footer Section End -->
</div>
</body>

</html>