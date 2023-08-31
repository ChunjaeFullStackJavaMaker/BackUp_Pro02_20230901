<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 상세보기</title>
    <c:set var="path" value="<%=request.getContextPath() %>" />
    <%@ include file="../common.jsp"%>
<<<<<<< HEAD
    <%@ include file="../setting/head.jsp"%>
=======
    <%@ include file="/setting/head.jsp" %>
>>>>>>> 11d56b7ea555b3835a68fa574d772a5fd8fd4d68
    <style>
    #tb1 { width:960px; margin:40px auto; }
    #tb1 th { background-color: #7fad39; color:#fff; }
    .table {background-color: #F5F5F5; border-radius:10px; overflow:hidden;}
    .item1 { width:10%; }
    .item2 { width:70%; }
    .item3 { width:11%; }
    .item4 { width:10%; }
    #page-nation1 { width: 960px; margin:20px auto; }
    </style>
</head>
<body>
<div class="container-fluid">
    <%@include file="/layout/header_top.jsp"%>
    <%@ include file="/layout/header.jsp" %>
    <div class="contents" style="min-height:100vh">
        <!-- Breadcrumb Section Begin -->
        <section class="breadcrumb-section set-bg" style="background-image: url('${path}/img/breadcrumb.jpg')">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <div class="breadcrumb__text">
                            <h2>공지사항</h2>
                            <div class="breadcrumb__option">
                                <a href="${path}">Home</a>
                                <span>고객지원</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Breadcrumb Section End -->
        <h2 class="title">공지사항 상세보기</h2>
        <div class="container">
            <div class="box_wrap">
                <table class="table" id="tb1">
                    <tbody>
                    <tr>
                        <th>글 번호</th>
                        <td>${noti.no }</td>
                    </tr>
                    <tr>
                        <th>글 제목</th>
                        <td>${noti.title }</td>
                    </tr>
                    <tr>
                        <th>글 내용</th>
                        <td>${noti.content }</td>
                    </tr>
                    <tr>
                        <th>작성일시</th>
                        <td>${noti.resdate }</td>
                    </tr>
                    <tr>
                        <th>읽은 횟수</th>
                        <td>${noti.visit }</td>
                    </tr>
                    </tbody>
                </table>
                <div class="btn-group">
                    <a href="${path }/NoticeList.do" class="btn btn-primary">글 목록</a>
                    <c:if test="${sid.equals('admin')}">
                        <a href="${path }/UpdateNotice.do?no=${noti.no }" class="btn btn-primary">글 수정</a>
                        <a href="${path }/DeleteNotice.do?no=${noti.no }" class="btn btn-primary">글 삭제</a>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="/layout/footer.jsp" %>
</div>
</body>
</html>
