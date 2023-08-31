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
    <title> ADMIN DASHBOARD </title>
    <c:set var="path" value="<%=request.getContextPath()%>"/>
    <c:set var="now" value="<%=new java.util.Date()%>"/>
    <c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy"/></c:set>
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

    <!-- Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
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
                        <h2> ADMIN MAIN </h2>
                        <div class="breadcrumb__option">
                            <a href="${path}/">Home</a>
                            <span> ADMIN MAIN </span>
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
                    <a href="${path}/AdminDashboard.do" class="d-block menu_item" style="color:#7FAD39; font-weight:bold"> ADMIN MAIN </a>
                    <a href="${path}/AdminProductList.do" class="d-block menu_item mt-2"> 상품 관리 </a>
                    <a href="${path}/DeliveryList.do" class="d-block menu_item mt-2"> 배송 정보 관리 </a>
                    <a href="${path}/MemberMgmt.do" class="d-block menu_item mt-2"> 회원 관리 </a>
                </div>
            </div>
            <main class="col-md-9 ms-sm-auto col-lg-9 px-md-4">
                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                    <h4> ADMIN DASHBOARD </h4>
                </div>
                <canvas class="my-4 w-100" id="myChart" width="1326" height="559" style="display: block; box-sizing: border-box; height: 373px; width: 884px;"></canvas>

                <h4 class="mb-3"> ${sysYear-1}년 ~ ${sysYear}년 상품 판매량 (상위 30개) </h4>
                <div class="table-responsive middle mb-5 pb-5">
                    <table class="table table-striped table-md">
                        <thead class="text-center">
                        <tr>
                            <th scope="col"> # </th>
                            <th scope="col"> 상품명 </th>
                            <th scope="col"> 판매량 </th>
                            <th scope="col"> 판매액 </th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="pro" items="${hotProducts}" varStatus="idx">
                            <tr>
                                <td class="text-center"> ${idx.index + 1} </td>
                                <td> ${pro.title} </td>
                                <td class="text-center"> ${pro.sum_amount} </td>
                                <td class="text-right"> ${pro.sum_price} </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </main>
        </div>
    </div>
    <!-- Footer Section Begin -->
    <%@include file="/layout/footer.jsp"%>
    <!-- Footer Section End -->

    <script>
        $(document).ready(function() {
            const labelList = [];
            const sales = [];
            const profits = [];

            $.ajax({
                url:"${path}/getProfit.do",
                type:"post",
                dataType:"json",
                success: function(data) {
                    for(var i=0; i<data.length; i++) {
                        var temp = data[i];
                        labelList[i] = temp.date;
                        sales[i] = temp.sales;
                        profits[i] = temp.profit;
                    }

                    var ctx = document.getElementById("myChart");

                    var mixedChart = {
                        type: 'bar',
                        labels: labelList,
                        datasets: [
                            {
                                label: '총 매출액',
                                data: sales,
                                type: 'line',
                                backgroundColor: 'transparent',
                                borderColor: '#282c37'
                            },
                            {
                                label: '매출총이익',
                                data: profits,
                                backgroundColor: '#9baec8'
                            }
                        ]
                    };

                    var myChart = new Chart(ctx, {
                        type: 'bar',
                        data: mixedChart,
                        options: {
                            legend: {
                                display: true
                            }
                        }
                    });
                }
            });
        });
    </script>
</div>
</body>
</html>
