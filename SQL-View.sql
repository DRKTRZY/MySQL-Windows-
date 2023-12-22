use frigg;
select
data.digest,
data.content,
data.size as datasize,
data.compression as datacompression,
type.name as typename,
tag.name as tagname,
usergroup.`groupname` as usergroupname,
systemuser.user as systemusername,
meta.path as metapath,
meta.permission as metaperm,
meta.time as metatime
from data
left join type on data.type_id = type.id
left join data_tag on data.digest = data_tag.data_digest
left join tag on data_tag.tag_id = tag.id
left join meta on data.digest = meta.data_digest
left join usergroup on meta.usergroup_gid = usergroup.gid
left join systemuser on meta.systemuser_uid = systemuser.uid;
