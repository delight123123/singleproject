/*
--1. D����̺� delight ���� ����(���̺����̽� ����)
--2. ����Ŭ �����ڰ��� ���� (cmd -> sqlplus / as sysdba) 
--1. ���̺����̽� ����
 create tablespace tbs_singleproject
 datafile 'F:\ikjoo\tb_singleproject.dbf' size 10M
 autoextend on next 5M;
 
--2. ��� ���� , ����
 create user singleproject
 identified by singleproject123
 default tablespace tbs_singleproject;

--���Ѻο�
grant connect, resource to singleproject;

--������
alter user singleproject account unlock;*/

-- ����
ALTER TABLE tbl_user
	DROP CONSTRAINT PK_tbl_user; -- ���� �⺻Ű

-- �ڷ��� �亯 �Խ���
ALTER TABLE tbl_reboard
	DROP CONSTRAINT PK_tbl_reboard; -- �ڷ��� �亯 �Խ��� �⺻Ű

-- ����
DROP TABLE tbl_user;

-- �ڷ��� �亯 �Խ���
DROP TABLE tbl_reboard;

-- ����
CREATE TABLE tbl_user (
	userid    VARCHAR2(50)       NOT NULL, -- ���̵�
	userpw    VARCHAR2(500byte)  NOT NULL, -- ��й�ȣ
	email1    VARCHAR2(900)      NULL,     -- �̸���1
	email2    VARCHAR2(900)      NULL,     -- �̸���2
	salt      VARCHAR2(100 char) NOT NULL, -- ��ȣȭ
	writeauth VARCHAR2(3)       DEFAULT 'N', -- �������
	readauth  VARCHAR2(3)        DEFAULT 'Y', -- �б����
	adminauth VARCHAR2(3)       DEFAULT 'N', -- �����ڱ���
	path      VARCHAR2(2000)   NULL      -- ���� ����
);

-- ����
ALTER TABLE tbl_user
	ADD
		CONSTRAINT PK_tbl_user -- ���� �⺻Ű
		PRIMARY KEY (
			no -- ��ȣ
		);

-- �ڷ��� �亯 �Խ���
CREATE TABLE tbl_reboard (
	reboard_no       NUMBER        NOT NULL, -- �۹�ȣ
	reboard_title    VARCHAR2(300) NULL,     -- ������
	reboard_content  CLOB          NULL,     -- �۳���
	reboard_reg      DATE    DEFAULT sysdate, -- �ۼ���
	readcount        NUMBER    DEFAULT 0, -- ��ȸ��
	groupno          NUMBER     DEFAULT 0, -- �׷��ȣ
	step             NUMBER      DEFAULT 0, -- ���� �ܰ�
	sortno           NUMBER        DEFAULT 0, -- ���� ���ļ���
	delflag          char              DEFAULT 'N', -- ����
    ckimgup          CLOB          NULL, --�������̹������ϸ�
	filename         VARCHAR2(150) NULL,     -- ���ε����ϸ�
	filesize         NUMBER       DEFAULT 0, -- ���ϻ�����
	downcount        NUMBER       DEFAULT 0, -- �ٿ��
	originalfilename VARCHAR2(150) NULL,     -- �̸������� ���ε����ϸ�
	userid    VARCHAR2(50)        NULL      -- ���̵�
);

-- �ڷ��� �亯 �Խ���
ALTER TABLE tbl_reboard
	ADD
		CONSTRAINT PK_tbl_reboard -- �ڷ��� �亯 �Խ��� �⺻Ű
		PRIMARY KEY (
			reboard_no -- �۹�ȣ
		);

--����
drop sequence user_seq;
create sequence user_seq
start with 1
increment by 1
nocache;
		

--�Խ���
drop sequence reboard_seq;
create sequence reboard_seq
start with 1
increment by 1
nocache;




/*
exec delete_reboard(13,13,0);
exec delete_reboard(1,1,1);
*/


create or replace procedure delete_reboard --���ν��� �̸� 
(
--�Ű�����
    p_no  number,
    p_groupno number,
    p_step    number
)
is
--���������
    cnt number;
begin
--ó���� ����
    --�亯�ִ� �������� ��� delflag�� Y�� update, �������� delete
    if p_step=0 then --������
        --�亯�� �ִ��� üũ
        select count(*) into cnt
        from tbl_reboard
        where groupno=p_groupno;
        
        if cnt>1 then  --�亯�� �ִ� ���
            update tbl_reboard
            set delflag='Y'
            where reboard_no=p_no;
        else    --�亯�� ���� ���
            delete from tbl_reboard
            where reboard_no=p_no;
        end if;
        
    else --
        delete from tbl_reboard
        where reboard_no=p_no;
    end if;
    
    commit;

EXCEPTION
    WHEN OTHERS THEN
	raise_application_error(-20001, '�� ���� ����!');
        ROLLBACK;
end;