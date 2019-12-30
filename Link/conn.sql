drop database link site_link1;
create database link site_link1
connect to system identified by "553322"
using '(DESCRIPTION =
(ADDRESS_LIST =
(ADDRESS = (PROTOCOL = TCP)
(HOST = 192.168.43.102)
(PORT = 1521))
)
(CONNECT_DATA =(SID = XE))
)'
;

drop database link site_link2;
create database link site_link2
connect to system identified by "123456"
using '(DESCRIPTION =
(ADDRESS_LIST =
(ADDRESS = (PROTOCOL = TCP)
(HOST = 192.168.43.231)
(PORT = 1521))
)
(CONNECT_DATA =(SID = XE))
)'
;