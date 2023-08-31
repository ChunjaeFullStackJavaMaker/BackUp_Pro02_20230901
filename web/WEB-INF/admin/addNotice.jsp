<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 글쓰기</title>
    <c:set var="path" value="<%=request.getContextPath() %>" />
    <%@ include file="../../common.jsp"%>
    <%@ include file="/setting/head.jsp" %>
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
        <h2 class="title">공지사항 글 등록</h2>
        <div class="container">
            <div class="box_wrap">
                <form action="${path }/AddNoticePro.do" method="post">
                    <table class="table" id="tb1">
                        <tbody>
                        <tr>
                            <th>글 제목</th>
                            <td><input type="text" name="title" id="title" class="form-control" required></td>
                        </tr>
                        <tr>
                            <th>글 내용</th>
                            <td><textarea name="content" id="content" class="form-control"></textarea></td>
                        </tr>
                        </tbody>
                    </table>
                    <div class="group container">
                        <input type="submit" value="글 등록" class="btn btn-primary"/>
                        <a href="${path }/NoticeList.do" class="btn btn-primary">글 목록</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <%@ include file="/layout/footer.jsp" %>
</div>
</body>
</html>
