--charpter2
--1.系统自带的用户    
    --系统用户sys,system,
    --sysman,操作企业管理器的用户
    --scott
--2.登陆系统
    --格式：[username/password][@server][as sysdba|sysoper]
    --如：system/10086 @orcl as sysdba 
    --其中orcl就是自己设置的服务名

    --更改登陆用户
    connect scott/tiger

--3.查看用具登陆（命令，可以不用分号结尾）
    --show user命令
    --dba_users数据字典,使用desc命令可以查看数据字典的结构
    desc dba_users
    --查看当前系统中的用户名
    select username from dba_users;

--4启用和锁定用户
alter user username account  lock|unlock;

--5表空间
--数据库与表空间
	--表空间与数据文件

--表空间分类
	--永久表空间
	--临时表空间
	--undo表空间：被修改之前的数据，可以执行回滚

--6查看用户的表空间
 --dba_tablesapces, user_tablespaces数据字典
desc dba_tablespaces
desc user_tablsespaces
--查询表空间的名称
select  tablespace_name from dba_tablespaces;
select  tablespace_name from user_tablespaces;
--dba_users, user_users数据字典
desc dba_users
desc user_users
--查询某一用户的默认和临时表空间
select default_tablespace,temporary_tablespace from dba_users where  username='SYSTEM';
--如何设置用户的默认和临时表空间
--语法：alter user username default|temporary tablespace tablespace_name
--如将用户system的表空间更改为system
alter user system default tablespace system;


--7.创建表空间
--语法:create [temporary] tablespace tablespace_name tempfile|datafile 'xxx.dbf' size  xxM
--如：
create tablespace test1_tablespace datafile 'test1file.dbf' size 10M;
create temporary tablespace temptest1_tablespace tempfile 'temfile1.dbf' size 10m;
--想查看数据文件在哪怎么办？可以查看数据字典dba_data_files
desc dba_data_files
--查看我们自己创建的表空间的数据文件的路径，filename会返回文件的路径
select filename from dba_data_files where tablespace_name='TEST1_TABLESPACE';
--临时表空间
desc dba_temp_files
--查看我们自己创建的临时表空间的数据文件的路径，filename会返回文件的路径
select filename from dba_temp_files where tablespace_name='TEMPTEST1_TABLESPACE';

--8修改表空间
--修改表空间的状态：设置为联机或者脱机状态,默认是联机(online)状态
--语法：alter tablespace tablespace_name online|offline;
--如：
alter tablespace test1_tablespace offline;
--查看表空间的状态
select status from dba_tablespace where tablespace_name='TEST1_TABLESPACE';

----修改表空间的状态：设置为只读或者可读写状态,默认是联机(可读写)状态
--在设置这个属性的时候，表空间必须是online状态，脱机状态是不行的
--语法：alter tablespace tablespace_name read only|read write
--如：
alter tablespace test1_tablespace read only;
--现在查看一下状态
select status from dba_tablespace where tablespace_name='TEST1_TABLESPACE';
--（默认的联机状态下就是可读写的状态）

--9修改数据文件
--增加数据文件
--语法：alter tablespace tablespace_name add datafile 'xx.dbf' size xxM;
--如：
alter tablespace test1_tablespace add datafile 'test2_file.dbf' size 10m;
--查看一下,有两个文件啦。
select filename from dba_data_files where tablespace_name='TEST!_TABLESPACE';

--删除数据文件(不能删除创建表空间时的文件，否则就要把整个表空间删除）
--语法：alter tablespace tablespace_name drop datafile 'filename.dbf'
--如：
alter tablespace test1_tablespace drop datafile 'test2_file.dbf';
--查看一下
select filename from dba_data_files where tablespace_name='TEST1_TABLESPACE';

--10删除表空间
--语法：drop tablespace tablespace_name [including contents],选项including contents的意思是是否把数据文件一并删除
--如：
drop tablespace test1_tablespace including contents;



---总结：用到的数据字典，可以用desc查看表结构
dba_users
dba_tablespaces
user_users
user_tablespaces
dba_data_files
dba_temp_files

