-- ��� �з�
-- ������ ��� ��з�
DROP TABLE WTE_Group;
CREATE TABLE WTE_Group(
    group_no NUMBER PRIMARY KEY,
    group_name VARCHAR2(40)
);

DROP SEQUENCE WTE_Group_seq;
CREATE SEQUENCE WTE_Group_seq;

-- ������ ��� �ߺз�
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
-- ��з�
INSERT INTO WTE_Group VALUES(
    WTE_Group_seq.nextval,
    '����/�����'
);

INSERT INTO WTE_Group VALUES(
    WTE_Group_seq.nextval,
    '����'
);

INSERT INTO WTE_Group VALUES(
    WTE_Group_seq.nextval,
    'ä��'
);

INSERT INTO WTE_Group VALUES(
    WTE_Group_seq.nextval,
    '���깰'
);

INSERT INTO WTE_Group VALUES(
    WTE_Group_seq.nextval,
    '��/��/����'
);

INSERT INTO WTE_Group VALUES(
    WTE_Group_seq.nextval,
    '����ǰ'
);

INSERT INTO WTE_Group VALUES(
    WTE_Group_seq.nextval,
    '���'
);

INSERT INTO WTE_Group VALUES(
    WTE_Group_seq.nextval,
    '��Ÿ'
);

INSERT INTO WTE_Group VALUES(
    WTE_Group_seq.nextval,
    'ȸ�� �߰� ���'
);

SELECT * FROM WTE_Group;
--------------------------------------------------------------------------------------------------------------
-- �ߺз�
-- ����/�����
INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    1,
    0,
    '���'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    1,
    0,
    '���߸���'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    1,
    0,
    '��Ÿ �˷�'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    1,
    0,
    '�߰��'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    1,
    0,
    '�������'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    1,
    0,
    '����'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    1,
    0,
    '�������'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    1,
    0,
    '�Ұ��'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    1,
    0,
    '��Ÿ ����'
);

-- ����
INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    2,
    0,
    '���'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    2,
    0,
    '��'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    2,
    0,
    '����'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    2,
    0,
    '����'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    2,
    0,
    '���'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    2,
    0,
    '����'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    2,
    0,
    '�丶��'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    2,
    0,
    '����'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    2,
    0,
    'Ű��'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    2,
    0,
    '��纣��'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    2,
    0,
    '����'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    2,
    0,
    '�ڵ�'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    2,
    0,
    '������'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    2,
    0,
    '��'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    2,
    0,
    '����'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    2,
    0,
    '�ٳ���'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    2,
    0,
    '���ξ���'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    2,
    0,
    '������'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    2,
    0,
    '�ڸ�'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    2,
    0,
    '����'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    2,
    0,
    '����'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    2,
    0,
    '�������'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    2,
    0,
    'ü��'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    2,
    0,
    '����'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    2,
    0,
    '�ƺ�ī��'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    2,
    0,
    '�ǰ���'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    2,
    0,
    '��Ÿ ����'
);

-- ä��
INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    3,
    0,
    '�κ�'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    3,
    0,
    '�ᳪ��'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    3,
    0,
    '���ֳ���'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    3,
    0,
    '����'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    3,
    0,
    '����'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    3,
    0,
    '����'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    3,
    0,
    '����'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    3,
    0,
    '��'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    3,
    0,
    '����'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    3,
    0,
    '����'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    3,
    0,
    '����'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    3,
    0,
    'ȣ��'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    3,
    0,
    '������'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    3,
    0,
    '����'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    3,
    0,
    '����'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    3,
    0,
    '��ä��'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    3,
    0,
    '����'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    3,
    0,
    '�Ǹ�'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    3,
    0,
    '������ī'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    3,
    0,
    '�ñ�ġ'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    3,
    0,
    '����'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    3,
    0,
    '����'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    3,
    0,
    '�����'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    3,
    0,
    '�����'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    3,
    0,
    '����ݸ�'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    3,
    0,
    '������'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    3,
    0,
    '���ä��'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    3,
    0,
    '���'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    3,
    0,
    '���'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    3,
    0,
    '����'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    3,
    0,
    '��'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    3,
    0,
    '����'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    3,
    0,
    '���� ��ġ'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    3,
    0,
    '�� ��ġ'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    3,
    0,
    '�� ��ġ'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    3,
    0,
    '��Ÿ ��ġ��'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    3,
    0,
    '����'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    3,
    0,
    '��'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    3,
    0,
    '�ƽ��Ķ�Ž�'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    3,
    0,
    '����'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    3,
    0,
    '�λ�'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    3,
    0,
    '����'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    3,
    0,
    '�༱���'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    3,
    0,
    '��Ÿ ä��'
);

-- ���깰
INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    4,
    0,
    '����'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    4,
    0,
    '��ġ'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    4,
    0,
    '��Ÿ ������'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    4,
    0,
    '��¡��'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    4,
    0,
    '����'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    4,
    0,
    '�޲ٹ�'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    4,
    0,
    '����'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    4,
    0,
    '����'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    4,
    0,
    '��'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    4,
    0,
    '������'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    4,
    0,
    '����'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    4,
    0,
    '��'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    4,
    0,
    '�۰�'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    4,
    0,
    '��Ÿ ������'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    4,
    0,
    'ȸ'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    4,
    0,
    '���'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    4,
    0,
    '��ġ��'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    4,
    0,
    '���� ���'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    4,
    0,
    '��'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    4,
    0,
    '�̿�'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    4,
    0,
    '��Ÿ ������'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    4,
    0,
    '��ġ'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    4,
    0,
    'Ȳ��'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    4,
    0,
    '�밡��'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    4,
    0,
    '�Ǿ'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    4,
    0,
    '��Ÿ �ػ깰'
);

-- ��/��/����
INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    5,
    0,
    '���'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    5,
    0,
    '�Ľ�Ÿ��'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    5,
    0,
    '����'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    5,
    0,
    '�Ǹ�'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    5,
    0,
    '��Ÿ ���'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    5,
    0,
    '��'
);
INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    5,
    0,
    '��'
);

-- ����ǰ
INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    6,
    0,
    '����'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    6,
    0,
    '���Ʈ'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    6,
    0,
    '�䱸��Ʈ'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    6,
    0,
    '����'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    6,
    0,
    'ġ��'
);

-- ���
INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    7,
    0,
    '���'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    7,
    0,
    '����'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    7,
    0,
    '����'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    7,
    0,
    '���'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    7,
    0,
    '��'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    7,
    0,
    '��'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    7,
    0,
    '����'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    7,
    0,
    '�͸�'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    7,
    0,
    '�߰���'
);

INSERT INTO WTE_Subgroup VALUES(
    WTE_Subgroup_seq.nextval,
    8,
    0,
    '�ݰ���'
);

SELECT * FROM WTE_Subgroup;

----------------------------------------------------------------------------------------------------
-- ������ �з�
-- ������ ������
DROP TABLE WTE_Recipe_National;
CREATE TABLE WTE_Recipe_National(
    national_no NUMBER PRIMARY KEY,
    national_name VARCHAR2(40)
);

DROP SEQUENCE WTE_Recipe_National_seq;
CREATE SEQUENCE WTE_Recipe_National_seq;

-- ������ ������
DROP TABLE WTE_Recipe_Kind;
CREATE TABLE WTE_Recipe_Kind(
    kind_no NUMBER PRIMARY KEY,
    kind_name VARCHAR2(40)
);

DROP SEQUENCE WTE_Recipe_Kind_seq;
CREATE SEQUENCE WTE_Recipe_Kind_seq;
-----------------------------------------------------------------------------------------------------------
-- ������ ������
INSERT INTO WTE_Recipe_National VALUES(
    WTE_Recipe_National_seq.nextval,
    '�ѽ�'
);

INSERT INTO WTE_Recipe_National VALUES(
    WTE_Recipe_National_seq.nextval,
    '���'
);

INSERT INTO WTE_Recipe_National VALUES(
    WTE_Recipe_National_seq.nextval,
    '�Ͻ�'
);

INSERT INTO WTE_Recipe_National VALUES(
    WTE_Recipe_National_seq.nextval,
    '�߽�'
);

INSERT INTO WTE_Recipe_National VALUES(
    WTE_Recipe_National_seq.nextval,
    '�ε���'
);

INSERT INTO WTE_Recipe_National VALUES(
    WTE_Recipe_National_seq.nextval,
    '��Ÿ'
);

SELECT * FROM WTE_Recipe_National;

-- ������ ������
INSERT INTO WTE_Recipe_Kind VALUES(
    WTE_Recipe_Kind_seq.nextval,
    '�ع���'
);

INSERT INTO WTE_Recipe_Kind VALUES(
    WTE_Recipe_Kind_seq.nextval,
    '���ι���'
);

INSERT INTO WTE_Recipe_Kind VALUES(
    WTE_Recipe_Kind_seq.nextval,
    '��/��/�'
);

INSERT INTO WTE_Recipe_Kind VALUES(
    WTE_Recipe_Kind_seq.nextval,
    '����Ʈ'
);

INSERT INTO WTE_Recipe_Kind VALUES(
    WTE_Recipe_Kind_seq.nextval,
    '��/����'
);

INSERT INTO WTE_Recipe_Kind VALUES(
    WTE_Recipe_Kind_seq.nextval,
    '��/��/��'
);

INSERT INTO WTE_Recipe_Kind VALUES(
    WTE_Recipe_Kind_seq.nextval,
    'ǻ��'
);

INSERT INTO WTE_Recipe_Kind VALUES(
    WTE_Recipe_Kind_seq.nextval,
    '��ġ/����/���'
);

INSERT INTO WTE_Recipe_Kind VALUES(
    WTE_Recipe_Kind_seq.nextval,
    '���/�ҽ�/��'
);

INSERT INTO WTE_Recipe_Kind VALUES(
    WTE_Recipe_Kind_seq.nextval,
    '��Ÿ'
);

SELECT * FROM WTE_Recipe_Kind;

-- ���� �Խ��� ī�װ�
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
    '���'
);
INSERT INTO WTE_FB_Category VALUES(
    WTE_FB_Category_seq.nextval,
    '����'
);

INSERT INTO WTE_FB_Category VALUES(
    WTE_FB_Category_seq.nextval,
    '��Ÿ'
);

commit;