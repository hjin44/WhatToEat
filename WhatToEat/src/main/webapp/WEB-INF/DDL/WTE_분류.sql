-- 재료 분류
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

SELECT * FROM WTE_Group;
SELECT * FROM WTE_Subgroup;
--------------------------------------------------------------------------------------------------------
-- 대분류
INSERT INTO WTE_Group VALUES(
    WTE_Group_seq.nextval,
    '정육/계란류'
);

INSERT INTO WTE_Group VALUES(
    WTE_Group_seq.nextval,
    '과일'
);

INSERT INTO WTE_Group VALUES(
    WTE_Group_seq.nextval,
    '채소'
);

INSERT INTO WTE_Group VALUES(
    WTE_Group_seq.nextval,
    '수산물'
);

INSERT INTO WTE_Group VALUES(
    WTE_Group_seq.nextval,
    '면/빵/떡류'
);

INSERT INTO WTE_Group VALUES(
    WTE_Group_seq.nextval,
    '유제품'
);

INSERT INTO WTE_Group VALUES(
    WTE_Group_seq.nextval,
    '곡류'
);

INSERT INTO WTE_Group VALUES(
    WTE_Group_seq.nextval,
    '기타'
);

INSERT INTO WTE_Group VALUES(
    WTE_Group_seq.nextval,
    '회원 추가 재료'
);

SELECT * FROM WTE_Group;
--------------------------------------------------------------------------------------------------------------
-- 중분류
-- 정육/계란류
INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    1,
    0,
    '계란'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    1,
    0,
    '메추리알'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    1,
    0,
    '기타 알류'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    1,
    0,
    '닭고기'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    1,
    0,
    '오리고기'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    1,
    0,
    '양고기'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    1,
    0,
    '돼지고기'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    1,
    0,
    '소고기'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    1,
    0,
    '기타 육류'
);

-- 과일
INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    2,
    0,
    '사과'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    2,
    0,
    '배'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    2,
    0,
    '감귤'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    2,
    0,
    '수박'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    2,
    0,
    '멜론'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    2,
    0,
    '참외'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    2,
    0,
    '토마토'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    2,
    0,
    '딸기'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    2,
    0,
    '키위'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    2,
    0,
    '블루베리'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    2,
    0,
    '포도'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    2,
    0,
    '자두'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    2,
    0,
    '복숭아'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    2,
    0,
    '감'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    2,
    0,
    '곶감'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    2,
    0,
    '바나나'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    2,
    0,
    '파인애플'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    2,
    0,
    '오렌지'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    2,
    0,
    '자몽'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    2,
    0,
    '레몬'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    2,
    0,
    '망고'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    2,
    0,
    '열대과일'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    2,
    0,
    '체리'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    2,
    0,
    '석류'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    2,
    0,
    '아보카도'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    2,
    0,
    '건과일'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    2,
    0,
    '기타 과일'
);

-- 채소
INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    3,
    0,
    '두부'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    3,
    0,
    '콩나물'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    3,
    0,
    '숙주나물'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    3,
    0,
    '고구마'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    3,
    0,
    '감자'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    3,
    0,
    '양파'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    3,
    0,
    '마늘'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    3,
    0,
    '파'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    3,
    0,
    '생강'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    3,
    0,
    '오이'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    3,
    0,
    '가지'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    3,
    0,
    '호박'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    3,
    0,
    '옥수수'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    3,
    0,
    '상추'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    3,
    0,
    '깻잎'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    3,
    0,
    '쌈채소'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    3,
    0,
    '고추'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    3,
    0,
    '피망'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    3,
    0,
    '파프리카'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    3,
    0,
    '시금치'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    3,
    0,
    '부추'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    3,
    0,
    '나물'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    3,
    0,
    '양배추'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    3,
    0,
    '양상추'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    3,
    0,
    '브로콜리'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    3,
    0,
    '샐러드'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    3,
    0,
    '어린잎채소'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    3,
    0,
    '당근'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    3,
    0,
    '우엉'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    3,
    0,
    '연근'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    3,
    0,
    '마'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    3,
    0,
    '버섯'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    3,
    0,
    '배추 김치'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    3,
    0,
    '무 김치'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    3,
    0,
    '파 김치'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    3,
    0,
    '기타 김치류'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    3,
    0,
    '배추'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    3,
    0,
    '무'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    3,
    0,
    '아스파라거스'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    3,
    0,
    '허브류'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    3,
    0,
    '인삼'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    3,
    0,
    '더덕'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    3,
    0,
    '약선재료'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    3,
    0,
    '기타 채소'
);

-- 수산물
INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    4,
    0,
    '고등어'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    4,
    0,
    '갈치'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    4,
    0,
    '기타 생선류'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    4,
    0,
    '오징어'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    4,
    0,
    '낙지'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    4,
    0,
    '쭈꾸미'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    4,
    0,
    '문어'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    4,
    0,
    '새우'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    4,
    0,
    '게'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    4,
    0,
    '랍스터'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    4,
    0,
    '전복'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    4,
    0,
    '굴'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    4,
    0,
    '멍게'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    4,
    0,
    '기타 조개류'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    4,
    0,
    '회'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    4,
    0,
    '명란'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    4,
    0,
    '날치알'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    4,
    0,
    '여러 장류'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    4,
    0,
    '김'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    4,
    0,
    '미역'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    4,
    0,
    '기타 해조류'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    4,
    0,
    '멸치'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    4,
    0,
    '황태'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    4,
    0,
    '노가리'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    4,
    0,
    '건어물'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    4,
    0,
    '기타 해산물'
);

-- 면/빵/떡류
INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    5,
    0,
    '라면'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    5,
    0,
    '파스타면'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    5,
    0,
    '생면'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    5,
    0,
    '건면'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    5,
    0,
    '기타 면류'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    5,
    0,
    '빵'
);
INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    5,
    0,
    '떡'
);

-- 유제품
INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    6,
    0,
    '우유'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    6,
    0,
    '요거트'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    6,
    0,
    '요구르트'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    6,
    0,
    '두유'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    6,
    0,
    '치즈'
);

-- 곡류
INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    7,
    0,
    '백미'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    7,
    0,
    '찹쌀'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    7,
    0,
    '현미'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    7,
    0,
    '흑미'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    7,
    0,
    '콩'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    7,
    0,
    '팥'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    7,
    0,
    '보리'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    7,
    0,
    '귀리'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    7,
    0,
    '견과류'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    8,
    0,
    '금가루'
);

SELECT * FROM WTE_Subgroup;

----------------------------------------------------------------------------------------------------
-- 레시피 분류
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
-----------------------------------------------------------------------------------------------------------
-- 레시피 국가별
INSERT INTO WTE_Recipe_National VALUES(
    WTE_Recipe_National_seq.nextval,
    '한식'
);

INSERT INTO WTE_Recipe_National VALUES(
    WTE_Recipe_National_seq.nextval,
    '양식'
);

INSERT INTO WTE_Recipe_National VALUES(
    WTE_Recipe_National_seq.nextval,
    '일식'
);

INSERT INTO WTE_Recipe_National VALUES(
    WTE_Recipe_National_seq.nextval,
    '중식'
);

INSERT INTO WTE_Recipe_National VALUES(
    WTE_Recipe_National_seq.nextval,
    '인도식'
);

INSERT INTO WTE_Recipe_National VALUES(
    WTE_Recipe_National_seq.nextval,
    '기타'
);

SELECT * FROM WTE_Recipe_National;

-- 레시피 종류별
INSERT INTO WTE_Recipe_Kind VALUES(
    WTE_Recipe_Kind_seq.nextval,
    '밑반찬'
);

INSERT INTO WTE_Recipe_Kind VALUES(
    WTE_Recipe_Kind_seq.nextval,
    '메인반찬'
);

INSERT INTO WTE_Recipe_Kind VALUES(
    WTE_Recipe_Kind_seq.nextval,
    '국/탕/찌개'
);

INSERT INTO WTE_Recipe_Kind VALUES(
    WTE_Recipe_Kind_seq.nextval,
    '디저트'
);

INSERT INTO WTE_Recipe_Kind VALUES(
    WTE_Recipe_Kind_seq.nextval,
    '면/만두'
);

INSERT INTO WTE_Recipe_Kind VALUES(
    WTE_Recipe_Kind_seq.nextval,
    '밥/죽/떡'
);

INSERT INTO WTE_Recipe_Kind VALUES(
    WTE_Recipe_Kind_seq.nextval,
    '퓨전'
);

INSERT INTO WTE_Recipe_Kind VALUES(
    WTE_Recipe_Kind_seq.nextval,
    '김치/젓갈/장류'
);

INSERT INTO WTE_Recipe_Kind VALUES(
    WTE_Recipe_Kind_seq.nextval,
    '양념/소스/잼'
);

INSERT INTO WTE_Recipe_Kind VALUES(
    WTE_Recipe_Kind_seq.nextval,
    '기타'
);

SELECT * FROM WTE_Recipe_Kind;

-- 자유 게시판 카테고리
DROP TABLE WTE_FB_Category;
CREATE TABLE WTE_FB_Category(
    fb_category_no NUMBER(8),
    fb_category_name VARCHAR2(20)
);

DROP SEQUENCE WTE_FB_Category_seq;
CREATE SEQUENCE WTE_FB_Category_seq;

SELECT * FROM WTE_FB_Category;

-------------------------------------------------------------------------------
INSERT INTO WTE_FB_Category VALUES(
    WTE_FB_Category_seq.nextval,
    '잡담'
);
INSERT INTO WTE_FB_Category VALUES(
    WTE_FB_Category_seq.nextval,
    '질문'
);

INSERT INTO WTE_FB_Category VALUES(
    WTE_FB_Category_seq.nextval,
    '기타'
);

commit;