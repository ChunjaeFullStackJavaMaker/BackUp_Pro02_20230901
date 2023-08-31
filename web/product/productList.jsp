<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <title>상품 목록</title>

    <%@ include file="/setting/head.jsp"%>
</head>

<body>
<!-- Page Preloder -->
<div id="preloder">
    <div class="loader"></div>
</div>

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
                    <h2>상품 목록</h2>
                    <div class="breadcrumb__option">
                        <a href="${path}">Home</a>
                        <span>상품 목록</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<!-- Product Section Begin -->
<section class="product spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-5">
                <div class="sidebar">
                    <div class="sidebar__item">
                        <h4>Department</h4>
                        <ul>
                            <c:if test="${param.cate_id eq 'QRS' || param.cate_id eq 'Q' || param.cate_id eq 'R' || param.cate_id eq 'S'}">
                                <li><a href="${path}/CateProList.do?cate_id=Q">유아 콘텐츠</a></li>
                                <li><a href="${path}/CateProList.do?cate_id=R">유아 놀이</a></li>
                                <li><a href="${path}/CateProList.do?cate_id=S">유아 기타</a></li>
                            </c:if>
                            <c:if test="${param.cate_id eq 'ABCD' || param.cate_id eq 'A' || param.cate_id eq 'B' || param.cate_id eq 'C' || param.cate_id eq 'D'}">
                                <li><a href="${path}/CateProList.do?cate_id=A">초등 교과서</a></li>
                                <li><a href="${path}/CateProList.do?cate_id=B">초등 참고서</a></li>
                                <li><a href="${path}/CateProList.do?cate_id=C">초등 문제집</a></li>
                                <li><a href="${path}/CateProList.do?cate_id=D">초등 기타</a></li>
                            </c:if>
                            <c:if test="${param.cate_id eq 'EFGH' || param.cate_id eq 'E' || param.cate_id eq 'F' || param.cate_id eq 'G' || param.cate_id eq 'H'}">
                                <li><a href="${path}/CateProList.do?cate_id=E">중등 교과서</a></li>
                                <li><a href="${path}/CateProList.do?cate_id=F">중등 참고서</a></li>
                                <li><a href="${path}/CateProList.do?cate_id=G">중등 문제집</a></li>
                                <li><a href="${path}/CateProList.do?cate_id=H">중등 기타</a></li>
                            </c:if>
                            <c:if test="${param.cate eq 'IJKL' || param.cate_id eq 'I' || param.cate_id eq 'J' || param.cate_id eq 'K' || param.cate_id eq 'L'}">
                                <li><a href="${path}/CateProList.do?cate_id=I">고등 교과서</a></li>
                                <li><a href="${path}/CateProList.do?cate_id=J">고등 참고서</a></li>
                                <li><a href="${path}/CateProList.do?cate_id=K">고등 문제집</a></li>
                                <li><a href="${path}/CateProList.do?cate_id=L">고등 기타</a></li>
                            </c:if>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-lg-9 col-md-7">
                <div class="row">
                    <c:forEach var="pro" items="${proList}" varStatus="status">
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product__item">
                                <div class="product__item__pic set-bg" style="background-image: url('${path }/storage/${pro.img_src}')">
                                </div>
                                <div class="product__item__text">
                                    <h6><a href="${path}/getProduct.do?pro_no=${pro.pro_no }">${pro.title}</a></h6>
                                    <h5>${pro.price}</h5>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    <c:if test="${empty proList}">
                        <li class="col-12">해당 상품이 존재하지 않습니다.</li>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Product Section End -->

<!-- Footer Section Begin -->
<%@include file="/layout/footer.jsp"%>
<!-- Footer Section End -->

</body>

</html>