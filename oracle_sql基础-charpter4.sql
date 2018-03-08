--charpter4

--操作表中的数据
	--向表中插入数据-----insert语句
	--语法：
	insert into table_name(column1,column2,……） values(value1,value2,……）
	--实例：向用户信息表中添加信息
  --（1）向表中所有字段添加值
	insert into userinfo values(1,'xxx','123','xxx@126.com',sysdate);
	--注意，向字符串中插入值要用单引号引起来
	--（2）向表中指定字段添加值
	insert into userinfo(id, username,userpwd) values(2,'yyy','123');

	--修改表中的字段为其设置默认值
	alter table userinfo modify email default '无';
  --这样之后再插入数据就，填数据了就用填的数据，没填的话就用默认的‘无’


--复制表数据
  --建表时复制
--语法：
create table new_table as select  column1,……|*  from old_table;
-- 实例：
--举例1：SCOTT
create table userinfo_new
as
select * from userinfo;
--举例2：(抽取部分数据到一张新表里）
create table userinfo_new1
as 
select id,email from userinfo;

  --在添加时复制
--语法：
insert into new_table[(column1,……)] select column1,……|* from old_table;
--前提：new_table已经存在。
--注意事项：数据类型要匹配
--实例：
--举例1：
insert into userinfo_new
select * from userinfo;
--举例2：
insert into userinfo_new(id,email)
select id,email from userinfo;


--修改数据
--语法：
update table_name set column1=value1,……[where condishions]
--实例
--举例1：不加where 条件会更新整张表
update userinfo set  userpwd='1111';
--同时更新两个字段
update userinfo set userpwd='111',email='111@126.com';
--举例2：带where条件
update userinfo set userpwd='123456' where username='xxx';


--删除数据
--语法：
delete from table_name [where conditions]
--实例
--举例1：不加where条件其实是删除表里的全部数据
delete from userinfo  <===> truncate userinfo
--举例2：加where条件
delete from userinfo where username='yyy';





