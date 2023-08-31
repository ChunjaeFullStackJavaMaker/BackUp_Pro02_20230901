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
    <title> MY PAGE - 개인 정보 수정</title>
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
        #post_btn {margin-top : 22px;}
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
                        <span>개인 정보 변경</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<!-- 나의 정보 수정 -->
<section class="blog spad">
    <div class="container">
        <div class="row">
            <div class="col col-lg-3 mb-3 p-3">
                <div class="p-4 border">
                    <a href="${path}/mypageInfo.do" class="d-block menu_item" style="color:#7FAD39; font-weight:bold"> 개인정보 변경 </a>
                    <a href="${path}/MyOrderList.do" class="d-block mt-2 menu_item" > 주문/배송 조회 </a>
                    <a href="${path}/mypageReview.do" class="d-block mt-2 menu_item"> 리뷰 관리</a>
                </div>
            </div>
            <div class="col-lg-9 col-md-9">
                <form action="${path}/mypageInfoPro.do" method="post">
                    <div class="row">
                        <div class="col-lg-12 col-md-12">
                            <div class="checkout__input">
                                <p>아이디<span>*</span></p>
                                <input type="text" value="${mem.id }" name="id" id="id" class="indata" readonly required>
                            </div>
                            <div class="checkout__input">
                                <p>비밀번호<span>*</span></p>
                                <input type="password" value="${pw }" name="pw" id="pw" class="indata"  required>
                            </div>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>주소<span>*</span></p>
                                        <input type="text" name="postcode" id="postcode" class="indata" value="${postcode}" required>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p><span></span></p>
                                        <button type="button" id="post_btn" onclick="findAddr()" class="site-btn" >우편번호검색</button>
                                    </div>
                                </div>
                            </div>
                            <div class="checkout__input">
                                <input type="text" name="address1" id="address1" value="${addr1 }" class="indata"  required>
                            </div>
                            <div class="checkout__input">
                                <input type="text" name="address2" id="address2" value="${addr2 }"  class="indata"  required>
                            </div>
                            <div class="checkout__input">
                                <p>전화번호<span>*</span></p>
                                <input type="tel" value="${mem.tel }" name="tel" id="tel" class="indata"  required >
                            </div>
                            <div class="checkout__input">
                                <p>이메일<span>*</span></p>
                                <input type="email" value="${mem.email }" name="email" id="email"  class="indata"  required >
                            </div>
                            <div class="checkout__input">
                                <p>생년월일<span>*</span></p>
                                <input type="date" value="${mem.birth }" name="birth" id="birth" class="indata"  required>
                            </div>
                            <div>
                                <button type="submit" class="site-btn" style="float:right;">개인정보수정</button>
                            </div>
                        </div>
                    </div>
                </form>
                <script>
                    function findAddr() {
                        new daum.Postcode({
                            oncomplete: function(data) {
                                console.log(data);
                                var roadAddr = data.roadAddress;
                                var jibunAddr = data.jibunAddress;
                                document.getElementById("postcode").value = data.zonecode;
                                if(roadAddr !== '') {
                                    document.getElementById("address1").value = roadAddr;
                                } else if(jibunAddr !== ''){
                                    document.getElementById("address1").value = jibunAddr;
                                }
                                document.getElementById("address2").focus();
                            }
                        }).open();
                    }
                </script>
                <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
            </div>
        </div>
    </div>
</section>
<!-- 나의 정보 수정 끝 -->

<!-- Footer Section Begin -->
<%@include file="/layout/footer.jsp"%>
<!-- Footer Section End -->
</body>

</html>