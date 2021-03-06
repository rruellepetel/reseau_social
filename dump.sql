BEGIN TRANSACTION;
CREATE TABLE "django_migrations" ("id" serial NOT NULL PRIMARY KEY, "app" varchar(255) NOT NULL, "name" varchar(255) NOT NULL, "applied" timestamp NOT NULL);
CREATE TABLE "auth_group" ("id" serial NOT NULL PRIMARY KEY, "name" varchar(80) NOT NULL UNIQUE);
CREATE TABLE "django_content_type" ("id" serial NOT NULL PRIMARY KEY, "app_label" varchar(100) NOT NULL, "model" varchar(100) NOT NULL);
CREATE TABLE "auth_permission" ("id" serial NOT NULL PRIMARY KEY, "content_type_id" integer NOT NULL REFERENCES "django_content_type" ("id"), "codename" varchar(100) NOT NULL, "name" varchar(255) NOT NULL);
CREATE TABLE "auth_user" ("id" serial NOT NULL PRIMARY KEY, "password" varchar(128) NOT NULL, "last_login" timestamp NULL, "is_superuser" bool NOT NULL, "first_name" varchar(30) NOT NULL, "last_name" varchar(30) NOT NULL, "email" varchar(254) NOT NULL, "is_staff" bool NOT NULL, "is_active" bool NOT NULL, "date_joined" timestamp NOT NULL, "username" varchar(150) NOT NULL UNIQUE);
CREATE TABLE "auth_group_permissions" ("id" serial NOT NULL PRIMARY KEY, "group_id" integer NOT NULL REFERENCES "auth_group" ("id"), "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id"));
CREATE TABLE "auth_user_groups" ("id" serial NOT NULL PRIMARY KEY, "user_id" integer NOT NULL REFERENCES "auth_user" ("id"), "group_id" integer NOT NULL REFERENCES "auth_group" ("id"));
CREATE TABLE "auth_user_user_permissions" ("id" serial NOT NULL PRIMARY KEY, "user_id" integer NOT NULL REFERENCES "auth_user" ("id"), "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id"));
CREATE TABLE "django_admin_log" ("id" serial NOT NULL PRIMARY KEY, "object_id" text NULL, "object_repr" varchar(200) NOT NULL, "action_flag" smallint NOT NULL, "change_message" text NOT NULL, "content_type_id" integer NULL REFERENCES "django_content_type" ("id"), "user_id" integer NOT NULL REFERENCES "auth_user" ("id"), "action_time" timestamp NOT NULL);

CREATE TABLE "account_emailaddress" ("id" serial NOT NULL PRIMARY KEY, "verified" bool NOT NULL, "primary" bool NOT NULL, "user_id" integer NOT NULL REFERENCES "auth_user" ("id"), "email" varchar(254) NOT NULL UNIQUE);
CREATE TABLE "account_emailconfirmation" ("id" serial NOT NULL PRIMARY KEY, "created" timestamp NOT NULL, "sent" timestamp NULL, "key" varchar(64) NOT NULL UNIQUE, "email_address_id" integer NOT NULL REFERENCES "account_emailaddress" ("id"));

CREATE TABLE "django_site" ("id" serial NOT NULL PRIMARY KEY, "name" varchar(50) NOT NULL, "domain" varchar(100) NOT NULL UNIQUE);
CREATE TABLE "socialaccount_socialapp" ("id" serial NOT NULL PRIMARY KEY, "provider" varchar(30) NOT NULL, "name" varchar(40) NOT NULL, "client_id" varchar(191) NOT NULL, "key" varchar(191) NOT NULL, "secret" varchar(191) NOT NULL);
CREATE TABLE "socialaccount_socialapp_sites" ("id" serial NOT NULL PRIMARY KEY, "socialapp_id" integer NOT NULL REFERENCES "socialaccount_socialapp" ("id"), "site_id" integer NOT NULL REFERENCES "django_site" ("id"));
CREATE TABLE "socialaccount_socialaccount" ("id" serial NOT NULL PRIMARY KEY, "provider" varchar(30) NOT NULL, "uid" varchar(191) NOT NULL, "last_login" timestamp NOT NULL, "date_joined" timestamp NOT NULL, "user_id" integer NOT NULL REFERENCES "auth_user" ("id"), "extra_data" text NOT NULL);
CREATE TABLE "socialaccount_socialtoken" ("id" serial NOT NULL PRIMARY KEY, "token" text NOT NULL, "token_secret" text NOT NULL, "expires_at" timestamp NULL, "account_id" integer NOT NULL REFERENCES "socialaccount_socialaccount" ("id"), "app_id" integer NOT NULL REFERENCES "socialaccount_socialapp" ("id"));
CREATE TABLE "taggit_tag" ("id" serial NOT NULL PRIMARY KEY, "name" varchar(100) NOT NULL UNIQUE, "slug" varchar(100) NOT NULL UNIQUE);

CREATE TABLE "taggit_taggeditem" ("id" serial NOT NULL PRIMARY KEY, "object_id" integer NOT NULL, "content_type_id" integer NOT NULL REFERENCES "django_content_type" ("id"), "tag_id" integer NOT NULL REFERENCES "taggit_tag" ("id"));

CREATE TABLE "people_profile" ("id" serial NOT NULL PRIMARY KEY, "address" varchar(100) NULL, "city" varchar(75) NULL, "website" varchar(150) NULL, "contact_Email" varchar(150) NULL, "user_id" integer NOT NULL UNIQUE REFERENCES "auth_user" ("id"), "avatar" varchar(100) NULL, "zip_Code" varchar(5) NULL);
CREATE TABLE "people_taginterest" ("id" serial NOT NULL PRIMARY KEY, "content_object_id" integer NOT NULL REFERENCES "people_profile" ("id"), "tag_id" integer NOT NULL REFERENCES "taggit_tag" ("id"));


INSERT INTO "django_migrations" VALUES(1,'contenttypes','0001_initial','2017-05-29 07:20:28.176229');
INSERT INTO "django_migrations" VALUES(2,'auth','0001_initial','2017-05-29 07:20:28.280371');
INSERT INTO "django_migrations" VALUES(3,'admin','0001_initial','2017-05-29 07:20:28.312526');
INSERT INTO "django_migrations" VALUES(4,'admin','0002_logentry_remove_auto_add','2017-05-29 07:20:28.389311');
INSERT INTO "django_migrations" VALUES(5,'contenttypes','0002_remove_content_type_name','2017-05-29 07:20:28.433655');
INSERT INTO "django_migrations" VALUES(6,'auth','0002_alter_permission_name_max_length','2017-05-29 07:20:28.461079');
INSERT INTO "django_migrations" VALUES(7,'auth','0003_alter_user_email_max_length','2017-05-29 07:20:28.493765');
INSERT INTO "django_migrations" VALUES(8,'auth','0004_alter_user_username_opts','2017-05-29 07:20:28.511055');
INSERT INTO "django_migrations" VALUES(9,'auth','0005_alter_user_last_login_null','2017-05-29 07:20:28.538309');
INSERT INTO "django_migrations" VALUES(10,'auth','0006_require_contenttypes_0002','2017-05-29 07:20:28.545524');
INSERT INTO "django_migrations" VALUES(11,'auth','0007_alter_validators_add_error_messages','2017-05-29 07:20:28.590580');
INSERT INTO "django_migrations" VALUES(12,'auth','0008_alter_user_username_max_length','2017-05-29 07:20:28.608715');
INSERT INTO "django_migrations" VALUES(13,'sessions','0001_initial','2017-05-29 07:20:28.623547');
INSERT INTO "django_migrations" VALUES(14,'people','0001_initial','2017-05-29 12:10:47.115695');
INSERT INTO "django_migrations" VALUES(15,'people','0002_auto_20170529_1457','2017-05-29 12:57:08.197246');
INSERT INTO "django_migrations" VALUES(16,'account','0001_initial','2017-05-29 13:06:41.266645');
INSERT INTO "django_migrations" VALUES(17,'account','0002_email_max_length','2017-05-29 13:06:41.294480');
INSERT INTO "django_migrations" VALUES(18,'sites','0001_initial','2017-05-29 13:06:41.306041');
INSERT INTO "django_migrations" VALUES(19,'sites','0002_alter_domain_unique','2017-05-29 13:06:41.322190');
INSERT INTO "django_migrations" VALUES(20,'socialaccount','0001_initial','2017-05-29 13:06:41.436692');
INSERT INTO "django_migrations" VALUES(21,'socialaccount','0002_token_max_lengths','2017-05-29 13:06:41.498897');
INSERT INTO "django_migrations" VALUES(22,'socialaccount','0003_extra_data_default_dict','2017-05-29 13:06:41.527450');
INSERT INTO "django_migrations" VALUES(23,'people','0003_profile_slug','2017-06-01 11:45:49.951947');
INSERT INTO "django_migrations" VALUES(24,'people','0004_auto_20170601_1019','2017-06-01 11:45:49.977983');
INSERT INTO "django_migrations" VALUES(25,'people','0005_auto_20170601_1022','2017-06-01 11:45:50.008014');
INSERT INTO "django_migrations" VALUES(26,'people','0006_remove_profile_slug','2017-06-01 11:45:50.063783');
INSERT INTO "django_migrations" VALUES(27,'people','0007_auto_20170601_1108','2017-06-01 11:45:50.206796');
INSERT INTO "django_migrations" VALUES(28,'taggit','0001_initial','2017-06-01 14:01:42.731875');
INSERT INTO "django_migrations" VALUES(29,'taggit','0002_auto_20150616_2121','2017-06-01 14:01:42.753929');
INSERT INTO "django_migrations" VALUES(30,'people','0008_auto_20170601_1605','2017-06-01 14:05:59.424688');
INSERT INTO "django_migrations" VALUES(31,'people','0009_profile_interests','2017-06-01 14:47:15.198719');
INSERT INTO "django_migrations" VALUES(32,'people','0010_auto_20170609_1137','2017-06-09 10:14:40.384229');
INSERT INTO "django_migrations" VALUES(33,'people','0011_auto_20170609_1214','2017-06-09 10:14:40.424506');
INSERT INTO "django_content_type" VALUES(1,'admin','logentry');
INSERT INTO "django_content_type" VALUES(2,'auth','group');
INSERT INTO "django_content_type" VALUES(3,'auth','permission');
INSERT INTO "django_content_type" VALUES(4,'auth','user');
INSERT INTO "django_content_type" VALUES(5,'contenttypes','contenttype');
INSERT INTO "django_content_type" VALUES(6,'sessions','session');
INSERT INTO "django_content_type" VALUES(7,'people','profile');
INSERT INTO "django_content_type" VALUES(8,'sites','site');
INSERT INTO "django_content_type" VALUES(9,'account','emailconfirmation');
INSERT INTO "django_content_type" VALUES(10,'account','emailaddress');
INSERT INTO "django_content_type" VALUES(11,'socialaccount','socialapp');
INSERT INTO "django_content_type" VALUES(12,'socialaccount','socialtoken');
INSERT INTO "django_content_type" VALUES(13,'socialaccount','socialaccount');
INSERT INTO "django_content_type" VALUES(14,'taggit','taggeditem');
INSERT INTO "django_content_type" VALUES(15,'taggit','tag');
INSERT INTO "django_content_type" VALUES(16,'people','taginterest');
INSERT INTO "auth_user" VALUES(1,'pbkdf2_sha256$36000$Okd0YcrBYROL$R5ies6Nlq3G6syYnGCbUlYZv5SwYMrQQc+ui4mC8Pmg=','2017-06-12 11:34:46.748920','1','','','','1','1','2017-05-29 09:15:55.105111','romain');
INSERT INTO "auth_user" VALUES(4,'pbkdf2_sha256$36000$i7HEFXAOjjw7$zdGzjzvdA94AN2amVPykWeGQVN5U1ARLB/rfShpPOOI=','2017-06-09 07:31:29.217105','0','','','toto@plop.fr','0','1','2017-05-29 13:49:32','toto');
INSERT INTO "auth_user" VALUES(6,'pbkdf2_sha256$36000$frL8ksoFoFez$W9Cur/ectfWnBuapkn++/GZWRJ4iJrR9sbTLr1c55eM=',NULL,'0','','','test.lelel@gmail.com','0','1','2017-06-12 11:39:59','user1');
INSERT INTO "auth_user" VALUES(7,'pbkdf2_sha256$36000$5g6xTFB1YSud$6yfGStgaci1qJUNljxY1eQHDXhP2yOX4DyojiolMfck=',NULL,'0','','','','0','1','2017-06-12 11:42:53','user2');
INSERT INTO "auth_user" VALUES(8,'pbkdf2_sha256$36000$5srqRmwVZ7ZL$k44wb8ExHqdEvT5Se+4R8edxgEKAasKSNCXz4f85VCY=',NULL,'0','','','','0','1','2017-06-12 11:44:13','tata');
INSERT INTO "auth_user" VALUES(9,'pbkdf2_sha256$36000$JCAvf8JAK6LY$QssplxO/o/neeQSsLxDKIMLG6FvV7eo5zxTprLlUjVg=',NULL,'0','','','','0','1','2017-06-12 11:46:29','jean-kev');
INSERT INTO "auth_user" VALUES(10,'pbkdf2_sha256$36000$6ZEQRVsGPvQQ$ojQKnn4iaJ+2WvKBXXdEjFYGKpNjh5xOcBR8Bdg4r7w=',NULL,'0','','','','0','1','2017-06-12 11:48:04','user3');
INSERT INTO "django_admin_log" VALUES(1,'4','toto',2,'[{"added": {"object": "Profile object", "name": "profile"}}]',4,1,'2017-06-01 12:17:14.221647');
INSERT INTO "django_admin_log" VALUES(2,'4','toto',2,'[{"changed": {"fields": ["password"]}}]',4,1,'2017-06-01 12:18:37.800159');
INSERT INTO "django_admin_log" VALUES(3,'5','tata',2,'[{"added": {"object": "Profile object", "name": "profile"}}]',4,1,'2017-06-01 13:22:56.340566');
INSERT INTO "django_admin_log" VALUES(4,'4','toto',2,'[{"changed": {"fields": ["address", "zip_Code", "city", "website", "contact_Email", "skills", "interests"], "object": "Profile object", "name": "profile"}}]',4,1,'2017-06-01 13:55:05.769445');
INSERT INTO "django_admin_log" VALUES(5,'6','user1',1,'[{"added": {}}]',4,1,'2017-06-12 11:39:59.959417');
INSERT INTO "django_admin_log" VALUES(6,'6','user1',2,'[{"changed": {"fields": ["address", "zip_Code", "city", "website", "contact_Email", "interests", "skills"], "object": "Profile object", "name": "profile"}}]',4,1,'2017-06-12 11:40:43.847195');
INSERT INTO "django_admin_log" VALUES(7,'3','lelel',3,'',4,1,'2017-06-12 11:41:09.416809');
INSERT INTO "django_admin_log" VALUES(8,'2','plop',3,'',4,1,'2017-06-12 11:41:09.423331');
INSERT INTO "django_admin_log" VALUES(9,'5','tata',3,'',4,1,'2017-06-12 11:41:09.425427');
INSERT INTO "django_admin_log" VALUES(10,'7','user2',1,'[{"added": {}}]',4,1,'2017-06-12 11:42:53.822736');
INSERT INTO "django_admin_log" VALUES(11,'7','user2',2,'[{"changed": {"fields": ["address", "zip_Code", "city", "website", "contact_Email", "interests", "skills"], "object": "Profile object", "name": "profile"}}]',4,1,'2017-06-12 11:43:46.578755');
INSERT INTO "django_admin_log" VALUES(12,'8','tata',1,'[{"added": {}}]',4,1,'2017-06-12 11:44:13.706933');
INSERT INTO "django_admin_log" VALUES(13,'8','tata',2,'[{"changed": {"fields": ["address", "zip_Code", "city", "website", "contact_Email", "interests", "skills"], "object": "Profile object", "name": "profile"}}]',4,1,'2017-06-12 11:45:31.524699');
INSERT INTO "django_admin_log" VALUES(14,'9','jean-kev',1,'[{"added": {}}]',4,1,'2017-06-12 11:46:29.124300');
INSERT INTO "django_admin_log" VALUES(15,'9','jean-kev',2,'[{"changed": {"fields": ["address", "zip_Code", "city", "website", "contact_Email", "interests", "skills"], "object": "Profile object", "name": "profile"}}]',4,1,'2017-06-12 11:47:31.918191');
INSERT INTO "django_admin_log" VALUES(16,'10','user3',1,'[{"added": {}}]',4,1,'2017-06-12 11:48:04.467948');
INSERT INTO "django_admin_log" VALUES(17,'10','user3',2,'[{"changed": {"fields": ["address", "zip_Code", "city", "website", "contact_Email", "interests", "skills"], "object": "Profile object", "name": "profile"}}]',4,1,'2017-06-12 11:48:56.097961');
INSERT INTO "django_admin_log" VALUES(18,'6','user1',2,'[{"changed": {"fields": ["email"]}}, {"changed": {"fields": ["interests", "skills"], "object": "Profile object", "name": "profile"}}]',4,1,'2017-06-12 11:52:47.655101');

INSERT INTO "auth_permission" VALUES(1,1,'add_logentry','Can add log entry');
INSERT INTO "auth_permission" VALUES(2,1,'change_logentry','Can change log entry');
INSERT INTO "auth_permission" VALUES(3,1,'delete_logentry','Can delete log entry');
INSERT INTO "auth_permission" VALUES(4,2,'add_group','Can add group');
INSERT INTO "auth_permission" VALUES(5,2,'change_group','Can change group');
INSERT INTO "auth_permission" VALUES(6,2,'delete_group','Can delete group');
INSERT INTO "auth_permission" VALUES(7,3,'add_permission','Can add permission');
INSERT INTO "auth_permission" VALUES(8,3,'change_permission','Can change permission');
INSERT INTO "auth_permission" VALUES(9,3,'delete_permission','Can delete permission');
INSERT INTO "auth_permission" VALUES(10,4,'add_user','Can add user');
INSERT INTO "auth_permission" VALUES(11,4,'change_user','Can change user');
INSERT INTO "auth_permission" VALUES(12,4,'delete_user','Can delete user');
INSERT INTO "auth_permission" VALUES(13,5,'add_contenttype','Can add content type');
INSERT INTO "auth_permission" VALUES(14,5,'change_contenttype','Can change content type');
INSERT INTO "auth_permission" VALUES(15,5,'delete_contenttype','Can delete content type');
INSERT INTO "auth_permission" VALUES(16,6,'add_session','Can add session');
INSERT INTO "auth_permission" VALUES(17,6,'change_session','Can change session');
INSERT INTO "auth_permission" VALUES(18,6,'delete_session','Can delete session');
INSERT INTO "auth_permission" VALUES(19,7,'add_profile','Can add profile');
INSERT INTO "auth_permission" VALUES(20,7,'change_profile','Can change profile');
INSERT INTO "auth_permission" VALUES(21,7,'delete_profile','Can delete profile');
INSERT INTO "auth_permission" VALUES(22,8,'add_site','Can add site');
INSERT INTO "auth_permission" VALUES(23,8,'change_site','Can change site');
INSERT INTO "auth_permission" VALUES(24,8,'delete_site','Can delete site');
INSERT INTO "auth_permission" VALUES(25,9,'add_emailconfirmation','Can add email confirmation');
INSERT INTO "auth_permission" VALUES(26,9,'change_emailconfirmation','Can change email confirmation');
INSERT INTO "auth_permission" VALUES(27,9,'delete_emailconfirmation','Can delete email confirmation');
INSERT INTO "auth_permission" VALUES(28,10,'add_emailaddress','Can add email address');
INSERT INTO "auth_permission" VALUES(29,10,'change_emailaddress','Can change email address');
INSERT INTO "auth_permission" VALUES(30,10,'delete_emailaddress','Can delete email address');
INSERT INTO "auth_permission" VALUES(31,11,'add_socialapp','Can add social application');
INSERT INTO "auth_permission" VALUES(32,11,'change_socialapp','Can change social application');
INSERT INTO "auth_permission" VALUES(33,11,'delete_socialapp','Can delete social application');
INSERT INTO "auth_permission" VALUES(34,12,'add_socialtoken','Can add social application token');
INSERT INTO "auth_permission" VALUES(35,12,'change_socialtoken','Can change social application token');
INSERT INTO "auth_permission" VALUES(36,12,'delete_socialtoken','Can delete social application token');
INSERT INTO "auth_permission" VALUES(37,13,'add_socialaccount','Can add social account');
INSERT INTO "auth_permission" VALUES(38,13,'change_socialaccount','Can change social account');
INSERT INTO "auth_permission" VALUES(39,13,'delete_socialaccount','Can delete social account');
INSERT INTO "auth_permission" VALUES(40,14,'add_taggeditem','Can add Tagged Item');
INSERT INTO "auth_permission" VALUES(41,14,'change_taggeditem','Can change Tagged Item');
INSERT INTO "auth_permission" VALUES(42,14,'delete_taggeditem','Can delete Tagged Item');
INSERT INTO "auth_permission" VALUES(43,15,'add_tag','Can add Tag');
INSERT INTO "auth_permission" VALUES(44,15,'change_tag','Can change Tag');
INSERT INTO "auth_permission" VALUES(45,15,'delete_tag','Can delete Tag');
INSERT INTO "auth_permission" VALUES(46,16,'add_taginterest','Can add taginterest');
INSERT INTO "auth_permission" VALUES(47,16,'change_taginterest','Can change taginterest');
INSERT INTO "auth_permission" VALUES(48,16,'delete_taginterest','Can delete taginterest');

CREATE TABLE "django_session" ("session_key" varchar(40) NOT NULL PRIMARY KEY, "session_data" text NOT NULL, "expire_date" timestamp NOT NULL);
INSERT INTO "django_session" VALUES('xk7anppq297z7kmwr3fxnghcu4aqbexw','NWFkYzkwNDA2MzYzMmNlN2NlOTBjMWJkZjRkYmZhODEzOTRlMjQzOTp7ImFjY291bnRfdXNlciI6IjUiLCJhY2NvdW50X3ZlcmlmaWVkX2VtYWlsIjpudWxsfQ==','2017-06-12 13:52:02.284865');
INSERT INTO "django_session" VALUES('1bjq0pmdbr78kjjizk0f6u5a8t3bbq1e','MzRkZTM5YWE3OWVkZWM0NDgzNjdmNTNlOGQwN2FjY2MxZmIxYmMzZjp7Il9hdXRoX3VzZXJfaGFzaCI6ImNlNjRlY2QxNDQ1OWUyYTM5MWYxNGUyZDE1ZTRhMTIxYjcwODUyYjYiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2017-06-15 12:18:37.815236');
INSERT INTO "django_session" VALUES('dme82is5rtwcd7ujn24dtnf3mzm370q3','YzY1YjY4Y2U1MjdhZjk5ODY3ODE2YWM5MmNmN2E2OGIxOWUyNDBkZDp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiNmRkZTlmODY5MjA3MjRhMGVlZDU5MzBiODE5MWI3NDY0M2IwYTFjNSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjQifQ==','2017-06-15 13:29:34.379713');
INSERT INTO "django_session" VALUES('6plogykpsiyyr4r64kmjlnp00v6kichk','MTU3MDlmNWEyZTA2NDk5YTM0Y2ExNTFmNTcxOWY2NmYxYWQxMTkwYjp7Il9hdXRoX3VzZXJfaGFzaCI6ImNlNjRlY2QxNDQ1OWUyYTM5MWYxNGUyZDE1ZTRhMTIxYjcwODUyYjYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-06-26 11:34:46.754907');

INSERT INTO "account_emailaddress" VALUES(3,'0','1',4,'toto@plop.fr');

INSERT INTO "people_profile" VALUES(1,'rue de nowhere','Mende','Test.fr','plop@plop.fr',4,'tic8_Q85OQDA.png','48000');
INSERT INTO "people_profile" VALUES(3,'esdfzefezf','mende','zazdefere','plop@gmail.com',6,'','48000');
INSERT INTO "people_profile" VALUES(4,'32 rue de nulle part','azerty','plop','plop@lelel.fr',7,'','48000');
INSERT INTO "people_profile" VALUES(5,'je sais pas où','inconnu','pasmal','tata.lelel@gmail.com',8,'','00000');
INSERT INTO "people_profile" VALUES(6,'nulle part ailleurs','cité de la peur','nuls','nuls.nuls@nuls.fr',9,'','92000');
INSERT INTO "people_profile" VALUES(7,'esdfzefezf','waynes world','yolo','yolo.lelel@gmail.com',10,'','78945');
INSERT INTO "django_site" VALUES(1,'example.com','example.com');
INSERT INTO "taggit_tag" VALUES(1,'edff','edff');
INSERT INTO "taggit_tag" VALUES(2,'caca','caca');
INSERT INTO "taggit_tag" VALUES(3,'hello','hello');
INSERT INTO "taggit_tag" VALUES(4,'plop','plop');
INSERT INTO "taggit_tag" VALUES(5,'coucou','coucou');
INSERT INTO "taggit_tag" VALUES(6,'la','la');
INSERT INTO "taggit_tag" VALUES(7,'c''est','cest');
INSERT INTO "taggit_tag" VALUES(8,'hass','hass');
INSERT INTO "taggit_tag" VALUES(9,'frere','frere');
INSERT INTO "taggit_tag" VALUES(10,'lel','lel');
INSERT INTO "taggit_tag" VALUES(11,'prout','prout');
INSERT INTO "taggit_tag" VALUES(12,'lelel','lelel');
INSERT INTO "taggit_tag" VALUES(13,'fred','fred');
INSERT INTO "taggit_tag" VALUES(14,'ffff','ffff');
INSERT INTO "taggit_tag" VALUES(15,'fhghgr','fhghgr');
INSERT INTO "taggit_tag" VALUES(16,'yjytiuku','yjytiuku');
INSERT INTO "taggit_tag" VALUES(17,'tytrtr','tytrtr');
INSERT INTO "taggit_tag" VALUES(18,'fqerger','fqerger');
INSERT INTO "taggit_tag" VALUES(19,'regrgreg','regrgreg');
INSERT INTO "taggit_tag" VALUES(20,'none','none');
INSERT INTO "taggit_tag" VALUES(21,'none2','none2');
INSERT INTO "taggit_tag" VALUES(22,'most','most');
INSERT INTO "taggit_tag" VALUES(23,'wanted','wanted');
INSERT INTO "taggit_tag" VALUES(24,'unlimited','unlimited');
INSERT INTO "taggit_tag" VALUES(25,'the','the');
INSERT INTO "taggit_tag" VALUES(26,'sky','sky');
INSERT INTO "taggit_tag" VALUES(27,'above','above');
INSERT INTO "taggit_tag" VALUES(28,'amazing','amazing');
INSERT INTO "taggit_tag" VALUES(29,'maybe','maybe');
INSERT INTO "taggit_taggeditem" VALUES(18,1,7,17);
INSERT INTO "taggit_taggeditem" VALUES(19,3,7,19);
INSERT INTO "taggit_taggeditem" VALUES(20,4,7,21);
INSERT INTO "taggit_taggeditem" VALUES(21,5,7,23);
INSERT INTO "taggit_taggeditem" VALUES(22,6,7,25);
INSERT INTO "taggit_taggeditem" VALUES(23,6,7,26);
INSERT INTO "taggit_taggeditem" VALUES(24,6,7,27);
INSERT INTO "taggit_taggeditem" VALUES(25,7,7,29);
INSERT INTO "people_taginterest" VALUES(2,1,16);
INSERT INTO "people_taginterest" VALUES(3,3,18);
INSERT INTO "people_taginterest" VALUES(4,4,20);
INSERT INTO "people_taginterest" VALUES(5,5,22);
INSERT INTO "people_taginterest" VALUES(6,6,24);
INSERT INTO "people_taginterest" VALUES(7,7,28);


CREATE UNIQUE INDEX "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ON "auth_group_permissions" ("group_id", "permission_id");
CREATE INDEX "auth_group_permissions_group_id_b120cbf9" ON "auth_group_permissions" ("group_id");
CREATE INDEX "auth_group_permissions_permission_id_84c5c92e" ON "auth_group_permissions" ("permission_id");
CREATE UNIQUE INDEX "auth_user_groups_user_id_group_id_94350c0c_uniq" ON "auth_user_groups" ("user_id", "group_id");
CREATE INDEX "auth_user_groups_user_id_6a12ed8b" ON "auth_user_groups" ("user_id");
CREATE INDEX "auth_user_groups_group_id_97559544" ON "auth_user_groups" ("group_id");
CREATE UNIQUE INDEX "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" ON "auth_user_user_permissions" ("user_id", "permission_id");
CREATE INDEX "auth_user_user_permissions_user_id_a95ead1b" ON "auth_user_user_permissions" ("user_id");
CREATE INDEX "auth_user_user_permissions_permission_id_1fbb5f2c" ON "auth_user_user_permissions" ("permission_id");
CREATE INDEX "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log" ("content_type_id");
CREATE INDEX "django_admin_log_user_id_c564eba6" ON "django_admin_log" ("user_id");
CREATE UNIQUE INDEX "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" ("app_label", "model");
CREATE UNIQUE INDEX "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission" ("content_type_id", "codename");
CREATE INDEX "auth_permission_content_type_id_2f476e4b" ON "auth_permission" ("content_type_id");
CREATE INDEX "django_session_expire_date_a5c62663" ON "django_session" ("expire_date");
CREATE INDEX "account_emailconfirmation_email_address_id_5b7f8c58" ON "account_emailconfirmation" ("email_address_id");
CREATE INDEX "account_emailaddress_user_id_2c513194" ON "account_emailaddress" ("user_id");
CREATE UNIQUE INDEX "socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq" ON "socialaccount_socialtoken" ("app_id", "account_id");
CREATE UNIQUE INDEX "socialaccount_socialapp_sites_socialapp_id_site_id_71a9a768_uniq" ON "socialaccount_socialapp_sites" ("socialapp_id", "site_id");
CREATE INDEX "socialaccount_socialapp_sites_socialapp_id_97fb6e7d" ON "socialaccount_socialapp_sites" ("socialapp_id");
CREATE INDEX "socialaccount_socialapp_sites_site_id_2579dee5" ON "socialaccount_socialapp_sites" ("site_id");
CREATE INDEX "socialaccount_socialtoken_account_id_951f210e" ON "socialaccount_socialtoken" ("account_id");
CREATE INDEX "socialaccount_socialtoken_app_id_636a42d7" ON "socialaccount_socialtoken" ("app_id");
CREATE UNIQUE INDEX "socialaccount_socialaccount_provider_uid_fc810c6e_uniq" ON "socialaccount_socialaccount" ("provider", "uid");
CREATE INDEX "socialaccount_socialaccount_user_id_8146e70c" ON "socialaccount_socialaccount" ("user_id");
CREATE INDEX "taggit_taggeditem_object_id_e2d7d1df" ON "taggit_taggeditem" ("object_id");
CREATE INDEX "taggit_taggeditem_content_type_id_9957a03c" ON "taggit_taggeditem" ("content_type_id");
CREATE INDEX "taggit_taggeditem_tag_id_f4f5b767" ON "taggit_taggeditem" ("tag_id");
CREATE INDEX "taggit_taggeditem_content_type_id_object_id_196cc965_idx" ON "taggit_taggeditem" ("content_type_id", "object_id");
CREATE INDEX "people_taginterest_content_object_id_1f8adf1f" ON "people_taginterest" ("content_object_id");
CREATE INDEX "people_taginterest_tag_id_3c290ded" ON "people_taginterest" ("tag_id");
COMMIT;
