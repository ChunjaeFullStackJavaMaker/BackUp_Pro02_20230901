-- 회원 가입 테이블
CREATE TABLE member(
                       id VARCHAR(16) NOT NULL,   								-- 아이디
                       pw VARCHAR(300) NOT NULL,  								-- 비밀번호
                       NAME VARCHAR(100) NOT NULL,  							-- 이름
                       email VARCHAR(100) NOT NULL,   							-- 이메일
                       tel VARCHAR(13),   										-- 전화번호
                       birth DATE, 											-- 생년월일
                       addresss VARCHAR(300), 									-- 주소
                       resdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,   -- 가입일
                       POINT INT DEFAULT 0,   									-- 포인트
                       grade VARCHAR(4) DEFAULT 'F', 							-- 멤버쉽 등급
                       per int,												-- 숫자별 특정 인원 지정 -> (0 : 관리자), (1 : 고객)
                       PRIMARY KEY (id)
);

INSERT INTO custom(id, pw, NAME, email, tel, birth, per) VALUES('admin','1234', '관리자', 'admin@shop.com', '010-1004-1004', '1998-01-01', 0);
INSERT INTO custom(id, pw, NAME, email, tel, birth, per) VALUES('kimhk','1234', '김현경', 'kimhk@shop.com', '010-1234-5678', '2000-01-01', 1);
INSERT INTO custom(id, pw, NAME, email, tel, birth, per) VALUES('kimbk','qwer1234!', '김보경', 'kimbk@shop.com', '010-8765-4321', '2000-01-01', 1);
INSERT INTO custom(id, pw, NAME, email, tel, birth, per) VALUES('parkjk','1234', '박진권', 'park@shop.com', '010-1111-2222', '2000-01-01', 1);
INSERT INTO custom(id, pw, NAME, email, tel, birth, per) VALUES('sirious920','xogns1234!', '오태훈', 'dhxogns920@shop.com', '010-7329-7484', '1998-09-20', 1);
INSERT INTO custom(id, pw, NAME, email, tel, birth, per) VALUES('shin','asdf1234!', '신예은', 'shin@shop.com', '010-9999-8888', '2000-01-01', 1);

COMMIT;

UPDATE custom SET pw='5/WIXGDnP4kR6lBSOlppBlzj9Dh5wJDBz4qUqz/hEWatg/r5IpuWB/NKx7hp1jVq/qQI2Q==' WHERE id='admin';
UPDATE custom SET pw='oc6d/JVbQD/DF/n20Cc0boHATW/HJ/u0tiOSQPtMmq/Wck7hCSbp0ZIla7QKyWY1dyrYEQ==' WHERE id='kimbk';
UPDATE custom SET pw='5/WIXGDnP4kR6lBSOlppBlzj9Dh5wJDBz4qUqz/hEWatg/r5IpuWB/NKx7hp1jVq/qQI2Q==' WHERE id='kimhk';
UPDATE custom SET pw='SNUDLHC98Nr0jiVRtk16oLuRIbQA6a3U/bnyLC7h4FmxBZvL2Zy9bQiOTTAzwDUlhSC+Bw==' WHERE id='sirious920';
UPDATE custom SET pw='5/WIXGDnP4kR6lBSOlppBlzj9Dh5wJDBz4qUqz/hEWatg/r5IpuWB/NKx7hp1jVq/qQI2Q==' WHERE id='parkjk';
UPDATE custom SET pw='BxlPkArgCvRg65RMqzQqfu3Aj2TdbSkFNFvLTHzBP8nhJUNhJIRH9M76ula/sRFJ1tAeDw==' WHERE id='shin';
--------------------------------------------------------------

-- 매장 전용 공지사항(notice) 테이블 생성
create table notice(
                       nno serial primary KEY,
                       title varchar(200) not NULL,
                       content varchar(1000),
                       author varchar(50),
                       resdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                       visit INTEGER DEFAULT 0
);

-- 매장 전용 공지사항 더미글 추가 10건

INSERT INTO notice(title, content, author) VALUES ('공지사항1', '여기는 공지사항1입니다', 'admin');

INSERT INTO notice(title, content, author) VALUES ('공지사항2', '여기는 공지사항2입니다', 'admin');

INSERT INTO notice(title, content, author) VALUES ('공지사항3', '여기는 공지사항3입니다', 'admin');

INSERT INTO notice(title, content, author) VALUES ('공지사항4', '여기는 공지사항4입니다', 'admin');

INSERT INTO notice(title, content, author) VALUES ('공지사항5', '여기는 공지사항5입니다', 'admin');

INSERT INTO notice(title, content, author) VALUES ('공지사항6', '여기는 공지사항6입니다', 'admin');

INSERT INTO notice(title, content, author) VALUES ('공지사항7', '여기는 공지사항7입니다', 'admin');

INSERT INTO notice(title, content, author) VALUES ('공지사항8', '여기는 공지사항8입니다', 'admin');

INSERT INTO notice(title, content, author) VALUES ('공지사항8', '여기는 공지사항8입니다', 'admin');

INSERT INTO notice(title, content, author) VALUES ('공지사항8', '여기는 공지사항8입니다', 'admin');

commit;

select * from notice;

----------------------------------------------------------------------------------------------------------------

-- 고객 전용 공지사항(board) 테이블 생성
CREATE TABLE board(
                      bno serial PRIMARY KEY,
                      title VARCHAR(200) NOT NULL,
                      content VARCHAR(1000),
                      author VARCHAR(16),
                      resdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                      cnt INT DEFAULT 0
);

-- 공지사항 더미글 추가 10건
INSERT INTO board(title, content, author) VALUES ('게시판1', '여기는 게시판1입니다', 'oh');

INSERT INTO board(title, content, author) VALUES ('게시판2', '여기는 게시판2입니다', 'shin');

INSERT INTO board(title, content, author) VALUES ('게시판3', '여기는 게시판3입니다', 'park');

INSERT INTO board(title, content, author) VALUES ('게시판4', '여기는 게시판4입니다', 'kimhk');

INSERT INTO board(title, content, author) VALUES ('게시판5', '여기는 게시판5입니다', 'kimbk');

INSERT INTO board(title, content, author) VALUES ('게시판6', '여기는 게시판6입니다', 'oh');

INSERT INTO board(title, content, author) VALUES ('게시판7', '여기는 게시판7입니다', 'shin');

INSERT INTO board(title, content, author) VALUES ('게시판8', '여기는 게시판8입니다', 'park');

INSERT INTO board(title, content, author) VALUES ('게시판9', '여기는 게시판9입니다 ', 'kimbk');

INSERT INTO board(title, content, author) VALUES ('게시판10', '여기는 게시판10입니다', 'kimhk');

COMMIT;

SELECT * FROM board;

------------------------------------------------------------------------

-- 고객 전용 문의 테이블 생성 -- 고객만 사용 가능
CREATE TABLE askboard(
                         bno serial PRIMARY KEY,
                         title VARCHAR(200) NOT NULL,
                         content VARCHAR(1000),
                         author VARCHAR(16),
                         resdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                         cnt INT DEFAULT 0,
                         FOREIGN KEY(author) REFERENCES member(id) ON DELETE CASCADE
);

-- 고객 전용 문의 테이블 더미글 추가 10건
INSERT INTO askboard(title, content, author) VALUES ('문의1', '문의1 입니다', 'oh');

INSERT INTO askboard(title, content, author) VALUES ('문의2', '문의2 입니다', 'shin');

INSERT INTO askboard(title, content, author) VALUES ('문의3', '문의3 입니다', 'park');

INSERT INTO askboard(title, content, author) VALUES ('문의4', '문의4 입니다', 'kimhk');

INSERT INTO askboard(title, content, author) VALUES ('문의5', '문의5 입니다', 'kimbk');

INSERT INTO askboard(title, content, author) VALUES ('문의6', '문의6 입니다', 'oh');

INSERT INTO askboard(title, content, author) VALUES ('문의7', '문의7 입니다', 'shin');

INSERT INTO askboard(title, content, author) VALUES ('문의8', '문의8 입니다', 'park');

INSERT INTO askboard(title, content, author) VALUES ('문의9', '문의9 입니다', 'kimhk');

INSERT INTO askboard(title, content, author) VALUES ('문의10', '문의10 입니다', 'kimbk');

COMMIT;

SELECT * FROM askboard;

-----------------------------------------------------------------------------------------------------

-- 질문 및 답변 테이블 생성
CREATE TABLE qna(
                    qno serial PRIMARY KEY ,   			            -- 번호
                    title VARCHAR(100) NOT NULL,   					-- 제목
                    content VARCHAR(1000) NOT NULL,   				-- 내용
                    author VARCHAR(16),   							-- 작성자
                    resdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  -- 등록일
                    visit INT DEFAULT 0,   							-- 조회수
                    lev INT DEFAULT 0, 								-- 질문(0), 답변(1)
                    par INT,										-- 질문(자신 레코드의 qno), 답변(질문의 글번호)
                    secret BOOLEAN DEFAULT false,				    -- 비밀글 유무
                    FOREIGN KEY(author) REFERENCES member(id) ON DELETE CASCADE
);

-- 더미 데이터 작성
INSERT INTO qna(title, content, author, lev, secret) VALUES('질문1', '질문입니다. 1', 'kimbk', 0, false);

UPDATE qna SET par=qno WHERE lev=0 AND qno=1;

INSERT INTO qna(title, content, author, lev, secret) VALUES('질문2', '질문입니다. 2', 'park', 0, true);

UPDATE qna SET par=qno WHERE lev=0 AND qno=2;

INSERT INTO qna(title, content, author, lev, secret) VALUES('질문3', '질문입니다. 3', 'kimhk', 0, false);

UPDATE qna SET par=qno WHERE lev=0 AND qno=3;

INSERT INTO qna(title, content, author, lev, secret) VALUES('질문4', '질문입니다. 4', 'park', 0, false);

UPDATE qna SET par=qno WHERE lev=0 AND qno=4;

INSERT INTO qna(title, content, author, lev, secret) VALUES('질문5', '질문입니다. 5', 'kimbk', 0, false);

UPDATE qna SET par=qno WHERE lev=0 AND qno=5;

INSERT INTO qna(title, content, author, lev, secret) VALUES('질문6', '질문입니다. 6', 'oh', 0, false);

UPDATE qna SET par=qno WHERE lev=0 AND qno=6;

INSERT INTO qna(title, content, author, lev, secret) VALUES('질문7', '질문입니다. 7', 'shin', 0, false);

UPDATE qna SET par=qno WHERE lev=0 AND qno=7;

INSERT INTO qna(title, content, author, lev, secret) VALUES('질문8', '질문입니다. 8', 'shin', 0, false);

UPDATE qna SET par=qno WHERE lev=0 AND qno=8;

INSERT INTO qna(title, content, author, lev, secret) VALUES('질문9', '질문입니다. 9', 'park', 0, false);

UPDATE qna SET par=qno WHERE lev=0 AND qno=9;

INSERT INTO qna(title, content, author, lev, secret) VALUES('질문10', '질문입니다. 10', 'kimbk', 0, false);

UPDATE qna SET par=qno WHERE lev=0 AND qno=10;

-- 답변

INSERT INTO qna(title, content, author, lev, par, secret) VALUES ('질문1에 대한 답변', '답변입니다. 1', 'park', 1, 1, false);

INSERT INTO qna(title, content, author, lev, par, secret) VALUES ('질문2에 대한 답변', '답변입니다. 2.', 'admin', 1, 2, true);

INSERT INTO qna(title, content, author, lev, par, secret) VALUES ('질문3에 대한 답변', '답변입니다. 3', 'admin', 1, 3, false);

INSERT INTO qna(title, content, author, lev, par, secret) VALUES ('질문4에 대한 답변', '답변입니다. 4', 'admin', 1, 4, false);

INSERT INTO qna(title, content, author, lev, par, secret) VALUES ('질문5에 대한 답변', '답변입니다. 5', 'admin', 1, 5, false);

INSERT INTO qna(title, content, author, lev, par, secret) VALUES ('질문6에 대한 답변', '답변입니다. 6', 'admin', 1, 6, false);

INSERT INTO qna(title, content, author, lev, par, secret) VALUES ('질문7에 대한 답변', '답변입니다. 7', 'admin', 1, 7, false);

INSERT INTO qna(title, content, author, lev, par, secret) VALUES ('질문8에 대한 답변', '답변입니다. 8', 'admin', 1, 8, false);

INSERT INTO qna(title, content, author, lev, par, secret) VALUES ('질문9에 대한 답변', '답변입니다. 9', 'admin', 1, 9, false);

INSERT INTO qna(title, content, author, lev, par, secret) VALUES ('질문10에 대한 답변', '답변입니다. 10', 'admin', 1, 10, false);

COMMIT;

select * from qna;

-- QnA 리스트
SELECT a.qno AS qno, a.title AS title, a.content AS content, a.author AS author, a.resdate AS resdate, a.cnt AS cnt, a.lev AS lev,
       a.par AS par, b.name AS name FROM qna a, member b WHERE a.author=b.id ORDER BY a.par DESC, a.lev ASC, a.qno ASC;

-- qna JOIN & VIEW 생성 ( 내가 쓴 글에 이용)
CREATE VIEW qnalist2 AS (SELECT a.qno AS qno, a.title AS title, a.content AS content, a.author AS author, a.resdate AS resdate, a.cnt AS cnt, a.lev AS lev,
                                a.par AS par, b.id AS id FROM qna a, member b WHERE a.author=b.id ORDER BY a.par DESC, a.lev ASC, a.qno ASC);

SELECT * FROM qnalist2;


-----------------------------------------------------------------------------------------------------------------------

-- 자주 묻는 질문 (FAQ) 테이블 생성

CREATE TABLE faq (
                     fno serial PRIMARY KEY,
                     question VARCHAR(1000) NOT NULL,
                     answer VARCHAR(1000) NOT NULL,
                     cnt INT DEFAULT 0 NOT NULL
);

INSERT INTO faq(question, answer) VALUES('자주 묻는 질문입니다1', '답변입니다1');

INSERT INTO faq(question, answer) VALUES('자주 묻는 질문입니다2', '답변입니다2');

INSERT INTO faq(question, answer) VALUES('자주 묻는 질문입니다3', '답변입니다3');

INSERT INTO faq(question, answer) VALUES('자주 묻는 질문입니다4', '답변입니다4');

INSERT INTO faq(question, answer) VALUES('자주 묻는 질문입니다5', '답변입니다5');

INSERT INTO faq(question, answer) VALUES('자주 묻는 질문입니다6', '답변입니다6');

INSERT INTO faq(question, answer) VALUES('자주 묻는 질문입니다7', '답변입니다7');

INSERT INTO faq(question, answer) VALUES('자주 묻는 질문입니다8', '답변입니다8');

INSERT INTO faq(question, answer) VALUES('자주 묻는 질문입니다9', '답변입니다9');

INSERT INTO faq(question, answer) VALUES('자주 묻는 질문입니다10', '답변입니다10');

COMMIT;

select * from faq;

----------------------------------------------------------------------------------

-- 고객 문의 게시판 댓글 테이블 생성

create table askComment(
                           cno serial PRIMARY KEY,
                           bno INT,
                           author VARCHAR(16),
                           resdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                           content VARCHAR(200),
                           FOREIGN KEY(bno) REFERENCES askboard(bno) ON DELETE CASCADE
);

-- 더미 데이터 추가
INSERT INTO askComment(bno, author, content) VALUES(1, 'admin', '댓글 기능 더미데이터1');
INSERT INTO askComment(bno, author, content) VALUES(2, 'admin', '댓글 기능 더미데이터2');
INSERT INTO askComment(bno, author, content) VALUES(3, 'shin', '댓글 기능 더미데이터3');
INSERT INTO askComment(bno, author, content) VALUES(4, 'park', '댓글 기능 더미데이터3');
INSERT INTO askComment(bno, author, content) VALUES(5, 'oh', '댓글 기능 더미데이터3');
INSERT INTO askComment(bno, author, content) VALUES(6, 'shin', '댓글 기능 더미데이터3');
INSERT INTO askComment(bno, author, content) VALUES(7, 'park', '댓글 기능 더미데이터3');
INSERT INTO askComment(bno, author, content) VALUES(8, 'oh', '댓글 기능 더미데이터3');
INSERT INTO askComment(bno, author, content) VALUES(1, 'shin', '댓글 기능 더미데이터3');
INSERT INTO askComment(bno, author, content) VALUES(1, 'park', '댓글 기능 더미데이터3');

COMMIT;

SELECT * FROM askcomment;

------------------------------------------------------------------------------------------------------------------------------

-- 파일 업로드 -- 필요한지는 모르겠음...

create table filetest(
                         uname varchar(200),
                         subject varchar(300),
                         content varchar(1000),
                         filename varchar(500)
);

create table filetest2(
                          uname varchar(200),
                          subject varchar(300),
                          content varchar(1000),
                          filename1 varchar(500),
                          filename2 varchar(500),
                          filename3 varchar(500)
);

select * from filetest2;

------------------------------------------------------------------------------------------------------------------------------

-- 상품 테이블 생성
create table product(
                        pro_no serial PRIMARY KEY,
                        cate_id VARCHAR(4) NOT NULL,								-- 품목 명
                        pro_cate_no VARCHAR(100) NOT NULL, 							-- 상품번호+Category : 1-10 이런 형식
                        price INT DEFAULT 0, 										-- 상품 가격
                        title VARCHAR(100) NOT NULL,								-- 상품명
                        description VARCHAR(200), 									-- 상품 썸네일 설명
                        pro_content VARCHAR(2000), 									-- 상품 설명
                        thumb VARCHAR(256), 										-- 상품 썸네일
                        img_src VARCHAR(5000) DEFAULT 'no_img.jpg', 				-- 상품 이미지 리스트
                        regdate timestamp default CURRENT_TIMESTAMP 				-- 상품 게시 날짜
);

-- 상품 부가정보 테이블 생성
create table addinfo(
                        add_no serial primary key,
                        pro_no integer not null,
                        title varchar(200) not null,
                        movie varchar(256) default 'sample1.mp4',
                        resdate timestamp default current_timestamp
);

---------------------------------------------------------------------------------------------------

-- 입고 테이블 생성
create table receive(
                        re_no serial primary key,								-- 입고 번호
                        pro_no integer not null,                                -- 상품 번호
                        amount integer default 1,	         					-- 입고 수량
                        re_price integer default 1000,			    			-- 입고 가격
                        resdate timestamp default current_timestamp		    	-- 입고 일시
);

---------------------------------------------------------------------------------------------------

-- 출고 테이블 생성
create table serve(
                      se_no serial primary key,								-- 출고 번호
                      pro_no integer not null, 		                        -- 상품 번호
                      se_price integer default 1000,					    	-- 출고 가격
                      amount integer default 1,				         		-- 출고 수량
                      resdate timestamp default current_timestamp		    	-- 출고 일시
);

---------------------------------------------------------------------------------------------------

-- 배송 테이블 생성
create table delivery(
                         del_no serial primary key,						-- 배송 번호
                         pay_no integer not null, 						-- 결제 번호
                         custom_id varchar(20) not null,					-- 고객 아이디
                         del_addr varchar(300) not null, 				-- 배송지
                         cus_tel varchar(13) not null,					-- 고객 연락처
                         del_com varchar(100),							-- 배송 회사
                         del_tel varchar(13),							-- 배송 기사님 전화번호
                         del_state integer default 0,					-- 배송 상태 -> (0 : 입고 중, 1 : 출하 중, 2 : 상차, 3 : 하차, 4 : 캠프 도착, 5 : 배송 중, 6 : 배송 도착)
                         del_date timestamp default current_timestamp,	-- 배송 출발일
                         res_date varchar(13),							-- 배송 도착일
                         del_code varchar(30)							-- 송장 코드
);

-------------------------------------------------------------------------------------------

-- 결제 테이블 생성
create table payment(
                        pay_no serial primary key,			-- 결제 번호
                        cus_id varchar(20) not null,		-- 고객 아이디
                        cus_num varchar(100),				-- 고객 번호
                        pro_no integer not null,			-- 상품 번호
                        amount integer default 1,			-- 결제 수량
                        pay_method varchar(100),			-- 결제 수단
                        pay_com varchar(100),				-- 결제 회사
                        pay_price integer default 1000,		-- 결제 금액
                        pay_account varchar(100) NOT NULL,	-- 결제 카드 번호
                        del_no varchar(100),				-- 배송 번호(랜덤번호 추출)
                        pay_resdate timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP -- 결제 일시 지정
);

-------------------------------------------------------------------------------------------

-- 카테고리 테이블
create table category(
                         cate_no varchar(4) primary key,
                         cate_name varchar(100) not null
);

-- 카테고리 등록
insert into category values('A', '초등교과서');
insert into category values('B', '초등참고서');
insert into category values('C', '초등문제집');
insert into category values('D', '초등기타');
insert into category values('E', '중등교과서');
insert into category values('F', '중등참고서');
insert into category values('G', '중등문제집');
insert into category values('H', '중등기타');
insert into category values('I', '고등교과서');
insert into category values('J', '고등참고서');
insert into category values('K', '고등문제집');
insert into category values('L', '고등기타');
insert into category values('M', '일반교과서');
insert into category values('N', '일반참고서');
insert into category values('O', '일반문제집');
insert into category values('P', '일반기타');
insert into category values('Q', '유아콘텐츠');
insert into category values('R', '유아놀이');
insert into category values('S', '유아기타');
insert into category values('T', '해외서적');
insert into category values('U', '해외콘텐츠');

-------------------------------------------------------------------------------------------

-- 카트 테이블 생성
create table cart(
                     cartno serial primary key,
                     cid varchar(20) not null,
                     pno integer not null,
                     amount integer not null
);

-------------------------------------------------------------------------------------------

-- 후기 테이블 생성
CREATE TABLE review(
                       rev_no serial PRIMARY KEY, 			            			-- 리뷰 번호
                       mem_id VARCHAR(16) NOT NULL, 								-- 회원 아이디
                       pay_no INT NOT NULL, 										-- 결제 번호
                       pro varchar(200) NOT NULL, 									-- 상품명
                       star INT DEFAULT 5, 										-- 별점
                       content VARCHAR(1000), 										-- 리뷰 내용
                       regdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,		-- 리뷰 작성 일자
                       pro_no INT NOT NULL  										-- 상품 번호
);

-------------------------------------------------------------------------------------------
-- dto에 들어 갈거나 기타 등등

-- 내가 만든 테이블 목록 보기
select * from pg_tables where schemaname='public';

-------------------------------------------------------------------------------------------

-- 재고 뷰 생성
create view inventory as (select re_no, amount from receive EXCEPT select se_no, amount from serve);

select * from product;

select * from payment;

select * from cart;

-------------------------------------------------------------------------------------------

-- 상품 목록
select * from product order by pno;

-------------------------------------------------------------------------------------------

-- 신상품 목록
select * from product order by pno desc limit 5;

-------------------------------------------------------------------------------------------

-- 베스트셀러 상품 목록
select * from product where pno in (select pno from payment group by pno order by sum(amount) desc limit 5);

-------------------------------------------------------------------------------------------

-- 카테고리별 신상품 목록
select * from product where cate=? order by pno desc limit 3;

-------------------------------------------------------------------------------------------

-- 카테고리별 베스트셀러 상품 목록
select * from product where pcode in (select pno from payment group by pno order by sum(amount)) and cate=? limit 3;

-------------------------------------------------------------------------------------------

-- 상품 등록
insert into product values(default, ?, '', ?, ?, ?, ?, ?, ?, ?, default);

update product set prono = concat(cate, pno) where pno=?;

-------------------------------------------------------------------------------------------

-- 상품 제거
delete from product where pno=?;

-------------------------------------------------------------------------------------------

-- 상품 정보 변경
update product set pname=?, cate=?, pcomment=?, plist=?, price=?, imgsrc1=?, imgsrc2=?, imgsrc3=? where pno=?;

-------------------------------------------------------------------------------------------

-- 입고 조회
select * from receive;

-------------------------------------------------------------------------------------------

-- 입고 처리 패턴
insert into receive values (default, ?, ?, ?, default);

insert into receive(pno, amount, rprice) values (?, ?, ?);

-------------------------------------------------------------------------------------------

-- 상품, 결제, 출고, 배송, 카트 테이블 확인
select * from product;
select * from payment;
select * from serve;
select * from delivery;
select * from cart;

-------------------------------------------------------------------------------------------

-- 출고 처리 패턴
insert into payment values (default, ?, ?, ?, ?, ?, ?, ?, '');
insert into serve values(default, ?, ?, ?, default);
insert into delivery values (default, ?, ?, ?, ?, '','',default,default,'','');
delete from cart where cartno=?;

-------------------------------------------------------------------------------------------

-- 반품 처리 패턴(배송전이면 반품 가능)
delete from payment where sno=?;
insert into receive values (default, ?, ?, ?, default);
delete from serve where sno=?;
insert into cart values (default, ?, ?, ?);
delete from delivery where sno=?;

-------------------------------------------------------------------------------------------

-- 배송처리
update delivery set pcom=?, ptel=?, pstate=1, sdate=current_timestamp, rdate=?, bcode=? where dno=?;

-------------------------------------------------------------------------------------------

-- 배송 완료 처리
update delivery set pstate=2 where dno=?;


-- 전체 이익 통계 뷰 작성
create view profit as (select pno, sum(sprice*amount) as tot from serve group by pno EXCEPT select pno, sum(rprice*amount) as tot from receive group by pno);

select * from profit;
select * from addinfo;
select * from receive;
select * from delivery;
select * from payment;
select * from custom;
select * from inventory;