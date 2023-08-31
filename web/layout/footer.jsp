<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="<%=request.getContextPath() %>" />
<footer class="footer spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-6 col-sm-6">
                <div class="footer__about">
                    <div class="footer__about__logo">
                        <a href="${path}/"><img src="${path}/img/logo/corn_book_85-55.png" alt=""></a>
                    </div>
                    <ul>
                        <li><b>Address</b>: 서울특별시 금천구 가산동,<br/> 마리오아울렛 2관 11층 천재교육</li>
                        <li><b>Phone</b>: +82 - 010-1234-1234</li>
                        <li><b>Email</b>: admin@cornedu.com</li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-6 offset-lg-1">
                <div class="footer__widget">
                    <h6>Useful Links</h6>
                    <ul>
                        <li><a href="#">About Us</a></li>
                        <li><a href="#">유아콘텐츠</a></li>
                        <li><a href="#">유아놀이</a></li>
                        <li><a href="#">유아기타</a></li>
                    </ul>
                    <ul>
                        <li><a href="#">중등교과서</a></li>
                        <li><a href="#">중등참고서</a></li>
                        <li><a href="#">중등문제집</a></li>
                        <li><a href="#">중등기타</a></li>
                    </ul>
                    <ul>
                        <li><a href="#">초등교과서</a></li>
                        <li><a href="#">초등참고서</a></li>
                        <li><a href="#">초등문제집</a></li>
                        <li><a href="#">초등기타</a></li>
                    </ul>
                    <ul>
                        <li><a href="#">고등교과서</a></li>
                        <li><a href="#">고등참고서</a></li>
                        <li><a href="#">고등문제집</a></li>
                        <li><a href="#">고등기타</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-4 col-md-12">
                <div class="footer__widget">
                    <div class="footer__widget__social">
                        <a href="#"><i class="fa fa-facebook"></i></a>
                        <a href="#"><i class="fa fa-instagram"></i></a>
                        <a href="#"><i class="fa fa-twitter"></i></a>
                        <a href="#"><i class="fa fa-pinterest"></i></a>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="footer__copyright">
                    <div class="footer__copyright__text"><p>
                        Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | by <a href="" target="_blank">CornBooks</a>
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p></div>
                    <div class="footer__copyright__payment"><img src="${path}/img/payment-item.png" alt=""></div>
                </div>
            </div>
        </div>
    </div>
</footer>