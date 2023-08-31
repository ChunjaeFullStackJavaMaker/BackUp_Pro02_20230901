<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="<%=request.getContextPath() %>" />
<%@include file="../setting/head.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>제품 상세보기</title>
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <script src="https://kit.fontawesome.com/67fc414e58.js" crossorigin="anonymous"></script>
    <style>
        button.player_btn {
            border: none;
            background-color: #ffffff;
        }
    </style>
</head>

<body>
<!-- Page Preloder -->
<div id="preloder">
    <div class="loader"></div>
</div>

<!-- Humberger Begin -->
<%@include file="../layout/header_top.jsp"%>
<!-- Humberger End -->

<!-- Header Section Begin -->
<%@include file="../layout/header.jsp"%>
<!-- Header Section End -->

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg" style="background-image: url('${path}/img/breadcrumb.jpg')">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2>${pro.title}</h2>
                    <div class="breadcrumb__option">
                        <a href="${path}/">Home</a>
                        <span>교 재</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->
<section class="product-details spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 col-md-6">
                <div class="product__details__pic">
                    <div class="product__details__pic__item">
                        <img class="product__details__pic__item--large"
                             src="${path}/storage/${pro.thumb}" alt="썸네일 이미지">
                    </div>
                </div>
            </div>
            <div class="col-lg-6 col-md-6">
                <div class="product__details__text">
                    <h3>${pro.title}</h3>
                    <div class="product__details__price">${pro.price}</div>
                    <p>${pro.description}</p>
                    <div class="product__details__quantity">
                        <div class="quantity">
                            <div class="pro-qty">
                                <c:if test="${amount == 0}">
                                <input type="text" value="품절" readonly>
                                </c:if>
                                <c:if test="${amount > 0}">
                                    <input type="number" id="amount" name="amount" value="1" min="1" max="${amount}">
                                </c:if>
                            </div>
                        </div>
                    </div>
                    <c:if test="${sid eq 'admin'}">
                    <a href="${path }/Receive.do?pro_no=${pro.pro_no }" class="primary-btn">입고</a>
                    </c:if>
                    <c:if test="${sid ne null and sid ne 'admin'}">
                    <button type="button" class="primary-btn" onclick="addCart()">장바구니 추가</button>
                    </c:if>
                </div>
            </div>
            <div class="col-lg-12">
                <div class="product__details__tab">
                    <ul class="nav nav-tabs" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab"
                               aria-selected="true">Description</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab"
                               aria-selected="false">Video</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab"
                               aria-selected="false">Reviews</a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane active" id="tabs-1" role="tabpanel">
                            <div class="product__details__tab__desc">
                                <h6>상품 상세 설명</h6>
                                <p>${pro.pro_content}</p>
                            </div>
                        </div>
                        <div class="tab-pane" id="tabs-2" role="tabpanel">
                            <div class="product__details__tab__desc">
                                <h6>상품 동영상</h6>
                                <div class="player" style="width: 800px; margin: 0 auto;">
                                    <div class="vdo_fr">
                                        <video id="video" style="width: 100%">
                                            <source src="${path}/storage/${info.movie}" type="video/mp4"/>
                                        </video>
                                    </div>
                                    <div id="progress">
                                        <div id="progressBar"></div>
                                    </div>
                                    <div id="buttonbar" style="width: 100%">
                                        <button id="play" class="player_btn"> <i class="fas fa-play"></i> </button>
                                        <button id="pause" class="player_btn"> <i class="fas fa-pause"></i> </button>
                                        <button id="stop" class="player_btn"> <i class="fas fa-stop"></i> </button>
                                        <div class="btn float-right">
                                            <input id="vol" type="range" value="500" min="0" max="1000">
                                            <button id="volTxt" class="player_btn">50%</button>
                                            <button id="full" class="player_btn"> <i class="fas fa-expand-arrows-alt"></i> </button>
                                        </div>
                                    </div>
                                    <script src="${path}/js/vdo.js"></script>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="tabs-3" role="tabpanel">
                            <div class="product__details__tab__desc">
                                <h5 style="margin-bottom: 20px"><strong>후기</strong></h5>
                                <div>
                                    <c:forEach var="review" items="${reviewList}">
                                        <div class="name"><strong>회원 ID: </strong>${review.mem_id}&nbsp;&nbsp;&nbsp;&nbsp;<strong>작성일시: </strong>${review.regdate}</div>
                                        <div class="star"><strong>별점: </strong>
                                            <c:if test="${review.star eq 5}">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                            </c:if>
                                            <c:if test="${review.star eq 4}">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                            </c:if>
                                            <c:if test="${review.star eq 3}">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                            </c:if>
                                            <c:if test="${review.star eq 2}">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                            </c:if>
                                            <c:if test="${review.star eq 1}">
                                                <i class="fa fa-star"></i>
                                            </c:if>
                                        </div>
                                        <div class="content">${review.content}</div>
                                        <hr>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<script>
    function addCart() {
        var cart_amount = document.getElementById("amount").value;
        location.href="${path}/AddCart.do?pro_no=${pro.pro_no}&amount="+cart_amount;
    }
</script>

<!-- Footer Section Begin -->
<%@ include file="../layout/footer.jsp"%>
<!-- Footer Section End -->

</body>
</html>