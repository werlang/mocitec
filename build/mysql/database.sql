-- MySQL dump 10.13  Distrib 5.7.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: db_mocitec
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.24-MariaDB

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
-- Table structure for table `administrators`
--

DROP TABLE IF EXISTS `administrators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrators` (
                                  `id` int(11) NOT NULL AUTO_INCREMENT,
                                  `name` varchar(255) NOT NULL,
                                  `email` varchar(255) NOT NULL,
                                  `password` varchar(255) NOT NULL,
                                  `mobile` varchar(45) NOT NULL,
                                  `photo` varchar(255) DEFAULT NULL,
                                  `forget` varchar(255) DEFAULT NULL,
                                  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
                                  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
                                  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrators`
--

LOCK TABLES `administrators` WRITE;
/*!40000 ALTER TABLE `administrators` DISABLE KEYS */;
INSERT INTO `administrators` VALUES (1,'Fábio Santos','fabiosantos@ifsul.edu.br','$2y$10$FWtwjAoD.H3RRZbfPZkgneF.5eLNJ92m3dqMtUowzRpQdS6vYViOe','','https://github.com/fabio3268.png',NULL,'2022-09-27 21:00:31','2022-09-28 16:35:34');
/*!40000 ALTER TABLE `administrators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `answers`
--

DROP TABLE IF EXISTS `answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answers` (
                           `id` int(11) NOT NULL AUTO_INCREMENT,
                           `group_id` int(11) NOT NULL,
                           `description` varchar(45) NOT NULL,
                           `value` float(2,1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_answers_types_groups1_idx` (`group_id`),
  CONSTRAINT `fk_answers_types_groups1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answers`
--

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
INSERT INTO `answers` VALUES (1,1,'SIM - 2 PONTOS',2.0),(2,1,'NÃO – ZERO PONTOS',0.0),(6,2,'SIM – 8 PONTOS',8.0),(7,2,'ATENDE PARCIALMENTE – 4 PONTOS',4.0),(8,2,'NÃO – ZERO PONTOS',0.0),(12,4,'ATENDE - 1 PONTO',1.0),(13,4,'PARCIALMENTE - 05 PONTO',0.5),(14,4,'NÃO ATENDE - ZERO PONTO',0.0);
/*!40000 ALTER TABLE `answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `approved_presentials`
--

DROP TABLE IF EXISTS `approved_presentials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `approved_presentials` (
                                        `id` int(11) NOT NULL AUTO_INCREMENT,
                                        `project_id` int(11) NOT NULL,
                                        `stand` varchar(45) DEFAULT NULL,
                                        `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
                                        `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
                                        PRIMARY KEY (`id`),
                                        KEY `fk_approveds_projects1_idx` (`project_id`),
                                        CONSTRAINT `fk_approveds_projects1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `approved_presentials`
--

LOCK TABLES `approved_presentials` WRITE;
/*!40000 ALTER TABLE `approved_presentials` DISABLE KEYS */;
/*!40000 ALTER TABLE `approved_presentials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `approved_virtuals`
--

DROP TABLE IF EXISTS `approved_virtuals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `approved_virtuals` (
                                     `id` int(11) NOT NULL AUTO_INCREMENT,
                                     `project_id` int(11) NOT NULL,
                                     `room_meet` varchar(255) DEFAULT NULL,
                                     `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
                                     `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
                                     PRIMARY KEY (`id`),
                                     KEY `fk_aproved_virtual_projects1_idx` (`project_id`),
                                     CONSTRAINT `fk_aproved_virtual_projects1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `approved_virtuals`
--

LOCK TABLES `approved_virtuals` WRITE;
/*!40000 ALTER TABLE `approved_virtuals` DISABLE KEYS */;
/*!40000 ALTER TABLE `approved_virtuals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authors` (
                           `id` int(11) NOT NULL AUTO_INCREMENT,
                           `role` varchar(255) NOT NULL COMMENT 'advisor\ncoadvisor\nauthor',
                           `status` varchar(255) NOT NULL COMMENT 'registered confirmed',
                           `user_id` int(11) NOT NULL,
                           `project_id` int(11) NOT NULL,
                           PRIMARY KEY (`id`),
                           KEY `fk_submission_projects_idx` (`project_id`),
                           KEY `fk_submission_users1_idx` (`user_id`),
                           CONSTRAINT `fk_submission_projects` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
                           CONSTRAINT `fk_submission_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments_selection`
--

DROP TABLE IF EXISTS `comments_selection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments_selection` (
                                      `id` int(11) NOT NULL AUTO_INCREMENT,
                                      `reviewer_what_id` int(11) NOT NULL,
                                      `strong` text DEFAULT NULL,
                                      `weak` text DEFAULT NULL,
                                      `suggestions` text DEFAULT NULL,
                                      PRIMARY KEY (`id`),
                                      KEY `fk_comments_selection_reviewers_what1_idx` (`reviewer_what_id`),
                                      CONSTRAINT `fk_comments_selection_reviewers_what1` FOREIGN KEY (`reviewer_what_id`) REFERENCES `reviewers_what` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments_selection`
--

LOCK TABLES `comments_selection` WRITE;
/*!40000 ALTER TABLE `comments_selection` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments_selection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events` (
                          `id` int(11) NOT NULL AUTO_INCREMENT,
                          `name` varchar(255) NOT NULL,
                          `coord` varchar(255) NOT NULL,
                          `signature_coord` varchar(255) DEFAULT NULL,
                          `principal` varchar(255) NOT NULL,
                          `signature_principal` varchar(255) DEFAULT NULL,
                          `begin` date DEFAULT NULL,
                          `end` date DEFAULT NULL,
                          `submission_begin` date DEFAULT NULL,
                          `subimission_end` date DEFAULT NULL,
                          `registration_reviewers_begin` date DEFAULT NULL,
                          `registration_reviewers_end` date DEFAULT NULL,
                          `created_at` timestamp NULL DEFAULT current_timestamp(),
                          `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
                          PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (1,'MOCITEC 2023','',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-09-27 20:22:10',NULL);
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fields` (
                          `id` int(11) NOT NULL AUTO_INCREMENT,
                          `description` varchar(255) NOT NULL,
                          PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
INSERT INTO `fields` VALUES (1,'Matemática e suas tecnologias - Ciências da Natureza e suas tecnologias'),(2,'Ciências Humanas e suas tecnologias - Linguagens, códigos e suas tecnologias'),(3,'Ciências Exatas e Biológicas'),(4,'Ciências Humanas, Comportamentais, Linguagens e Artes'),(5,'Engenharias'),(6,'Informática'),(7,'Meio Ambiente');
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
                          `id` int(11) NOT NULL AUTO_INCREMENT,
                          `description` varchar(255) NOT NULL,
                          `total` int(11) NOT NULL COMMENT 'Total de pontos no grupo.',
                          PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,'AVALIAÇÃO DO ESTANDE (MÁXIMO 8 PONTOS)',8),(2,'APRESENTAÇÃO ORAL (MÁXIMO 32 PONTOS)',32),(3,'AVALIAÇÃO GERAL DO TRABALHO (MÁXIMO 60 PONTOS)',40),(4,'SELEÇÃO',10);
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `levels`
--

DROP TABLE IF EXISTS `levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `levels` (
                          `id` int(11) NOT NULL AUTO_INCREMENT,
                          `description` varchar(255) NOT NULL,
                          PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `levels`
--

LOCK TABLES `levels` WRITE;
/*!40000 ALTER TABLE `levels` DISABLE KEYS */;
INSERT INTO `levels` VALUES (1,'Ensino Fundamental'),(2,'Ensino Médio'),(3,'Ensino Médio Integrado e Técnico de Nível Médio'),(4,'Ensino Superior e Pós-Graduação');
/*!40000 ALTER TABLE `levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `levels_has_fields`
--

DROP TABLE IF EXISTS `levels_has_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `levels_has_fields` (
                                     `id` int(11) NOT NULL AUTO_INCREMENT,
                                     `level_id` int(11) NOT NULL,
                                     `field_id` int(11) NOT NULL,
                                     PRIMARY KEY (`id`),
                                     KEY `fk_levels_has_fields_fields1_idx` (`field_id`),
                                     KEY `fk_levels_has_fields_levels1_idx` (`level_id`),
                                     CONSTRAINT `fk_levels_has_fields_fields1` FOREIGN KEY (`field_id`) REFERENCES `fields` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
                                     CONSTRAINT `fk_levels_has_fields_levels1` FOREIGN KEY (`level_id`) REFERENCES `levels` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `levels_has_fields`
--

LOCK TABLES `levels_has_fields` WRITE;
/*!40000 ALTER TABLE `levels_has_fields` DISABLE KEYS */;
INSERT INTO `levels_has_fields` VALUES (1,1,1),(2,1,2),(3,2,1),(4,2,2),(5,3,3),(6,3,4),(7,3,5),(8,3,6),(9,3,7),(10,4,1),(11,4,2);
/*!40000 ALTER TABLE `levels_has_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects` (
                            `id` int(11) NOT NULL AUTO_INCREMENT,
                            `title` text NOT NULL,
                            `abstract` text NOT NULL,
                            `user_id` int(11) NOT NULL,
                            `event_id` int(11) NOT NULL,
                            `level_id` int(11) NOT NULL,
                            `field_id` int(11) NOT NULL,
                            `keyword_01` varchar(255) NOT NULL,
                            `keyword_02` varchar(255) NOT NULL,
                            `keyword_03` varchar(255) NOT NULL,
                            `modality` char(1) NOT NULL DEFAULT 'P' COMMENT 'P - Presencial\nV - Virtual ',
                            `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
                            `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
                            PRIMARY KEY (`id`),
                            KEY `fk_projects_users1_idx` (`user_id`),
                            KEY `fk_projects_event1_idx` (`event_id`),
                            KEY `fk_projects_levels1_idx` (`level_id`),
                            KEY `fk_projects_fields1_idx` (`field_id`),
                            CONSTRAINT `fk_projects_event1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
                            CONSTRAINT `fk_projects_fields1` FOREIGN KEY (`field_id`) REFERENCES `fields` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
                            CONSTRAINT `fk_projects_levels1` FOREIGN KEY (`level_id`) REFERENCES `levels` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
                            CONSTRAINT `fk_projects_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (1,'Titulo projeto 10 Titulo projeto 10 Titulo projeto 10 Titulo projeto 10 ','Resumo do projeto 10',2,1,2,2,'Palavra 01','Palavra 02','Palavra 03','P','2022-09-27 20:28:36','2022-11-14 11:54:26'),(2,'Titulo projeto 11 Titulo projeto 11 Titulo projeto 11','Resumo do projeto 11',2,1,3,3,'Palavra 01','Palavra 02','Palavra 03','P','2022-09-27 20:47:13','2022-09-28 23:59:00'),(3,'Titulo projeto 12 Titulo projeto 12 Titulo projeto 12 Titulo projeto 12 Titulo projeto 12','Resumo do projeto 12',2,1,3,3,'Palavra 01','Palavra 02','Palavra 03','P','2022-09-28 12:25:30','2022-09-28 23:59:00'),(4,'Titulo projeto 14 Titulo projeto 14 Titulo projeto 14','Resumo do projeto 14',2,1,2,2,'Palavra 01','Palavra 01','Palavra 01','P','2022-10-10 13:25:10','2022-11-14 11:54:26'),(5,'Titulo projeto 15 Titulo projeto 15 Titulo projeto 15','Resumo do projeto 15',2,1,3,3,'Palavra 01','Palavra 01','Palavra 01','P','2022-10-11 20:07:42','2022-10-11 20:11:29'),(6,'Titulo projeto 16 Titulo projeto 16 Titulo projeto 16','Resumo do projeto 16',2,1,3,4,'Palavra 01','Palavra 01','Palavra 01','P','2022-10-11 20:07:42','2022-10-11 20:17:01'),(7,'Titulo projeto 17 Titulo projeto 17 Titulo projeto 18','Resumo do projeto 17',2,1,3,7,'Palavra 01','Palavra 01','Palavra 01','P','2022-10-11 20:17:01','2022-10-24 12:51:03'),(8,'Titulo projeto 17 Titulo projeto 17 Titulo projeto 19','Resumo do projeto 17',2,1,2,2,'Palavra 01','Palavra 01','Palavra 01','P','2022-10-24 12:51:03','2022-11-14 11:54:26'),(9,'Titulo projeto 17 Titulo projeto 17 Titulo projeto 20','Resumo do projeto 17',2,1,2,2,'Palavra 01','Palavra 01','Palavra 01','P','2022-10-24 12:51:03','2022-11-14 11:54:26'),(10,'Titulo projeto 17 Titulo projeto 17 Titulo projeto 21','Resumo do projeto 17',2,1,2,2,'Palavra 01','Palavra 01','Palavra 01','P','2022-10-24 12:51:03','2022-11-14 11:54:26'),(11,'Titulo projeto 17 Titulo projeto 17 Titulo projeto 22','Resumo do projeto 17',2,1,2,2,'Palavra 01','Palavra 01','Palavra 01','P','2022-10-24 12:51:03','2022-11-14 11:54:26'),(12,'Projeto 01 - Alterado teste','Abstract 01 - Alterado',2,1,1,1,'Palavra 01 - Alterada','Palavra 02 - Alterada','Palavra 03 - Alterada','P','2022-10-24 18:55:03','2022-11-09 13:59:09'),(13,'Titulo projeto 23','Resumo',2,1,1,1,'','','','P','2022-10-24 18:55:03',NULL),(14,'Titulo projeto 24','Resumo',2,1,1,1,'','','','P','2022-10-24 18:55:03',NULL),(15,'Titulo projeto 25','Resumo',2,1,1,1,'','','','P','2022-10-24 18:55:03',NULL),(16,'Titulo projeto 26','Resumo',2,1,2,2,'','','','P','2022-10-24 18:55:03','2022-11-14 11:54:26'),(17,'Titulo projeto 27','Resumo',2,1,1,2,'','','','P','2022-10-24 18:55:03',NULL),(18,'Titulo projeto 28','Resumo',2,1,1,1,'','','','P','2022-10-24 18:55:03',NULL),(19,'Titulo projeto 29','Resumo',2,1,2,1,'','','','P','2022-10-24 18:55:03','2022-11-14 12:04:33'),(20,'Titulo projeto 30','Resumo',2,1,2,1,'','','','P','2022-10-24 18:55:03','2022-11-14 12:04:33'),(21,'Titulo projeto 31','Resumo',2,1,2,1,'','','','P','2022-10-24 18:55:03','2022-11-14 12:04:33'),(22,'Titulo projeto 32','Resumo',2,1,2,1,'','','','P','2022-10-24 18:55:03','2022-11-14 12:04:33'),(23,'Titulo projeto 40','Resumo do projeto 40',2,1,2,1,'Palavra 01','Palavra 02','Palavra 03','P','2022-11-09 14:00:54','2022-11-14 12:04:33');
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions` (
                             `id` int(11) NOT NULL AUTO_INCREMENT,
                             `group_id` int(11) NOT NULL,
                             `description` varchar(255) NOT NULL,
                             `weight` decimal(10,0) NOT NULL,
                             `type` char(1) NOT NULL COMMENT 'S Selectio E Evaluation',
                             PRIMARY KEY (`id`),
                             KEY `fk_questions_groups1_idx` (`group_id`),
                             CONSTRAINT `fk_questions_groups1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (1,1,'O ESTANDE ESTÁ DEVIDAMENTE ORGANIZADO E LIMPO?',2,'R'),(2,1,'NO ESTANDE HÁ CADERNO DE CAMPO OU OUTROS REGISTROS QUE EVIDENCIAM OS PASSOS SEGUIDOS NA CONDUÇÃO DA PESQUISA?',3,'R'),(3,1,'NO ESTANDE HÁ BANNER/PÔSTER DE APRESENTAÇÃO DO PROJETO?',3,'R'),(4,2,'DURANTE O DESENVOLVIMENTO DA APRESENTAÇÃO, O(S) ESTUDANTE(S) FEZ/FIZERAM SUA EXPOSIÇÃO DE MODO LÓGICO E ORGANIZADO?',8,'R'),(5,2,'HÁ CONSISTÊNCIA ENTRE A APRESENTAÇÃO E OS DOCUMENTOS DA PESQUISA (BANNER/PÔSTER, CADERNO DE CAMPO, ETC.)?',8,'R'),(6,2,'AO FINAL DA APRESENTAÇÃO FAZ UMA SÍNTESE E APONTA ATIVIDADES FUTURAS?',8,'R'),(7,2,'O(S) ESTUDANTE(S) APRESENTA(M) DESENVOLTURA E PRECISÃO AO RESPONDER(EM) AOS QUESTIONAMENTOS DO AVALIADOR?',8,'R'),(8,4,'Configura projeto de pesquisa ou inovação',1,'S'),(9,4,'Configura projeto de pesquisa ou inovação',1,'S'),(10,4,'O problema de pesquisa foi evidenciado',1,'S'),(11,4,'O trabalho destaca sua relevância',1,'S'),(12,4,'Os objetivos são claros e coerentes',1,'S'),(13,4,'Apresenta fundamentação teórica adequada',1,'S'),(14,4,'A metodologia está alinhada ao trabalho',1,'S'),(15,4,'O texto do resumo segue as orientações do evento',1,'S'),(16,4,'Os resultados parciais ou finais apresentados são coerentes com os objetivos e metodologia descritos pelos autores',1,'S'),(17,4,'Resumo evidencia o protagonismo dos estudantes na realização da pesquisa',1,'S');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviewer_questions`
--

DROP TABLE IF EXISTS `reviewer_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviewer_questions` (
                                      `id` int(11) NOT NULL AUTO_INCREMENT,
                                      `reviewer_what_id` int(11) NOT NULL,
                                      `question_id` int(11) NOT NULL,
                                      `answer_id` int(11) NOT NULL,
                                      `value` float(2,1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_reviewer_questions_reviewers_what1_idx` (`reviewer_what_id`),
  KEY `fk_reviewer_questions_questions1_idx` (`question_id`),
  KEY `fk_reviewer_questions_answers1_idx` (`answer_id`),
  CONSTRAINT `fk_reviewer_questions_answers1` FOREIGN KEY (`answer_id`) REFERENCES `answers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_reviewer_questions_questions1` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_reviewer_questions_reviewers_what1` FOREIGN KEY (`reviewer_what_id`) REFERENCES `reviewers_what` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviewer_questions`
--

LOCK TABLES `reviewer_questions` WRITE;
/*!40000 ALTER TABLE `reviewer_questions` DISABLE KEYS */;
INSERT INTO `reviewer_questions` VALUES (1,6,1,1,2.0),(2,6,2,1,2.0),(3,6,3,2,0.0),(5,17,8,12,1.0),(6,17,9,12,1.0),(7,17,10,13,0.5),(9,17,11,12,2.0),(11,17,12,13,0.5);
/*!40000 ALTER TABLE `reviewer_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviewers`
--

DROP TABLE IF EXISTS `reviewers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviewers` (
                             `id` int(11) NOT NULL AUTO_INCREMENT,
                             `name` varchar(255) NOT NULL,
                             `email` varchar(255) NOT NULL,
                             `password` varchar(255) NOT NULL,
                             `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
                             `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
                             PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviewers`
--

LOCK TABLES `reviewers` WRITE;
/*!40000 ALTER TABLE `reviewers` DISABLE KEYS */;
INSERT INTO `reviewers` VALUES (1,'Avaliador 01','avaliador01@gmail.com','$2y$10$A7ve6stfTTQw9nX8lRMXZOGvnyFWIyQZew.Ovhe8YEDdlCC38lT0K','2022-11-29 01:12:08',NULL),(2,'Avaliador 02','avaliador02@gmail.com','$2y$10$/SJu9kInec/6eFaxnmMFIOhaeWtD5Xv.C5uxG5izuWgCLyLGeGleS','2022-11-29 01:12:26',NULL),(3,'Avaliador 03','avaliador03@gmail.com','$2y$10$DvJIu.R3aS/l3sYf8SYem.KysA/xNrMzISaUsyWq960/wI4su7Yne','2022-11-29 01:12:33',NULL),(4,'Avaliador 04','avaliador04@gmail.com','$2y$10$HVYcnpxtgV1mbNiKFJPA/OHgx27K5h3ZUh3fXdlxDb48jp7wrt8/G','2022-11-29 01:12:39',NULL),(5,'Avaliador 05','avaliador05@gmail.com','$2y$10$MJ4AzDn181/h3FLUlrEw0eTjM5vDyrW29aMelbGyKNf1Z2JHH0XB6','2022-11-29 01:12:46',NULL),(6,'Avaliador 06','avaliador06@gmail.com','$2y$10$VNNF80glmirUBdpMQfREDuccbj/lwnrTq32gP8S3yIY/LJLXjyW5.','2022-11-29 01:12:53',NULL),(7,'Avaliador 07','avaliador07@gmail.com','$2y$10$oRt9BuYHjUDj3jD9KchVr.9xFzwuNGaB3JTJRqKd1qsb/E3s9hhA6','2022-11-29 01:16:29',NULL),(8,'Avaliador 08','avaliador08@gmail.com','$2y$10$D6nCrnyEEODZbGbOGA1qvO98/.x8AHXcAdVeH7EDRUwipV5DuO.wy','2022-11-29 01:16:46',NULL),(9,'Avaliador 09','avaliador09@gmail.com','$2y$10$ZRSl10wQeWUbtKln5jOK6.0GkqyvLZmx3/S5Q9OdgEM0Snv.Zodze','2022-11-29 01:16:54',NULL),(10,'Avaliador 10','avaliador10@gmail.com','$2y$10$7eIpJ.2MyGu6OrSTcqI98O9SPuBJdaTm6/D4JNyoWkMuUaGMugcku','2022-11-29 01:17:08',NULL);
/*!40000 ALTER TABLE `reviewers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviewers_how`
--

DROP TABLE IF EXISTS `reviewers_how`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviewers_how` (
                                 `id` int(11) NOT NULL AUTO_INCREMENT,
                                 `event_id` int(11) NOT NULL,
                                 `reviewer_id` int(11) NOT NULL,
                                 `level_id` int(11) NOT NULL,
                                 `field_id` int(11) NOT NULL,
                                 `type` char(1) NOT NULL,
                                 PRIMARY KEY (`id`),
                                 KEY `fk_reviewers_how_events1_idx` (`event_id`),
                                 KEY `fk_reviewers_how_reviewers1_idx` (`reviewer_id`),
                                 KEY `fk_reviewers_how_levels1_idx` (`level_id`),
                                 KEY `fk_reviewers_how_fields1_idx` (`field_id`),
                                 CONSTRAINT `fk_reviewers_how_events1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
                                 CONSTRAINT `fk_reviewers_how_fields1` FOREIGN KEY (`field_id`) REFERENCES `fields` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
                                 CONSTRAINT `fk_reviewers_how_levels1` FOREIGN KEY (`level_id`) REFERENCES `levels` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
                                 CONSTRAINT `fk_reviewers_how_reviewers1` FOREIGN KEY (`reviewer_id`) REFERENCES `reviewers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviewers_how`
--

LOCK TABLES `reviewers_how` WRITE;
/*!40000 ALTER TABLE `reviewers_how` DISABLE KEYS */;
INSERT INTO `reviewers_how` VALUES (1,1,1,1,1,'S'),(2,1,1,1,2,'S'),(3,1,2,1,1,'S'),(4,1,2,1,2,'S'),(5,1,3,1,1,'S'),(6,1,4,1,1,'S'),(7,1,5,1,2,'S'),(8,1,6,1,2,'S'),(9,1,7,1,1,'S'),(10,1,7,1,2,'S'),(11,1,8,1,1,'S'),(12,1,8,1,2,'S');
/*!40000 ALTER TABLE `reviewers_how` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviewers_what`
--

DROP TABLE IF EXISTS `reviewers_what`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviewers_what` (
                                  `id` int(11) NOT NULL AUTO_INCREMENT,
                                  `reviewer_id` int(11) NOT NULL,
                                  `project_id` int(11) NOT NULL,
                                  `type` char(1) NOT NULL,
                                  PRIMARY KEY (`id`),
                                  KEY `fk_reviewers_what_reviewers1_idx` (`reviewer_id`),
                                  KEY `fk_reviewers_what_projects1_idx` (`project_id`),
                                  CONSTRAINT `fk_reviewers_what_projects1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
                                  CONSTRAINT `fk_reviewers_what_reviewers1` FOREIGN KEY (`reviewer_id`) REFERENCES `reviewers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviewers_what`
--

LOCK TABLES `reviewers_what` WRITE;
/*!40000 ALTER TABLE `reviewers_what` DISABLE KEYS */;
INSERT INTO `reviewers_what` VALUES (6,1,12,'S'),(7,2,12,'S'),(8,3,13,'S'),(9,4,13,'S'),(10,7,14,'S'),(11,8,14,'S'),(12,1,15,'S'),(13,2,18,'S'),(14,8,15,'S'),(15,7,18,'S'),(16,4,14,'S'),(17,4,15,'S');
/*!40000 ALTER TABLE `reviewers_what` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
                         `id` int(11) NOT NULL AUTO_INCREMENT,
                         `name` varchar(255) NOT NULL,
                         `email` varchar(255) DEFAULT NULL,
                         `mobile` varchar(255) DEFAULT NULL,
                         `password` varchar(255) DEFAULT NULL,
                         `status` varchar(255) DEFAULT 'registred' COMMENT 'registered confirmed',
                         `forget` varchar(255) DEFAULT NULL,
                         `document` varchar(255) DEFAULT NULL,
                         `photo` varchar(255) DEFAULT NULL,
                         `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
                         `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
                         PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'F&aacute;bio Lu&iacute;s da Silva Santos','fabiosantos@ifsul.edu.br','(51) 98156-9999','$2y$10$FWtwjAoD.H3RRZbfPZkgneF.5eLNJ92m3dqMtUowzRpQdS6vYViOe','registred',NULL,NULL,NULL,'2022-09-27 20:16:36','2022-11-09 13:25:46'),(3,'Fábio Luís da Silva Santos 02','fabiosantos02@ifsul.edu.br',NULL,'$2y$10$gAlupBsKuLpgKvfLCX8MZ.Wwjeb1tgxaGs.D/oP8pxkD/Ll/6vv6S','registred',NULL,NULL,NULL,'2022-09-27 20:17:09',NULL),(4,'Fábio Luís da Silva Santos 02','fabiosantos10@ifsul.edu.br',NULL,'$2y$10$E0GvOiOVtLGeRUqq/NCbG.CmMzI6yIgTkmNv.0maqaEC3AhI9eabm','registred',NULL,NULL,NULL,'2022-11-09 13:26:01',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `vw_projects`
--

DROP TABLE IF EXISTS `vw_projects`;
/*!50001 DROP VIEW IF EXISTS `vw_projects`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_projects` AS SELECT
 1 AS `id`,
 1 AS `title`,
 1 AS `abstract`,
 1 AS `user_id`,
 1 AS `event_id`,
 1 AS `level_id`,
 1 AS `field_id`,
 1 AS `keyword_01`,
 1 AS `keyword_02`,
 1 AS `keyword_03`,
 1 AS `modality`,
 1 AS `created_at`,
 1 AS `updated_at`,
 1 AS `field`,
 1 AS `level`,
 1 AS `name`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'db_mocitec'
--

--
-- Dumping routines for database 'db_mocitec'
--

--
-- Final view structure for view `vw_projects`
--

/*!50001 DROP VIEW IF EXISTS `vw_projects`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_projects` AS select `projects`.`id` AS `id`,`projects`.`title` AS `title`,`projects`.`abstract` AS `abstract`,`projects`.`user_id` AS `user_id`,`projects`.`event_id` AS `event_id`,`projects`.`level_id` AS `level_id`,`projects`.`field_id` AS `field_id`,`projects`.`keyword_01` AS `keyword_01`,`projects`.`keyword_02` AS `keyword_02`,`projects`.`keyword_03` AS `keyword_03`,`projects`.`modality` AS `modality`,`projects`.`created_at` AS `created_at`,`projects`.`updated_at` AS `updated_at`,`f`.`description` AS `field`,`l`.`description` AS `level`,`e`.`name` AS `name` from (((`projects` join `levels` `l` on(`l`.`id` = `projects`.`level_id`)) join `fields` `f` on(`f`.`id` = `projects`.`field_id`)) join `events` `e` on(`e`.`id` = `projects`.`event_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-29  2:27:39
