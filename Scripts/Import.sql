use frigg;
 
load data infile 'C:\\ProgramData\\MySQL\\MySQL Server 8.2\\Uploads\\temp.csv'

into table `temp`

fields terminated by ',' enclosed by '"'

lines terminated by '\n'

ignore 1 lines

(`#count`, `digest`, `path`, `size`, `type`, `permission`, `uid`, `user`, `gid`, `groupname`, `time`, `compression`, `data`);
 
select * from temp;

use frigg;
insert into frigg.type(name) 
select distinct type from temp;
 
insert into frigg.usergroup(`gid`, `groupname`)
select distinct gid, `groupname` from temp;
 
insert into frigg.systemuser(`uid`, `user`)
select distinct uid, `user` from temp;
 
insert into frigg.data(`digest`, `content`, `size`, `compression`, `type_id`)
select distinct `digest`, `data`, `size`, `compression`, (select id from frigg.type where type.name = temp.type) from temp;
 
insert into frigg.meta(`path`, `permission`, `time`, `systemuser_uid`, `usergroup_gid`, `data_digest`)
select distinct `path`, `permission`, `time`, `uid`, `gid`, `digest` from temp;
