<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <title>카카오톡 실시간 상담 만들기</title>
    <style>
        .kakaoChat {
            position: fixed;
            right: 15px;
            bottom: 15px;
            width: 50px;
            height: 50px;
            z-index: 99;
        }
    </style>
</head>
<body>
<a href="https://open.kakao.com/o/ggOwUUCf" target="_blank"><img class="kakaoChat" src="${path}/img/카카오톡 투명로고.png" alt="카카오톡투명로고"/></a>
</body>
</html>