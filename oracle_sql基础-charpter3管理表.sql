--charpter3

--1.数据类型
  --字符型
  --数值型
  --日期型
  --其他类型

	--（1）字符型
		--都是定长的类型
		char(n)--n最大2000
		nchar(n)--采用Unicode存储，n最大1000，可以存储汉字
		--可变长度的类型
		varchar2(n)--n最大4000
		nvarchar2(n)--采用Unicode，n最大2000

	--（2）数值型
		number(p,s)--其中p表示有效数字，s表示小数点后的位数。
			   --s为正数表示从小数点往后的小数位数，s为负数表示从最大有效数字到小数点的位数
		--如：number(5,2)表示有效数字5位，保留2位小数，如123.45
		float(n)--主要用来存储二进制数据，1～126位的二进制数据。需乘以0.30103转化为十进制

	--（3）日期型
		date--可以精确到秒。可表示范围为公元前4712年1月1日到公元9999年12月31日
		timestamp--可以精确到小数秒

	--（4）其他类型
		--主要用于存储大数据文件
		BLOB--4G的数据，采用二进制
		CLOB--4G的数据，采用字符串存储

--2.管理表
	--（1）创建表
		--语法：
		create table table_name(
		column_name datatype,
		……
		);
		--示例：创建用户信息表
		create table userinfo(
		id number(6,0),
		username varchar2(20),
		userpwd VARCHAR2(20),
		email VARCHAR2(30),
		regdate DATE
		};
	--(2)查看表
		desc tablename
		--示例：
		desc userinfo
	--(3)修改表
		--1）添加字段，这个字段不能有非空约束，要不然已有的数据咋办，
		--语法：
		alter table table_name add column_name datatype;
		--示例
		alter table userinfo add remarks varchar2(500);

		--2）更改字段的数据类型。该操作，最好表里面没有值时操作
		--语法：
		alter table table_name modify column_name datatype;
		--示例：
		alter table userinfo modify remarks varchar2(400);
		alter table userinfo modify userpwd number(6,0);

		--3）删除字段
		--语法
		alter table table_name drop column column_name;
		--示例
		alter table userinfo drop column remarks;

		--4）修改字段名
		--语法
		alter table table_name rename column old_column_name to new_column_name;
		--示例
		alter table userinfo rename column email to new_email;

	--5)修改表名
		--语法
		rename old_table_name to new_table_name;
		--示例
		rename userinfo to new_userinfo;

--3.删除表
	--（1）删除表中的数据，不删除表
		truncate table table_name ;--截断表
	  	delete from table_name;--也是删除表里的数据，但是比truncate慢
		--示例
		truncate table new_userinfo;
	--（2）删除表结构，当然数据也就没了
		drop table table_name;
		--示例
		drop table new_userinfo;
