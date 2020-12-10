-- 삭제 가능한 테이블과 커리문 조회
SELECT 'DROP TABLE "' || TABLE_NAME || '" CASCADE CONSTRAINTS;' FROM user_tables;
-- 테이블 삭제
DROP TABLE "THEATERS" CASCADE CONSTRAINTS;
DROP TABLE "MEMBERS" CASCADE CONSTRAINTS;
DROP TABLE "SCREENS" CASCADE CONSTRAINTS;
DROP TABLE "MOVIE" CASCADE CONSTRAINTS;
DROP TABLE "SEATS" CASCADE CONSTRAINTS;
DROP TABLE "TICKET" CASCADE CONSTRAINTS;
DROP TABLE "REVIEW" CASCADE CONSTRAINTS;
DROP TABLE "NOTICE" CASCADE CONSTRAINTS;
DROP TABLE "FAQ" CASCADE CONSTRAINTS;
DROP TABLE "CUSTOMERSERVICE" CASCADE CONSTRAINTS;
DROP TABLE "BOOKING" CASCADE CONSTRAINTS;

-- 시퀀스 삭제
DROP SEQUENCE MEMBERS_SEQ;
DROP SEQUENCE CS_SEQ;
DROP SEQUENCE NOTICE_SEQ;
DROP SEQUENCE FAQ_SEQ;
DROP SEQUENCE SEATS_SEQ;
DROP SEQUENCE TICKET_SEQ;
DROP SEQUENCE SCREENS_SEQ;
DROP SEQUENCE THEATERS_SEQ;
DROP SEQUENCE BOOKING_SEQ;
DROP SEQUENCE movie_seq;

-- THEATERS Table Create SQL
CREATE TABLE THEATERS
(
    theater_uid           NUMBER           NOT NULL, 
    theater_place         VARCHAR2(20)     NOT NULL, 
    theater_name          VARCHAR2(50)     NOT NULL, 
    theater_address       VARCHAR2(300)    NOT NULL, 
    theater_tot_screen    NUMBER           NOT NULL, 
    theater_tot_seats     NUMBER           NOT NULL, 
    CONSTRAINT THEATERS_PK PRIMARY KEY (theater_uid)
);

-- THEATERS Table Create SQL
CREATE TABLE MEMBERS
(
    mem_uid            NUMBER           NOT NULL, 
    userid         VARCHAR2(20)     NOT NULL UNIQUE, 
    userpw         VARCHAR2(20)     NOT NULL, 
    name           VARCHAR2(20)     NOT NULL, 
    email          VARCHAR2(100)    NOT NULL, 
    phone          VARCHAR2(20)     NOT NULL, 
    zipcode        VARCHAR2(20)     NOT NULL, 
    address1       VARCHAR2(100)    NOT NULL, 
    address2       VARCHAR2(100)    NOT NULL, 
    signupdate    DATE             NOT NULL, 
    status         CHAR(1)          NOT NULL, 
    booking        VARCHAR2(300)    NULL, 
    cancle         VARCHAR2(300)    NULL, 
    point          NUMBER           NULL, 
    CONSTRAINT MEMBERS_PK PRIMARY KEY (mem_uid)
);




-- THEATERS Table Create SQL
CREATE TABLE SCREENS
(
    screen_uid          NUMBER          NOT NULL, 
    s_theater_uid       NUMBER          NOT NULL, 
    screen_name         VARCHAR2(50)    NOT NULL, 
    screen_tot_seats    NUMBER          NOT NULL, 
    CONSTRAINT SCREENS_PK PRIMARY KEY (screen_uid)
);




-- THEATERS Table Create SQL
CREATE TABLE MOVIE
(
    movie_uid            NUMBER            NOT NULL, 
    movie_name           VARCHAR2(100)     NOT NULL, 
    movie_director       VARCHAR2(20)      NOT NULL, 
    movie_date           VARCHAR2(100)     NOT NULL, 
    move_time            VARCHAR2(20)      NOT NULL, 
    movie_actor          VARCHAR2(300)     NOT NULL, 
    movie_info           VARCHAR2(1000)    NOT NULL, 
    movie_img_address    VARCHAR2(400)     NOT NULL, 
    movie_screens		 NUMBER			   NOT NULL,
    movie_showdate		 VARCHAR2(20)      NOT NULL,
    movie_showtime		 VARCHAR2(20)      NOT NULL,
    CONSTRAINT MOVIE_PK PRIMARY KEY (movie_uid)
);


-- THEATERS Table Create SQL
CREATE TABLE SEATS
(
    seat_uid       NUMBER     NOT NULL, 
    screen_uid     NUMBER     NOT NULL, 
    seat_alpha     NUMBER     NOT NULL, 
    seat_num       NUMBER     NOT NULL,     
    seat_status    CHAR(1)    NOT NULL, 
    CONSTRAINT SEATS_PK PRIMARY KEY (seat_uid)
);



-- THEATERS Table Create SQL
CREATE TABLE TICKET
(
    ticket_uid      NUMBER    NOT NULL, 
    t_screen_uid    NUMBER    NOT NULL, 
    ticket_price    NUMBER    NOT NULL, 
    CONSTRAINT TICKET_PK PRIMARY KEY (ticket_uid)
);



-- THEATERS Table Create SQL
CREATE TABLE REVIEW
(
    review_uid        NUMBER            NOT NULL, 
    r_mem_id          VARCHAR2(20)      NOT NULL, 
    r_movie_uid       NUMBER            NOT NULL, 
    review_content    VARCHAR2(1000)    NOT NULL, 
    review_grade      VARCHAR2(20)      NOT NULL, 
    review_heart      NUMBER            NOT NULL, 
    CONSTRAINT REVIEW_PK PRIMARY KEY (review_uid)
);




-- THEATERS Table Create SQL
CREATE TABLE NOTICE
(
    notice_uid        NUMBER           NOT NULL, 
    notice_subject    VARCHAR2(200)    NOT NULL, 
    notice_content    CLOB             NOT NULL, 
    notice_viewcnt    NUMBER           NOT NULL, 
    notice_regdate    DATE             NOT NULL, 
    CONSTRAINT NOTICE_PK PRIMARY KEY (notice_uid)
);

-- THEATERS Table Create SQL
CREATE TABLE FAQ
(
    faq_uid        NUMBER           NOT NULL, 
    faq_subject    VARCHAR2(500)    NOT NULL, 
    faq_answer     CLOB             NOT NULL, 
    faq_regDate    TIMESTAMP        NOT NULL, 
    CONSTRAINT FAQ_PK PRIMARY KEY (faq_uid)
);


-- THEATERS Table Create SQL
CREATE TABLE CUSTOMERSERVICE
(
    cs_uid        NUMBER          NOT NULL, 
    cs_memid      VARCHAR2(20)    NOT NULL, 
    cs_content    CLOB            NOT NULL, 
    cs_regdate    DATE            NOT NULL, 
    cs_status     CHAR(1)         NOT NULL, 
    CONSTRAINT CUSTOMERSERVICE_PK PRIMARY KEY (cs_uid)
);




-- THEATERS Table Create SQL
CREATE TABLE BOOKING
(
    booing_uid        NUMBER          NOT NULL, 
    booking_status    CHAR(1)         NOT NULL, 
    b_mem_id          VARCHAR2(20)    NOT NULL, 
    b_theater_uid     NUMBER          NOT NULL, 
    b_screen_uid      NUMBER          NOT NULL, 
    b_movie_uid       NUMBER          NOT NULL, 
    b_seat_uid        NUMBER          NOT NULL, 
    b_ticket_uid      NUMBER          NOT NULL, 
    CONSTRAINT BOOKING_PK PRIMARY KEY (booing_uid)
);

CREATE SEQUENCE movie_seq
START WITH 1
INCREMENT BY 1
NOCACHE;

-- 회원관련 시퀀스
CREATE SEQUENCE MEMBERS_SEQ
START WITH 1
INCREMENT BY 1
NOCACHE;

--예매관련 시퀀스들
CREATE SEQUENCE SEATS_SEQ
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE SCREENS_SEQ
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE TICKET_SEQ
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE THEATERS_SEQ
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE BOOKING_SEQ
START WITH 1
INCREMENT BY 1
NOCACHE;

--고객센터 관련 시퀀스

CREATE SEQUENCE CS_SEQ
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE NOTICE_SEQ
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE FAQ_SEQ
START WITH 1
INCREMENT BY 1
NOCACHE;


-- FK 지정
ALTER TABLE SCREENS
    ADD CONSTRAINT FK_SCREENS_s_theater_uid FOREIGN KEY (s_theater_uid)
        REFERENCES THEATERS (theater_uid);

ALTER TABLE SEATS
    ADD CONSTRAINT FK_SEATS_screen_uid FOREIGN KEY (screen_uid)
        REFERENCES SCREENS (screen_uid);
       
ALTER TABLE TICKET
    ADD CONSTRAINT FK_TICKET_t_screen_uid FOREIGN KEY (t_screen_uid)
        REFERENCES SCREENS (screen_uid);
       
ALTER TABLE REVIEW
    ADD CONSTRAINT FK_REVIEW_r_mem_id FOREIGN KEY (r_mem_id)
        REFERENCES MEMBERS (userid);
ALTER TABLE REVIEW
    ADD CONSTRAINT FK_REVIEW_r_movie_uid FOREIGN KEY (r_movie_uid)
        REFERENCES MOVIE (movie_uid);
       
ALTER TABLE CUSTOMERSERVICE
    ADD CONSTRAINT FK_CUSTOMERSERVICE_cs_memid FOREIGN KEY (cs_memid)
        REFERENCES MEMBERS (userid);

ALTER TABLE BOOKING
    ADD CONSTRAINT FK_BOOKING_b_mem_id FOREIGN KEY (b_mem_id)
        REFERENCES MEMBERS (userid);
ALTER TABLE BOOKING
    ADD CONSTRAINT FK_BOOKING_b_theater_uid FOREIGN KEY (b_theater_uid)
        REFERENCES THEATERS (theater_uid);
ALTER TABLE BOOKING
    ADD CONSTRAINT FK_BOOKING_b_screen_uid FOREIGN KEY (b_screen_uid)
        REFERENCES SCREENS (screen_uid);
ALTER TABLE BOOKING
    ADD CONSTRAINT FK_BOOKING_b_movie_uid FOREIGN KEY (b_movie_uid)
        REFERENCES MOVIE (movie_uid);
ALTER TABLE BOOKING
    ADD CONSTRAINT FK_BOOKING_b_seat_uid FOREIGN KEY (b_seat_uid)
        REFERENCES SEATS (seat_uid);
ALTER TABLE BOOKING
    ADD CONSTRAINT FK_BOOKING_b_ticket_uid FOREIGN KEY (b_ticket_uid)
        REFERENCES TICKET (ticket_uid);

-- 데이터
INSERT INTO MEMBERS(mem_uid, userid, userpw, name, email, phone, zipcode, 
					address1, address2, signupdate, status, booking, cancle, point)
  	 VALUES(MEMBERS_SEQ.NEXTVAL, 'apple123', '1111', '사과', 'a@gmail.com', '010-1111-1111', 
  	 		'00135', '광교중앙로 1', '푸르지오', SYSDATE, '1', '도굴', '디바', 300);
  	 	
INSERT INTO MEMBERS(mem_uid, userid, userpw, name, email, phone, zipcode, 
					address1, address2, signupdate, status, booking, cancle, point)
  	 VALUES(MEMBERS_SEQ.NEXTVAL, 'lemon123', '2222', '레몬', 'l@gmail.com', '010-2222-2222', 
  	 		'22135', '위올라이로 1', '스카이캐슬', SYSDATE, '1', '날다', '히히', 100);

INSERT INTO MEMBERS(mem_uid, userid, userpw, name, email, phone, zipcode, 
					address1, address2, signupdate, status, booking, cancle, point)
  	 VALUES(MEMBERS_SEQ.NEXTVAL, 'apple999', '3333', '금사과', 'aa1@gmail.com', '010-1111-4444', 
  	 		'44431', '진실로 1', '진실의방', SYSDATE, '0', '굴굴', '바바', 300);
  	 	
INSERT INTO MEMBERS(mem_uid, userid, userpw, name, email, phone, zipcode, 
					address1, address2, signupdate, status, point)
  	 VALUES(MEMBERS_SEQ.NEXTVAL, 'banana123', '5555', '바나나', 'ban@gmail.com', '010-1111-2222', 
  	 		'12123', '무왕로 1', '진격', SYSDATE, '0', 0);
  	 	
  	 	
-- 회원목록, 아이디중복, 로그인, 회원정보, 
--SELECT * FROM MEMBERS;

--아이디중복체크
--SELECT userid FROM MEMBERS WHERE userid = 'apple123';

					
--로그인
SELECT userid FROM MEMBERS WHERE userid = 'apple123' and userpw = '1111'

--회원정보
--SELECT userid, userpw, name, email, phone, zipcode, 
--					address1, address2, signupdate, status, booking, cancle, point
--FROM MEMBERS WHERE userid = 'apple123';


--아이디
--SELECT userid FROM MEMBERS WHERE name = #{name} AND email = #{email}
-- SELECT userid FROM MEMBERS WHERE name = '사과' AND email = 'a@gmail.com';
  	 	
--비번
--SELECT userpw FROM MEMBERS WHERE userid = 'apple123' AND email= 'a@gmail.com';
 
  	 	
--메일 중복 체크
--SELECT email FROM MEMBERS WHERE email= 'a@gmail.com';

--회원정보수정
--UPDATE MEMBERS 
--	SET userpw = '1234', email = 'a1@gmail.com', phone = '010-1111-4321', 
--	zipcode = '00135', address1 = '상현중앙로', address2 = '2' WHERE userid = 'apple123';

--탈퇴하기 status = 0으로
--UPDATE MEMBERS SET status = '0' WHERE userid = 'apple123';

--포인트 조회
--SELECT userid, point FROM MEMBERS WHERE userid = 'apple123';
--SELECT userid, point FROM MEMBERS;

  	 	
--예매내역 보기 
--다중 테이블 조인 ANSI JOIN
--SELECT  B.BOOKING_STATUS, 
--		M.userid, 
--		V.MOVIE_NAME, 
--		T.THEATER_NAME, 
--		C.SCREEN_NAME, 
--		S.SEAT_NUM, 
--		K.TICKET_PRICE 
--  FROM BOOKING B
-- JOIN MEMBERS M
--    ON B.B_MEM_ID = M.userid 
-- JOIN THEATERS T
--    ON B.B_THEATER_UID = T.THEATER_UID 
-- JOIN SCREENS C
--    ON B.B_SCREEN_UID  = C.SCREEN_UID 
-- JOIN MOVIE V
--    ON B.B_MOVIE_UID = V.MOVIE_UID 
-- JOIN TICKET K
--    ON B.B_TICKET_UID = K.TICKET_UID
-- JOIN SEATS S
--    ON B.B_SEAT_UID = S.SEAT_UID
--WHERE B.B_MEM_ID = 'lemon123';

   
INSERT INTO movie
				(movie_uid, movie_name, movie_director, 
				 movie_date, move_time, movie_actor, 
				 movie_info, movie_img_address, movie_screens, 
				 movie_showdate, movie_showtime)
			VALUES
				(movie_seq.nextval, '영화제목', '감독이름', '개봉일', '총상영시간', '출연배우', '줄거리', '이미지주소', 1, 
				 '상영날짜', '상영시간');

INSERT INTO MOVIE
  	VALUES((movie_seq.nextval, '영화제목', '감독이름', '개봉일', '총상영시간', '출연배우', '줄거리', '이미지주소', 1, '상영날짜', '상영시간');
--			영화																				극장
INSERT INTO THEATERS
	VALUES(THEATERS_SEQ.NEXTVAL, '지역', '극장이름', '극장주소', 8, 640);
--			극장											상영관수, 총좌석수
INSERT INTO SCREENS 
	VALUES(SCREENS_SEQ.NEXTVAL, 1, '상영관이름', 80);
--					  상영관, 극장,			  총좌석
INSERT INTO SEATS 
	VALUES(SEATS_SEQ.NEXTVAL, 1, 10, 8, '0');
--			좌석, 상영관, 좌석 행, 좌석 열, 상태
INSERT INTO TICKET
	VALUES (TICKET_SEQ.NEXTVAL, 1, 8000);
--			티켓, 상영관, 가격
INSERT INTO BOOKING 
	VALUES (BOOKING_SEQ.NEXTVAL, '1', 'lemon123', 1, 1, 102, 1, 1);
--						예매, 상태,		 극장, 상영관, 영화, 좌석, 티켓)
--
--SELECT * FROM MOVIE;
--SELECT * FROM THEATERS;
--SELECT * FROM SCREENS;
--SELECT * FROM SEATS;
--SELECT * FROM TICKET;
--SELECT * FROM BOOKING;












