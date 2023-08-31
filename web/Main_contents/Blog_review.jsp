<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="<%=request.getContextPath() %>" /><section class="from-blog spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section-title from-blog__title">
                    <h2>교육 단계</h2>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-4 col-md-4 col-sm-6">
                <div class="blog__item">
                    <div class="blog__item__pic">
                        <img src="${path}/img/main/child.jpg" alt="">
                    </div>
                    <div class="blog__item__text">
                        <h5><a href="#">유아</a></h5>
                        <p>콘북은 배움의 시작을 함께합니다.</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-6">
                <div class="blog__item">
                    <div class="blog__item__pic">
                        <img src="${path}/img/main/elementary.jpg" alt="">
                    </div>
                    <div class="blog__item__text">
                        <h5><a href="#">초등</a></h5>
                        <p>콘북은 학교로 내딛는 첫 걸음을 응원합니다.</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-6">
                <div class="blog__item">
                    <div class="blog__item__pic">
                        <img src="${path}/img/main/middlehigh.jpg" alt="">
                    </div>
                    <div class="blog__item__text">
                        <h5><a href="#">중고등</a></h5>
                        <p>콘북은 꿈을 찾고 이루는 과정을 돕습니다.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

