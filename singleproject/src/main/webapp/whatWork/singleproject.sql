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

-- ����
DROP TABLE tbl_user;

-- ����
CREATE TABLE tbl_user (
	no        NUMBER             NOT NULL, -- ��ȣ
	userid    VARCHAR2(50)       NOT NULL, -- ���̵�
	userpw    VARCHAR2(500byte)  NOT NULL, -- ��й�ȣ
	email1    VARCHAR2(900)      NULL,     -- �̸���1
	email2    VARCHAR2(900)      NULL,     -- �̸���2
	email3    VARCHAR2(900)      NULL,     -- �̸���3
	salt      VARCHAR2(100 char) NOT NULL, -- ��ȣȭ
	path      VARCHAR2(1500)   NULL,     -- ���� ����
	authority VARCHAR2(1)        DEFAULT 'N' NOT NULL  -- ����
);

-- ����
ALTER TABLE tbl_user
	ADD
		CONSTRAINT PK_tbl_user -- ���� �⺻Ű
		PRIMARY KEY (
			no -- ��ȣ
		);

--����
drop sequence user_seq;
create sequence user_seq
start with 1
increment by 1
nocache;
		