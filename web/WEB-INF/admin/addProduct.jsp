<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="<%=request.getContextPath() %>" />
<%@include file="../../setting/head.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>제품 등록하기</title>
    <%@include file="../../setting/head.jsp"%>
</head>

<body>
<!-- Page Preloder -->
<div id="preloder">
    <div class="loader"></div>
</div>

<div class="container-fluid m-0 p-0">
    <!-- Humberger Begin -->
    <%@include file="../../layout/header_top.jsp"%>
    <!-- Humberger End -->

    <!-- Header Section Begin -->
    <%@include file="../../layout/header.jsp"%>
    <!-- Header Section End -->

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section" style="background-image: url('${path}/img/breadcrumb.jpg'); background-position: bottom, center; background-size: cover">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2> 제품 등록하기 </h2>
                        <div class="breadcrumb__option">
                            <a href="${path}/">Home</a>
                            <a href="${path}/AdminDashboard.do">관리자 페이지</a>
                            <span> 제품 등록 </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <section>
        <div class="container-md p-5 mt-5">
            <h3 class="mb-2"> 제품 등록 </h3>
            <form name="frm1" id="frm1" action="${path}/AddProductPro.do" method="post" enctype="multipart/form-data">
                <div class="row">
                    <div class="form-outline mb-4 col col-4">
                        <select name="cate_id" id="cate_id" class="form-control form-control-lg">
                            <c:forEach var="cate" items="${cateList}" varStatus="status">
                                <option value="${cate.cate_no}">${cate.cate_name}</option>
                            </c:forEach>
                        </select>
                        <label class="form-label" for="cate_id"> 카테고리 </label>
                    </div>

                    <div class="form-outline mb-4 col col-8">
                        <input type="text" id="title" name="title" class="form-control form-control-lg" maxlength="90" required />
                        <label class="form-label" for="title"> 상품명 </label>
                    </div>
                </div>
                <div class="form-outline mb-4">
                    <textarea class="form-control" id="description" name="description" placeholder="상품의 자세한 정보를 입력하세요" maxlength="1990" rows="10" required></textarea>
                    <label for="description" class="form-label"> 상품 정보 </label>
                </div>
                <div class="form-outline mb-4">
                    <textarea class="form-control" id="pro_content" name="pro_content" placeholder="도서 상품의 설명을 입력하세요" maxlength="1990" rows="10" required></textarea>
                    <label for="pro_content" class="form-label"> 상품 설명 </label>
                </div>
                <div class="form-outline mb-4">
                    <input class="form-control form-control-lg" type="number" name="price" id="price" value="1000" min="1000" step="100" required>
                    <label for="price" class="form-label"> 상품 가격 </label>
                </div>
                <div class="row">
                    <div class="form-outline mb-4 col col-4">
                        <input class="form-control form-control-lg" type="file" name="thumb" id="thumb" placeholder="상품 메인이미지" required>
                        <label for="thumb" class="form-label"> 상품 이미지(메인) </label>
                    </div>
                    <div class="form-outline mb-4 col col-4">
                        <input class="form-control form-control-lg" type="file" name="img_src" id="img_src" placeholder="상품 서브이미지" required>
                        <label for="img_src" class="form-label"> 상품 이미지(서브) </label>
                    </div>
                    <div class="form-outline mb-4 col col-4">
                        <input class="form-control form-control-lg" type="file" name="movie" id="movie" placeholder="상품 맛보기 동영상" required>
                        <label for="img_src" class="form-label"> 상품 이미지(서브) </label>
                    </div>
                </div>
                <div class="d-flex justify-content-center mt-4">
                    <button type="submit" class="btn btn-dark btn-block btn-lg gradient-custom-4"> 상품 등록하기 </button>
                </div>
            </form>
        </div>
    </section>

    <!-- Footer Section Begin -->
    <%@ include file="../../layout/footer.jsp"%>
    <!-- Footer Section End -->
</div>
</body>
</html>