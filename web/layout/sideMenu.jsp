<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="<%=request.getContextPath() %>" />
<section class="hero">
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="hero__categories">
                    <div class="hero__categories__all">
                        <i class="fa fa-bars"></i>
                        <span>All Products</span>
                    </div>
                    <ul>
                        <li><a href="#">초등교과서</a></li>
                        <li><a href="#">초등참고서</a></li>
                        <li><a href="#">초등문제집</a></li>
                        <li><a href="#">초등기타</a></li>
                        <li><a href="#">중등교과서</a></li>
                        <li><a href="#">중등참고서</a></li>
                        <li><a href="#">중등문제집</a></li>
                        <li><a href="#">중등기타</a></li>
                        <li><a href="#">고등교과서</a></li>
                        <li><a href="#">고등참고서</a></li>
                        <li><a href="#">고등기타</a></li>
                        <li><a href="#">유아콘텐츠</a></li>
                        <li><a href="#">유아놀이</a></li>
                        <li><a href="#">유아기타</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-9">
                <div class="hero__search">
                    <div class="hero__search__form">
                        <form action="#">
                            <div class="hero__search__categories">
                                All Categories
                                <span class="arrow_carrot-down"></span>
                            </div>
                            <input type="text" placeholder="찾으시는 책을 검색해주세요.">
                            <button type="submit" class="site-btn">SEARCH</button>
                        </form>
                    </div>
                    <div class="hero__search__phone">
                        <div class="hero__search__phone__icon">
                            <i class="fa fa-phone"></i>
                        </div>
                        <div class="hero__search__phone__text">
                            <h5>+65 11.188.888</h5>
                            <span>support 24/7 time</span>
                        </div>
                    </div>
                </div>
                <div class="hero__item set-bg" data-setbg="${path}/img/hero/banner.jpg">
                    <div class="hero__text">
                        <span>First Kids, First Students</span>
                        <h2>Innovative for <br />Education</h2>
                        <p>Free Pickup and Delivery Available</p>
                        <a href="#" class="primary-btn">SHOP NOW</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>