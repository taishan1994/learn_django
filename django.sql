/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : django

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2019-12-07 14:10:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can view log entry', '1', 'view_logentry');
INSERT INTO `auth_permission` VALUES ('5', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('8', 'Can view permission', '2', 'view_permission');
INSERT INTO `auth_permission` VALUES ('9', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('11', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('12', 'Can view group', '3', 'view_group');
INSERT INTO `auth_permission` VALUES ('13', 'Can add user', '4', 'add_user');
INSERT INTO `auth_permission` VALUES ('14', 'Can change user', '4', 'change_user');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete user', '4', 'delete_user');
INSERT INTO `auth_permission` VALUES ('16', 'Can view user', '4', 'view_user');
INSERT INTO `auth_permission` VALUES ('17', 'Can add content type', '5', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('18', 'Can change content type', '5', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('19', 'Can delete content type', '5', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('20', 'Can view content type', '5', 'view_contenttype');
INSERT INTO `auth_permission` VALUES ('21', 'Can add session', '6', 'add_session');
INSERT INTO `auth_permission` VALUES ('22', 'Can change session', '6', 'change_session');
INSERT INTO `auth_permission` VALUES ('23', 'Can delete session', '6', 'delete_session');
INSERT INTO `auth_permission` VALUES ('24', 'Can view session', '6', 'view_session');
INSERT INTO `auth_permission` VALUES ('25', 'Can add index', '7', 'add_index');
INSERT INTO `auth_permission` VALUES ('26', 'Can change index', '7', 'change_index');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete index', '7', 'delete_index');
INSERT INTO `auth_permission` VALUES ('28', 'Can view index', '7', 'view_index');
INSERT INTO `auth_permission` VALUES ('29', 'Can add student detail', '8', 'add_studentdetail');
INSERT INTO `auth_permission` VALUES ('30', 'Can change student detail', '8', 'change_studentdetail');
INSERT INTO `auth_permission` VALUES ('31', 'Can delete student detail', '8', 'delete_studentdetail');
INSERT INTO `auth_permission` VALUES ('32', 'Can view student detail', '8', 'view_studentdetail');
INSERT INTO `auth_permission` VALUES ('33', 'Can add teacher', '9', 'add_teacher');
INSERT INTO `auth_permission` VALUES ('34', 'Can change teacher', '9', 'change_teacher');
INSERT INTO `auth_permission` VALUES ('35', 'Can delete teacher', '9', 'delete_teacher');
INSERT INTO `auth_permission` VALUES ('36', 'Can view teacher', '9', 'view_teacher');
INSERT INTO `auth_permission` VALUES ('37', 'Can add student', '10', 'add_student');
INSERT INTO `auth_permission` VALUES ('38', 'Can change student', '10', 'change_student');
INSERT INTO `auth_permission` VALUES ('39', 'Can delete student', '10', 'delete_student');
INSERT INTO `auth_permission` VALUES ('40', 'Can view student', '10', 'view_student');
INSERT INTO `auth_permission` VALUES ('41', 'Can add book', '11', 'add_book');
INSERT INTO `auth_permission` VALUES ('42', 'Can change book', '11', 'change_book');
INSERT INTO `auth_permission` VALUES ('43', 'Can delete book', '11', 'delete_book');
INSERT INTO `auth_permission` VALUES ('44', 'Can view book', '11', 'view_book');
INSERT INTO `auth_permission` VALUES ('45', 'Can add publisher', '12', 'add_publisher');
INSERT INTO `auth_permission` VALUES ('46', 'Can change publisher', '12', 'change_publisher');
INSERT INTO `auth_permission` VALUES ('47', 'Can delete publisher', '12', 'delete_publisher');
INSERT INTO `auth_permission` VALUES ('48', 'Can view publisher', '12', 'view_publisher');
INSERT INTO `auth_permission` VALUES ('49', 'Can add author', '13', 'add_author');
INSERT INTO `auth_permission` VALUES ('50', 'Can change author', '13', 'change_author');
INSERT INTO `auth_permission` VALUES ('51', 'Can delete author', '13', 'delete_author');
INSERT INTO `auth_permission` VALUES ('52', 'Can view author', '13', 'view_author');
INSERT INTO `auth_permission` VALUES ('53', 'Can add users', '14', 'add_users');
INSERT INTO `auth_permission` VALUES ('54', 'Can change users', '14', 'change_users');
INSERT INTO `auth_permission` VALUES ('55', 'Can delete users', '14', 'delete_users');
INSERT INTO `auth_permission` VALUES ('56', 'Can view users', '14', 'view_users');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES ('1', 'pbkdf2_sha256$150000$UPaVM90ac7S1$AVt9LslUKTQl4Z+DKcds3AIJNcAe0DdBNo752H6SwcI=', null, '1', 'admin', '', '', '', '1', '1', '2019-11-01 10:43:53.360558');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('4', 'auth', 'user');
INSERT INTO `django_content_type` VALUES ('5', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('14', 'login', 'users');
INSERT INTO `django_content_type` VALUES ('13', 'person', 'author');
INSERT INTO `django_content_type` VALUES ('11', 'person', 'book');
INSERT INTO `django_content_type` VALUES ('7', 'person', 'index');
INSERT INTO `django_content_type` VALUES ('12', 'person', 'publisher');
INSERT INTO `django_content_type` VALUES ('10', 'person', 'student');
INSERT INTO `django_content_type` VALUES ('8', 'person', 'studentdetail');
INSERT INTO `django_content_type` VALUES ('9', 'person', 'teacher');
INSERT INTO `django_content_type` VALUES ('6', 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2019-11-01 10:42:11.682742');
INSERT INTO `django_migrations` VALUES ('2', 'auth', '0001_initial', '2019-11-01 10:42:16.657027');
INSERT INTO `django_migrations` VALUES ('3', 'admin', '0001_initial', '2019-11-01 10:42:33.272977');
INSERT INTO `django_migrations` VALUES ('4', 'admin', '0002_logentry_remove_auto_add', '2019-11-01 10:42:36.934186');
INSERT INTO `django_migrations` VALUES ('5', 'admin', '0003_logentry_add_action_flag_choices', '2019-11-01 10:42:37.035192');
INSERT INTO `django_migrations` VALUES ('6', 'contenttypes', '0002_remove_content_type_name', '2019-11-01 10:42:39.994361');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0002_alter_permission_name_max_length', '2019-11-01 10:42:41.809465');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0003_alter_user_email_max_length', '2019-11-01 10:42:44.349611');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0004_alter_user_username_opts', '2019-11-01 10:42:44.506620');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0005_alter_user_last_login_null', '2019-11-01 10:42:46.111711');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0006_require_contenttypes_0002', '2019-11-01 10:42:46.206717');
INSERT INTO `django_migrations` VALUES ('12', 'auth', '0007_alter_validators_add_error_messages', '2019-11-01 10:42:46.283721');
INSERT INTO `django_migrations` VALUES ('13', 'auth', '0008_alter_user_username_max_length', '2019-11-01 10:42:48.020821');
INSERT INTO `django_migrations` VALUES ('14', 'auth', '0009_alter_user_last_name_max_length', '2019-11-01 10:42:49.527907');
INSERT INTO `django_migrations` VALUES ('15', 'auth', '0010_alter_group_name_max_length', '2019-11-01 10:42:51.233004');
INSERT INTO `django_migrations` VALUES ('16', 'auth', '0011_update_proxy_permissions', '2019-11-01 10:42:51.331010');
INSERT INTO `django_migrations` VALUES ('17', 'person', '0001_initial', '2019-11-01 10:42:54.025164');
INSERT INTO `django_migrations` VALUES ('18', 'sessions', '0001_initial', '2019-11-01 10:43:01.860612');
INSERT INTO `django_migrations` VALUES ('19', 'person', '0002_auto_20191101_1844', '2019-11-01 10:44:52.069916');
INSERT INTO `django_migrations` VALUES ('20', 'person', '0003_auto_20191101_2102', '2019-11-01 13:02:38.885751');
INSERT INTO `django_migrations` VALUES ('21', 'person', '0004_book_introduce', '2019-11-03 05:28:24.593484');
INSERT INTO `django_migrations` VALUES ('22', 'person', '0005_auto_20191103_1335', '2019-11-03 05:35:38.161283');
INSERT INTO `django_migrations` VALUES ('23', 'login', '0001_initial', '2019-11-06 02:49:26.719794');
INSERT INTO `django_migrations` VALUES ('24', 'person', '0006_auto_20191106_1049', '2019-11-06 02:49:26.906994');
INSERT INTO `django_migrations` VALUES ('25', 'login', '0002_auto_20191106_1102', '2019-11-06 03:02:26.625041');
INSERT INTO `django_migrations` VALUES ('26', 'login', '0002_auto_20191106_1458', '2019-11-06 06:58:46.124062');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------

-- ----------------------------
-- Table structure for login_users
-- ----------------------------
DROP TABLE IF EXISTS `login_users`;
CREATE TABLE `login_users` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `phone` varchar(20) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(50) NOT NULL,
  `repassword` varchar(50) NOT NULL,
  `birthday` datetime DEFAULT NULL,
  `regday` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of login_users
-- ----------------------------
INSERT INTO `login_users` VALUES ('10', '15867772543', 'xiximayou', '123456', '', '1990-09-10 00:00:00', '2019-11-06 00:00:00');
INSERT INTO `login_users` VALUES ('11', '15926459981', 'demaxiya', '88888', '', '1994-10-20 00:00:00', '2019-11-07 00:00:00');

-- ----------------------------
-- Table structure for person_author
-- ----------------------------
DROP TABLE IF EXISTS `person_author`;
CREATE TABLE `person_author` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of person_author
-- ----------------------------
INSERT INTO `person_author` VALUES ('1', 'gong');
INSERT INTO `person_author` VALUES ('2', 'li');
INSERT INTO `person_author` VALUES ('3', 'xue');

-- ----------------------------
-- Table structure for person_author_book
-- ----------------------------
DROP TABLE IF EXISTS `person_author_book`;
CREATE TABLE `person_author_book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `person_author_book_author_id_book_id_03d34919_uniq` (`author_id`,`book_id`),
  KEY `person_author_book_book_id_2c63d0ec_fk_person_book_id` (`book_id`),
  CONSTRAINT `person_author_book_author_id_d1db2fcd_fk_person_author_id` FOREIGN KEY (`author_id`) REFERENCES `person_author` (`id`),
  CONSTRAINT `person_author_book_book_id_2c63d0ec_fk_person_book_id` FOREIGN KEY (`book_id`) REFERENCES `person_book` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of person_author_book
-- ----------------------------
INSERT INTO `person_author_book` VALUES ('2', '1', '1');
INSERT INTO `person_author_book` VALUES ('1', '1', '2');
INSERT INTO `person_author_book` VALUES ('10', '1', '3');
INSERT INTO `person_author_book` VALUES ('8', '1', '6');
INSERT INTO `person_author_book` VALUES ('3', '2', '1');
INSERT INTO `person_author_book` VALUES ('4', '3', '2');
INSERT INTO `person_author_book` VALUES ('5', '3', '3');

-- ----------------------------
-- Table structure for person_book
-- ----------------------------
DROP TABLE IF EXISTS `person_book`;
CREATE TABLE `person_book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `publisher_id` int(11) NOT NULL,
  `introduce` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `person_book_publisher_id_66ffa14f_fk_person_publisher_id` (`publisher_id`),
  CONSTRAINT `person_book_publisher_id_66ffa14f_fk_person_publisher_id` FOREIGN KEY (`publisher_id`) REFERENCES `person_publisher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of person_book
-- ----------------------------
INSERT INTO `person_book` VALUES ('1', '网络基础', '2', 'ni hao a');
INSERT INTO `person_book` VALUES ('2', 'python', '1', 'ni hao a');
INSERT INTO `person_book` VALUES ('3', 'java_edit', '3', 'ni hao a 我修改了 呀');
INSERT INTO `person_book` VALUES ('6', 'zabbix从入门到精通', '3', 'ni hao a');
INSERT INTO `person_book` VALUES ('8', 'python_edit', '3', 'ni hao a edit');
INSERT INTO `person_book` VALUES ('9', 'python', '3', 'ni hao a');
INSERT INTO `person_book` VALUES ('10', 'php', '1', 'nihao a ');
INSERT INTO `person_book` VALUES ('11', 'c++', '2', 'nihao a ');
INSERT INTO `person_book` VALUES ('12', 'html', '3', 'nihao a');
INSERT INTO `person_book` VALUES ('13', 'css', '2', 'jihao a');
INSERT INTO `person_book` VALUES ('17', '编译原理', '3', 'nihao a');
INSERT INTO `person_book` VALUES ('18', '数据结构', '2', 'nihao a ');
INSERT INTO `person_book` VALUES ('19', '深度学习', '1', 'nihao a');
INSERT INTO `person_book` VALUES ('21', 'python', '3', '我们都是热爱学习的人');

-- ----------------------------
-- Table structure for person_publisher
-- ----------------------------
DROP TABLE IF EXISTS `person_publisher`;
CREATE TABLE `person_publisher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of person_publisher
-- ----------------------------
INSERT INTO `person_publisher` VALUES ('2', '北京大学出版社');
INSERT INTO `person_publisher` VALUES ('3', '广州大学出版社');
INSERT INTO `person_publisher` VALUES ('1', '清华大学出版社');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `age` varchar(10) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `introduce` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('1', '龚鸥波', '25', 'female', '我是个很爱学习的人');
INSERT INTO `student` VALUES ('2', '李叔敖', '25', 'male', '我是个天才');
INSERT INTO `student` VALUES ('3', '李志', '26', 'male', '我是个牛逼');
INSERT INTO `student` VALUES ('4', '德玛', '30', 'male', '德玛西亚');
INSERT INTO `student` VALUES ('5', 'dfdf', '12', 'male', '1231');
INSERT INTO `student` VALUES ('6', 'mmm', '12', 'male', '1231');
INSERT INTO `student` VALUES ('7', 'ddd', '12', 'male', '1231');
