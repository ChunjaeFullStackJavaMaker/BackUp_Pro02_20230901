<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>CORNBOOK</title>

<%@ include file="/setting/head.jsp"%>
<%@ include file="/layout/Chat.jsp"%>    

</head>

<body>
<!-- Page Preloder -->
<div id="preloder">
    <div class="loader"></div>
</div>
<%--항상 따라다니는 사이드 메뉴--%>
<%@include file="/layout/AllAround_SideMenu.jsp"%>

<!-- Humberger Begin -->
<%@include file="/layout/header_top.jsp"%>
<!-- Humberger End -->

<!-- Header Section Begin -->
<%@include file="/layout/header.jsp"%>
<!-- Header Section End -->

<!-- Hero Section Begin -->
<%@include file="/Main_contents/main_banner.jsp"%>
<!-- Hero Section End -->

<!-- Categories Section Begin -->
<%@ include file="/Main_contents/category.jsp"%>
<!-- Categories Section End -->



<!-- Featured Section Begin -->
<%@ include file="/Main_contents/feature_Product.jsp"%>
<!-- Featured Section End -->

<!-- Banner Begin -->
<%@include file="/Main_contents/banner.jsp"%>
<!-- Banner End -->

<!-- Latest Product Section Begin -->
<%--<%@include file="/Main_contents/LatestProduct.jsp"%>--%>
<!-- Latest Product Section End -->

<!-- Blog Section Begin -->
<%@include file="/Main_contents/Blog_review.jsp"%>
<!-- Blog Section End -->

<!-- Footer Section Begin -->
<%@include file="/layout/footer.jsp"%>
<!-- Footer Section End -->
</body>

</html>