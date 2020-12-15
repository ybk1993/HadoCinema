DROP TABLE THEATERS CASCADE CONSTRAINTS;
DROP TABLE MEMBERS CASCADE CONSTRAINTS;
DROP TABLE SCREENS CASCADE CONSTRAINTS;
DROP TABLE MOVIE CASCADE CONSTRAINTS;
DROP TABLE SEATS CASCADE CONSTRAINTS;
DROP TABLE TICKET CASCADE CONSTRAINTS;
DROP TABLE REVIEW CASCADE CONSTRAINTS;
DROP TABLE NOTICE CASCADE CONSTRAINTS;
DROP TABLE FAQ CASCADE CONSTRAINTS;
DROP TABLE CUSTOMERSERVICE CASCADE CONSTRAINTS;
DROP TABLE NOTICE CASCADE CONSTRAINTS;
DROP TABLE BOOKING CASCADE CONSTRAINTS;
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
    mem_uesrid         VARCHAR2(20)     NOT NULL UNIQUE, 
    mem_userpw         VARCHAR2(20)     NOT NULL, 
    mem_name           VARCHAR2(20)     NOT NULL, 
    mem_email          VARCHAR2(100)    NOT NULL, 
    mem_phone          VARCHAR2(20)     NOT NULL, 
    mem_zipcode        VARCHAR2(20)     NOT NULL, 
    mem_address1       VARCHAR2(100)    NOT NULL, 
    mem_address2       VARCHAR2(100)    NOT NULL, 
    mem_signup_date    DATE             NOT NULL, 
    mem_status         CHAR(1)          NOT NULL, 
    mem_booking        VARCHAR2(300)    NULL, 
    mem_cancle         VARCHAR2(300)    NULL, 
    mem_point          NUMBER           NULL, 
    CONSTRAINT MEMBERS_PK PRIMARY KEY (mem_uid)
);

CREATE SEQUENCE MEMBERS_SEQ
START WITH 1
INCREMENT BY 1
NOCACHE;


-- THEATERS Table Create SQL
CREATE TABLE SCREENS
(
    screen_uid          NUMBER          NOT NULL, 
    s_theater_uid       NUMBER          NOT NULL, 
    screen_name         VARCHAR2(50)    NOT NULL, 
    screen_tot_seats    NUMBER          NOT NULL, 
    CONSTRAINT SCREENS_PK PRIMARY KEY (screen_uid)
);


ALTER TABLE SCREENS
    ADD CONSTRAINT FK_SCREENS_s_theater_uid_THEAT FOREIGN KEY (s_theater_uid)
        REFERENCES THEATERS (theater_uid);


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
    movie_cnt            NUMBER            NOT NULL, 
    movie_brate          VARCHAR2(20)      NOT NULL, 
    movie_img_address    VARCHAR2(400)     NOT NULL, 
    CONSTRAINT MOVIE_PK PRIMARY KEY (movie_uid)
);


-- THEATERS Table Create SQL
CREATE TABLE SEATS
(
    seat_uid       NUMBER     NOT NULL, 
    screen_uid     NUMBER     NOT NULL, 
    seat_num       NUMBER     NOT NULL, 
    seat_status    CHAR(1)    NOT NULL, 
    CONSTRAINT SEATS_PK PRIMARY KEY (seat_uid)
);


ALTER TABLE SEATS
    ADD CONSTRAINT FK_SEATS_screen_uid_SCREENS_sc FOREIGN KEY (screen_uid)
        REFERENCES SCREENS (screen_uid);

-- THEATERS Table Create SQL
CREATE TABLE TICKET
(
    ticket_uid      NUMBER    NOT NULL, 
    t_screen_uid    NUMBER    NOT NULL, 
    t_week          NUMBER    NOT NULL, 
    ticket_price    NUMBER    NOT NULL, 
    CONSTRAINT TICKET_PK PRIMARY KEY (ticket_uid)
);


ALTER TABLE TICKET
    ADD CONSTRAINT FK_TICKET_t_screen_uid_SCREENS FOREIGN KEY (t_screen_uid)
        REFERENCES SCREENS (screen_uid);

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

ALTER TABLE REVIEW
    ADD CONSTRAINT FK_REVIEW_r_mem_id_MEMBERS_mem FOREIGN KEY (r_mem_id)
        REFERENCES MEMBERS (mem_uesrid);

ALTER TABLE REVIEW
    ADD CONSTRAINT FK_REVIEW_r_movie_uid_MOVIE_mo FOREIGN KEY (r_movie_uid)
        REFERENCES MOVIE (movie_uid);


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


ALTER TABLE CUSTOMERSERVICE
    ADD CONSTRAINT FK_CUSTOMERSERVICE_cs_memid_ME FOREIGN KEY (cs_memid)
        REFERENCES MEMBERS (mem_uesrid);



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
    b_price_uid       NUMBER          NOT NULL, 
    CONSTRAINT BOOKING_PK PRIMARY KEY (booing_uid)
);


ALTER TABLE BOOKING
    ADD CONSTRAINT FK_BOOKING_b_mem_id_MEMBERS_me FOREIGN KEY (b_mem_id)
        REFERENCES MEMBERS (mem_uesrid);

ALTER TABLE BOOKING
    ADD CONSTRAINT FK_BOOKING_b_theater_uid_THEAT FOREIGN KEY (b_theater_uid)
        REFERENCES THEATERS (theater_uid);
       
ALTER TABLE BOOKING
    ADD CONSTRAINT FK_BOOKING_b_screen_uid_SCREEN FOREIGN KEY (b_screen_uid)
        REFERENCES SCREENS (screen_uid);

ALTER TABLE BOOKING
    ADD CONSTRAINT FK_BOOKING_b_movie_uid_MOVIE_m FOREIGN KEY (b_movie_uid)
        REFERENCES MOVIE (movie_uid);

ALTER TABLE BOOKING
    ADD CONSTRAINT FK_BOOKING_b_seat_uid_SEATS_se FOREIGN KEY (b_seat_uid)
        REFERENCES SEATS (seat_uid);

ALTER TABLE BOOKING
    ADD CONSTRAINT FK_BOOKING_b_price_uid_TICKET_ FOREIGN KEY (b_price_uid)
        REFERENCES TICKET (ticket_uid);

       
       
       
DROP TABLE CUSTOMERSERVICE CASCADE CONSTRAINTS;

-- THEATERS Table Create SQL
CREATE TABLE CUSTOMERSERVICE
(
    cs_uid        NUMBER          NOT NULL, 
    cs_memid      VARCHAR2(100)    NOT NULL,
    cs_subject    VARCHAR2(200)   NOT NULL,
    cs_content    CLOB            NOT NULL, 
   	cs_answer     CLOB            NULL, 
    cs_regdate    DATE            DEFAULT SYSDATE, 
    cs_status     CHAR(1)         DEFAULT '0' NOT NULL, 
    CONSTRAINT CUSTOMERSERVICE_PK PRIMARY KEY (cs_uid)
);


ALTER TABLE CUSTOMERSERVICE
    ADD CONSTRAINT FK_CUSTOMERSERVICE_cs_memid_ME FOREIGN KEY (cs_memid)
        REFERENCES MEMBERS (mem_uesrid);


DROP SEQUENCE CUSTOMERSERVICE_SEQ;
CREATE SEQUENCE CUSTOMERSERVICE_SEQ START WITH 1 INCREMENT BY 1 NOCACHE;

INSERT INTO CUSTOMERSERVICE(cs_uid, cs_memid, cs_content,  cs_subject) 
VALUES(CUSTOMERSERVICE_SEQ.nextval, '19991', '111test', 'ddddd');
INSERT INTO CUSTOMERSERVICE(cs_uid, cs_memid, cs_content,  cs_subject) 
VALUES(CUSTOMERSERVICE_SEQ.nextval, 'w', 'w', 'w');
INSERT INTO CUSTOMERSERVICE(cs_uid, cs_memid, cs_content,  cs_subject) 
VALUES(CUSTOMERSERVICE_SEQ.nextval, 'a', 'a', 'a');
INSERT INTO CUSTOMERSERVICE(cs_uid, cs_memid, cs_content,  cs_subject) 
VALUES(CUSTOMERSERVICE_SEQ.nextval, 'b', 'b', 'b');
INSERT INTO CUSTOMERSERVICE(cs_uid, cs_memid, cs_content,  cs_subject) 
VALUES(CUSTOMERSERVICE_SEQ.nextval, 'c', 'c', 'c');
INSERT INTO CUSTOMERSERVICE(cs_uid, cs_memid, cs_content,  cs_subject) 
VALUES(CUSTOMERSERVICE_SEQ.nextval, 'd', 'd', 'd');
INSERT INTO CUSTOMERSERVICE(cs_uid, cs_memid, cs_content,  cs_subject) 
VALUES(CUSTOMERSERVICE_SEQ.nextval, 'f', 'f', 'f');
INSERT INTO CUSTOMERSERVICE(cs_uid, cs_memid, cs_content,  cs_subject) 
VALUES(CUSTOMERSERVICE_SEQ.nextval, 'g', 'g', 'g');
INSERT INTO CUSTOMERSERVICE(cs_uid, cs_memid, cs_content,  cs_subject) 
VALUES(CUSTOMERSERVICE_SEQ.nextval, 'h', 'h', 'h');

INSERT INTO CUSTOMERSERVICE(cs_uid, cs_memid, cs_content,  cs_subject) 
VALUES(CUSTOMERSERVICE_SEQ.nextval, 'i', 'i', 'i');
INSERT INTO CUSTOMERSERVICE(cs_uid, cs_memid, cs_content,  cs_subject) 
VALUES(CUSTOMERSERVICE_SEQ.nextval, 'j', 'j', 'j');
INSERT INTO CUSTOMERSERVICE(cs_uid, cs_memid, cs_content,  cs_subject) 
VALUES(CUSTOMERSERVICE_SEQ.nextval, 'k', 'k', 'k');

INSERT INTO CUSTOMERSERVICE(cs_uid, cs_memid, cs_content,  cs_subject) 
VALUES(CUSTOMERSERVICE_SEQ.nextval, 'l', 'l', 'l');
INSERT INTO CUSTOMERSERVICE(cs_uid, cs_memid, cs_content,  cs_subject) 
VALUES(CUSTOMERSERVICE_SEQ.nextval, 'm', 'm', 'm');
INSERT INTO CUSTOMERSERVICE(cs_uid, cs_memid, cs_content,  cs_subject) 
VALUES(CUSTOMERSERVICE_SEQ.nextval, 'n', 'n', 'n');

INSERT INTO CUSTOMERSERVICE(cs_uid, cs_memid, cs_content,  cs_subject) 
VALUES(CUSTOMERSERVICE_SEQ.nextval, 'o', 'o', 'o');
INSERT INTO CUSTOMERSERVICE(cs_uid, cs_memid, cs_content,  cs_subject) 
VALUES(CUSTOMERSERVICE_SEQ.nextval, 'p', 'p', 'p');
INSERT INTO CUSTOMERSERVICE(cs_uid, cs_memid, cs_content,  cs_subject) 
VALUES(CUSTOMERSERVICE_SEQ.nextval, 'q', 'q', 'q');

SELECT * FROM CUSTOMERSERVICE;

SELECT cs_uid, cs_memid, cs_subject, cs_content, cs_status, cs_regdate 		  
FROM CUSTOMERSERVICE ORDER BY cs_uid DESC;

CREATE TABLE REVIEW
(
    reviewUid        NUMBER            NOT NULL, 
    rMemId           VARCHAR2(20)      NOT NULL, 
    rMovieName       VARCHAR2(100)     NOT NULL, 
    reviewContent    VARCHAR2(1000)    NOT NULL, 
    reviewGrade      NUMBER            NOT NULL, 
    reviewHeart      NUMBER            DEFAULT '0' NOT NULL,
    reviewRegdate    DATE              DEFAULT SYSDATE, 
    CONSTRAINT REVIEW_PK PRIMARY KEY (reviewUid)
);
	private String rMemId;
	private String rMovieName;
	private int reviewUid;
	private Date reviewRegdate;
	private String reviewContent;
	private int reviewGrade;
	private int reviewHeart;
	
CREATE SEQUENCE REVIEW_SEQ START WITH 1 INCREMENT BY 1 NOCACHE;
DROP TABLE REVIEW CASCADE CONSTRAINTS;

INSERT INTO REVIEW(reviewUid, rMemId, rMovieName,  reviewContent, reviewGrade) 
VALUES(REVIEW_SEQ.nextval, 'r_mem_id', '도굴', 'review_content', 5);
INSERT INTO REVIEW(reviewUid, rMemId, rMovieName,  reviewContent, reviewGrade) 
VALUES(REVIEW_SEQ.nextval, 'bbb', '도굴', '좋아요', 5);
INSERT INTO REVIEW(reviewUid, rMemId, rMovieName,  reviewContent, reviewGrade) 
VALUES(REVIEW_SEQ.nextval, 'ccc', '도굴', '재밌어요', 10);
INSERT INTO REVIEW(reviewUid, rMemId, rMovieName,  reviewContent, reviewGrade) 
VALUES(REVIEW_SEQ.nextval, 'ddd', '도굴', '슬퍼요', 7);
INSERT INTO REVIEW(reviewUid, rMemId, rMovieName,  reviewContent, reviewGrade) 
VALUES(REVIEW_SEQ.nextval, 'eee', '도굴', '재미없어요', 1);
INSERT INTO REVIEW(reviewUid, rMemId, rMovieName,  reviewContent, reviewGrade) 
VALUES(REVIEW_SEQ.nextval, 'fff', '도굴', '굳굳', 5);
INSERT INTO REVIEW(reviewUid, rMemId, rMovieName,  reviewContent, reviewGrade) 
VALUES(REVIEW_SEQ.nextval, 'r_mem_id', '원더우먼', 'review_content', 5);
INSERT INTO REVIEW(reviewUid, rMemId, rMovieName,  reviewContent, reviewGrade) 
VALUES(REVIEW_SEQ.nextval, 'bbb', '원더우먼', '좋아요', 5);
INSERT INTO REVIEW(reviewUid, rMemId, rMovieName,  reviewContent, reviewGrade) 
VALUES(REVIEW_SEQ.nextval, 'ccc', '원더우먼', '재밌어요', 10);
INSERT INTO REVIEW(reviewUid, rMemId, rMovieName,  reviewContent, reviewGrade) 
VALUES(REVIEW_SEQ.nextval, 'ddd', '원더우먼', '슬퍼요', 7);
INSERT INTO REVIEW(reviewUid, rMemId, rMovieName,  reviewContent, reviewGrade) 
VALUES(REVIEW_SEQ.nextval, 'eee', '원더우먼', '재미없어요', 1);
INSERT INTO REVIEW(reviewUid, rMemId, rMovieName,  reviewContent, reviewGrade) 
VALUES(REVIEW_SEQ.nextval, 'fff', '원더우먼', '굳굳', 5);

INSERT INTO REVIEW(reviewUid, rMemId, rMovieName,  reviewContent, reviewGrade) 
VALUES(REVIEW_SEQ.nextval, 'r_mem_id', '인셉션', 'review_content', 5);
INSERT INTO REVIEW(reviewUid, rMemId, rMovieName,  reviewContent, reviewGrade) 
VALUES(REVIEW_SEQ.nextval, 'bbb', '인셉션', '좋아요', 5);
INSERT INTO REVIEW(reviewUid, rMemId, rMovieName,  reviewContent, reviewGrade) 
VALUES(REVIEW_SEQ.nextval, 'ccc', '인셉션', '재밌어요', 10);
INSERT INTO REVIEW(reviewUid, rMemId, rMovieName,  reviewContent, reviewGrade) 
VALUES(REVIEW_SEQ.nextval, 'ddd', '인셉션', '슬퍼요', 7);
INSERT INTO REVIEW(reviewUid, rMemId, rMovieName,  reviewContent, reviewGrade) 
VALUES(REVIEW_SEQ.nextval, 'eee', '인셉션', '재미없어요', 1);
INSERT INTO REVIEW(reviewUid, rMemId, rMovieName,  reviewContent, reviewGrade) 
VALUES(REVIEW_SEQ.nextval, 'fff', '인셉션', '굳굳', 5);

SELECT * FROM REVIEW;

SELECT review_uid, r_mem_id, r_movie_uid, review_content, review_grade, review_heart, review_regdate , 
ROW_NUMBER() OVER(ORDER BY review_uid DESC) AS  RNUM FROM REVIEW WHERE R_MOVIE_UID = 1 ;

CREATE TABLE OTHERREVIEWS
(
    reviewUid2        NUMBER            NOT NULL, 
    rMemId2           VARCHAR2(100)     NULL, 
    rMovieName2       VARCHAR2(100)     NULL, 
    reviewContent2    VARCHAR2(1000)    NULL, 
    reviewGrade2      NUMBER            NULL, 
    reviewHeart2      NUMBER            DEFAULT '0' NOT NULL,
    reviewRegdate2    DATE              NULL, 
    CONSTRAINT OTHERREVIEWS_PK PRIMARY KEY (reviewUid2)
);

INSERT INTO OTHERREVIEWS(reviewUid2, rMovieName2,  reviewContent2, reviewGrade2) 
VALUES(OTHERREVIEWS_SEQ.nextval, '인셉션', '굳굳', 5);
INSERT INTO OTHERREVIEWS(reviewUid2, rMovieName2,  reviewContent2, reviewGrade2) 
VALUES(OTHERREVIEWS_SEQ.nextval, '인셉션', '굳굳', 6);
INSERT INTO OTHERREVIEWS(reviewUid2, rMovieName2,  reviewContent2, reviewGrade2) 
VALUES(OTHERREVIEWS_SEQ.nextval, '셉션', '굳굳', 7);
INSERT INTO OTHERREVIEWS(reviewUid2, rMovieName2,  reviewContent2, reviewGrade2) 
VALUES(OTHERREVIEWS_SEQ.nextval, '인셉션', '굳굳', 8);
INSERT INTO OTHERREVIEWS(reviewUid2, rMovieName2,  reviewContent2, reviewGrade2) 
VALUES(OTHERREVIEWS_SEQ.nextval, '인셉션', '굳굳', 9);



INSERT INTO REVIEW2(reviewUid2, rMemId2, rMovieName2,  reviewContent2, reviewGrade2) 
VALUES(REVIEW2_SEQ.nextval, 'r_mem_id', '인셉션', 'review_content', 5);
INSERT INTO REVIEW2(reviewUid2, rMemId2, rMovieName2,  reviewContent2, reviewGrade2) 
VALUES(REVIEW2_SEQ.nextval, 'bbb', '인셉션', '좋아요', 5);
INSERT INTO REVIEW(reviewUid, rMemId, rMovieName,  reviewContent, reviewGrade) 
VALUES(REVIEW_SEQ.nextval, 'ccc', '인셉션', '재밌어요', 10);
INSERT INTO REVIEW(reviewUid, rMemId, rMovieName,  reviewContent, reviewGrade) 
VALUES(REVIEW_SEQ.nextval, 'ddd', '인셉션', '슬퍼요', 7);
INSERT INTO REVIEW(reviewUid, rMemId, rMovieName,  reviewContent, reviewGrade) 
VALUES(REVIEW_SEQ.nextval, 'eee', '인셉션', '재미없어요', 1);
INSERT INTO REVIEW(reviewUid, rMemId, rMovieName,  reviewContent, reviewGrade) 
VALUES(REVIEW_SEQ.nextval, 'fff', '인셉션', '굳굳', 5);

SELECT * FROM OTHERREVIEWS ORDER BY reviewUid2 desc;
SELECT * FROM REVIEW2;
SELECT count(*) FROM REVIEW2;


CREATE TABLE REVIEW2
(
    reviewUid2        NUMBER            NOT NULL, 
    rMemId2           VARCHAR2(20)      NULL, 
    rMovieName2       VARCHAR2(100)     NULL, 
    reviewContent2    CLOB              NULL, 
    reviewGrade2      NUMBER            NULL, 
    reviewHeart2      NUMBER            DEFAULT '0' NOT NULL,
    reviewRegdate2    DATE              DEFAULT SYSDATE, 
    CONSTRAINT REVIEW_PK2 PRIMARY KEY (reviewUid2)
);

CREATE SEQUENCE REVIEW2_SEQ START WITH 1 INCREMENT BY 1 NOCACHE;

DROP TABLE REVIEW2 CASCADE CONSTRAINTS;
DROP SEQUENCE REVIEW2_SEQ;

SELECT * FROM members;
SELECT * FROM CUSTOMERSERVICE c ;