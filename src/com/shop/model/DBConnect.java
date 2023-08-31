package com.shop.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public interface DBConnect {
    final static String NOTICE_SELECT_ALL = "select * from notice order by no desc";
    final static String NOTICE_SELECT_ONE = "select * from notice where no=?";
    final static String NOTICE_INSERT = "insert into notice(title, content) values (?, ?);";
    final static String NOTICE_SELECT_RANGE = "select * from notice order by no desc limit 5 offset ?";
    final static String NOTICE_UPDATE = "update notice set title=?, content=? where no=?";
    final static String NOTICE_DELETE = "delete from notice where no=?";
    final static String NOTICE_COUNT = "select count(*) as cnt from notice";
    final static String NOTICE_COUNT_TITLE = "select count(*) as cnt from notice where title like ?";
    final static String NOTICE_COUNT_CONTENT = "select count(*) as cnt from notice where content like ?";
    final static String NOTICE_COUNT_ALL = "select count(*) as cnt from notice where title like ? or content like ?";
    final static String NOTICE_SELECT_TITLE_RANGE = "select * from notice where title like ? order by resdate desc limit 5 offset ?";
    final static String NOTICE_SELECT_CONTENT_RANGE = "select * from notice where content like ? order by resdate desc limit 5 offset ?";
    final static String NOTICE_SELECT_ALL_RANGE = "select * from notice where title like ? or content like ? order by resdate desc limit 5 offset ?";
    
    //FAQ
    final static String FAQ_SELECT_ALL = "select * from faq order by fno asc";

    //QnA
    final static String QNA_SELECT_ALL = "select a.qno AS qno, a.title AS title, a.content AS content, a.author AS author, a.resdate AS resdate, a.visit as visit, a.lev AS lev, a.par AS par, b.name AS NAME FROM qna a, member b WHERE a.author=b.id order BY a.par DESC, a.lev ASC, a.qno ASC";


    //카테고리별 목록
    final static String PRODUCT_SELECT_CATE = "select * from product where cate_id=? order by pro_no";

    //신상품
    final static String PRODUCT_SELECT_NEW = "select * from product order by pro_no desc limit 5";

    //베스트 상품
    final static String PRODUCT_SELECT_BEST = "select * from product where pro_no in (select pro_no from payment group by pro_no order by sum(amount) desc limit 5)";
    // 상품 리스트 페이징
    final static String PRODUCT_SELECT_RANGE = "select * from product order by title limit 5 offset ?";
    final static String PRODUCT_COUNT_ALL = "select count(*) as cnt from product";

    //상품 입고
    final static String PRODUCT_INSERT = "insert into product values(default, ?, '', ?, ?, ?, ?, ?, ?, default)";
    final static String CATEGORY_LOAD = "select * from category";

    //상품번호+상품카테고리 pro_cate_no
    final static String PRODUCT_INSERT_UPDATE = "UPDATE product SET pro_cate_no = CONCAT(cate_id,'-',pro_no) where pro_no IN (select pro_no FROM (select pro_no from product order by regdate desc LIMIT 1) AS tmp)";

    //상품 추가 정보
    final static String PRODUCT_INFO = "insert into addinfo values(default, ?, ?, ?, default)";

    //상품 수정
    final static String PRODUCT_UPDATE = "update product set price=?, title=?, description=?, pro_content=? where pro_no=?";

    //상품 삭제
    final static String PRODUCT_DELETE = "delete from product where pro_no=?";

    // 상품 추가 정보 입력하기
    final static String INSERT_ADDINFO = "insert into addinfo(pro_no, title, movie) values(?,?,?)";
    // 최근 추가된 상품의 번호 가져오기
    final static String LATEST_PRO_NO = "select pro_no from product order by pro_no desc limit 1";

    //재고 조회
    final static String INVENTORY_SELECT_ALL = "select * from inventory order by pro_no desc";
    final static String INVENTORY_SELECT_ONE = "select * from inventory where pro_no=?";

    // 결제 테이블 sql문
    final static String PAYMENT_SELECT_ONE = "select * from payment where pay_no=?";
    final static String PAYMENT_SELECT_LIST = "select * from payment where cus_id=? and pay_resdate=?";
    final static String GET_PAY_NO = "select pay_no from payment order by pay_no desc limit 1";
    final static String PAYMENT_SELECT_CID ="select * from payment where custom_id=?";
    
    // 관리자 메인 페이지
    // 매출액 가져오기
    final static String GET_SALES_LIST = "SELECT date_format(pay_resdate, '%Y-%m') AS 'pay_resdate', SUM(pay_price*amount) AS 'sum' FROM payment " +
            "WHERE pay_resdate > DATE(SUBDATE(NOW(), INTERVAL 12 MONTH)) " +
            "GROUP BY month(pay_resdate), YEAR(pay_resdate) ORDER BY pay_resdate";
    final static String GET_PROFIT_LIST = "SELECT b.profit_month, if(avg_se IS NULL, 0, avg_se) - avg_re AS gross_profit FROM receive_stats a RIGHT OUTER JOIN serve_stats b ON (a.profit_month=b.profit_month) ORDER BY b.profit_month";
    final static String ADMIN_HOT_PRODUCT_LIST = "SELECT * FROM admin_hot_product";
    
    //출고 관리 sql문
    final static String SERVE_PAYMENT =  "insert into payment values (default, ?, ?, ?, ?, ?, ?, ?, '')";
    final static String SERVE_INSERT = "insert into serve values(default, ?, ?, ?, default)";

    // 반품 처리 sql문
    final static String SELECT_MY_ORDER_LIST = "select pay.pay_no, pay_resdate, thumb, description, title, amount, pay_price, del_state from payment pay, delivery del, product pro where pay.pay_no = del.pay_no and pro.pro_no=pay.pro_no and cus_id=? order by pay_resdate desc";
    final static String RETURN_PAYMENT = "delete from payment where pay_no=?";
    final static String RETURN_PAYMENTS = "delete from payment where cus_id=? and pay_resdate=?";
    final static String RETURN_RECEIVE = "insert into receive values (default, ?, ?, ?, default)";
    final static String RETURN_SERVE = "delete from serve where se_no=?";
    final static String RETURN_SERVES = "delete from serve where se_no in (select pay_no from payment where pay_resdate=? and cus_id=?)";
    final static String RETURN_CART = "insert into cart values (default, ?, ?, ?)";
    final static String RETURN_DELIVERY = "delete from delivery where pay_no=?";
    final static String RETURN_DELIVERIES = "delete from delivery where pay_no in (select pay_no from payment where pay_resdate=? and cus_id=?)";

    //회원 관리 sql문
    final static String MEMBER_SELECT_ALL = "select * from member order by resdate limit 5 offset ?";
    final static String MEMBER_SELECT_ONE = "select * from member where id=?";
    final static String MEMBER_SELECT_LOG = "select * from member where id=?";
    final static String MEMBER_COUNT_ALL = "select count(*) as cnt from member";
    final static String MEMBER_INSERT = "insert into member(id, pw, name, tel, email, birth, address) values (?,?,?,?,?,?,?)";
    final static String MEMBER_UPDATE = "update member set pw=?, address=?,tel=?, email=?, birth=? where id=?";
    final static String MEMBER_DELETE = "delete from member where id = ?";

    //상품 관리 sql문
    final static String PRODUCT_SELECT_ALL = "select * from product order by pro_no";
    final static String PRODUCT_SELECT_ONE = "select * from product where pro_no=?";
    final static String RECEIVE_INSERT ="insert into receive values (default,?,?,?,default)";

    //배송 관리 sql문
    final static String DELIVERY_INSERT = "insert into delivery values (default, ?, ?, ?, ?, '','',default,default,'','')";
    final static String DELIVERY_UPDATE = "update delivery set del_date=?, res_date=?, del_com=?, del_tel=?, del_code=?, del_state=? where del_no=?";
    final static String DELIVERY_UPDATE_WITH_DELCODE = "update delivery set del_date=?, res_date=?, del_com=?, del_tel=?, del_code=?, del_state=? where del_code=?";
    final static String DELIVERY_SELECT_PAYNO = "select * from delivery where pay_no=?";
    final static String DELIVERY_PRODUCT_SELECT_ONE = "SELECT a.del_no, title, custom_id, pay_resdate, del_addr, cus_tel, del_com, del_tel, del_state, del_date, res_date, del_code FROM delivery a, payment b, product c WHERE a.pay_no=b.pay_no AND b.pro_no=c.pro_no AND a.del_no=?";
    final static String DELIVERY_PRODUCT_SELECT_ALL = "SELECT a.del_no AS del_no, custom_id, title, pay_price, del_state, pay_resdate FROM delivery a, payment b, product c WHERE a.pay_no=b.pay_no AND b.pro_no=c.pro_no AND del_state=0 order by pay_resdate, del_no";
    final static String DELCODE_GROUP_LIST = "SELECT a.del_no, CONCAT(title, ' 외 ', COUNT(*)-1, '건') AS title, custom_id, pay_resdate, del_addr, cus_tel, del_com, del_tel, del_state, del_date, res_date, del_code FROM delivery a, payment b, product c WHERE a.pay_no=b.pay_no AND b.pro_no=c.pro_no AND del_code != '' AND del_state < 6 GROUP BY del_code";

    //장바구니 관리 sql문
    final static String CART_INSERT = "insert into cart values (default,?,?,?)";
    final static String CART_DELETE = "delete from cart where cart_no=?";
    final static String CART_DELETE_CART_NO = "delete from cart where cart_no=?";
    final static String CART_SELECT_CID = "select * from cart where cus_id=?";

    //리뷰 관리 sql문
    final static String REVIEW_SELECT_CID ="select * from review where mem_id=?";
    final static String REVIEW_DELETE = "delete from review where rev_no=?";
    //리뷰
    final static String REVIEW_SELECT = "select * from review where pro_no=?";
    final static String REVIEW_INSERT = "insert into review values (default, ?, ?, ?, ?, ?, default, ?)";

    //상세페이지 비디오
    final static String PRODUCT_VIDEO = "select * from product left join addinfo on product.pro_no = addinfo.pro_no where product.pro_no=?";


    public Connection connect();
    public void close(PreparedStatement pstmt, Connection conn);
    public void close(ResultSet rs, PreparedStatement pstmt, Connection conn);

}