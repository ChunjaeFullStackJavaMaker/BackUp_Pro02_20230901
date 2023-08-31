<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="<%=request.getContextPath() %>" />
<header class="header">
    <div class="header__top">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <div class="col-lg-12 col-md-12">
                        <div class="header__top__right">
                            <div class="header__top__right__auth">
                                <c:if test="${sid eq null}">
                                    <a href="${path}/Login.do"><i class="fa fa-user"></i> Login</a>
                                    <a href="${path}/Term.do"><i class="fa fa-sign-in" aria-hidden="true"></i> Join </a>
                                </c:if>
                                <c:if test="${sid ne null and sid ne 'admin'}">
                                    <a href="${path}/Logout.do"><i class="fa fa-user"></i> Logout </a>
                                    <a href="${path}/mypageInfo.do"><i class="fa fa-sign-in" aria-hidden="true"></i> MyPage </a>
                                </c:if>
                                <c:if test="${sid eq 'admin'}">
                                    <a href="${path}/Logout.do"><i class="fa fa-user"></i> Logout </a>
                                    <a href="${path}/AdminDashboard.do"><i class="fa fa-sign-in" aria-hidden="true"></i> Admin Page </a>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="header__logo">
                    <a href="${path}/"><img src="${path}/img/logo/corn_book_85-55.png" alt=""></a>
                </div>
            </div>
            <div class="col-lg-6">
                <nav class="header__menu">
                    <ul>
                        <li><a href="${path}/CateProList.do?cate_id=Q&cate_id=R&cate_id=S"> 유아 </a>
                            <ul class="header__menu__dropdown">
                                <li><a href="${path}/CateProList.do?cate_id=Q">유아콘텐츠</a></li>
                                <li><a href="${path}/CateProList.do?cate_id=R">유아놀이</a></li>
                                <li><a href="${path}/CateProList.do?cate_id=S">유아기타</a></li>
                            </ul>
                        </li>
                        <li><a href="${path}/CateProList.do?cate_id=A&cate_id=B&cate_id=C&cate_id=D"> 초등 </a>
                            <ul class="header__menu__dropdown">
                                <li><a href="${path}/CateProList.do?cate_id=B">초등참고서</a></li>
                                <li><a href="${path}/CateProList.do?cate_id=C">초등문제집</a></li>
                                <li><a href="${path}/CateProList.do?cate_id=D">초등기타</a></li>
                            </ul>
                        </li>
                        <li><a href="${path}/CateProList.do?cate_id=E&cate_id=F&cate_id=G&cate_id=H"> 중등 </a>
                            <ul class="header__menu__dropdown">
                                <li><a href="${path}/CateProList.do?cate_id=E">중등교과서</a></li>
                                <li><a href="${path}/CateProList.do?cate_id=F">중등참고서</a></li>
                                <li><a href="${path}/CateProList.do?cate_id=G">중등문제집</a></li>
                                <li><a href="${path}/CateProList.do?cate_id=H">중등기타</a></li>
                            </ul>
                        </li>
                        <li><a href="${path}/CateProList.do?cate_id=I&cate_id=J&cate_id=K&cate_id=L"> 고등 </a>
                            <ul class="header__menu__dropdown">
                                <li><a href="${path}/CateProList.do?cate_id=I">고등교과서</a></li>
                                <li><a href="${path}/CateProList.do?cate_id=J">고등참고서</a></li>
                                <li><a href="${path}/CateProList.do?cate_id=K">고등문제집</a></li>
                                <li><a href="${path}/CateProList.do?cate_id=L">고등기타</a></li>
                            </ul>
                        </li>
                        <li><a href="#"> 고객지원 </a>
                            <ul class="header__menu__dropdown">
                                <li><a href="${path}/NoticeList.do"> 공지사항 </a></li>
                                <li><a href="${path}/FaqList.do"> FAQ </a></li>
                            </ul>
                        </li>
                    </ul>
                </nav>
            </div>
            <div class="col-lg-3">
                <c:if test="${sid ne null and sid ne 'admin'}">
                    <div class="header__cart">
                        <ul>
                            <li><a href="${path}/CartList.do"><i class="fa fa-shopping-bag"></i></a></li>
                        </ul>
                    </div>
                </c:if>
            </div>
        </div>
        <div class="humberger__open">
            <i class="fa fa-bars"></i>
        </div>
    </div>
</div>
</header>

