<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>입고 처리</title>
    <c:set var="path" value="<%=request.getContextPath() %>" />
    <%@include file="../../setting/head.jsp"%>
    <style>
        .breadcrumb-section {background-image: url("${path }/img/breadcrumb.jpg");}
    </style>
</head>
<body>
<!-- Page Preloder -->
<div id="preloder">
    <div class="loader"></div>
</div>

<!-- Humberger Begin -->
<%@include file="../../layout/header_top.jsp"%>
<!-- Humberger End -->

<!-- Header Section Begin -->
<%@include file="../../layout/header.jsp"%>
<!-- Header Section End -->

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section" style="background-image: url('${path}/img/breadcrumb.jpg'); background-size: cover; background-position: center">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2> ${pro.title } 상품 입고 </h2>
                    <div class="breadcrumb__option">
                        <a href="${path}/">Home</a>
                        <span> ${pro.title} 상품 입고 </span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<!-- 제품 상세 보기 및 입고 처리 -->
<section class="product-details spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 col-md-6">
                <div class="product__details__pic">
                    <div class="product__details__pic__item">
                        <img class="product__details__pic__item--large"
                             src="${path }/storage/${pro.img_src }" alt="">
                    </div>
                </div>
            </div>
            <div class="col-lg-6 col-md-6">
                <div class="product__details__text">
                    <h3>${pro.title}</h3>
                    <div class="product__details__price">${pro.price }</div>
                    <p>${pro.description}</p>
                    <div class="product__details__quantity">
                        <form action="${path}/ReceivePro.do" method="post">
                            <p class="mb-2">입고 금액<span>*</span></p>
                            <div class="col-lg-12">
                                <div class="checkout__input">
                                    <input type="hidden" id="pro_no" name="pro_no" value="${pro.pro_no}">
                                    <input class="form-control" type="number" name="receive" id="receive" min="1" value="1000">
                                </div>
                            </div>
                            <p class="mb-2">입고 수량<span>*</span></p>
                            <div class="col-lg-12">
                                <div class="checkout__input">
                                    <input class="form-control" type="number" name="re_amount" id="re_amount" min="1" max="100" value="1" >
                                </div>
                            </div>
                            <input type="submit" id="receive_btn" class="site-btn" value="RECEIVE"/>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- 제품 상세 보기 및 입고 처리  -->

<!-- Footer Section Begin -->
<%@ include file="../../layout/footer.jsp"%>
<!-- Footer Section End -->

</body>
</html>