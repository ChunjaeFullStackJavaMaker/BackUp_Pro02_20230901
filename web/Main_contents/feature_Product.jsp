<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="<%=request.getContextPath() %>" />
<section class="featured spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section-title">
                    <h2>CORN BOOKS</h2>
                </div>
                <div class="featured__controls">
                    <ul>
                        <li class="active" data-filter="*">All</li>
                        <li data-filter=".유아">유아</li>
                        <li data-filter=".초등">초등</li>
                        <li data-filter=".중등">중등</li>
                        <li data-filter=".고등">고등</li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="row featured__filter">
<%--            대략적인 템플릿이올시다.                                      --%>
<%--            <c:forEach var="product" items="${oceaniaProductList}">--%>
<%--                <div class="slide">--%>
<%--                    <img src="${pageContext.request.contextPath}/${product.imgUrl_1}" alt="image">--%>
<%--                    <div class="slide-content">--%>
<%--                        <h3>${product.name}</h3>--%>
<%--                        <p>${product.summary}</p>--%>
<%--                        <p class="price">${product.price}</p>--%>
<%--                        <a href="${pageContext.request.contextPath}/cart?cmd=add&product_id=${product.id}" class="buy-btn">구매하기</a>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </c:forEach>--%>
            <div class="col-lg-3 col-md-4 col-sm-6 mix 유아">
                <div class="featured__item">
                    <div class="featured__item__pic set-bg">
                        <img src="${path}/img/main/childbook01.webp" alt="">
                        <ul class="featured__item__pic__hover">
                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                            <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                        </ul>
                    </div>
                    <div class="featured__item__text">
                        <h6><a href="#">유아 책 01</a></h6>
                        <h5>5000₩</h5>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-md-4 col-sm-6 mix 초등">
                <div class="featured__item">
                    <div class="featured__item__pic set-bg">
                        <img src="${path}/img/main/elementarybook01.jpg" alt="">
                        <ul class="featured__item__pic__hover">
                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                            <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                        </ul>
                    </div>
                    <div class="featured__item__text">
                        <h6><a href="#">초등 책 01</a></h6>
                        <h5>6000₩</h5>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-md-4 col-sm-6 mix 중등">
                <div class="featured__item">
                    <div class="featured__item__pic set-bg">
                        <img src="${path}/img/main/middlebook01.jpg" alt="">
                        <ul class="featured__item__pic__hover">
                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                            <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                        </ul>
                    </div>
                    <div class="featured__item__text">
                        <h6><a href="#">중등 책 01</a></h6>
                        <h5>8000₩</h5>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-md-4 col-sm-6 mix 초등">
                <div class="featured__item">
                    <div class="featured__item__pic set-bg">
                        <img src="${path}/img/main/elementarybook02.jpg" alt="">
                        <ul class="featured__item__pic__hover">
                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                            <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                        </ul>
                    </div>
                    <div class="featured__item__text">
                        <h6><a href="#">초등 책 02</a></h6>
                        <h5>6000₩</h5>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-md-4 col-sm-6 mix 고등">
                <div class="featured__item">
                    <div class="featured__item__pic set-bg">
                        <img src="${path}/img/main/highbook01.jpg" alt="">
                        <ul class="featured__item__pic__hover">
                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                            <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                        </ul>
                    </div>
                    <div class="featured__item__text">
                        <h6><a href="#">고등 책 01</a></h6>
                        <h5>9000₩</h5>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-md-4 col-sm-6 mix 유아">
                <div class="featured__item">
                    <div class="featured__item__pic set-bg">
                        <img src="${path}/img/main/childbook02.jpg" alt="">
                        <ul class="featured__item__pic__hover">
                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                            <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                        </ul>
                    </div>
                    <div class="featured__item__text">
                        <h6><a href="#">유아 책 02</a></h6>
                        <h5>5000₩</h5>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-md-4 col-sm-6 mix 중등">
                <div class="featured__item">
                    <div class="featured__item__pic set-bg">
                        <img src="${path}/img/main/middlebook02.jpg" alt="">
                        <ul class="featured__item__pic__hover">
                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                            <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                        </ul>
                    </div>
                    <div class="featured__item__text">
                        <h6><a href="#">중등 책 02</a></h6>
                        <h5>8000₩</h5>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-md-4 col-sm-6 mix 고등">
                <div class="featured__item">
                    <div class="featured__item__pic set-bg">
                        <img src="${path}/img/main/highbook02.jpg" alt="">
                        <ul class="featured__item__pic__hover">
                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                            <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                        </ul>
                    </div>
                    <div class="featured__item__text">
                        <h6><a href="#">고등 책 02</a></h6>
                        <h5>9000₩</h5>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>