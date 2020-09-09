
DROP TABLE MEMBER;

CREATE TABLE MEMBER
(
    MEMBER_ID VARCHAR2(50),
    MEMBER_PWD VARCHAR2(200) NOT NULL,
    MEMBER_NAME VARCHAR2(50) NOT NULL,
    NICKNAME VARCHAR2(50) NOT NULL,
    PHONE VARCHAR2(200),
    ADDRESS VARCHAR2(200) NOT NULL,
    EMAIL VARCHAR2(200),
    ENROLL_DATE DATE DEFAULT SYSDATE,
    GRADE VARCHAR2(5) DEFAULT 1,
    CUR_ROOM_CNT VARCHAR2(10) DEFAULT 0,
    MAX_ROOM_CNT VARCHAR2(10) DEFAULT 3,
    REPORT_CNT VARCHAR2(10) DEFAULT 0,
    POINT VARCHAR2(20) DEFAULT 0,
    LEAVE_MEM VARCHAR2(1) DEFAULT 0,
    CUR_TRADE_LIST VARCHAR2(200) DEFAULT NULL,
    TRADE_LIST VARCHAR2(200) DEFAULT NULL,
    LIKE_LIST VARCHAR2(200) DEFAULT NULL,
    UNIQUE(PHONE,EMAIL),PRIMARY KEY(MEMBER_ID)
);

COMMENT ON COLUMN MEMBER.MEMBER_ID IS '회원아이디';
COMMENT ON COLUMN MEMBER.MEMBER_PWD IS '회원비밀번호(단방향)';
COMMENT ON COLUMN MEMBER.MEMBER_NAME IS '회원이름';
COMMENT ON COLUMN MEMBER.NICKNAME IS '회원닉네임';
COMMENT ON COLUMN MEMBER.PHONE IS '전화번호(양방향)';
COMMENT ON COLUMN MEMBER.ADDRESS IS '주소(양방향)';
COMMENT ON COLUMN MEMBER.EMAIL IS '이메일(양방향)';
COMMENT ON COLUMN MEMBER.ENROLL_DATE IS '가입날짜';
COMMENT ON COLUMN MEMBER.GRADE IS '회원등급';
COMMENT ON COLUMN MEMBER.CUR_ROOM_CNT IS '현재개설한방갯수';
COMMENT ON COLUMN MEMBER.MAX_ROOM_CNT IS '개설가능한방갯수';
COMMENT ON COLUMN MEMBER.REPORT_CNT IS '신고당한횟수';
COMMENT ON COLUMN MEMBER.POINT IS '포인트수치';
COMMENT ON COLUMN MEMBER.LEAVE_MEM IS '회원탈퇴여부 Boolean';
COMMENT ON COLUMN MEMBER.CUR_TRADE_LIST IS '거래중인게시글리스트';
COMMENT ON COLUMN MEMBER.TRADE_LIST IS '과거거래내역리스트';
COMMENT ON COLUMN MEMBER.LIKE_LIST IS '추천게시글리스트';

------------------------------------------------------------------------------------------

DROP TABLE BOARD;

CREATE TABLE BOARD(
    BOARD_ID NUMBER,
    BOARD_TITLE VARCHAR2(100) NOT NULL,
    WRITER_ID VARCHAR2(50),
    CONTENT VARCHAR2(1000),
    ENROLL_DATE TIMESTAMP DEFAULT SYSDATE,
    HIT NUMBER DEFAULT 0,
    FILES VARCHAR2(2000) DEFAULT NULL,
    PRODUCT_CATEGORI VARCHAR2(50),
    PRODUCT_NAME VARCHAR2(50),
    DELIVERY_TIME TIMESTAMP DEFAULT (SYSDATE + 3*24/24),
    TRADE_AREA VARCHAR2(200),
    MAX_MEMS VARCHAR2(50) DEFAULT 3,
    CUR_MEMS_LIST VARCHAR2(200) DEFAULT NULL,
    LIMIT_TRADE_TIME TIMESTAMP DEFAULT (SYSDATE + 2/24),
    TRADE_STAGE VARCHAR2(10) DEFAULT 1,
    TRADE_START VARCHAR2(10) DEFAULT 0,
    POPULAR_BOARD VARCHAR2(10) DEFAULT 0,
    PRODUCT_PRICE NUMBER(20) NOT NULL,
    OWN_STATUS VARCHAR2(30) NOT NULL,
    TRADE_KIND VARCHAR2(30) NOT NULL,
    PRODUCT_URL VARCHAR2(50) DEFAULT NULL,
    PRIMARY KEY(BOARD_ID)
);

COMMENT ON COLUMN BOARD.BOARD_ID IS '게시글아이디';
COMMENT ON COLUMN BOARD.BOARD_TITLE IS '게시글제목';
COMMENT ON COLUMN BOARD.WRITER_ID IS '게시글작성자아이디';
COMMENT ON COLUMN BOARD.CONTENT IS '게시글내용';
COMMENT ON COLUMN BOARD.ENROLL_DATE IS '게시글등록날짜';
COMMENT ON COLUMN BOARD.HIT IS '조회수';
COMMENT ON COLUMN BOARD.FILES IS '파일첨부(파일명.확장자)';
COMMENT ON COLUMN BOARD.PRODUCT_CATEGORI IS '제품 카테고리';
COMMENT ON COLUMN BOARD.PRODUCT_NAME IS '제품 이름';
COMMENT ON COLUMN BOARD.DELIVERY_TIME IS '배송 예정 시간';
COMMENT ON COLUMN BOARD.TRADE_AREA IS '거래 지역';
COMMENT ON COLUMN BOARD.MAX_MEMS IS '최대 N빵 회원 수(방장이 실시간으로 변경 가능)';
COMMENT ON COLUMN BOARD.CUR_MEMS_LIST IS '현재 회원 리스트';
COMMENT ON COLUMN BOARD.LIMIT_TRADE_TIME IS '거래 예정 시간';
COMMENT ON COLUMN BOARD.TRADE_STAGE IS '거래 진행 단계';
COMMENT ON COLUMN BOARD.TRADE_START IS '거래 활성화 여부 Boolean';
COMMENT ON COLUMN BOARD.POPULAR_BOARD IS '인기 게시물 활성화 여부 Boolean';
COMMENT ON COLUMN BOARD.PRODUCT_PRICE IS '제품의가격';
COMMENT ON COLUMN BOARD.OWN_STATUS IS '제품보유상태';
COMMENT ON COLUMN BOARD.TRADE_KIND IS '거래 종류';
COMMENT ON COLUMN BOARD.PRODUCT_URL IS '제품 URL';
COMMIT;

------------------------------------------------------------------------------------------

DROP TABLE "COMMENT";

CREATE TABLE "COMMENT" (
  COM_ID NUMBER,
  CBOARD_ID NUMBER NOT NULL,
  "COMMENT" VARCHAR2(1000),
  CWRITER_ID VARCHAR2(50) DEFAULT NULL,
  CENROLL_DATE TIMESTAMP DEFAULT SYSDATE,
  SECRET NUMBER DEFAULT 0,
  PRIMARY KEY (COM_ID)
);

COMMENT ON COLUMN "COMMENT".COM_ID IS '댓글 아이디';
COMMENT ON COLUMN "COMMENT".CBOARD_ID IS '댓글 달린 게시물 아이디';
COMMENT ON COLUMN "COMMENT"."COMMENT" IS '댓글 내용';
COMMENT ON COLUMN "COMMENT".CWRITER_ID IS '댓글 작성자 아이디';
COMMENT ON COLUMN "COMMENT".CENROLL_DATE IS '댓글 작성 날짜';
COMMENT ON COLUMN "COMMENT".SECRET IS '비밀 댓글 여부 Boolean';
COMMIT;

------------------------------------------------------------------------------------------

SELECT * FROM MEMBER;
SELECT * FROM BOARD;
SELECT * FROM "COMMENT";
CREATE SEQUENCE SEQ_NOTICE_NO;
DROP TABLE NOTICE;
       CREATE TABLE NOTICE(
        NOTICE_NO NUMBER PRIMARY KEY,
        NOTICE_TITLE VARCHAR2(100) NOT NULL,
        NOTICE_WRITER VARCHAR2(15) NOT NULL,
        NOTICE_CONTENT VARCHAR2(4000) NOT NULL,
        NOTICE_DATE DATE DEFAULT SYSDATE,
        FILEPATH VARCHAR2(300),
        STATUS VARCHAR2(1) DEFAULT 'Y'
    );
    INSERT INTO NOTICE VALUES(SEQ_NOTICE_NO.NEXTVAL,'공지사항테스트','admin','공지사항테스트입니다',default,null,default);

COMMIT;


--멤버 테스트용 계정
INSERT INTO MEMBER VALUES('admin','admin','관리자','관리자','01012345678','서울시 서초구', 'admin@admin', sysdate, default,
default, default, default, default, default, default, default, default);
COMMIT;
SELECT * FROM MEMBER where member_id='admin' and member_pwd='admin';