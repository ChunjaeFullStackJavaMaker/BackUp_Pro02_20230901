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
    <title>제품 수정하기</title>
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
                        <h2> 제품 수정하기 </h2>
                        <div class="breadcrumb__option">
                            <a href="${path}/">Home</a>
                            <span> 관리자 페이지 </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <section>
        <div class="container-md p-5 mt-5">
            <h3 class="mb-2"> 제품 수정 </h3>
            <form name="frm1" id="frm1" action="${path}/UpdateProductPro.do" method="post">
                <div class="form-outline mb-4 p-3">
                    <div class="row">
                        <div class="col col-6" style="height: 300px; background-image: url('${path}/storage/${product.thumb}'); background-position: center; background-size: cover"></div>
                        <div class="col col-6" style="height: 300px; background-image: url('${path}/storage/${product.img_src}'); background-position: center; background-size: cover"></div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-outline mb-4 col col-4">
                        <select name="cate_id" id="cate_id" class="form-control form-control-lg">
                            <c:forEach var="cate" items="${cateList}" varStatus="status">
                                <c:if test="${cate.cate_no eq product.cate_id}">
                                    <option value="${cate.cate_no}" selected>${cate.cate_name}</option>
                                </c:if>
                                <c:if test="${cate.cate_no ne product.cate_id}">
                                    <option value="${cate.cate_no}">${cate.cate_name}</option>
                                </c:if>
                            </c:forEach>
                        </select>
                        <label class="form-label" for="cate_id"> 카테고리 </label>
                    </div>

                    <div class="form-outline mb-4 col col-8">
                        <input type="hidden" id="pro_no" name="pro_no" value="${product.pro_no}"/>
                        <input type="text" id="title" name="title" class="form-control form-control-lg" maxlength="90" value="${product.title}" required />
                        <label class="form-label" for="title"> 상품명 </label>
                    </div>
                </div>
                <div class="form-outline mb-4">
                    <textarea class="form-control" id="description" name="description" placeholder="상품의 자세한 정보를 입력하세요" maxlength="1990" rows="10" required> ${product.description} </textarea>
                    <label for="description" class="form-label"> 상품 정보 </label>
                </div>
                <div class="form-outline mb-4">
                    <textarea class="form-control" id="pro_content" name="pro_content" placeholder="도서 상품의 설명을 입력하세요" maxlength="1990" rows="10" required> ${product.pro_content} </textarea>
                    <label for="pro_content" class="form-label"> 상품 설명 </label>
                </div>
                <div class="form-outline mb-4">
                    <input class="form-control form-control-lg" type="number" name="price" id="price" min="1000" step="100" value="${product.price}" required>
                    <label for="price" class="form-label"> 상품 가격 </label>
                </div>
                <div class="form-outline mb-4">
                    <p> ❗️상품 이미지는 변경 불가합니다. </p>
                </div>
                <div class="d-flex justify-content-center mt-4">
                    <button type="submit" class="btn btn-dark btn-block btn-lg gradient-custom-4"> 상품 수정하기 </button>
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