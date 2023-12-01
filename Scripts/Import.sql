Use frigg;

Insert into frigg.type(name)
select distinct type from temp;

Insert into frigg.systemuser(uid, name)
select distinct uid, user from temp;

Insert into frigg.usergroup(gid, groupname)
select distinct gid, "group" from temp;

Insert into frigg.data(digest, size, compression, content, type_id)
select distinct digest, size, compression, "data", (select ID from frigg.type where type.name = temp.type) from temp;

Insert into frigg.meta(path, time, usergroup_gid, Data_id, systemuser_uid)
select distinct path, time, gid,(Select ID from frigg.data where "frigg.data(content)" = "temp.data"), uid from temp;

Drop table frigg.temp;
