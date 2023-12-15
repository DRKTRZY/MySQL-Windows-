drop database if exists frigg;
create database frigg;

use frigg;

create table temp (
    `#count` int not null unique primary key,
    digest varchar(50) not null,
    path text not null,
    size int not null,
    type nvarchar(50) not null,
    permission int not null,
    uid int not null,
    user varchar(50) not null,
    gid int not null,
    `groupname` varchar(50) not null,
    time int not null,
    compression int not null,
    data text not null
);

create table type (
    id int not null auto_increment primary key,
    name varchar(50) unique
);

create table data (
    digest varchar(50) not null primary key,
    content text not null,
    size int not null,
    compression int not null,
    type_id int,
    foreign key (type_id) references type(id)
);

create table tag (
    id int not null auto_increment primary key,
    name varchar(50) unique
);

create table data_tag (
    data_digest varchar(50) not null,
    tag_id int,
    primary key (data_digest, tag_id),
    foreign key (data_digest) references data(digest),
    foreign key (tag_id) references tag(id)
);
create table systemuser (
    uid int not null unique primary key,
    user varchar(50) not null unique
);

create table usergroup (
    gid int not null unique primary key,
    `groupname` varchar(50) not null unique
);

create table meta (
    id int not null auto_increment primary key,
    path varchar(250) not null,
    permission int not null,
    time int not null,
    systemuser_uid int,
    usergroup_gid int,
    data_digest varchar(50) not null,
    foreign key (systemuser_uid) references systemuser(uid),
    foreign key (usergroup_gid) references usergroup(gid),
    foreign key (data_digest) references data(digest)
);
