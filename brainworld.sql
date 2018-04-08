-- MySQL dump 10.13  Distrib 5.5.15, for Win32 (x86)
--
-- Host: localhost    Database: brainworld
-- ------------------------------------------------------
-- Server version	5.5.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `certificates`
--

DROP TABLE IF EXISTS `certificates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certificates` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `ut_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`c_id`),
  KEY `ut_id` (`ut_id`),
  CONSTRAINT `certificates_ibfk_1` FOREIGN KEY (`ut_id`) REFERENCES `usr_tests` (`ut_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificates`
--

LOCK TABLES `certificates` WRITE;
/*!40000 ALTER TABLE `certificates` DISABLE KEYS */;
/*!40000 ALTER TABLE `certificates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password`
--

DROP TABLE IF EXISTS `password`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password` (
  `pass_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `password` varchar(20) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pass_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `password_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password`
--

LOCK TABLES `password` WRITE;
/*!40000 ALTER TABLE `password` DISABLE KEYS */;
INSERT INTO `password` VALUES (1,1,'nahipata',0),(2,2,'nahipata',0),(3,3,'ankit',0),(4,4,'footballcricket',0),(5,5,'hellowrold',0),(6,6,'helloworld',0),(7,7,'abcdefg',0),(8,8,'ankit',0),(9,9,'chirag',0),(10,10,'',0),(11,11,'8951906764',0),(12,12,'abcdefghijklm',0),(13,13,'akshat',0),(14,14,'shinigami',0),(15,15,'atishey',0),(16,16,'9911824897',0),(17,17,'welcome123',0),(18,18,'mvcpass',0),(19,19,'password',0),(20,1,'helloworld',0),(21,1,'newpassword',0),(22,20,'newpassword',1),(23,1,'nahipata',1),(24,21,'temppassword',1);
/*!40000 ALTER TABLE `password` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ques_opt`
--

DROP TABLE IF EXISTS `ques_opt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ques_opt` (
  `qo_id` int(20) NOT NULL,
  `q_id` int(20) NOT NULL,
  `qo_desc` varchar(200) NOT NULL,
  `is_Answer` tinyint(1) DEFAULT '0',
  `is_Active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`qo_id`),
  KEY `q_id` (`q_id`),
  CONSTRAINT `ques_opt_ibfk_1` FOREIGN KEY (`q_id`) REFERENCES `questions` (`q_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ques_opt`
--

LOCK TABLES `ques_opt` WRITE;
/*!40000 ALTER TABLE `ques_opt` DISABLE KEYS */;
INSERT INTO `ques_opt` VALUES (1,1,'-1',0,1),(2,1,'1',0,1),(3,1,'0',1,1),(4,1,'Programs do not return a value',0,1),(5,2,'Start()',0,1),(6,2,'system()',0,1),(7,2,'main()',1,1),(8,2,'program()',0,1),(9,3,'Yes',1,1),(10,3,'No',0,1),(11,4,'Bjarne Stroustrup',0,1),(12,4,'Dennis Ritchie',1,1),(13,4,'Bill Gates',0,1),(14,4,'Tim Berner Lee',0,1),(15,5,'2 6',0,1),(16,5,'4 6',0,1),(17,5,'2 5',0,1),(18,5,'4 5',1,1),(19,6,'It will accept a word as a string from user.',0,1),(20,6,'It will accept a sentence as a string from user.',0,1),(21,6,'It will accept a paragraph as a string from user.',0,1),(22,6,'Compiler error',1,1),(23,7,'5 garbage garbage',0,1),(24,7,'5 0 0',1,1),(25,7,'5 null null',0,1),(26,7,'Compiler error',0,1),(27,8,'10 10 12',0,1),(28,8,'12 11 11 ',1,1),(29,8,'12 12 12',0,1),(30,8,'10 11 12',0,1),(31,9,'5 10',0,1),(32,9,'5 11',1,1),(33,9,'6 10',0,1),(34,9,'6 11',0,1),(35,10,'c:\\tc\\bin\\rw.c',0,1),(36,10,'c: c inw.c',0,1),(37,10,'c:cinw.c',0,1),(38,10,'w.c in',1,1),(39,11,'11',0,1),(40,11,'12',0,1),(41,11,'Garbage Value',1,1),(42,11,'Compiler Error',0,1),(43,12,'True',0,1),(44,12,'False',1,1),(45,12,'Run Time Error',0,1),(46,12,'Compiler Error',0,1),(47,13,'2',0,1),(48,13,'3',0,1),(49,13,'5',1,1),(50,13,'Garbage Value',0,1),(51,14,'c c++',0,1),(52,14,'Not equal',0,1),(53,14,'Compiler Error',1,1),(54,14,'Run Time Error',0,1),(55,15,'6',0,1),(56,15,'7',0,1),(57,15,'8',1,1),(58,15,'11',0,1),(59,16,'Oracle',0,1),(60,16,'DB2',0,1),(61,16,'MySQL',0,1),(62,16,'',0,1),(63,16,'',0,1),(64,16,'',0,1),(65,16,'All of the above',1,1),(66,17,'Oracle',0,1),(67,17,'DB2',0,1),(68,17,'MySQL',0,1),(69,17,'',0,1),(70,17,'',0,1),(71,17,'',0,1),(72,17,'All of the above',1,1),(73,18,',nnkjnknk',1,1),(74,18,'bjbjb',0,1),(75,18,'jbjbjhb',0,1);
/*!40000 ALTER TABLE `ques_opt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions` (
  `q_id` int(20) NOT NULL,
  `subject_id` int(10) NOT NULL,
  `q_desc` longtext NOT NULL,
  `is_Active` tinyint(1) NOT NULL DEFAULT '1',
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`q_id`),
  KEY `subject_id` (`subject_id`),
  CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (1,1,'What is the correct value to return to the operating system upon the successful completion of a program?',1,'2016-08-02 20:48:33'),(2,1,' What is the only function all C programs must contain?',1,'2016-07-30 20:57:12'),(3,1,'Is C a procedural language?',1,'2016-04-24 00:25:07'),(4,1,'Who is the founder of C?',1,'2016-04-24 00:25:07'),(5,1,'\r\n\r\nWhat will be output if you will compile and execute the following c code?\r\n\r\n#include&ltstdio.h&gt\r\nint main(){\r\n\r\n  int a=5;\r\n\r\n  float b;\r\n\r\n  printf(\"%d\",sizeof(++a+b));\r\n\r\n  printf(\" %d\",a); \r\n  return 0;\r\n\r\n}',1,'2016-04-24 00:25:07'),(6,1,'\r\nWhat will be output if you will compile and execute the following c code?\r\n\r\n#include&ltstdio.h&gt\r\n\r\nint main(){\r\n\r\n  char *str;\r\n\r\n  scanf(\"%[^\\n]\",str);\r\n\r\n  printf(\"%s\",str); \r\n  return 0;\r\n\r\n}\r\n',1,'2016-04-24 00:25:07'),(7,1,'\r\nWhat will be output if you will compile and execute the following c code?\r\n\r\n#include&ltstdio.h&gt\r\n\r\nint main(){\r\n\r\n  int array[3]={5};\r\n\r\n  int i;\r\n\r\n  for(i=0;i&lt=2;i++)\r\n\r\n    printf(\"%d \",array[i]); \r\n  return 0;\r\n\r\n}\r\n',1,'2016-04-24 00:25:07'),(8,1,'\r\nWhat will be output if you will compile and execute the following c code?\r\n\r\n#include&ltstdio.h&gt\r\n\r\nvoid call(int,int,int);\r\n\r\nint main(){\r\n\r\n  int a=10;\r\n\r\n  call(a,a++,++a); \r\n  return 0;\r\n\r\n}\r\n\r\nvoid call(int x,int y,int z){\r\n\r\n  printf(\"%d %d %d\",x,y,z);\r\n\r\n}\r\n\r\n',1,'2016-04-24 00:25:07'),(9,1,'What will be output if you will compile and execute the following c code?\r\n\r\n#include&ltstdio.h&gt\r\n\r\nint main(){\r\n\r\n  int a=5;\r\n\r\n  int b=10;\r\n\r\n  {\r\n\r\n    int a=2;\r\n\r\n    a++;\r\n\r\n    b++;\r\n\r\n  }\r\n\r\n  printf(\"%d %d\",a,b); \r\n  return 0;\r\n\r\n}\r\n\r\n\r\n\r\n\r\n\r\n',1,'2016-04-24 00:25:07'),(10,1,'What will be output if you will compile and execute the following c code?\r\n\r\n#include&ltstdio.h&gt\r\n\r\nint main(){\r\n\r\n  char *url=\"c:\\tc\\bin\\rw.c\";\r\n\r\n  printf(\"%s\",url); \r\n  return 0;\r\n\r\n}\r\n\r\n',1,'2016-04-24 00:25:07'),(11,1,'What will be output if you will compile and execute the following c code?\r\n\r\n#include&ltstdio.h&gt\r\n\r\nint main(){\r\n\r\n  int i=11;\r\n\r\n  int const * p=&i;\r\n\r\n  p++;\r\n\r\n  printf(\"%d\",*p); \r\n  return 0;\r\n\r\n}\r\n\r\n\r\n',1,'2016-04-24 00:25:07'),(12,1,'What will be output if you will compile and execute the following c code?\r\n\r\n#include&ltstdio.h&gt\r\n\r\nint main(){\r\n\r\n  int a=15,b=10,c=5;\r\n\r\n  if(a&gtb&gtc )\r\n\r\n    printf(\"Trre\");\r\n\r\n  else\r\n\r\n    printf(\"False\"); \r\n  return 0;\r\n\r\n}\r\n\r\n',1,'2016-04-24 00:25:07'),(13,1,'What will be output if you will compile and execute the following c code?\r\n\r\n#include&ltstdio.h&gt\r\n\r\nint main(){\r\n\r\n  int a=sizeof(a);\r\n\r\n  a=modify(a);\r\n\r\n  printf(\"%d\",a); \r\n  return 0;\r\n\r\n}\r\n\r\nint modify(int x){\r\n\r\n  int y=3;\r\n\r\n  _AX=x+y;\r\n\r\n  return;\r\n\r\n}\r\n\r\n',1,'2016-04-24 00:25:07'),(14,1,'What will be output if you will compile and execute the following c code?\r\n\r\n#define PRINT printf(\"c\");printf(\"c++\");\r\n\r\nint main(){\r\n\r\n  float a=5.5;\r\n\r\n  if(a==5.5)\r\n\r\n    PRINT\r\n\r\n  else\r\n\r\n    printf(\"Not equal\"); \r\n  return 0;\r\n\r\n}\r\n\r\n\r\n',1,'2016-04-24 00:25:07'),(15,1,'What will be output if you will compile and execute the following c code?\r\n\r\n#include&ltstdio.h&gt\r\n\r\nint main(){\r\n\r\n\r\n  int array[2][2][3]={0,1,2,3,4,5,6,7,8,9,10,11};\r\n\r\n\r\n  printf(\"%d\",array[1][0][2]);\r\n\r\n  return 0;\r\n\r\n\r\n}\r\n',1,'2016-04-24 00:25:07'),(16,8,'Example of RDBMS is',0,'2016-08-12 23:22:57'),(17,8,'Example of RDBMS is :',0,'2016-08-12 23:23:37'),(18,1,'gvhgvhgv',1,'2017-11-13 19:58:15');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subjects` (
  `subject_id` int(10) NOT NULL,
  `sub_desc` varchar(100) NOT NULL,
  `start_date` date NOT NULL,
  `is_Active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
INSERT INTO `subjects` VALUES (1,'C','2016-02-17',1),(2,'C++','2016-02-17',1),(3,'Java','2016-02-17',1),(4,'Javascript','2016-02-17',1),(5,'HTML','2016-02-17',1),(6,'Algorithms','2016-03-04',1),(7,'Operating Systems ','2016-03-04',1),(8,'DBMS','2016-03-04',1),(9,'Unix','2016-03-04',1),(10,'IQ','2016-08-13',1);
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_ques`
--

DROP TABLE IF EXISTS `test_ques`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_ques` (
  `tq_id` int(20) NOT NULL,
  `test_id` int(10) NOT NULL,
  `q_id` int(20) NOT NULL,
  PRIMARY KEY (`tq_id`),
  KEY `test_id` (`test_id`),
  KEY `q_id` (`q_id`),
  CONSTRAINT `test_ques_ibfk_1` FOREIGN KEY (`test_id`) REFERENCES `tests` (`test_id`),
  CONSTRAINT `test_ques_ibfk_2` FOREIGN KEY (`q_id`) REFERENCES `questions` (`q_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_ques`
--

LOCK TABLES `test_ques` WRITE;
/*!40000 ALTER TABLE `test_ques` DISABLE KEYS */;
INSERT INTO `test_ques` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,1,9),(10,1,10),(11,1,11),(12,1,12),(13,1,13),(14,1,14),(15,1,15);
/*!40000 ALTER TABLE `test_ques` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tests`
--

DROP TABLE IF EXISTS `tests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tests` (
  `test_id` int(10) NOT NULL,
  `subject_id` int(10) NOT NULL,
  `test_name` varchar(100) NOT NULL,
  `test_desc` longtext NOT NULL,
  `total_marks` int(5) NOT NULL DEFAULT '100',
  `passing_score` int(5) NOT NULL,
  `start_date` date NOT NULL,
  `expiry_date` date NOT NULL,
  `is_Active` tinyint(1) NOT NULL DEFAULT '1',
  `is_Practice` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`test_id`),
  KEY `subject_id` (`subject_id`),
  CONSTRAINT `tests_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tests`
--

LOCK TABLES `tests` WRITE;
/*!40000 ALTER TABLE `tests` DISABLE KEYS */;
INSERT INTO `tests` VALUES (1,1,'Test on C','Take a test on C',100,40,'2016-02-17','2016-12-31',1,1),(2,3,'Test on Java','Take a test on Java',100,40,'2016-02-17','2016-12-31',1,1),(3,5,'Test on HTML','Take a test on HTML',100,40,'2016-02-17','2016-12-31',1,1),(4,2,'Basic C++','Basic Test on C++.',100,30,'2016-02-17','2016-12-31',1,0),(5,4,'Test on Javascript','Take a test on Javascript',100,40,'2016-02-17','2016-12-31',1,0),(6,1,'Data Structures','Advanced C Handeling Data Structures',100,40,'2016-02-26','2016-12-31',1,0),(7,2,'OOP using C++','Object Oriented Programming using C++.',200,80,'2016-04-06','2016-12-31',1,0);
/*!40000 ALTER TABLE `tests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `ur_id` bigint(20) NOT NULL,
  `user_id` int(10) NOT NULL,
  `role` varchar(10) NOT NULL DEFAULT 'user',
  PRIMARY KEY (`ur_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,1,'admin'),(2,2,'user'),(3,3,'user'),(4,4,'user'),(5,5,'user'),(6,6,'user'),(7,7,'user'),(8,8,'admin'),(9,9,'user'),(10,10,'user'),(11,11,'user'),(12,12,'user'),(13,13,'user'),(14,14,'user'),(15,15,'user'),(16,16,'user'),(17,17,'user'),(18,18,'user'),(19,19,'user');
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` int(10) NOT NULL,
  `username` varchar(20) NOT NULL,
  `fname` varchar(30) NOT NULL,
  `lname` varchar(30) DEFAULT NULL,
  `email` varchar(30) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `is_Active` tinyint(1) DEFAULT '1',
  `role` varchar(10) NOT NULL DEFAULT 'user',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'ankit','Ankit','Sinha','ankit.sinha2000@gmail.com','9570041556',1,'admin'),(2,'helloworld','Hello','World','helloworld@gmail','0',1,'user'),(3,'AnkitSinha','Ankit','Sinha','ankit.sinha2000@gmail.com','0',1,'user'),(4,'KPBrijesh','Brijesh','KP','kpbrijesh1997@gmail.com','0',1,'user'),(5,'helloworld123','Hello','World','helloworld@gmail.com','0',1,'user'),(6,'hellow','HelloW','World','helloworld123@gmail.com','12321321',1,'user'),(7,'helloworld23','Hello','World','helloworld@gmail.com','0',1,'user'),(8,'sameersekhar','sameer','Sekhar','sameersekhar@gmail.com','0',1,'user'),(9,'chirag1goel','Chirag','Lol','chirag1goel@gmail.com','0',1,'user'),(10,'','Ayush','agrawal','ayushagrawal622@gmail.com','8951906764',1,'user'),(11,'ayush1','Ayush','Agrawal','ayushagrawal622@gmail.com','8951906764',1,'user'),(12,'helloworld2','hello','world','helloworld@gmail.com',NULL,1,'user'),(13,'AKSHAT','Akshat','Trivedi','akshat.trivedi08@gmail.com',NULL,1,'user'),(14,'shinigami','Sudhanshu','Ranjan','perfectsudh@gmail.com','0',1,'user'),(15,'atishey','Atishey','Jain','atisheyjain97@gmail.com','0',1,'user'),(16,'ayushag','Ayush','Agrawal','ayushagrawal622@gmail.com',NULL,1,'user'),(17,'rohitprasad23','rohit','prasad','rohit.prasad.23@gmail.com','0',1,'user'),(18,'mvc','m','c','mvcEmail',NULL,1,'user'),(19,'arpit','Arpit','Sachdeva','arpitsachdeva001@gmail.com',NULL,1,'user'),(20,'hello','hello','world','hello@world.com','0',1,'user'),(21,'tempaccount','Temp','Account','tempaccount@gmail.com','0',1,'user');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usr_sub`
--

DROP TABLE IF EXISTS `usr_sub`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usr_sub` (
  `usr_sub_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `subject_id` int(10) NOT NULL,
  PRIMARY KEY (`usr_sub_id`),
  KEY `user_id` (`user_id`),
  KEY `subject_id` (`subject_id`),
  CONSTRAINT `usr_sub_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `usr_sub_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usr_sub`
--

LOCK TABLES `usr_sub` WRITE;
/*!40000 ALTER TABLE `usr_sub` DISABLE KEYS */;
INSERT INTO `usr_sub` VALUES (29,2,1),(30,3,6),(31,3,1),(32,3,2),(33,4,1),(35,5,1),(36,5,2),(37,5,8),(38,6,1),(39,6,2),(40,7,1),(41,7,2),(42,8,1),(43,8,8),(44,8,5),(45,8,4),(46,9,1),(51,10,1),(52,11,1),(53,14,1),(54,14,2),(55,14,5),(56,14,10),(57,14,3),(58,14,4),(67,15,1),(68,15,5),(69,15,9),(70,17,1),(71,17,3),(72,17,7),(73,17,9),(74,1,6),(75,1,1),(76,1,2),(77,20,1),(78,21,1);
/*!40000 ALTER TABLE `usr_sub` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usr_test_ques`
--

DROP TABLE IF EXISTS `usr_test_ques`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usr_test_ques` (
  `utq_id` int(50) NOT NULL,
  `ut_id` int(40) NOT NULL,
  `q_id` int(40) NOT NULL,
  `usr_answer` varchar(100) NOT NULL,
  PRIMARY KEY (`utq_id`),
  KEY `ut_id` (`ut_id`),
  KEY `q_id` (`q_id`),
  CONSTRAINT `usr_test_ques_ibfk_1` FOREIGN KEY (`ut_id`) REFERENCES `usr_tests` (`ut_id`),
  CONSTRAINT `usr_test_ques_ibfk_2` FOREIGN KEY (`q_id`) REFERENCES `questions` (`q_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usr_test_ques`
--

LOCK TABLES `usr_test_ques` WRITE;
/*!40000 ALTER TABLE `usr_test_ques` DISABLE KEYS */;
INSERT INTO `usr_test_ques` VALUES (1,133,14,'Not Answered'),(2,133,2,'Not Answered'),(3,133,7,'Not Answered'),(4,133,5,'Not Answered'),(5,133,12,'Not Answered'),(6,133,8,'Not Answered'),(7,133,9,'Not Answered'),(8,133,15,'Not Answered'),(9,133,11,'Not Answered'),(10,133,4,'Not Answered'),(11,134,9,'5 11'),(12,134,5,'4 6'),(13,134,7,'5 null null'),(14,134,4,'Dennis Ritchie'),(15,134,12,'Compiler Error'),(16,134,15,'11'),(17,134,3,'Yes'),(18,134,10,'c:cinw.c'),(19,134,1,'0'),(20,134,6,'Compiler error'),(21,135,6,'Not Answered'),(22,135,12,'Not Answered'),(23,135,7,'Not Answered'),(24,135,8,'Not Answered'),(25,135,1,'Not Answered'),(26,135,14,'Not Answered'),(27,135,9,'Not Answered'),(28,135,3,'Not Answered'),(29,135,13,'Not Answered'),(30,135,11,'Not Answered'),(31,136,10,'w.c in'),(32,136,2,'program()'),(33,136,12,'Not Answered'),(34,136,6,'Not Answered'),(35,136,3,'Not Answered'),(36,136,15,'Not Answered'),(37,136,4,'Not Answered'),(38,136,13,'Not Answered'),(39,136,8,'Not Answered'),(40,136,9,'Not Answered'),(41,137,9,'5 11'),(42,137,13,'Not Answered'),(43,137,12,'Not Answered'),(44,137,4,'Not Answered'),(45,137,11,'Not Answered'),(46,137,14,'Not Answered'),(47,137,10,'Not Answered'),(48,137,2,'Not Answered'),(49,137,7,'Not Answered'),(50,137,15,'Not Answered'),(51,138,7,'5 0 0'),(52,138,10,'w.c in'),(53,138,2,'main()'),(54,138,9,'5 11'),(55,138,12,'False'),(56,138,6,'Compiler error'),(57,138,14,'Compiler Error'),(58,138,5,'4 5'),(59,138,13,'5'),(60,138,4,'Dennis Ritchie'),(61,139,4,'Dennis Ritchie'),(62,139,15,'Not Answered'),(63,139,6,'It will accept a sentence as a string from user.'),(64,139,11,'Not Answered'),(65,139,2,'Not Answered'),(66,139,14,'Not Answered'),(67,139,12,'Not Answered'),(68,139,3,'Not Answered'),(69,139,10,'Not Answered'),(70,139,1,'Programs do not return a value'),(71,140,1,'0'),(72,140,14,'Compiler Error'),(73,140,2,'main()'),(74,140,4,'Dennis Ritchie'),(75,140,15,'8'),(76,140,8,'12 11 11 '),(77,140,7,'5 0 0'),(78,140,6,'Compiler error'),(79,140,12,'True'),(80,140,9,'5 11'),(81,141,10,'c:\\tc\\bin\\rw.c'),(82,141,1,'0'),(83,141,12,'False'),(84,141,5,'4 6'),(85,141,8,'12 11 11 '),(86,141,15,'8'),(87,141,4,'Dennis Ritchie'),(88,141,3,'Yes'),(89,141,2,'main()'),(90,141,13,'Garbage Value'),(91,142,12,'False'),(92,142,11,'Garbage Value'),(93,142,8,'12 11 11 '),(94,142,6,'It will accept a word as a string from user.'),(95,142,15,'7'),(96,142,1,'0'),(97,142,4,'Dennis Ritchie'),(98,142,10,'c: c inw.c'),(99,142,2,'main()'),(100,142,14,'Compiler Error'),(101,143,11,'12'),(102,143,3,'No'),(103,143,2,'Start()'),(104,143,13,'Not Answered'),(105,143,15,'6'),(106,143,14,'Not Answered'),(107,143,10,'c:\\tc\\bin\\rw.c'),(108,143,9,'5 11'),(109,143,8,'10 10 12'),(110,143,6,'Not Answered'),(111,144,9,'Not Answered'),(112,144,15,'Not Answered'),(113,144,3,'Not Answered'),(114,144,8,'Not Answered'),(115,144,4,'Not Answered'),(116,144,12,'Not Answered'),(117,144,13,'Not Answered'),(118,144,14,'Not Answered'),(119,144,2,'Not Answered'),(120,144,6,'Not Answered'),(121,145,8,'10 10 12'),(122,145,9,'5 11'),(123,145,13,'3'),(124,145,7,'Not Answered'),(125,145,1,'Not Answered'),(126,145,15,'Not Answered'),(127,145,5,'4 6'),(128,145,10,'c:cinw.c'),(129,145,11,'Not Answered'),(130,145,3,'Not Answered'),(131,146,9,'5 11'),(132,146,3,'Yes'),(133,146,1,'-1'),(134,146,4,'Not Answered'),(135,146,13,'3'),(136,146,14,'Not equal'),(137,146,10,'Not Answered'),(138,146,5,'Not Answered'),(139,146,12,'Not Answered'),(140,146,11,'Compiler Error'),(141,147,10,'c: c inw.c'),(142,147,3,'Yes'),(143,147,12,'True'),(144,147,6,'It will accept a sentence as a string from user.'),(145,147,8,'12 11 11 '),(146,147,9,'5 11'),(147,147,2,'main()'),(148,147,13,'Garbage Value'),(149,147,11,'12'),(150,147,1,'0'),(151,148,5,'Not Answered'),(152,148,13,'Not Answered'),(153,148,3,'Not Answered'),(154,148,1,'Not Answered'),(155,148,14,'Not Answered'),(156,148,11,'Not Answered'),(157,148,8,'Not Answered'),(158,148,15,'Not Answered'),(159,148,2,'Not Answered'),(160,148,12,'Not Answered'),(161,149,6,'Not Answered'),(162,149,1,'Not Answered'),(163,149,5,'Not Answered'),(164,149,12,'Not Answered'),(165,149,10,'Not Answered'),(166,149,9,'Not Answered'),(167,149,7,'Not Answered'),(168,149,3,'Not Answered'),(169,149,13,'Not Answered'),(170,149,11,'Not Answered'),(171,150,2,'Not Answered'),(172,150,8,'Not Answered'),(173,150,4,'Not Answered'),(174,150,11,'Not Answered'),(175,150,10,'Not Answered'),(176,150,1,'Not Answered'),(177,150,7,'Not Answered'),(178,150,15,'Not Answered'),(179,150,9,'Not Answered'),(180,150,3,'Not Answered'),(181,151,12,'False'),(182,151,10,'w.c in'),(183,151,14,'Run Time Error'),(184,151,15,'11'),(185,151,4,'Tim Berner Lee'),(186,151,11,'Compiler Error'),(187,151,1,'Programs do not return a value'),(188,151,5,'4 5'),(189,151,13,'Garbage Value'),(190,151,8,'10 11 12'),(191,152,11,'Not Answered'),(192,152,3,'Not Answered'),(193,152,8,'Not Answered'),(194,152,9,'Not Answered'),(195,152,7,'Not Answered'),(196,152,13,'Not Answered'),(197,152,1,'Not Answered'),(198,152,5,'Not Answered'),(199,152,2,'Not Answered'),(200,152,6,'Not Answered'),(201,153,5,'Not Answered'),(202,153,3,'Not Answered'),(203,153,12,'Not Answered'),(204,153,4,'Not Answered'),(205,153,10,'Not Answered'),(206,153,1,'Not Answered'),(207,153,15,'Not Answered'),(208,153,14,'Not Answered'),(209,153,13,'Not Answered'),(210,153,7,'Not Answered'),(211,154,6,'Not Answered'),(212,154,2,'Not Answered'),(213,154,11,'Not Answered'),(214,154,13,'Not Answered'),(215,154,10,'Not Answered'),(216,154,15,'Not Answered'),(217,154,14,'Not Answered'),(218,154,3,'Not Answered'),(219,154,9,'Not Answered'),(220,154,1,'Not Answered'),(221,155,11,'Not Answered'),(222,155,2,'Not Answered'),(223,155,8,'Not Answered'),(224,155,9,'Not Answered'),(225,155,6,'Not Answered'),(226,155,12,'Not Answered'),(227,155,10,'Not Answered'),(228,155,1,'Not Answered'),(229,155,14,'Not Answered'),(230,155,5,'Not Answered'),(231,156,7,'Not Answered'),(232,156,6,'Not Answered'),(233,156,10,'Not Answered'),(234,156,8,'Not Answered'),(235,156,15,'Not Answered'),(236,156,13,'Not Answered'),(237,156,2,'Not Answered'),(238,156,1,'Not Answered'),(239,156,4,'Not Answered'),(240,156,14,'Not Answered'),(241,157,14,'Not Answered'),(242,157,15,'Not Answered'),(243,157,10,'Not Answered'),(244,157,2,'Not Answered'),(245,157,12,'Not Answered'),(246,157,5,'Not Answered'),(247,157,7,'Not Answered'),(248,157,4,'Not Answered'),(249,157,6,'Not Answered'),(250,157,8,'Not Answered'),(251,158,9,'Not Answered'),(252,158,14,'Not Answered'),(253,158,10,'Not Answered'),(254,158,13,'Not Answered'),(255,158,11,'Not Answered'),(256,158,3,'Not Answered'),(257,158,4,'Not Answered'),(258,158,6,'Not Answered'),(259,158,12,'Not Answered'),(260,158,15,'Not Answered'),(261,159,6,'Not Answered'),(262,159,3,'Not Answered'),(263,159,9,'Not Answered'),(264,159,5,'Not Answered'),(265,159,10,'Not Answered'),(266,159,8,'Not Answered'),(267,159,2,'Not Answered'),(268,159,4,'Not Answered'),(269,159,1,'Not Answered'),(270,159,11,'Not Answered'),(271,160,10,'Not Answered'),(272,160,15,'Not Answered'),(273,160,3,'Not Answered'),(274,160,8,'Not Answered'),(275,160,2,'Not Answered'),(276,160,9,'Not Answered'),(277,160,1,'Not Answered'),(278,160,13,'Not Answered'),(279,160,5,'Not Answered'),(280,160,12,'Not Answered'),(281,161,15,'Not Answered'),(282,161,12,'Not Answered'),(283,161,7,'Not Answered'),(284,161,11,'Not Answered'),(285,161,5,'Not Answered'),(286,161,4,'Not Answered'),(287,161,6,'Not Answered'),(288,161,10,'Not Answered'),(289,161,8,'Not Answered'),(290,161,9,'Not Answered'),(291,162,11,'Not Answered'),(292,162,7,'Not Answered'),(293,162,6,'Not Answered'),(294,162,3,'Not Answered'),(295,162,12,'Not Answered'),(296,162,8,'Not Answered'),(297,162,13,'Not Answered'),(298,162,15,'Not Answered'),(299,162,9,'Not Answered'),(300,162,4,'Not Answered'),(301,163,2,'Not Answered'),(302,163,14,'Not Answered'),(303,163,5,'Not Answered'),(304,163,7,'Not Answered'),(305,163,8,'Not Answered'),(306,163,15,'Not Answered'),(307,163,12,'Not Answered'),(308,163,9,'Not Answered'),(309,163,6,'Not Answered'),(310,163,4,'Not Answered'),(311,164,2,'Not Answered'),(312,164,6,'Not Answered'),(313,164,13,'Not Answered'),(314,164,4,'Not Answered'),(315,164,14,'Not Answered'),(316,164,11,'Not Answered'),(317,164,15,'Not Answered'),(318,164,1,'Not Answered'),(319,164,10,'Not Answered'),(320,164,7,'Not Answered'),(321,166,8,'10 11 12'),(322,166,4,'Dennis Ritchie'),(323,166,3,'Yes'),(324,166,15,'8'),(325,166,14,'Compiler Error'),(326,166,9,'5 10'),(327,166,6,'It will accept a sentence as a string from user.'),(328,166,5,'4 6'),(329,166,2,'system()'),(330,166,13,'5'),(331,167,8,'12 11 11 '),(332,167,6,'It will accept a sentence as a string from user.'),(333,167,2,'system()'),(334,167,4,'Not Answered'),(335,167,1,'Not Answered'),(336,167,14,'Not Answered'),(337,167,12,'Not Answered'),(338,167,9,'Not Answered'),(339,167,15,'Not Answered'),(340,167,5,'Not Answered'),(341,168,13,'5'),(342,168,1,'Programs do not return a value'),(343,168,6,'It will accept a paragraph as a string from user.'),(344,168,12,'Not Answered'),(345,168,10,'Not Answered'),(346,168,4,'Dennis Ritchie'),(347,168,8,'12 11 11 '),(348,168,3,'Not Answered'),(349,168,9,'5 11'),(350,168,2,'system()'),(351,193,6,'It will accept a sentence as a string from user.'),(352,193,15,'6'),(353,193,9,'5 11'),(354,193,1,'1'),(355,193,5,'2 6'),(356,193,12,'False'),(357,193,10,'c: c inw.c'),(358,193,11,'12'),(359,193,2,'system()'),(360,193,4,'Bjarne Stroustrup'),(361,194,9,'5 10'),(362,194,6,'It will accept a sentence as a string from user.'),(363,194,11,'12'),(364,194,15,'Not Answered'),(365,194,4,'Not Answered'),(366,194,13,'Not Answered'),(367,194,1,'Not Answered'),(368,194,14,'Not Answered'),(369,194,5,'Not Answered'),(370,194,10,'Not Answered'),(371,195,15,'Not Answered'),(372,195,10,'Not Answered'),(373,195,1,'Not Answered'),(374,195,11,'Not Answered'),(375,195,7,'Not Answered'),(376,195,4,'Not Answered'),(377,195,3,'Not Answered'),(378,195,8,'Not Answered'),(379,195,12,'Not Answered'),(380,195,13,'Not Answered'),(381,197,7,'5 0 0'),(382,197,3,'Yes'),(383,197,4,'Dennis Ritchie'),(384,197,5,'4 5'),(385,197,1,'0'),(386,197,10,'c:\\tc\\bin\\rw.c'),(387,197,15,'11'),(388,197,14,'Compiler Error'),(389,197,2,'main()'),(390,197,6,'It will accept a word as a string from user.'),(391,199,2,'Not Answered'),(392,199,3,'Not Answered'),(393,199,8,'Not Answered'),(394,199,13,'Not Answered'),(395,199,11,'Not Answered'),(396,199,7,'Not Answered'),(397,199,12,'Not Answered'),(398,199,5,'Not Answered'),(399,199,15,'Not Answered'),(400,199,10,'Not Answered'),(401,200,14,'Not equal'),(402,200,9,'5 11'),(403,200,8,'12 11 11 '),(404,200,15,'7'),(405,200,12,'False'),(406,200,5,'4 6'),(407,200,2,'system()'),(408,200,13,'Not Answered'),(409,200,10,'Not Answered'),(410,200,7,'Not Answered');
/*!40000 ALTER TABLE `usr_test_ques` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usr_tests`
--

DROP TABLE IF EXISTS `usr_tests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usr_tests` (
  `ut_id` int(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `test_id` int(10) NOT NULL,
  `test_date` date NOT NULL,
  `score` int(5) NOT NULL DEFAULT '0',
  `grade` varchar(2) NOT NULL DEFAULT 'F',
  `certificate` varchar(3) NOT NULL DEFAULT 'no',
  PRIMARY KEY (`ut_id`),
  KEY `user_id` (`user_id`),
  KEY `test_id` (`test_id`),
  CONSTRAINT `usr_tests_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `usr_tests_ibfk_2` FOREIGN KEY (`test_id`) REFERENCES `tests` (`test_id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usr_tests`
--

LOCK TABLES `usr_tests` WRITE;
/*!40000 ALTER TABLE `usr_tests` DISABLE KEYS */;
INSERT INTO `usr_tests` VALUES (1,1,1,'2017-10-14',100,'P','no'),(2,1,1,'2017-10-14',0,'F','no'),(3,1,1,'2017-10-14',0,'F','no'),(4,1,1,'2017-10-14',0,'F','no'),(5,1,1,'2017-10-14',100,'P','no'),(6,1,1,'2017-10-14',0,'F','no'),(7,1,1,'2017-10-14',100,'P','no'),(8,1,1,'2017-10-14',70,'P','no'),(9,1,1,'2017-10-14',0,'F','no'),(10,1,1,'2017-10-14',0,'F','no'),(11,1,1,'2017-10-14',0,'F','no'),(12,1,1,'2017-10-14',0,'F','no'),(13,1,1,'2017-10-14',0,'F','no'),(14,1,1,'2017-10-14',0,'F','no'),(15,1,1,'2017-10-14',0,'F','no'),(16,1,1,'2017-10-14',0,'F','no'),(17,1,1,'2017-10-14',0,'F','no'),(18,1,1,'2017-10-14',0,'F','no'),(19,1,1,'2017-10-14',0,'F','no'),(20,1,1,'2017-10-14',0,'F','no'),(21,1,1,'2017-10-14',0,'F','no'),(22,1,1,'2017-10-14',0,'F','no'),(23,1,1,'2017-10-14',0,'F','no'),(24,1,1,'2017-10-14',0,'F','no'),(25,1,1,'2017-10-14',0,'F','no'),(26,1,1,'2017-10-14',0,'F','no'),(27,1,1,'2017-10-14',30,'F','no'),(28,1,1,'2017-10-14',0,'F','no'),(29,1,1,'2017-10-14',0,'F','no'),(30,1,1,'2017-10-14',0,'F','no'),(31,1,1,'2017-10-14',30,'F','no'),(32,1,1,'2017-10-14',0,'F','no'),(33,1,1,'2017-10-14',90,'P','no'),(34,1,1,'2017-10-14',90,'P','no'),(35,1,1,'2017-10-14',100,'P','no'),(36,1,1,'2017-10-14',90,'P','no'),(37,1,1,'2017-10-14',0,'F','no'),(38,1,1,'2017-10-14',80,'P','no'),(39,1,1,'2017-10-14',0,'F','no'),(40,1,1,'2017-10-14',90,'P','no'),(41,1,1,'2017-10-14',60,'P','no'),(43,1,1,'2017-10-14',70,'P','no'),(44,1,1,'2017-10-14',20,'F','no'),(45,1,1,'2017-10-14',30,'F','no'),(46,1,1,'2017-10-14',0,'F','no'),(47,1,1,'2017-10-14',0,'F','no'),(48,1,1,'2017-10-14',0,'F','no'),(49,1,1,'2017-10-14',0,'F','no'),(50,1,1,'2017-10-14',0,'F','no'),(51,1,1,'2017-10-14',0,'F','no'),(52,1,1,'2017-10-14',0,'F','no'),(53,1,1,'2017-10-14',0,'F','no'),(54,1,1,'2017-10-14',0,'F','no'),(55,1,1,'2017-10-14',0,'F','no'),(56,1,1,'2017-10-14',0,'F','no'),(57,1,1,'2017-10-14',0,'F','no'),(58,1,1,'2017-10-14',0,'F','no'),(59,1,1,'2017-10-14',0,'F','no'),(60,1,1,'2017-10-14',0,'F','no'),(61,1,1,'2017-10-14',0,'F','no'),(62,1,1,'2017-10-14',0,'F','no'),(63,1,1,'2017-10-14',0,'F','no'),(64,1,1,'2017-10-14',0,'F','no'),(65,1,1,'2017-10-14',0,'F','no'),(66,1,1,'2017-10-14',0,'F','no'),(67,1,1,'2017-10-14',0,'F','no'),(68,1,1,'2017-10-14',0,'F','no'),(69,1,1,'2017-10-14',0,'F','no'),(70,1,1,'2017-10-14',0,'F','no'),(71,1,1,'2017-10-14',0,'F','no'),(72,1,1,'2017-10-14',0,'F','no'),(73,1,1,'2017-10-14',0,'F','no'),(74,1,1,'2017-10-14',0,'F','no'),(75,1,1,'2017-10-14',0,'F','no'),(76,1,1,'2017-10-14',0,'F','no'),(77,1,1,'2017-10-14',0,'F','no'),(78,1,1,'2017-10-14',90,'P','no'),(79,1,1,'2017-10-14',0,'F','no'),(80,1,1,'2017-10-14',70,'P','no'),(81,1,1,'2017-10-14',90,'P','no'),(83,1,1,'2017-10-14',0,'F','no'),(84,1,1,'2017-10-14',0,'F','no'),(85,1,1,'2017-10-14',0,'F','no'),(86,1,1,'2017-10-14',0,'F','no'),(87,1,1,'2017-10-14',0,'F','no'),(88,1,1,'2017-10-14',0,'F','no'),(89,1,1,'2017-10-14',0,'F','no'),(90,1,1,'2017-10-14',0,'F','no'),(91,1,1,'2017-10-14',0,'F','no'),(92,1,1,'2017-10-14',0,'F','no'),(93,1,1,'2017-10-14',0,'F','no'),(94,1,1,'2017-10-14',0,'F','no'),(95,1,1,'2017-10-14',0,'F','no'),(96,1,1,'2017-10-14',0,'F','no'),(97,1,1,'2017-10-14',0,'F','no'),(98,1,1,'2017-10-14',0,'F','no'),(99,1,1,'2017-10-14',0,'F','no'),(100,1,1,'2017-10-14',0,'F','no'),(101,1,1,'2017-10-14',0,'F','no'),(102,1,1,'2017-10-14',0,'F','no'),(103,1,1,'2017-10-14',0,'F','no'),(104,1,1,'2017-10-14',0,'F','no'),(105,1,1,'2017-10-14',0,'F','no'),(106,1,1,'2017-10-14',0,'F','no'),(107,1,1,'2017-10-14',0,'F','no'),(108,1,1,'2017-10-14',0,'F','no'),(109,1,1,'2017-10-14',0,'F','no'),(110,1,1,'2017-10-14',0,'F','no'),(111,1,1,'2017-10-14',0,'F','no'),(112,1,1,'2017-10-14',0,'F','no'),(113,1,1,'2017-10-14',0,'F','no'),(114,1,1,'2017-10-14',0,'F','no'),(115,1,1,'2017-10-14',0,'F','no'),(116,1,1,'2017-10-14',0,'F','no'),(117,1,1,'2017-10-14',0,'F','no'),(118,1,1,'2017-10-14',0,'F','no'),(119,1,1,'2017-10-14',0,'F','no'),(120,1,1,'2017-10-14',0,'F','no'),(121,1,1,'2017-10-14',0,'F','no'),(122,1,1,'2017-10-14',0,'F','no'),(123,1,1,'2017-10-14',0,'F','no'),(124,1,1,'2017-10-14',0,'F','no'),(125,1,1,'2017-10-14',0,'F','no'),(126,1,1,'2017-10-14',0,'F','no'),(127,1,1,'2017-10-14',0,'F','no'),(128,1,1,'2017-10-14',0,'F','no'),(129,1,1,'2017-10-14',0,'F','no'),(132,1,1,'2017-10-14',90,'P','no'),(133,1,1,'2017-10-14',0,'F','no'),(134,1,1,'2017-10-14',50,'P','no'),(135,1,1,'2017-10-14',0,'F','no'),(136,1,1,'2017-10-14',10,'F','no'),(137,1,1,'2017-10-14',10,'F','no'),(138,1,1,'2017-10-14',100,'P','no'),(139,3,1,'2017-10-14',10,'F','no'),(140,4,1,'2017-10-14',90,'P','no'),(141,4,1,'2017-10-14',70,'P','no'),(142,1,1,'2017-10-14',70,'P','no'),(143,1,1,'2017-10-14',10,'F','no'),(144,1,1,'2017-10-14',0,'F','no'),(145,5,1,'2017-10-14',10,'F','no'),(146,6,1,'2017-10-14',20,'F','no'),(147,8,1,'2017-10-14',50,'P','no'),(148,9,1,'2017-10-14',0,'F','no'),(149,1,1,'2017-10-14',0,'F','no'),(150,1,1,'2017-10-14',0,'F','no'),(151,1,1,'2017-10-14',30,'F','no'),(152,1,1,'2017-10-14',0,'F','no'),(153,1,1,'2017-10-14',0,'F','no'),(154,1,1,'2017-10-14',0,'F','no'),(155,1,1,'2017-10-14',0,'F','no'),(156,1,1,'2017-10-14',0,'F','no'),(157,1,1,'2017-10-14',0,'F','no'),(158,1,1,'2017-10-14',0,'F','no'),(159,11,1,'2017-10-14',0,'F','no'),(160,1,1,'2017-10-14',0,'F','no'),(161,11,1,'2017-10-14',0,'F','no'),(162,1,1,'2017-10-14',0,'F','no'),(163,1,1,'2017-10-14',0,'F','no'),(164,1,1,'2017-10-14',0,'F','no'),(165,15,6,'2017-10-14',0,'F','no'),(166,15,1,'2017-10-14',50,'P','no'),(167,1,1,'2017-10-14',10,'F','no'),(168,17,1,'2017-10-14',40,'F','no'),(169,1,1,'2017-11-04',0,'F','no'),(170,1,1,'2017-11-05',0,'F','no'),(171,1,1,'2017-11-05',0,'F','no'),(172,1,1,'2017-11-05',0,'F','no'),(173,1,1,'2017-11-05',0,'F','no'),(174,1,1,'2017-11-05',0,'F','no'),(175,1,1,'2017-11-05',0,'F','no'),(176,1,1,'2017-11-05',0,'F','no'),(177,1,1,'2017-11-05',0,'F','no'),(178,1,1,'2017-11-05',0,'F','no'),(179,1,1,'2017-11-05',0,'F','no'),(180,1,1,'2017-11-05',0,'F','no'),(181,1,1,'2017-11-05',0,'F','no'),(182,1,1,'2017-11-05',0,'F','no'),(183,1,1,'2017-11-05',0,'F','no'),(184,1,1,'2017-11-05',0,'F','no'),(185,1,1,'2017-11-05',0,'F','no'),(186,1,1,'2017-11-05',0,'F','no'),(187,1,1,'2017-11-05',0,'F','no'),(188,1,1,'2017-11-05',0,'F','no'),(189,1,1,'2017-11-05',0,'F','no'),(190,1,1,'2017-11-09',0,'F','no'),(191,1,1,'2017-11-10',0,'F','no'),(192,1,1,'2017-11-10',0,'F','no'),(193,1,1,'2017-11-13',20,'F','no'),(194,1,1,'2017-11-17',0,'F','no'),(195,1,1,'2017-11-27',0,'F','no'),(196,1,1,'2017-10-14',100,'P','yes'),(197,20,1,'2017-11-29',70,'p','no'),(198,20,6,'2017-11-29',0,'F','no'),(199,21,1,'2017-11-29',0,'F','no'),(200,1,1,'2017-11-29',30,'f','no');
/*!40000 ALTER TABLE `usr_tests` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger certificate_awarded
before insert on usr_tests
for each row
begin
if(NEW.grade='p') then
set NEW.certificate = 'yes';
else
set NEW.certificate = 'no';
end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-29 18:05:18
