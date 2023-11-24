drop database frigg;
create database frigg;
use frigg;
create table Type(
id int primary key auto_increment,
name varchar(100)
);
create table Data(
id int primary key auto_increment,
digest char(100),
size int,
compression int,
content varchar(500),
type_id int,
FOREIGN KEY(type_id) REFERENCES type(id)
);
create table Tag(
id int primary key auto_increment,
name varchar(100)
);
CREATE TABLE Data_Tag (
    Tag_id INT,
    Data_id INT,
    FOREIGN KEY (Tag_id) REFERENCES Tag(id),
    FOREIGN KEY (Data_id) REFERENCES Data(id)
);
CREATE TABLE Meta (
    id INT PRIMARY KEY AUTO_INCREMENT,
    path VARCHAR(50),
    permission INT,
    time INT,
    usergroup_gid INT,
    Data_id INT,
    systemuser_uid INT,
    FOREIGN KEY (usergroup_gid) REFERENCES usergroup(gid),
    FOREIGN KEY (Data_id) REFERENCES Data(id),
    FOREIGN KEY (systemuser_uid) REFERENCES systemuser(uid)
);

create table systemuser(
uid int primary key auto_increment,
name varchar(20)
);
create table usergroup(
gid int primary key auto_increment,
groupname varchar(50)
);


