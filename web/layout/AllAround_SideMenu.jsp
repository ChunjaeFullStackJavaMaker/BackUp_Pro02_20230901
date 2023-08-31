<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<style>
    .quickmenu {position:absolute;width:120px;top:50%;margin-top:-50px;right:10px;background:#fff;}
    .quickmenu ul {position:relative;float:left;width:100%;display:inline-block;*display:inline;border:1px solid #ddd;}
    .quickmenu ul li {float:left;width:100%;border-bottom:1px solid #ddd;text-align:center;display:inline-block;*display:inline;}
    .quickmenu ul li a {position:relative;float:left;width:100%;height:30px;line-height:30px;text-align:center;color:#999;font-size:9.5pt;}
    .quickmenu ul li a:hover {color:#000;}
    .quickmenu ul li:last-child {border-bottom:0;}
</style>
<div class="quickmenu">
    <ul>
        <li><a href="${path}/CateProList.do?cate_id=Q&cate_id=R&cate_id=S"> 유아 도서 </a></li>
        <li><a href="${path}/CateProList.do?cate_id=A&cate_id=B&cate_id=C&cate_id=D"> 초등 도서 </a></li>
        <li><a href="${path}/CateProList.do?cate_id=E&cate_id=F&cate_id=G&cate_id=H"> 중등 도서 </a></li>
        <li><a href="${path}/CateProList.do?cate_id=I&cate_id=J&cate_id=K&cate_id=L"> 고등 도서 </a></li>
        <li><a href="https://open.kakao.com/o/ggOwUUCf"> 1 대 1 문의 </a></li>
    </ul>
</div>
<script>
    $(document).ready(function(){
        var currentPosition = parseInt($(".quickmenu").css("top"));
        $(window).scroll(function() {
            var position = $(window).scrollTop();
            $(".quickmenu").stop().animate({"top":position+currentPosition+"px"},500);
        });
    });
</script>