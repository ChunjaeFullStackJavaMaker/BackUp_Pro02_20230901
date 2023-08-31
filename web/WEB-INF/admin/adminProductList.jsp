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
    <title> 상품 관리 </title>
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
    <section class="breadcrumb-section" style="background-image: url('${path}/img/breadcrumb.jpg'); background-position: bottom, center; background-size: cover">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2> 상품 관리 </h2>
                        <div class="breadcrumb__option">
                            <a href="${path}/">Home</a>
                            <span> 상품 관리 </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <div class="container mt-5" style="min-height:50vh">
        <div class="row">
            <div class="col col-lg-3 mb-3 p-3">
                <div class="p-4 border">
                    <a href="${path}/AdminDashboard.do" class="d-block menu_item"> ADMIN MAIN </a>
                    <a href="${path}/AdminProductList.do" class="d-block menu_item mt-2" style="color:#7FAD39; font-weight:bold"> 상품 관리 </a>
                    <a href="${path}/DeliveryList.do" class="d-block menu_item mt-2"> 배송 정보 관리 </a>
                    <a href="${path}/MemberMgmt.do" class="d-block menu_item mt-2"> 회원 관리 </a>
                </div>
            </div>
            <div class="col col-lg-9 mt-3">
                <button onclick="javascript: location.href='${path}/AddProduct.do'" class="btn btn-primary float-right mb-3"> 상품 등록 </button>
                <table class="table table-striped mb-5">
                    <thead>
                    <tr class="text-center"><th> 상품번호 </th><th> 책 제목 </th><th> 가격 </th><th> 관리 </th></tr>
                    </thead>
                    <tbody>
                    <c:forEach var="pro" items="${proList}">
                        <tr class="text-center">
                            <td class="align-middle">${pro.pro_cate_no}</td>
                            <td class="align-middle">${pro.title}</td>
                            <td class="align-middle">${pro.price}원 </td>
                            <td class="align-middle">
                                <button class="btn btn-outline-primary" onclick="javascript: location.href='${path}/UpdateProduct.do?pro_no=${pro.pro_no}'"> 수정 </button>
                                <button class="btn btn-outline-primary" onclick="javascript: location.href='${path}/DelProduct.do?pro_no=${pro.pro_no}'"> 삭제 </button>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <nav aria-label="Page navigation example" id="page-nation1">
                    <ul class="pagination justify-content-center mb-5">
                        <c:if test="${ curPageNum > 5 }">
                            <li class="page-item"><a href="${path }/AdminProductList.do?page=${ blockStartNum - 1 }" class="page-link"> &laquo; </a></li>
                        </c:if>
                        <c:forEach var="i" begin="${ blockStartNum }" end="${ blockLastNum }">
                            <c:choose>
                                <c:when test="${ i == curPageNum }">
                                    <li class="page-item active" aria-current="page"><a href="${path }/AdminProductList.do?page=${i}" class="page-link"> ${ i } </a></li>
                                </c:when>
                                <c:otherwise>
                                    <li class="page-item"><a href="${path }/AdminProductList.do?page=${ i }" class="page-link">${ i }</a></li>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                        <c:if test="${ blockLastNum < totalPageCount }">
                            <li class="page-item"><a href="${path }/AdminProductList.do?page=${ blockLastNum + 1 }" class="page-link"> &raquo; </a></li>
                        </c:if>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
    <!-- Footer Section Begin -->
    <%@include file="/layout/footer.jsp"%>
    <!-- Footer Section End -->
</div>
</body>
</html>