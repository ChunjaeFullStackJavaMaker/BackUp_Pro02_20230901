<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="<%=request.getContextPath() %>" />
<c:set var="state_list" value="${fn:split('입고 중,출하 중,상차,하차,캠프 도착,배송 중,배송 도착',',')}" />
<%@include file="../../setting/head.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title> 배송 정보 입력하기 </title>
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
                        <h2> 배송 정보 입력하기 </h2>
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
            <h4 class="mb-2"> 주문 정보 </h4>
            <div class="border p-4">
                <div class="row">
                    <div class="form-outline mb-4 col col-3">
                        <input type="text" name="del_no" class="form-control form-control"value="${delivery.del_no}" readonly />
                        <label class="form-label" for="title"> 배송번호 </label>
                    </div>

                    <div class="form-outline mb-4 col col-9">
                        <input type="text" id="title" name="title" class="form-control form-control" value="${delivery.title}" readonly />
                        <label class="form-label" for="title"> 상품명 </label>
                    </div>
                </div>
                <div class="row">
                    <div class="form-outline mb-4 col col-6">
                        <input type="text" class="form-control" id="cus_id" name="cus_id" value="${delivery.custom_id}" readonly>
                        <label for="cus_id" class="form-label"> 주문자 ID </label>
                    </div>
                    <div class="form-outline mb-4 col col-6">
                        <input type="text" class="form-control" id="cus_tel" name="cus_tel" value="${delivery.cus_tel}" readonly>
                        <label for="cus_tel" class="form-label"> 주문자 전화번호 </label>
                    </div>
                </div>
                <div class="form-outline">
                    <input class="form-control form-control" type="text" name="cus_addr" id="cus_addr" value="${delivery.del_addr}" readonly>
                    <label for="cus_addr" class="form-label"> 배송지주소 </label>
                </div>
            </div>

            <h4 class="mt-5 mb-2"> 배송 정보 </h4>
            <form name="frm1" id="frm1" action="${path}/UpdateDeliveryPro.do" method="post" class="border p-4">
                <div class="row">
                    <div class="form-outline mb-4 col col-4">
                        <input type="hidden" id="del_no" name="del_no" value="${delivery.del_no}">
                        <input type="hidden" id="type" name="type" value="${param.type}">
                        <input type="date" id="pay_resdate" name="pay_resdate" class="form-control form-control" value="${fn:substring(delivery.pay_resdate, 0, 10)}" readonly />
                        <label class="form-label" for="pay_resdate"> 결제일 </label>
                    </div>
                    <div class="form-outline mb-4 col col-4">
                        <input type="date" id="del_date" name="del_date" class="form-control form-control" value="${fn:substring(delivery.del_date, 0, 10)}" readonly />
                        <label class="form-label" for="del_date"> 배송시작일 </label>
                    </div>
                    <div class="form-outline mb-4 col col-4">
                        <input type="date" id="res_date" name="res_date" class="form-control form-control" value="${fn:substring(delivery.res_date, 0, 10)}" required />
                        <label class="form-label" for="res_date"> 배송예정일 </label>
                    </div>
                </div>
                <div class="row">
                    <div class="form-outline mb-4 col col-4">
                        <input type="text" class="form-control" id="del_com" name="del_com" value="${delivery.del_com}" required>
                        <label for="del_com" class="form-label"> 배송사 </label>
                    </div>
                    <div class="form-outline mb-4 col col-8">
                        <input type="text" class="form-control" id="del_tel" name="del_tel" value="${delivery.del_tel}" required>
                        <label for="del_tel" class="form-label"> 배송기사 전화번호 </label>
                    </div>
                </div>
                <div class="row">
                    <div class="form-outline mb-4 col col-8">
                        <input class="form-control" type="text" name="del_code" id="del_code" value="${delivery.del_code}" required>
                        <label for="del_code" class="form-label"> 송장번호 </label>
                    </div>
                    <div class="form-outline mb-4 col col-4">
                        <select class="form-control" name="del_state" id="del_state">
                            <c:forEach var="state" items="${state_list}" varStatus="status">
                                <c:if test="${delivery.current_state eq state}">
                                    <option value="${status.index}" selected> ${state} </option>
                                </c:if>
                                <c:if test="${delivery.current_state ne state}">
                                    <option value="${status.index}"> ${state} </option>
                                </c:if>
                            </c:forEach>
                        </select>
                        <label for="del_state" class="form-label"> 배송상태 </label>
                    </div>
                </div>

                <div class="d-flex justify-content-center mt-4">
                    <button type="submit" class="btn btn-dark btn-block btn-lg gradient-custom-4"> 배송정보 수정 </button>
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