-- 이성문님
-- 회원 멤버
DROP TABLE WTE_Member;
CREATE TABLE WTE_Member(
    member_no NUMBER PRIMARY KEY,
    member_id VARCHAR2(100) UNIQUE NOT NULL,
    member_pw VARCHAR2(200),
    member_nick VARCHAR2(40) UNIQUE NOT NULL,
    member_email VARCHAR2(20),
    member_gender VARCHAR2(4)CHECK (member_gender IN ('M','F')),
    member_birth DATE,
    member_profilephoto VARCHAR2(4000),
    member_joindate DATE
);

DROP SEQUENCE WTE_Member_seq;
CREATE SEQUENCE WTE_Member_seq;

-- 회원 인증
DROP TABLE WTE_Member_Auth;
CREATE TABLE WTE_Member_Auth(
    auth_no NUMBER PRIMARY KEY,
    member_no NUMBER(8),
    member_email VARCHAR2(20),
    auth_key NUMBER(8),
    auth_confirm VARCHAR2(8),
    auth_date DATE
);

DROP SEQUENCE WTE_Member_Auth_seq;
CREATE SEQUENCE WTE_Member_Auth_seq;

-- 쪽지
DROP TABLE WTE_Message;
CREATE TABLE WTE_Message(
    message_no NUMBER PRIMARY KEY,
    sender_no NUMBER(8),
    target_no NUMBER(8),
    message_content VARCHAR2(4000),
    open_confirm VARCHAR2(20),
    send_date DATE
);

DROP SEQUENCE WTE_Message_seq;
CREATE SEQUENCE WTE_Message_seq;

-- 주소록 폴더
DROP TABLE WTE_Address_Folder;
CREATE TABLE WTE_Address_Folder(
    address_folder_no NUMBER PRIMARY KEY,
    member_no NUMBER(8),
    address_folder_name VARCHAR2(4000)
);

DROP SEQUENCE WTE_Address_Folder_seq;
CREATE SEQUENCE WTE_Address_Folder_seq;

-- 주소록
DROP TABLE WTE_Address;
CREATE TABLE WTE_Address(
    address_no NUMBER PRIMARY KEY,
    address_folder_no NUMBER(8),
    member_no NUMBER(8)
);

DROP SEQUENCE WTE_Address_seq;
CREATE SEQUENCE WTE_Address_seq;

-- 레시피 게시판
DROP TABLE WTE_Recipe;
CREATE TABLE WTE_Recipe(
    recipe_no NUMBER PRIMARY KEY,
    member_no NUMBER(8),
    national_no NUMBER(8),
    kind_no NUMBER(8),
    recipe_title VARCHAR2(40),
    recipe_mainphoto VARCHAR2(4000),
    recipe_sauce VARCHAR2(800),
    recipe_people NUMBER(8),
    recipe_time NUMBER(8),
    recipe_readcount NUMBER(8),
    recipe_date DATE
);

DROP SEQUENCE WTE_Recipe_seq;
CREATE SEQUENCE WTE_Recipe_seq;

-- 레시피 게시판 컨텐트
DROP TABLE WTE_Recipe_Content;
CREATE TABLE WTE_Recipe_Content(
    recipe_content_no NUMBER PRIMARY KEY,
    recipe_no NUMBER(8),
    recipe_content VARCHAR2(4000),
    recipe_image_link VARCHAR2(4000)
);

DROP SEQUENCE WTE_Recipe_Content_seq;
CREATE SEQUENCE WTE_Recipe_Content_seq;

-- 레시피 게시판 좋아요
DROP TABLE WTE_Recipe_Good;
CREATE TABLE WTE_Recipe_Good(
    recipe_good_no NUMBER PRIMARY KEY,
    member_no NUMBER(8),
    recipe_no NUMBER(8),
    recipe_good_checkdate DATE
);

DROP SEQUENCE WTE_Recipe_Good_seq;
CREATE SEQUENCE WTE_Recipe_Good_seq;

-- 레시피 게시판 리플
DROP TABLE WTE_Recipe_Reply;
CREATE TABLE WTE_Recipe_Reply(
    recipe_reply_no NUMBER PRIMARY KEY,
    recipe_no NUMBER(8),
    member_no NUMBER(8),
    recipe_reply_comment VARCHAR2(4000),
    recipe_reply_writedate DATE
);

DROP SEQUENCE WTE_Recipe_Reply_seq;
CREATE SEQUENCE WTE_Recipe_Reply_seq;

-- 레시피 재료 대분류
DROP TABLE WTE_Group;
CREATE TABLE WTE_Group(
    group_no NUMBER PRIMARY KEY,
    group_name VARCHAR2(40)
);

DROP SEQUENCE WTE_Group_seq;
CREATE SEQUENCE WTE_Group_seq;

-- 레시피 재료 중분류
DROP TABLE WTE_Subgroup;
CREATE TABLE WTE_Subgroup(
    subgroup_no NUMBER PRIMARY KEY,
    group_no NUMBER(8),
    member_no NUMBER(8),
    subgroup_name VARCHAR2(40)
);

DROP SEQUENCE WTE_Subgroup_seq;
CREATE SEQUENCE WTE_Subgroup_seq;

-- 레시피 속 재료
DROP TABLE Ingredient_Recipe;
CREATE TABLE Ingredient_Recipe(
    ingredient_recipe_no NUMBER PRIMARY KEY,
    recipe_no NUMBER(8),
    subgroup_no NUMBER(8),
    ingredient_recipe_quantity VARCHAR2(40)
);

DROP SEQUENCE Ingredient_Recipe_seq;
CREATE SEQUENCE Ingredient_Recipe_seq;

-- 레시피 국가별
DROP TABLE WTE_Recipe_National;
CREATE TABLE WTE_Recipe_National(
    national_no NUMBER PRIMARY KEY,
    national_name VARCHAR2(40)
);

DROP SEQUENCE WTE_Recipe_National_seq;
CREATE SEQUENCE WTE_Recipe_National_seq;

-- 레시피 종류별
DROP TABLE WTE_Recipe_Kind;
CREATE TABLE WTE_Recipe_Kind(
    kind_no NUMBER PRIMARY KEY,
    kind_name VARCHAR2(40)
);

DROP SEQUENCE WTE_Recipe_Kind_seq;
CREATE SEQUENCE WTE_Recipe_Kind_seq;

-- 김현진님
--관리자 맴버
DROP TABLE WTE_Manager;
CREATE TABLE WTE_Manager(
    manager_no NUMBER PRIMARY KEY,
    manager_id VARCHAR2(100),
    manager_pw VARCHAR2(200),
    manager_nick VARCHAR2(40),
    manager_joindate DATE
);

DROP SEQUENCE WTE_Manager_seq;
CREATE SEQUENCE WTE_Manager_seq;

--Q&A 
DROP TABLE WTE_Ask;
CREATE TABLE WTE_Ask(
    ask_no NUMBER PRIMARY KEY,
    member_no NUMBER(8),
    ask_title VARCHAR2(400),
    ask_content VARCHAR2(4000),
    ask_check VARCHAR2(4),
    ask_writedate DATE
);

DROP SEQUENCE WTE_Ask_seq;
CREATE SEQUENCE WTE_Ask_seq;

--이미지 업로드
DROP TABLE WTE_QnA_Image;
CREATE TABLE WTE_QnA_Image(
    image_no NUMBER PRIMARY KEY,
    ask_no NUMBER(8),
    image_link VARCHAR2(200)
);

DROP SEQUENCE WTE_QnA_Image_seq;
CREATE SEQUENCE WTE_QnA_Image_seq;

--answer
DROP TABLE WTE_Answer;
CREATE TABLE WTE_Answer(
    answer_no NUMBER PRIMARY KEY,
    assign_no NUMBER(8),
    answer_content VARCHAR2(4000),
    answer_writedate DATE
);

DROP SEQUENCE WTE_Answer_seq;
CREATE SEQUENCE WTE_Answer_seq;

--배정테이블
DROP TABLE WTE_Assign;
CREATE TABLE WTE_Assign(
    assign_no NUMBER PRIMARY KEY,
    ask_no NUMBER(8),
    manager_no NUMBER(8),
    assign_date DATE
);
DROP SEQUENCE WTE_Assign_seq;
CREATE SEQUENCE WTE_Assign_seq;

--채팅방 목록
DROP TABLE WTE_Chat_Room;
CREATE TABLE WTE_Chat_Room(
    chat_room_no NUMBER PRIMARY KEY,
    member_no NUMBER(8),
    chat_room_title VARCHAR2(4000),
    chat_total_people NUMBER(8),
    chat_room_open_date DATE,
    chat_room_close_date DATE,
    chat_room_status VARCHAR2(200)
);

DROP SEQUENCE WTE_Chat_Room_seq;
CREATE SEQUENCE WTE_Chat_Room_seq;

--채팅 참가 회원
DROP TABLE WTE_Chat_Attend_Member;
CREATE TABLE WTE_Chat_Attend_Member(
    chat_attend_member_no NUMBER PRIMARY KEY,
    chat_room_no NUMBER(8),
    member_no NUMBER(8),
    chat_room_owner VARCHAR2(100),
    chat_attend_date DATE,
    chat_out_date DATE
);

DROP SEQUENCE WTE_Chat_Attend_Member_seq;
CREATE SEQUENCE WTE_Chat_Attend_Member_seq;

--채팅 메세지 
DROP TABLE WTE_Chatting_Message;
CREATE TABLE WTE_Chatting_Message(
    chatting_message_no NUMBER PRIMARY KEY,
    chat_room_no NUMBER(8),
    chat_attend_member_no NUMBER(8),
    chatting_content VARCHAR2(4000),
    chatting_date DATE
);

DROP SEQUENCE WTE_Chatting_Message_seq;
CREATE SEQUENCE WTE_Chatting_Message_seq;

--후기 게시판
DROP TABLE WTE_Postscript;
CREATE TABLE WTE_Postscript(
    postscript_no NUMBER(8),
    member_no NUMBER(8),
    recipe_no NUMBER(8),
    postscript_content VARCHAR2(4000),
    postscript_writedate DATE
);

DROP SEQUENCE WTE_Postscript_seq;
CREATE SEQUENCE WTE_Postscript_seq;

--이미지 업로드
DROP TABLE WTE_Postscript_Image;
CREATE TABLE WTE_Postscript_Image(
    postscript_image_no NUMBER(8),
    postscript_no NUMBER(8),
    postscript_image_link VARCHAR2(200)
);

DROP SEQUENCE WTE_Postscript_Image_seq;
CREATE SEQUENCE WTE_Postscript_Image_seq;

-- 김현정님
DROP TABLE WTE_Keep;
CREATE TABLE WTE_Keep(
    keep_no NUMBER PRIMARY KEY,
    subgroup_no NUMBER(8),
    keep_content VARCHAR2(4000)
);

DROP SEQUENCE WTE_Keep_seq;
CREATE SEQUENCE WTE_Keep_seq;

-- 박건우님
--요리도구 상품
DROP TABLE WTE_Goods;
CREATE TABLE WTE_Goods(
    goods_no NUMBER PRIMARY KEY,
    member_no NUMBER(8),
    goods_name VARCHAR2(100),
    goods_price NUMBER(38),
    goods_info VARCHAR2(4000),
    goods_amount NUMBER(38),
    goods_readcount NUMBER(8),
    goods_registdate DATE
);

DROP SEQUENCE WTE_Goods_seq;
CREATE SEQUENCE WTE_Goods_seq;

--상품 이미지
DROP TABLE WTE_Goods_Image;
CREATE TABLE WTE_Goods_Image(
    goods_image_no NUMBER PRIMARY KEY,
    goods_no NUMBER(8),
    goods_image_link VARCHAR2(2000)
);

DROP SEQUENCE WTE_Goods_Image_seq;
CREATE SEQUENCE WTE_Goods_Image_seq;

--상품 댓글
DROP TABLE WTE_Goods_Reply;
CREATE TABLE WTE_Goods_Reply(
    goods_reply_no NUMBER PRIMARY KEY,
    goods_no NUMBER(8),
    member_no NUMBER(8),
    goods_reply_comment VARCHAR2(4000),
    goods_reply_writedate DATE
);

DROP SEQUENCE WTE_Goods_Reply_seq;
CREATE SEQUENCE WTE_Goods_Reply_seq;

--좋아요
DROP TABLE WTE_Goods_Like;
CREATE TABLE WTE_Goods_Like(
    goods_like_no NUMBER PRIMARY KEY,
    goods_no NUMBER(8),
    member_no NUMBER(8)
);

DROP SEQUENCE WTE_Goods_Like_seq;
CREATE SEQUENCE WTE_Goods_Like_seq;

--포인트
DROP TABLE WTE_Goods_Point;
CREATE TABLE WTE_Goods_Point(
    point_no NUMBER PRIMARY KEY,
    member_no NUMBER(8),
    point_amount NUMBER(38),
    point_chargedate DATE
);

DROP SEQUENCE WTE_Goods_Point_seq;
CREATE SEQUENCE WTE_Goods_Point_seq;

--주문
DROP TABLE WTE_Goods_Order;
CREATE TABLE WTE_Goods_Order(
    order_no NUMBER PRIMARY KEY,
    goods_no NUMBER(8),
    member_no NUMBER(8),
    receiver_phone VARCHAR2(20),
    receiver_name VARCHAR2(20),
    receiver_address1 VARCHAR2(100),
    receiver_address2 VARCHAR2(100),
    receiver_address3 VARCHAR2(100),
    order_amount NUMBER(38),
    order_price NUMBER(38),
    order_date DATE
);

DROP SEQUENCE WTE_Goods_Order_seq;
CREATE SEQUENCE WTE_Goods_Order_seq;

--상세주문(다수상품 한번에 주문)
DROP TABLE WTE_Goods_DetailOrder;
CREATE TABLE WTE_Goods_DetailOrder(
    detail_order_no NUMBER PRIMARY KEY,
    order_no NUMBER(8),
    basket_no NUMBER(8)
);

DROP SEQUENCE WTE_Goods_DetailOrder_seq;
CREATE SEQUENCE WTE_Goods_DetailOrder_seq;

--장바구니
DROP TABLE WTE_Goods_Basket;
CREATE TABLE WTE_Goods_Basket(
    basket_no NUMBER PRIMARY KEY,
    member_no NUMBER(8),
    goods_no NUMBER(8),
    basket_amount NUMBER(8)
);

DROP SEQUENCE WTE_Goods_Basket_seq;
CREATE SEQUENCE WTE_Goods_Basket_seq;

-- 정왕희님
--컨텐츠 테이블
DROP TABLE WTE_Fb;
CREATE TABLE WTE_Fb(
    fb_no NUMBER PRIMARY KEY,
    member_no NUMBER(8),
    fb_category_no NUMBER(8),
    fb_title VARCHAR2(4000),
    fb_content VARCHAR2(4000),
    fb_readcount NUMBER(8),
    fb_writedate DATE
);

DROP SEQUENCE WTE_Fb_seq;
CREATE SEQUENCE WTE_Fb_seq;

--이미지 테이블
DROP TABLE WTE_FB_Image;
CREATE TABLE WTE_FB_Image(
    fbimage_no NUMBER PRIMARY KEY,
    fb_no NUMBER(8),
    fbimage_link VARCHAR2(200)
 
 );   
 
DROP SEQUENCE WTE_FB_Image_seq;
CREATE SEQUENCE WTE_FB_Image_seq;

--리플테이블--
DROP TABLE WTE_FB_Reple;
CREATE TABLE WTE_FB_Reple(
    fb_reple_no NUMBER PRIMARY KEY,
    fb_no NUMBER(8),
    member_no NUMBER(8),
    fb_reple_content VARCHAR2(4000),
    fb_reple_writedate DATE       
);

DROP SEQUENCE WTE_FB_Reple_seq;
CREATE SEQUENCE WTE_FB_Reple_seq;

--카테고리테이블--
DROP TABLE WTE_FB_Category;
CREATE TABLE WTE_FB_Category(
    fb_category_no NUMBER PRIMARY KEY,
    fb_category_name VARCHAR2(20)
);

DROP SEQUENCE WTE_FB_Category_seq;
CREATE SEQUENCE WTE_FB_Category_seq;

-- 좋아요 테이블
DROP TABLE WTE_FB_Good;
CREATE TABLE WTE_FB_Good(
    fb_good_no NUMBER PRIMARY KEY,
    fb_no NUMBER(8),
    member_no NUMBER(8)
);

DROP SEQUENCE WTE_FB_Good_seq;
CREATE SEQUENCE WTE_FB_Good_seq;

--카테고리테이블--
DROP TABLE WTE_FB_Category;
CREATE TABLE WTE_FB_Category(
    fb_category_no NUMBER PRIMARY KEY,
    fb_category_name VARCHAR2(20)
);

DROP SEQUENCE WTE_FB_Category_seq;
CREATE SEQUENCE WTE_FB_Category_seq;

-- SELECT -----------------------------------------------------------------------
SELECT * FROM WTE_Member;
SELECT * FROM WTE_Member_Auth;
SELECT * FROM WTE_Message;
SELECT * FROM WTE_Address_Folder;
SELECT * FROM WTE_Address;
SELECT * FROM WTE_Recipe;
SELECT * FROM WTE_Recipe_Content;
SELECT * FROM WTE_Recipe_Good;
SELECT * FROM WTE_Recipe_Reply;
SELECT * FROM WTE_Group;
SELECT * FROM WTE_Subgroup;
SELECT * FROM Ingredient_Recipe;
SELECT * FROM WTE_Recipe_National;
SELECT * FROM WTE_Recipe_Kind;

SELECT * FROM WTE_Manager;
SELECT * FROM WTE_Ask;
SELECT * FROM WTE_QnA_Image;
SELECT * FROM WTE_Answer;
SELECT * FROM WTE_Assign;

SELECT * FROM WTE_Keep;

SELECT * FROM WTE_Goods;
SELECT * FROM WTE_Goods_Image;
SELECT * FROM WTE_Goods_Reply;
SELECT * FROM WTE_Goods_Like;

SELECT * FROM WTE_Fb;
SELECT * FROM WTE_FB_Image;
SELECT * FROM WTE_FB_Reple;
SELECT * FROM WTE_FB_Category;
SELECT * FROM WTE_FB_Good;

commit;

------------------------------------------------------------------------------
-- memberPk 생성
SELECT WTE_Member_seq.nextval FROM DUAL;

-- 회원가입
INSERT INTO WTE_Member VALUES(
    WTE_Member_seq.nextval,
    'java1',
    '1111',
    '피카츄',
    '01011111111',
    'M',
    TO_DATE('1995-02-06','YYYY-MM-DD'),
    'photo_link',
    SYSDATE
);

-- 회원 인증
INSERT INTO WTE_Member_Auth VALUES(
    WTE_MEMBER_AUTH_SEQ.nextval,
    0,
    '01000000001',
    1235,
    'N',
    SYSDATE
);

-- 인증키 다시보내기
UPDATE WTE_Member_Auth 
SET auth_confirm = 'Y' 
;

-- 인증키 확인
SELECT * 
FROM WTE_Member_Auth 
WHERE member_phone = '01000000000'
;

UPDATE WTE_Member_Auth 
SET member_no = 1235 
WHERE member_phone = '01000000000'
;

-- 로그인
SELECT * 
FROM WTE_Member 
WHERE member_id = '123' 
AND member_pw = '123'
;

-- 특정 회원정보 가져오기
SELECT * 
FROM WTE_Member 
WHERE member_no = 1 
;

-- member_no 가져오기
SELECT member_no 
FROM WTE_Member 
WHERE member_nick = 1111
;

-- 닉네임 가져오기
SELECT member_nick 
FROM WTE_Member 
WHERE member_no = 1
;

-- 쪽지 보내기
INSERT INTO WTE_Message VALUES(
    WTE_Message_seq.nextval,
    '1',
    '2',
    '안녕하세요',
    'N',
    SYSDATE
);

-- 받은 쪽지 리스트 보기
SELECT *
FROM WTE_Message 
WHERE target_no = 2
ORDER BY message_no DESC
;

-- 보낸 쪽지 리스트 보기
SELECT * 
FROM WTE_Message 
WHERE sender_no = 2
ORDER BY message_no DESC
;

-- 특정 쪽기 보기
SELECT * 
FROM WTE_Message 
WHERE message_no = 1
;

-- 쪽지 확인 완료
UPDATE WTE_Message 
SET open_confirm = 'Y' 
WHERE message_no = 1
;

-- 쪽지 삭제
DELETE FROM WTE_Message WHERE message_no = 77;

-- 받은 쪽지 전체 수
SELECT COUNT(*) total_message
FROM WTE_Message 
WHERE target_no = 1
;

-- 받은 쪽지 중 안읽은 쪽지 수
SELECT COUNT(*) 
FROM WTE_Message not_read_message
WHERE target_no = 1
AND open_confirm = 'N'
;

-- 보낸 쪽지 전체 수
SELECT COUNT(*) total_message
FROM WTE_Message 
WHERE sender_no = 1
;

-- 보낸 쪽지 중 안읽은 쪽지 수
SELECT COUNT(*) not_read_message
FROM WTE_Message 
WHERE sender_no = 1
AND open_confirm = 'N'
;

-- 주소록 폴더 만들기
INSERT INTO WTE_Address_Folder VALUES(
    WTE_Address_Folder_seq.nextval,
    21,
    '전체 주소록'
);

-- 주소록 추가
INSERT INTO WTE_Address VALUES(
    WTE_Address_seq.nextval,
    1,
    2
);

-- 주소록 폴더 가져오기
SELECT * 
FROM WTE_Address_Folder 
WHERE member_no = 1
ORDER BY address_folder_no
;

-- 폴더별 주소록 가져오기
SELECT * 
FROM WTE_Address 
WHERE address_folder_no = 1
ORDER BY address_no
;

-- 주소록 폴더 정보 가져오기
SELECT * 
FROM WTE_Address_Folder 
WHERE address_folder_no = 1
;

-- 주소록 폴더 이름 변경
UPDATE WTE_Address_Folder
SET address_folder_name = '친구'
WHERE address_folder_no = 5
;

-- 폴더 변경
UPDATE WTE_Address
SET address_folder_no = 5
WHERE address_no = 2
;

-- 주소록 폴더+주소록 삭제
DELETE FROM WTE_Address_Folder WHERE address_folder_no = 12;
DELETE FROM WTE_Address WHERE address_folder_no = 12;

-- 주소록 폴더만 삭제
UPDATE WTE_Address 
SET address_folder_no = (SELECT MIN(address_folder_no) FROM WTE_Address_Folder WHERE member_no = 1) 
WHERE address_folder_no = 12;
DELETE FROM WTE_Address_Folder WHERE address_folder_no = 12;

SELECT MIN(address_folder_no) FROM WTE_Address_Folder WHERE member_no = 1;

-- 주소록 삭제
DELETE FROM WTE_Address WHERE address_no = 3;

-- 친구추가 유효성 검사
SELECT * 
FROM WTE_Address 
WHERE address_folder_no IN (
  SELECT address_folder_no 
    FROM WTE_Address_Folder 
    WHERE member_no = 2  
);

--관리자 삽입
INSERT INTO WTE_Manager VALUES(
    WTE_Manager_seq.nextval,
    'ma3',
    '333',
    '관리자3',
    SYSDATE
);

-- 대분류 select
SELECT * FROM WTE_Group;

-- 중분류 select(group_no)
SELECT * FROM WTE_Subgroup WHERE group_no = 1;

-- 나라별 select
SELECT * FROM WTE_Recipe_National;

-- 종류별 select
SELECT * FROM WTE_Recipe_Kind;

-- 나라별 검색
SELECT * 
FROM WTE_Recipe
WHERE national_no = 1
;

-- 종류별 검색
SELECT * 
FROM WTE_Recipe
WHERE kind_no = 1
;

-- 검색 쿼리
-- 종합
SELECT r1.* 
FROM (
    SELECT * 
    FROM WTE_Recipe
    WHERE recipe_no NOT IN (
        SELECT recipe_no 
        FROM Ingredient_Recipe
        WHERE subgroup_no IN (20)
    )
) r1, 
    (SELECT recipe_no, COUNT(recipe_no) as count
    FROM Ingredient_Recipe
    WHERE subgroup_no IN (1,10)
    GROUP BY recipe_no) r2
WHERE 
r1.recipe_no = r2.recipe_no
AND r1.recipe_no IN (
    SELECT recipe_no 
    FROM Ingredient_Recipe
    WHERE subgroup_no IN (1,10)
)
AND national_no = 1
AND kind_no = 2
ORDER BY count DESC
;

SELECT * 
FROM WTE_Recipe 
WHERE 1=1

AND national_no = 1

ORDER BY recipe_no DESC
;

-- 있는 분류 중 없는거
SELECT * 
FROM WTE_Recipe
WHERE recipe_no IN (
    SELECT recipe_no 
    FROM Ingredient_Recipe
    WHERE subgroup_no IN (1)
)
;

-- 없는 분류 중 없는거
SELECT * 
FROM WTE_Recipe
WHERE recipe_no IN (
    SELECT recipe_no 
    FROM Ingredient_User_Recipe
    WHERE user_group_no IN (
        SELECT user_group_no 
        FROM Ingredient_User_Group
        WHERE user_group_name IN ('df','as')
    )
)
;

-- 없는 놈들 합체
SELECT recipe_no 
FROM WTE_Recipe
WHERE recipe_no IN (
    SELECT recipe_no 
    FROM Ingredient_Recipe
    WHERE subgroup_no IN (1)
)
OR recipe_no IN (
    SELECT recipe_no 
    FROM Ingredient_User_Recipe
    WHERE user_group_no IN (
        SELECT user_group_no 
        FROM Ingredient_User_Group
        WHERE user_group_name IN ('df','as')
    )
)
;

SELECT * 
FROM WTE_Recipe
WHERE recipe_no NOT IN (
    SELECT recipe_no 
    FROM WTE_Recipe
    WHERE recipe_no IN (
        SELECT recipe_no 
        FROM Ingredient_Recipe
        WHERE subgroup_no IN (1)
    )
    OR recipe_no IN (
        SELECT recipe_no 
        FROM Ingredient_User_Recipe
        WHERE user_group_no IN (
            SELECT user_group_no 
            FROM Ingredient_User_Group
            WHERE user_group_name IN ('df','as')
        )
    )
)
;

-- 있는 분류 중 있는거
SELECT * 
FROM WTE_Recipe
WHERE recipe_no IN (
    SELECT recipe_no 
    FROM Ingredient_Recipe
    WHERE subgroup_no IN (1)
)
;

-- 없는 분류 중 있는거
SELECT * 
FROM WTE_Recipe
WHERE recipe_no IN (
    SELECT recipe_no 
    FROM Ingredient_User_Recipe
    WHERE user_group_no IN (
        SELECT user_group_no 
        FROM Ingredient_User_Group
        WHERE user_group_name IN ('df','as')
    )
)
;

-- 있는놈들 합체
SELECT recipe_no 
FROM WTE_Recipe
WHERE recipe_no IN (
    SELECT recipe_no 
    FROM Ingredient_Recipe
    WHERE subgroup_no IN (1)
)
AND recipe_no IN (
    SELECT recipe_no 
    FROM Ingredient_User_Recipe
    WHERE user_group_no IN (
        SELECT user_group_no 
        FROM Ingredient_User_Group
        WHERE user_group_name IN ('df','as')
    )
)
;


-- 예시 추가
INSERT INTO Ingredient_Recipe VALUES(
    Ingredient_Recipe_seq.nextval,
    2,
    5,
    11
);

INSERT INTO WTE_Recipe VALUES(
    WTE_Recipe_seq.nextval,
    2,
    5,
    5,
    'dsdsds',
    'dfdfd',
    'df',
    1,
    2,
    SYSDATE
);

SELECT re.*
FROM WTE_Recipe re, (SELECT recipe_no, COUNT(recipe_no) as xxx FROM Ingredient_Recipe WHERE subgroup_no IN (1,10) GROUP BY recipe_no) se 
WHERE re.recipe_no = se.recipe_no
AND re.recipe_no IN (
    SELECT recipe_no FROM Ingredient_Recipe WHERE subgroup_no IN (1,10)
)
ORDER BY xxx DESC
;


SELECT recipe_no, COUNT(recipe_no) FROM
(SELECT recipe_no FROM Ingredient_Recipe WHERE subgroup_no IN (1,10));

SELECT recipe_no FROM (SELECT recipe_no, COUNT(recipe_no) as xxx FROM Ingredient_Recipe WHERE subgroup_no IN (1,10) GROUP BY recipe_no) ORDER BY xxx DESC;

SELECT recipe_no, COUNT(recipe_no) as xxx FROM Ingredient_Recipe WHERE subgroup_no IN (1,10) GROUP BY recipe_no;

SELECT recipe_no, COUNT(recipe_no) as count
    FROM Ingredient_Recipe
    WHERE subgroup_no IN (1)
    GROUP BY recipe_no

SELECT recipe_no FROM Ingredient_Recipe WHERE subgroup_no IN (1,10);

SELECT * 
FROM WTE_Recipe 
WHERE 1=1
AND ( recipe_no IN (1) 
OR recipe_no IN (3)
)
ORDER BY recipe_no DESC
;

-- 재료를 재료명으로 검색
SELECT subgroup_no FROM WTE_Subgroup WHERE subgroup_name LIKE '%고기%' OR subgroup_name LIKE '%달걀%';

DELETE FROM WTE_Recipe WHERE recipe_no = 42;

UPDATE WTE_Member SET member_profilephoto = '/upload/profile/man2.png' WHERE member_no = 1;

-- 레시피 제목 검색
SELECT * 
FROM WTE_Recipe 
WHERE recipe_title like '%역시%';

SELECT * FROM WTE_Subgroup WHERE subgroup_name LIKE '%고기%' OR subgroup_name LIKE '%달걀%';

SELECT * FROM NLS_DATABASE_PARAMETERS

WHERE PARAMETER

LIKE '%CHARACTERSET%'; 

SELECT * FROM WTE_Member;
commit;