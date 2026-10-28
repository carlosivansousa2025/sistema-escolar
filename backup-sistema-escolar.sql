-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: sistema_escolar_laravel
-- ------------------------------------------------------
-- Server version	8.0.46

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `sistema_escolar_laravel`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `sistema_escolar_laravel` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `sistema_escolar_laravel`;

--
-- Table structure for table `administrativo`
--

DROP TABLE IF EXISTS `administrativo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administrativo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_pessoa` int NOT NULL,
  `id_escola` int NOT NULL,
  `id_cargo` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_pessoa_fk` (`id_pessoa`),
  KEY `id_escola_fk` (`id_escola`),
  KEY `id_cargo_fk` (`id_cargo`),
  CONSTRAINT `id_cargo_fk` FOREIGN KEY (`id_cargo`) REFERENCES `cargo` (`id`),
  CONSTRAINT `id_escola_fk` FOREIGN KEY (`id_escola`) REFERENCES `escola` (`id`),
  CONSTRAINT `id_pessoa_fk` FOREIGN KEY (`id_pessoa`) REFERENCES `pessoa` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrativo`
--

LOCK TABLES `administrativo` WRITE;
/*!40000 ALTER TABLE `administrativo` DISABLE KEYS */;
INSERT INTO `administrativo` VALUES (1,1,1,1),(2,2,2,2),(3,3,3,3),(4,4,4,4),(5,5,5,5),(6,6,6,6),(7,7,7,7),(8,8,8,8),(9,9,9,9),(10,10,10,1);
/*!40000 ALTER TABLE `administrativo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aluno`
--

DROP TABLE IF EXISTS `aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aluno` (
  `id` int NOT NULL AUTO_INCREMENT,
  `registro` varchar(20) NOT NULL,
  `id_pessoa` int NOT NULL,
  `id_escola` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_aln_pessoa_fk` (`id_pessoa`),
  KEY `id_aln_escola_fk` (`id_escola`),
  CONSTRAINT `id_aln_escola_fk` FOREIGN KEY (`id_escola`) REFERENCES `escola` (`id`),
  CONSTRAINT `id_aln_pessoa_fk` FOREIGN KEY (`id_pessoa`) REFERENCES `pessoa` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno`
--

LOCK TABLES `aluno` WRITE;
/*!40000 ALTER TABLE `aluno` DISABLE KEYS */;
INSERT INTO `aluno` VALUES (1,'ALU001',1,1),(2,'ALU002',2,2),(3,'ALU003',3,3),(4,'ALU004',4,4),(5,'ALU005',5,5),(6,'ALU006',6,6),(7,'ALU007',7,7),(8,'ALU008',8,8),(9,'ALU009',9,9),(10,'ALU010',10,10),(11,'ALU011',11,1),(12,'ALU012',12,2),(13,'ALU013',13,3),(14,'ALU014',14,4),(15,'ALU015',15,5),(16,'ALU016',16,6),(17,'ALU017',17,7),(18,'ALU018',18,8),(19,'ALU019',19,9),(20,'ALU020',20,10),(21,'ALU021',21,1),(22,'ALU022',22,2),(23,'ALU023',23,3),(24,'ALU024',24,4),(25,'ALU025',25,5),(26,'ALU026',26,6),(27,'ALU027',27,7),(28,'ALU028',28,8),(29,'ALU029',29,9),(30,'ALU030',30,10),(31,'ALU001',1,1),(32,'ALU002',2,2),(33,'ALU003',3,3),(34,'ALU004',4,4),(35,'ALU005',5,5),(36,'ALU006',6,6),(37,'ALU007',7,7),(38,'ALU008',8,8),(39,'ALU009',9,9),(40,'ALU010',10,10),(41,'ALU011',11,1),(42,'ALU012',12,2),(43,'ALU013',13,3),(44,'ALU014',14,4),(45,'ALU015',15,5),(46,'ALU016',16,6),(47,'ALU017',17,7),(48,'ALU018',18,8),(49,'ALU019',19,9),(50,'ALU020',20,10),(51,'ALU021',21,1),(52,'ALU022',22,2),(53,'ALU023',23,3),(54,'ALU024',24,4),(55,'ALU025',25,5),(56,'ALU026',26,6),(57,'ALU027',27,7),(58,'ALU028',28,8),(59,'ALU029',29,9),(60,'ALU030',30,10);
/*!40000 ALTER TABLE `aluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aluno_curso`
--

DROP TABLE IF EXISTS `aluno_curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aluno_curso` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_aluno` int NOT NULL,
  `id_curso` int NOT NULL,
  `progresso` decimal(10,2) DEFAULT NULL,
  `status` int DEFAULT '0',
  `nota` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_aluno` (`id_aluno`),
  KEY `id_curso` (`id_curso`),
  CONSTRAINT `aluno_curso_ibfk_1` FOREIGN KEY (`id_aluno`) REFERENCES `aluno` (`id`),
  CONSTRAINT `aluno_curso_ibfk_2` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno_curso`
--

LOCK TABLES `aluno_curso` WRITE;
/*!40000 ALTER TABLE `aluno_curso` DISABLE KEYS */;
INSERT INTO `aluno_curso` VALUES (1,1,1,20.50,0,7.50),(2,2,1,50.00,1,8.00),(3,3,2,10.00,0,6.00),(4,4,2,75.00,1,9.50),(5,5,3,30.00,0,7.00),(6,6,3,100.00,1,10.00),(7,7,4,45.00,0,8.50),(8,8,4,80.00,1,9.00),(9,9,5,15.00,0,6.50),(10,10,5,65.00,1,8.50),(11,11,6,25.00,0,7.00),(12,12,6,90.00,1,9.00),(13,13,7,40.00,0,7.50),(14,14,7,85.00,1,9.50),(15,15,8,5.00,0,5.50),(16,16,8,95.00,1,10.00),(17,17,9,50.00,0,8.00),(18,18,9,100.00,1,10.00),(19,19,10,20.00,0,7.00),(20,20,10,60.00,1,8.50),(21,21,11,15.00,0,6.50),(22,22,11,85.00,1,9.50),(23,23,12,35.00,0,7.50),(24,24,12,70.00,1,8.00),(25,25,13,45.00,0,7.50),(26,26,13,100.00,1,10.00),(27,27,14,25.00,0,7.00),(28,28,14,90.00,1,9.50),(29,29,15,5.00,0,5.50),(30,30,15,75.00,1,8.50);
/*!40000 ALTER TABLE `aluno_curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aluno_disciplina`
--

DROP TABLE IF EXISTS `aluno_disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aluno_disciplina` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_aluno` int NOT NULL,
  `id_disciplina` int NOT NULL,
  `status` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id_aluno` (`id_aluno`),
  KEY `id_disciplina` (`id_disciplina`),
  CONSTRAINT `aluno_disciplina_ibfk_1` FOREIGN KEY (`id_aluno`) REFERENCES `aluno` (`id`),
  CONSTRAINT `aluno_disciplina_ibfk_2` FOREIGN KEY (`id_disciplina`) REFERENCES `disciplina` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno_disciplina`
--

LOCK TABLES `aluno_disciplina` WRITE;
/*!40000 ALTER TABLE `aluno_disciplina` DISABLE KEYS */;
INSERT INTO `aluno_disciplina` VALUES (1,1,1,0),(2,2,2,1),(3,3,3,0),(4,4,4,1),(5,5,5,0),(6,6,6,1),(7,7,7,0),(8,8,8,1),(9,9,9,0),(10,10,10,1),(11,11,11,0),(12,12,12,1),(13,13,13,0),(14,14,14,1),(15,15,15,0),(16,16,16,1),(17,17,17,0),(18,18,18,1),(19,19,19,0),(20,20,20,1),(21,21,21,0),(22,22,22,1),(23,23,23,0),(24,24,24,1),(25,25,25,0),(26,26,26,1),(27,27,27,0),(28,28,28,1),(29,29,29,0),(30,30,30,1);
/*!40000 ALTER TABLE `aluno_disciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aluno_turma`
--

DROP TABLE IF EXISTS `aluno_turma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aluno_turma` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_turma` int NOT NULL,
  `id_aluno` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_turma` (`id_turma`),
  KEY `id_aluno` (`id_aluno`),
  CONSTRAINT `aluno_turma_ibfk_1` FOREIGN KEY (`id_turma`) REFERENCES `turma` (`id`),
  CONSTRAINT `aluno_turma_ibfk_2` FOREIGN KEY (`id_aluno`) REFERENCES `aluno` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno_turma`
--

LOCK TABLES `aluno_turma` WRITE;
/*!40000 ALTER TABLE `aluno_turma` DISABLE KEYS */;
INSERT INTO `aluno_turma` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),(6,6,6),(7,7,7),(8,8,8),(9,9,9),(10,10,10),(11,1,11),(12,2,12),(13,3,13),(14,4,14),(15,5,15),(16,6,16),(17,7,17),(18,8,18),(19,9,19),(20,10,20),(21,1,21),(22,2,22),(23,3,23),(24,4,24),(25,5,25);
/*!40000 ALTER TABLE `aluno_turma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` bigint NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` bigint NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_locks_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cargo`
--

DROP TABLE IF EXISTS `cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cargo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `descricao` text NOT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `status` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargo`
--

LOCK TABLES `cargo` WRITE;
/*!40000 ALTER TABLE `cargo` DISABLE KEYS */;
INSERT INTO `cargo` VALUES (1,'Diretor Executivo','Responsável pela administração geral da escola, tomando decisões e supervisionando o funcionamento de todas as áreas a fins',NULL,'2026-10-01',1),(2,'Vice-Diretor','Auxilia o diretor nas tarefas administrativas e gerencia a escola na ausência do diretor.',NULL,NULL,1),(3,'Coordenador Pedagógico','Responsável pela orientação pedagógica, apoiando professores e alunos no processo de ensino-aprendizagem.',NULL,NULL,1),(4,'Secretário Escolar','Organiza e mantém os registros escolares, além de atender alunos, pais e responsáveis na secretaria.',NULL,NULL,1),(5,'Inspetor de Alunos','Supervisiona os alunos durante o intervalo e nas dependências da escola para manter a disciplina e segurança.',NULL,NULL,1),(6,'Recepcionista','Atende ao público na entrada da escola, auxiliando com informações e direcionamento.',NULL,NULL,1),(7,'Orientador Educacional','Acompanha o desenvolvimento dos alunos e oferece suporte psicológico e emocional.',NULL,NULL,1),(8,'Auxiliar de Serviços Gerais','Responsável pela limpeza e organização dos ambientes escolares.',NULL,NULL,1),(9,'Bibliotecário','Organiza o acervo de livros e materiais da biblioteca e auxilia alunos e professores na consulta e pesquisa.',NULL,NULL,1),(10,'Auxiliar de Joalheiro','Criar produtos nobres em ouro 18 kilates','2026-09-30','2026-09-30',1);
/*!40000 ALTER TABLE `cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conteudo`
--

DROP TABLE IF EXISTS `conteudo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conteudo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(150) NOT NULL,
  `descricao` varchar(200) NOT NULL,
  `status` int DEFAULT '0',
  `observacao` text,
  `id_disciplina` int NOT NULL,
  `id_tipo` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_disciplina` (`id_disciplina`),
  KEY `id_tipo` (`id_tipo`),
  CONSTRAINT `conteudo_ibfk_1` FOREIGN KEY (`id_disciplina`) REFERENCES `disciplina` (`id`),
  CONSTRAINT `conteudo_ibfk_2` FOREIGN KEY (`id_tipo`) REFERENCES `tipo_conteudo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conteudo`
--

LOCK TABLES `conteudo` WRITE;
/*!40000 ALTER TABLE `conteudo` DISABLE KEYS */;
INSERT INTO `conteudo` VALUES (1,'Introdução à Programação','Material básico sobre lógica de programação.',1,'Inclui exemplos e exercícios.',1,2),(2,'Apostila de Algoritmos','PDF com explicação detalhada de algoritmos.',1,'Revisão atualizada.',1,3),(3,'Vídeo: Estruturas Condicionais','Vídeo explicativo sobre if, else e switch.',1,NULL,2,2),(4,'Planilha de Exercícios','Planilha com exercícios práticos sobre loops.',1,NULL,2,5),(5,'Banco de Dados Relacionais','Slides sobre conceitos de banco de dados.',1,'Acompanhados de exercícios.',3,6),(6,'Guia SQL','PDF com comandos básicos e avançados de SQL.',1,NULL,3,3),(7,'Cálculo Diferencial','Apostila introdutória ao cálculo.',1,NULL,4,3),(8,'Vídeo: Integrais','Vídeo didático sobre o conceito de integrais.',1,NULL,4,2),(9,'Introdução à Física','Material sobre conceitos básicos de física.',1,NULL,5,2),(10,'Experimentos Físicos','PDF com propostas de experimentos.',1,NULL,5,3),(11,'Química Geral','Slides sobre química inorgânica e orgânica.',1,NULL,6,6),(12,'Tabela Periódica Interativa','Planilha com elementos da tabela periódica.',1,NULL,6,5),(13,'Biologia Molecular','PDF sobre os fundamentos de biologia molecular.',1,NULL,7,3),(14,'Vídeo: Células e Organismos','Vídeo explicativo sobre células.',1,NULL,7,2),(15,'História do Brasil','Material sobre os principais eventos históricos.',1,NULL,8,3),(16,'Geografia Política','Slides sobre divisões políticas do mundo.',1,NULL,9,6),(17,'Mapa Econômico do Brasil','PDF com dados econômicos regionais.',1,NULL,9,3),(18,'Linguagem e Literatura','Vídeo sobre análise literária.',1,NULL,10,2),(19,'Gramática Avançada','Documento do Word com exercícios.',1,NULL,10,4),(20,'Inglês para Iniciantes','PDF com lições básicas de inglês.',1,NULL,11,3),(21,'Audio: Pronúncia Básica','Áudio para praticar pronúncia inicial.',1,NULL,11,1),(22,'Programação Avançada','PDF sobre orientação a objetos.',1,NULL,12,3),(23,'Desenvolvimento Web','Vídeo sobre HTML, CSS e JavaScript.',1,NULL,13,2),(24,'Planilha de Projetos','Planilha para gestão de projetos web.',1,NULL,13,5),(25,'Vídeo: Física Moderna','Vídeo explicativo sobre teorias modernas.',1,NULL,14,2),(26,'Apresentação de Química','Slides sobre reações químicas.',1,NULL,15,6),(27,'Matemática Financeira','PDF com fórmulas e exemplos.',1,NULL,16,3),(28,'Economia Global','Material de leitura sobre economia mundial.',1,NULL,17,3),(29,'Áudio: Conversação Avançada','Áudio com diálogos em inglês avançado.',1,NULL,18,1),(30,'História da Arte','Slides sobre os principais movimentos artísticos.',1,NULL,19,6),(31,'Programação Web Avançada','PDF sobre frameworks.',1,NULL,20,3),(32,'Bases da Física','Vídeo explicativo sobre energia.',1,NULL,21,2),(33,'Slides: Estatística','Slides sobre análise de dados.',1,NULL,22,6),(34,'Marketing Digital','PDF com estratégias de marketing.',1,NULL,23,3),(35,'Técnicas de Vendas','Vídeo sobre abordagens de vendas.',1,NULL,24,2),(36,'Gerenciamento de Projetos','Material sobre metodologias ágeis.',1,NULL,25,3),(37,'Psicologia Educacional','PDF com teorias de aprendizado.',1,NULL,26,3),(38,'Audio: Técnicas de Meditação','Áudio guiado para meditação.',1,NULL,27,1),(39,'Introdução ao Design','Slides sobre design gráfico.',1,NULL,28,6),(40,'Sustentabilidade e Meio Ambiente','PDF sobre práticas sustentáveis.',1,NULL,29,3),(41,'Culinária Internacional','Vídeo com receitas de diferentes países.',1,NULL,30,2),(42,'Dicas de Bem-Estar','Audio com dicas de vida saudável.',1,NULL,31,1),(43,'Tecnologias do Futuro','Slides sobre IA e robótica.',1,NULL,32,6);
/*!40000 ALTER TABLE `conteudo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso`
--

DROP TABLE IF EXISTS `curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curso` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) NOT NULL,
  `descricao` varchar(200) NOT NULL,
  `dt_cadastro` date NOT NULL,
  `status` int NOT NULL DEFAULT '0',
  `preco` decimal(10,2) DEFAULT NULL,
  `observacao` text,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso`
--

LOCK TABLES `curso` WRITE;
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
INSERT INTO `curso` VALUES (1,'Curso de Matemática Básica','Ensino avancado de matemática para iniciantes','2024-01-10',1,150.00,'Indicado para alunos do ensino fundamental',NULL,'2026-09-23'),(2,'Curso de Física Avançada','Preparação para vestibulares e olimpíadas de física','2024-02-05',0,250.00,'Inclui material complementar digital',NULL,'2026-09-23'),(3,'Curso de Redação ENEM','Foco em técnicas de redação para o ENEM','2024-03-01',0,200.00,'Com simulações de redação mensalmente',NULL,'2026-09-23'),(4,'Curso de Inglês Básico','Aprendizado básico do idioma inglês','2024-04-15',1,300.00,'Oferece certificado de conclusão',NULL,NULL),(5,'Curso de História Geral','Introdução à história geral e mundial','2024-05-10',1,180.00,'Com aulas práticas de análise de documentos históricos',NULL,NULL),(6,'Curso de Geografia Aplicada','Geografia para provas e concursos','2024-06-20',1,220.00,'Aulas incluem prática em mapas interativos',NULL,NULL),(7,'Curso de Ciências Naturais','Introdução às ciências naturais e experimentais','2024-07-05',1,170.00,'Laboratório incluso para atividades',NULL,NULL),(8,'Curso de Biologia Celular','Estudo detalhado sobre biologia celular','2024-08-10',1,260.00,'Pré-requisito para cursos avançados em biologia',NULL,NULL),(9,'Curso de Programação Python','Curso básico de programação em Python','2024-09-15',1,300.00,'Inclui certificado e projetos práticos',NULL,NULL),(10,'Curso de JavaScript','Introdução ao desenvolvimento web com JavaScript','2024-10-01',1,350.00,'Foco em aplicações práticas e dinâmicas web',NULL,NULL),(11,'Curso de Filosofia','Estudo introdutório à filosofia clássica e moderna','2024-11-10',1,200.00,'Inclui debates e leituras complementares',NULL,NULL),(12,'Curso de Química Geral','Base em química orgânica e inorgânica','2024-12-05',1,240.00,'Preparatório para exames e concursos',NULL,NULL),(13,'Curso de Lógica Matemática','Curso intensivo sobre lógica matemática','2024-12-20',1,270.00,'Recomendado para estudantes de tecnologia e ciência',NULL,NULL),(14,'Curso de Literatura Brasileira','Estudo de obras clássicas e modernas brasileiras','2024-12-25',1,190.00,'Com ênfase em interpretação de textos literários',NULL,NULL),(15,'Curso de Física Quântica','Introdução à física quântica e suas aplicações','2024-12-30',1,400.00,'Indicado para alunos avançados e interessados em pesquisa',NULL,NULL),(16,'Matematica','mundial','2026-09-23',1,124.00,'curso teste','2026-09-23','2026-09-23'),(17,'Carlos ivan de Oliveira sousa','matematica','2026-09-23',1,124.00,'fafdsfddfdf','2026-09-23','2026-09-23'),(18,'Ciencias da Natureza','Livro em alemao de ciencias','2026-09-23',0,4587.00,'Este é um livro muito especial','2026-09-23','2026-09-23'),(19,'O ABC INFANTIL','INFANTI','2026-09-23',1,789.00,'LIVRO COM CARACTERISTICAS DE APRENDIZAGEM','2026-09-23','2026-09-23');
/*!40000 ALTER TABLE `curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso_disciplina`
--

DROP TABLE IF EXISTS `curso_disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curso_disciplina` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_curso` int NOT NULL,
  `id_disciplina` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_curso` (`id_curso`),
  KEY `id_disciplina` (`id_disciplina`),
  CONSTRAINT `curso_disciplina_ibfk_1` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id`),
  CONSTRAINT `curso_disciplina_ibfk_2` FOREIGN KEY (`id_disciplina`) REFERENCES `disciplina` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso_disciplina`
--

LOCK TABLES `curso_disciplina` WRITE;
/*!40000 ALTER TABLE `curso_disciplina` DISABLE KEYS */;
INSERT INTO `curso_disciplina` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,2,5),(6,2,6),(7,2,7),(8,2,8),(9,3,9),(10,3,10),(11,3,11),(12,3,12),(13,4,13),(14,4,14),(15,4,15),(16,4,16),(17,5,17),(18,5,18),(19,5,19),(20,5,20),(21,6,21),(22,6,22),(23,6,23),(24,6,24),(25,7,25),(26,7,26),(27,7,27),(28,7,28),(29,8,29),(30,8,30),(31,8,31),(32,8,32),(33,9,1),(34,9,2),(35,9,3),(36,9,4),(37,10,5),(38,10,6),(39,10,7),(40,10,8),(41,11,9),(42,11,10),(43,11,11),(44,11,12),(45,12,13),(46,12,14),(47,12,15),(48,12,16),(49,13,17),(50,13,18),(51,13,19),(52,13,20),(53,14,21),(54,14,22),(55,14,23),(56,14,24),(57,15,25),(58,15,26),(59,1,27),(60,1,28),(61,2,29),(62,2,30),(63,3,31),(64,3,32);
/*!40000 ALTER TABLE `curso_disciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disciplina`
--

DROP TABLE IF EXISTS `disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disciplina` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) NOT NULL,
  `descricao` varchar(200) NOT NULL,
  `dt_cadastro` date NOT NULL,
  `status` int NOT NULL DEFAULT '0',
  `observacao` text,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disciplina`
--

LOCK TABLES `disciplina` WRITE;
/*!40000 ALTER TABLE `disciplina` DISABLE KEYS */;
INSERT INTO `disciplina` VALUES (1,'Aritmética Básica','Conceitos fundamentais de operações matemáticas','2024-01-15',1,'Essencial para iniciantes em matemática',NULL,NULL),(2,'Geometria Plana','Estudo de figuras geométricas bidimensionais','2024-01-20',1,'Inclui exercícios práticos de geometria',NULL,NULL),(3,'Introdução à Álgebra','Princípios básicos de álgebra','2024-01-25',1,'Foco em simplificação de expressões algébricas',NULL,NULL),(4,'Estatística Básica','Noções iniciais de estatística e probabilidade','2024-01-30',1,'Preparatório para áreas aplicadas',NULL,NULL),(5,'Mecânica Clássica','Estudo das leis de Newton e cinemática','2024-02-10',1,'Foco em preparação para provas e olimpíadas',NULL,NULL),(6,'Termodinâmica','Conceitos de calor e energia térmica','2024-02-15',1,'Inclui simulações práticas',NULL,NULL),(7,'Eletromagnetismo Spin','Campos elétricos e magnéticos','2024-02-20',1,'Aulas com foco em resolução de questões complexas e simplistas',NULL,'2026-10-02'),(8,'Física Óptica','Princípios de reflexão, refração e óptica geométrica','2024-02-25',1,'Com práticas laboratoriais',NULL,NULL),(9,'Técnicas de Redação','Estratégias para construção textual','2024-03-05',1,'Foco em organização de ideias e coesão textual',NULL,NULL),(10,'Gramática Aplicada','Revisão de gramática para redação','2024-03-10',1,'Com exercícios de revisão textual',NULL,NULL),(11,'Interpretação de Textos','Análise de textos e construção de argumentos','2024-03-15',1,'Preparação para provas dissertativas',NULL,NULL),(12,'Produção de Redação','Práticas de escrita com correção','2024-03-20',1,'Simulações de redações para ENEM e vestibulares',NULL,NULL),(13,'Vocabulário Básico','Aprendizado inicial de palavras em inglês','2024-04-05',1,'Com listas temáticas e exercícios',NULL,NULL),(14,'Estruturas Gramaticais','Conceitos básicos de gramática inglesa','2024-04-10',1,'Foco em frases afirmativas, negativas e interrogativas',NULL,NULL),(15,'Compreensão Oral','Exercícios para desenvolver listening em inglês','2024-04-15',1,'Aulas com áudio e vídeo',NULL,NULL),(16,'Conversação Básica','Prática de diálogos simples','2024-04-20',1,'Aulas interativas e práticas',NULL,NULL),(17,'História Antiga','Estudo das primeiras civilizações','2024-05-05',1,'Foco em Mesopotâmia, Egito e Roma',NULL,NULL),(18,'Idade Média','Conceitos e acontecimentos medievais','2024-05-10',1,'Inclui análise de documentos históricos',NULL,NULL),(19,'História do Brasil','Estudo da colonização à contemporaneidade','2024-05-15',1,'Com ênfase nos movimentos de independência',NULL,NULL),(20,'Revoluções Mundiais','Análise das revoluções industrial, francesa e outras','2024-05-20',1,'Com leituras de textos históricos',NULL,NULL),(21,'Cartografia Básica','Princípios de leitura e interpretação de mapas','2024-06-05',1,'Com atividades práticas de mapeamento',NULL,NULL),(22,'Climatologia','Estudo de fenômenos climáticos e meteorologia','2024-06-10',1,'Inclui análise de dados climáticos',NULL,NULL),(23,'Geografia Física','Aspectos naturais e físicos do planeta','2024-06-15',1,'Com estudo de relevo, solo e hidrografia',NULL,NULL),(24,'Geopolítica Atual','Conceitos de política global e economia mundial','2024-06-20',1,'Discussão sobre conflitos e tratados internacionais',NULL,NULL),(25,'Introdução à Biologia','Princípios básicos de biologia geral','2024-07-05',1,'Com práticas laboratoriais de observação',NULL,NULL),(26,'Química Geral','Noções iniciais de química','2024-07-10',1,'Foco em reações e propriedades da matéria',NULL,NULL),(27,'Física Experimental','Estudo prático de conceitos físicos','2024-07-15',1,'Laboratório incluso para experimentos',NULL,NULL),(28,'Astronomia Básica','Princípios de astronomia e observação celeste','2024-07-20',1,'Com exercícios de análise astronômica',NULL,NULL),(29,'Introdução ao Python','Conceitos básicos de programação em Python','2024-09-01',1,'Foco em lógica de programação',NULL,NULL),(30,'Estruturas de Dados','Trabalhando com listas, dicionários e tuplas','2024-09-05',1,'Práticas aplicadas em problemas reais',NULL,NULL),(31,'Automação com Python','Desenvolvimento de scripts automatizados','2024-09-10',1,'Com exercícios voltados ao mercado de trabalho',NULL,NULL),(32,'Desenvolvimento Web','Aplicações web usando Python e frameworks','2024-09-15',1,'Inclui projeto final',NULL,NULL),(33,'Química Orgânica','Estudo das estruturas e reações de compostos orgânicos','2024-12-01',1,'Preparação para exames avançados',NULL,NULL),(34,'Filosofia Clássica','Estudo de filósofos e correntes clássicas','2024-12-10',1,'Com debates em aula',NULL,NULL),(35,'Literatura Moderna','Obras literárias do século XX','2024-12-15',1,'Análise de textos e autores contemporâneos',NULL,NULL),(36,'Física Quântica Básica','Introdução a conceitos quânticos','2024-12-20',1,'Inclui estudo prático e teórico aprofundado',NULL,NULL),(37,'Matematica','Este livro retrata todas as fakes produzidas por uma familia de milicianos malditos','2026-10-01',1,'oi','2026-10-01','2026-10-01');
/*!40000 ALTER TABLE `disciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `escola`
--

DROP TABLE IF EXISTS `escola`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `escola` (
  `id` int NOT NULL AUTO_INCREMENT,
  `razao_social` varchar(200) NOT NULL,
  `nome_fantasia` varchar(200) NOT NULL,
  `codigo_escola` varchar(20) NOT NULL,
  `cnpj` varchar(20) NOT NULL,
  `endereco` text NOT NULL,
  `complemento` text,
  `bairro` varchar(100) NOT NULL,
  `cidade` varchar(100) NOT NULL,
  `estado` varchar(100) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `data_inauguracao` date NOT NULL,
  `status` int DEFAULT '1',
  `observacao` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `escola`
--

LOCK TABLES `escola` WRITE;
/*!40000 ALTER TABLE `escola` DISABLE KEYS */;
INSERT INTO `escola` VALUES (1,'Escola Novo Saber Ltda','Colégio Novo Saber','ESC001','12.345.678/0001-01','Rua das Flores, 101','Apto 202','Centro','São Paulo','SP','(11) 98765-4321','2005-03-15',1,'Escola tradicional no bairro'),(2,'Instituto Educação Avançada Ltda','Escola Educação Avançada','ESC002','98.765.432/0001-02','Av. Paulista, 200',NULL,'Bela Vista','São Paulo','SP','(11) 99876-5432','2010-06-20',1,'Oferece cursos de idiomas'),(3,'Centro Educacional Brilhante','Escola Brilhante','ESC003','34.567.890/0001-03','Rua das Palmeiras, 300','Sala 101','Vila Mariana','São Paulo','SP','(11) 91234-5678','2001-09-12',1,'Ensino fundamental e médio'),(4,'Instituto Conhecimento Ltda','Colégio Conhecimento','ESC004','56.789.012/0001-04','Av. Brasil, 400','2º Andar','Centro','Rio de Janeiro','RJ','(21) 92345-6789','2007-01-05',1,'Referência em qualidade de ensino'),(5,'Escola Futuro Melhor Ltda','Colégio Futuro Melhor','ESC005','78.901.234/0001-05','Rua do Comércio, 50','Próximo ao Shopping','Centro','Curitiba','PR','(41) 93456-7890','2000-05-25',0,'Escola atualmente inativa'),(6,'Instituto Saber e Crescer','Escola Saber e Crescer','ESC006','90.123.456/0001-06','Rua das Américas, 12','Bloco B','Cidade Nova','Belo Horizonte','MG','(31) 94567-1234','2002-11-03',1,'Ensino fundamental completo'),(7,'Centro Educacional Ponto Alto','Escola Ponto Alto','ESC007','23.456.789/0001-07','Av. Sete de Setembro, 60',NULL,'Centro','Salvador','BA','(71) 95678-2345','1998-08-14',1,'Ensino médio e pré-vestibular'),(8,'Colégio Saber Ltda','Escola Saber','ESC008','45.678.901/0001-08','Rua da Praia, 90',NULL,'Boa Viagem','Recife','PE','(81) 96789-3456','1999-12-21',1,'Escola referência na região'),(9,'Instituto Aprendiz Ltda','Escola Aprendiz','ESC009','67.890.123/0001-09','Rua dos Professores, 88','Térreo','Zona Norte','Porto Alegre','RS','(51) 97890-4567','2003-07-07',1,'Oferece atividades extracurriculares'),(10,'Centro Educacional Alpha Ltda','Colégio Alpha','ESC010','89.012.345/0001-10','Av. das Acácias, 70','Apto 5','Centro','Florianópolis','SC','(48) 98901-5678','2004-10-10',1,'Escola de alto desempenho acadêmico');
/*!40000 ALTER TABLE `escola` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`),
  KEY `failed_jobs_connection_queue_failed_at_index` (`connection`,`queue`,`failed_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` smallint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoa`
--

DROP TABLE IF EXISTS `pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pessoa` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) NOT NULL,
  `rg` varchar(20) DEFAULT NULL,
  `cpf` varchar(20) DEFAULT NULL,
  `endereco` text NOT NULL,
  `complemento` text,
  `bairro` varchar(100) NOT NULL,
  `cidade` varchar(100) NOT NULL,
  `estado` varchar(100) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `data_nascimento` date NOT NULL,
  `status` int DEFAULT '1',
  `observacao` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa`
--

LOCK TABLES `pessoa` WRITE;
/*!40000 ALTER TABLE `pessoa` DISABLE KEYS */;
INSERT INTO `pessoa` VALUES (1,'João Silva','12345678','123.456.789-00','Rua das Flores, 123','Apto 101','Centro','São Paulo','SP','(11) 98765-4321','1980-05-20',1,'Cliente ativo'),(2,'Maria Oliveira','87654321','987.654.321-00','Av. Paulista, 456',NULL,'Bela Vista','São Paulo','SP','(11) 99876-5432','1990-12-15',1,'Cliente VIP'),(3,'Carlos Pereira','23456789','234.567.890-00','Rua dos Andradas, 789','Casa','Centro','Rio de Janeiro','RJ','(21) 91234-5678','1975-07-08',1,'Pedido em aberto'),(4,'Ana Costa',NULL,'345.678.901-11','Av. Atlântica, 1010',NULL,'Copacabana','Rio de Janeiro','RJ','(21) 92345-6789','1988-03-22',0,'Inadimplente'),(5,'Pedro Almeida','56789012',NULL,'Rua Augusta, 50','Sala 203','Jardins','São Paulo','SP','(11) 93456-7890','2000-09-30',1,'Novo cliente'),(6,'Fernanda Lima','22334455','112.233.445-56','Rua XV de Novembro, 102','Apto 501','Centro','Curitiba','PR','(41) 91234-5678','1985-11-05',1,'Cliente ativo'),(7,'José da Silva','33445566','221.334.455-78','Rua das Orquídeas, 45',NULL,'Bairro Alto','Curitiba','PR','(41) 92345-6789','1992-06-18',1,'Cliente regular'),(8,'Luciana Santos','44556677','332.445.566-89','Av. Beira Mar, 876','Apto 1202','Meireles','Fortaleza','CE','(85) 94567-1234','1978-04-23',1,'Possui restrições'),(9,'Roberto Nunes',NULL,'667.778.889-00','Rua das Acácias, 303','Casa','Centro','Fortaleza','CE','(85) 91234-5678','1990-08-30',1,NULL),(10,'Juliana Gonçalves','55667788','445.556.667-99','Rua 24 de Maio, 1002',NULL,'Aldeota','Fortaleza','CE','(85) 92345-6789','1986-01-18',1,NULL),(11,'Paulo Cesar','66778899','556.667.778-11','Av. Independência, 455',NULL,'Centro','Porto Alegre','RS','(51) 94567-8901','1973-12-21',0,'Cliente inativo'),(12,'Tatiana Souza',NULL,'778.889.900-22','Rua São João, 987','Loja 2','Cidade Baixa','Porto Alegre','RS','(51) 93456-1234','1989-09-09',1,'Aguardando pagamento'),(13,'Marcos Almeida','88990011','889.900.011-33','Rua da Praia, 120',NULL,'Centro','Porto Alegre','RS','(51) 95678-2345','1995-11-17',1,NULL),(14,'Ana Luiza','99001122','990.011.122-44','Rua XV de Novembro, 56','Apto 802','Centro','Curitiba','PR','(41) 96789-3456','1980-07-25',1,'Novo cliente'),(15,'Lucas Teixeira','11223344','101.112.233-45','Av. Brasil, 234',NULL,'Centro','Belo Horizonte','MG','(31) 91234-5678','1976-03-14',0,'Cliente inativo'),(16,'Raquel Farias',NULL,'212.324.456-89','Rua Goiás, 321','Casa 2','Savassi','Belo Horizonte','MG','(31) 92345-6789','1983-05-19',1,NULL),(17,'Carlos Moura','22334455','334.556.678-90','Av. Amazonas, 1234','Apto 101','Centro','Belo Horizonte','MG','(31) 94567-8901','1971-10-11',1,'Cliente VIP'),(18,'Marta Martins','44556677','556.678.789-01','Rua do Comércio, 678','Loja 10','Centro','Florianópolis','SC','(48) 93456-7890','1988-02-09',1,NULL),(19,'Felipe Rocha','55667788','667.789.890-12','Rua das Palmeiras, 23','Apto 301','Jurerê','Florianópolis','SC','(48) 94567-1234','1993-06-25',1,'Cliente regular'),(20,'Sérgio Tavares','66778899','778.890.901-23','Av. das Torres, 456',NULL,'Centro','Joinville','SC','(47) 91234-5678','1974-09-14',0,NULL),(21,'Patrícia Fonseca','77889900','889.901.012-34','Rua São Francisco, 90','Casa','Centro','Joinville','SC','(47) 92345-6789','1981-12-05',1,NULL),(22,'Beatriz Monteiro','12345001','123.450.789-00','Rua das Pedras, 101','Apto 202','Boa Vista','Recife','PE','(81) 98765-4321','1984-01-10',1,'Cliente regular'),(23,'Ricardo Freitas','23456002','234.560.789-00','Av. Boa Viagem, 22',NULL,'Boa Viagem','Recife','PE','(81) 99876-5432','1992-02-25',1,NULL),(24,'Juliana Ribeiro','34567003','345.670.890-00','Rua do Sol, 999',NULL,'Centro','Recife','PE','(81) 91234-5678','1980-06-15',1,'Cliente ativo'),(25,'Paulo Henrique','45678004','456.780.123-00','Rua das Acácias, 500','Apto 12','Zona Norte','Manaus','AM','(92) 92345-6789','1983-03-28',0,'Inadimplente'),(26,'Vanessa Souza','56789005','567.890.234-00','Av. das Torres, 1200','Casa','Centro','Manaus','AM','(92) 93456-7890','1995-09-09',1,'Cliente VIP'),(27,'Lucas Rocha','67890006','678.900.345-00','Rua dos Pinheiros, 345',NULL,'Centro','Belém','PA','(91) 94567-1234','1989-04-11',1,NULL),(28,'Gabriela Lima','78901007','789.010.456-00','Av. Nazaré, 45','Apto 301','Nazaré','Belém','PA','(91) 95678-2345','1994-08-22',1,'Pedido em aberto'),(29,'Felipe Alves','89012008','890.120.567-00','Rua do Comércio, 123',NULL,'Centro','Campinas','SP','(19) 96789-3456','1982-11-18',1,NULL),(30,'Renata Vieira','90123009','901.230.678-00','Rua da Paz, 678','Apto 502','Cambuí','Campinas','SP','(19) 97890-4567','1985-05-10',1,'Cliente ativo'),(31,'Bruno Costa','01234010','012.340.789-11','Av. Brasil, 876',NULL,'Centro','Ribeirão Preto','SP','(16) 94567-8901','1987-10-21',0,'Cliente inativo'),(32,'Camila Andrade','12345011','123.450.890-22','Rua XV de Novembro, 210','Apto 602','Centro','Ribeirão Preto','SP','(16) 93456-1234','1991-06-12',1,'Novo cliente'),(33,'Leandro Cunha','23456012','234.560.901-33','Rua das Laranjeiras, 14','Casa','Zona Sul','Campo Grande','MS','(67) 91234-5678','1979-12-30',1,NULL),(34,'Daniela Silva','34567013','345.670.123-44','Av. Afonso Pena, 700',NULL,'Centro','Campo Grande','MS','(67) 92345-6789','1981-03-15',1,'Cliente regular'),(35,'Fernando Xavier','45678014','456.780.234-55','Rua Brasil, 250','Apto 803','Centro','Maceió','AL','(82) 93456-7890','1993-07-07',1,NULL),(36,'Aline Moraes','56789015','567.890.345-66','Rua do Comércio, 15',NULL,'Pajuçara','Maceió','AL','(82) 94567-1234','1992-02-18',1,NULL),(37,'João Mendes','67890016','678.900.456-77','Av. das Palmeiras, 190','Apto 302','Boa Viagem','Recife','PE','(81) 91234-5678','1978-12-05',0,'Cliente inativo'),(38,'Bianca Santos','78901017','789.010.567-88','Rua Marquês de Olinda, 678',NULL,'Centro','Petrópolis','RJ','(24) 92345-6789','1986-04-20',1,NULL),(39,'Fábio Gonçalves','89012018','890.120.678-99','Rua do Imperador, 100','Casa','Centro','Petrópolis','RJ','(24) 93456-7890','1984-11-13',1,'Cliente regular'),(40,'Sara Castro','90123019','901.230.789-11','Rua Teresa, 432',NULL,'Alto da Serra','Petrópolis','RJ','(24) 94567-8901','1990-05-19',1,'Cliente ativo'),(41,'André Fernandes','01234020','012.340.890-22','Av. Tereza Cristina, 89','Apto 202','Cidade Nova','Belo Horizonte','MG','(31) 95678-2345','1987-07-29',1,NULL),(42,'Roberta Lima','12345021','123.450.901-33','Rua Ouro Preto, 501',NULL,'Lourdes','Belo Horizonte','MG','(31) 96789-3456','1985-11-05',1,NULL),(43,'Carla Rodrigues','23456022','234.560.012-44','Av. Amazonas, 990','Apto 1','Centro','Manaus','AM','(92) 97890-4567','1991-09-12',1,'Novo cliente'),(44,'Hugo Almeida','34567023','345.670.123-55','Rua das Pedras, 56',NULL,'Coroado','Manaus','AM','(92) 98901-5678','1984-08-15',1,NULL),(45,'Camila Ribeiro','45678024','456.780.234-66','Av. Recife, 78',NULL,'Boa Viagem','Recife','PE','(81) 99876-5432','1988-10-22',1,NULL),(46,'Mariana Teixeira','56789025','567.890.345-77','Rua do Carmo, 901','Apto 5','Carmo','Olinda','PE','(81) 92345-6789','1986-01-10',1,'Cliente regular'),(47,'Renato Costa','67890026','678.900.456-88','Rua do Sol, 303',NULL,'Centro','Fortaleza','CE','(85) 93456-7890','1992-09-04',1,NULL),(48,'Luciana Almeida','78901027','789.010.567-99','Av. da Universidade, 45','Apto 3','Benfica','Fortaleza','CE','(85) 94567-1234','1979-05-19',1,NULL),(49,'Fernando Rocha','89012028','890.120.678-11','Rua das Acácias, 23',NULL,'Centro','Fortaleza','CE','(85) 95678-2345','1983-12-07',1,'Pedido em aberto'),(50,'Danilo Lima','90123029','901.230.789-22','Rua São Francisco, 67',NULL,'Centro','Florianópolis','SC','(48) 91234-5678','1995-03-10',1,NULL),(51,'Paula Nunes','01234030','012.340.890-33','Av. Beira Mar, 450','Casa','Meireles','Fortaleza','CE','(85) 92345-6789','1984-06-01',1,NULL),(52,'Robson Souza','12345031','123.450.901-44','Rua das Flores, 200',NULL,'Centro','Florianópolis','SC','(48) 94567-8901','1987-09-16',0,'Cliente inativo'),(53,'Natália Martins','23456032','234.560.012-55','Rua das Laranjeiras, 15','Apto 502','Centro','Salvador','BA','(71) 96789-3456','1980-08-23',1,NULL),(54,'Caio Cunha','34567033','345.670.123-66','Av. Sete de Setembro, 99',NULL,'Centro','Salvador','BA','(71) 97890-4567','1990-04-15',1,'Cliente ativo'),(55,'Patrícia Alves','45678034','456.780.234-77','Rua do Rosário, 123','Casa','Centro','Fortaleza','CE','(85) 98901-5678','1975-07-12',1,'Cliente regular'),(56,'João Moura','56789035','567.890.345-88','Av. dos Expedicionários, 14','Apto 203','Centro','Curitiba','PR','(41) 91234-5678','1993-10-18',1,NULL),(57,'Isabela Farias','67890036','678.900.456-99','Rua XV de Novembro, 1',NULL,'Centro','Curitiba','PR','(41) 92345-6789','1985-02-09',1,NULL),(58,'Alessandro Silva','78901037','789.010.567-00','Rua das Nações, 101','Apto 1201','Batel','Curitiba','PR','(41) 93456-7890','1983-11-27',0,'Inativo'),(59,'Verônica Cruz','89012038','890.120.678-11','Rua Chile, 200',NULL,'Cidade Nova','Belo Horizonte','MG','(31) 94567-1234','1996-12-15',1,NULL),(60,'Luan Castro','90123039','901.230.789-22','Rua Guaicurus, 190',NULL,'Centro','Belo Horizonte','MG','(31) 95678-2345','1991-03-24',1,'Cliente VIP');
/*!40000 ALTER TABLE `pessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professor`
--

DROP TABLE IF EXISTS `professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_pessoa` int NOT NULL,
  `id_escola` int NOT NULL,
  `registro` varchar(20) NOT NULL,
  `salario` decimal(10,2) NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `data_cadastro` date NOT NULL,
  `observacao` text,
  `telefone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_pfr_pessoa_fk` (`id_pessoa`),
  KEY `id_pfr_escola_fk` (`id_escola`),
  CONSTRAINT `id_pfr_escola_fk` FOREIGN KEY (`id_escola`) REFERENCES `escola` (`id`),
  CONSTRAINT `id_pfr_pessoa_fk` FOREIGN KEY (`id_pessoa`) REFERENCES `pessoa` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor`
--

LOCK TABLES `professor` WRITE;
/*!40000 ALTER TABLE `professor` DISABLE KEYS */;
INSERT INTO `professor` VALUES (1,1,1,'PROF001',4500.50,1,'2024-01-15','Professor de Matemática','(11) 91234-5678'),(2,2,2,'PROF002',4800.75,1,'2024-02-10','Professor de Física','(21) 92345-6789'),(3,3,3,'PROF003',5000.00,0,'2024-03-05','Professor afastado','(31) 93456-7890'),(4,4,4,'PROF004',4700.25,1,'2024-04-20','Professor de Português','(41) 94567-8901'),(5,5,5,'PROF005',5200.00,1,'2024-05-08','Professor de História','(51) 95678-9012');
/*!40000 ALTER TABLE `professor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('cM6kP1BUsX3kH0eHKYZC4XG941EAhIPeEp1MgFVZ',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36','eyJfdG9rZW4iOiJRZXNyMFVkWlBoYTFRUnA4TEs1WFpJd3hrRFR3RjVaWTZJTjJQQzY5IiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwXC9kaXNjaXBsaW5hXC9jb250ZXVkb3NcLzEiLCJyb3V0ZSI6ImRpc2NpcGxpbmEuY29udGV1ZG9zIn0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=',1792784758),('gaA1Ub6XeDbQGFaTz6ExFG5KdbQnu30AmnfHwtyx',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36','eyJfdG9rZW4iOiJlbGFnY0xkOHlzUGVxUVRmN3paTmhLWkdWdUdsV0g1RDU4eEpIMm4xIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwXC9kaXNjaXBsaW5hXC9jb250ZXVkb3NcLzEiLCJyb3V0ZSI6ImRpc2NpcGxpbmEuY29udGV1ZG9zIn0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=',1792590436),('RQffF22gyKqRAXtzKhrCwaQZjzufk4kq9I921ZMR',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36','eyJfdG9rZW4iOiI4NExQUlFDMU0yNFdLVE15aEpGZlVmSkVMMVh5RkY0WUxTWDh6ajhCIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL2xvY2FsaG9zdDo4MDAwXC9kaXNjaXBsaW5hIiwicm91dGUiOiJkaXNjaXBsaW5hLmluZGV4In0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=',1793133481),('Rt5Irwsw40oN8tm5x0Yn6B6xMoR5Mn6JHvxGPIEe',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36','eyJfdG9rZW4iOiJJeDdHUEZJZ2NUbnF6N1pTaU5CN2JSdnpRSE44NWFmUU45VnVmSTZsIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwXC9kaXNjaXBsaW5hXC9jb250ZXVkb3NcLzEiLCJyb3V0ZSI6ImRpc2NpcGxpbmEuY29udGV1ZG9zIn0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=',1792766375),('VsmcfqMS7gixdiYbbsIWUwdqljAGT9Z1EgONYGcN',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36','eyJfdG9rZW4iOiJGY2l6ZkVsRFRCdWJUZ0FydHA1R21CT2h4MG84ZjVORnhVSWRYVzVnIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL2xvY2FsaG9zdDo4MDAwXC9kaXNjaXBsaW5hXC9jb250ZXVkb3NcLzEiLCJyb3V0ZSI6ImRpc2NpcGxpbmEuY29udGV1ZG9zIn0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=',1793190381),('VYarwSZ7jDTqXEISLr7hIMpuyVY2RS019jQGUxJZ',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36','eyJfdG9rZW4iOiJ2QXA2dEhTMTNETmVQUDZlV3RzV1R1Nk12TnA5WE5GRWRRQjVZS2JmIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwXC9jdXJzbyIsInJvdXRlIjoiY3Vyc28uaW5kZXgifSwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119fQ==',1792084168),('wW1okbVE5IYkzpcj6PpyWbLPk5aPUnQQqJNX10aC',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36','eyJfdG9rZW4iOiJiYjA1SXdDSUJyRHJLcm5FTWdNVlFra1FqaG1SSFVvTUZvT0tOeDdYIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwXC9kaXNjaXBsaW5hXC9jb250ZXVkb3NcLzEiLCJyb3V0ZSI6ImRpc2NpcGxpbmEuY29udGV1ZG9zIn0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=',1792158570),('yietmx2VNjyY1zNO7uBkIv7TG82UtYSMj7Q4MpMC',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36','eyJfdG9rZW4iOiJ0OENaS0JaZmJUVEZ0cE1xeXFXcXNBWEo0Nk9PY2VlUUVERDRPUzM2IiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL2xvY2FsaG9zdDo4MDAwXC9kaXNjaXBsaW5hXC9jb250ZXVkb3NcLzEiLCJyb3V0ZSI6ImRpc2NpcGxpbmEuY29udGV1ZG9zIn0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=',1793211988),('zrwQWLp4DYvotHTzWS0gvY2zsowK6X7iNt8lK2wM',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36','eyJfdG9rZW4iOiI2V0I3cjlVMDhUVEZ5MnZhdW9SanQ1dnFHWTZld3ZNZ0FIOXFFN3hUIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwXC9kaXNjaXBsaW5hXC9jb250ZXVkb3NcLzEiLCJyb3V0ZSI6ImRpc2NpcGxpbmEuY29udGV1ZG9zIn0sIl9mbGFzaCI6eyJvbGQiOltdLCJuZXciOltdfX0=',1792612169);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_conteudo`
--

DROP TABLE IF EXISTS `tipo_conteudo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_conteudo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(100) NOT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `status` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_conteudo`
--

LOCK TABLES `tipo_conteudo` WRITE;
/*!40000 ALTER TABLE `tipo_conteudo` DISABLE KEYS */;
INSERT INTO `tipo_conteudo` VALUES (1,'Áudio',NULL,NULL,1),(2,'Vídeo',NULL,NULL,1),(3,'PDF',NULL,NULL,1),(4,'Documento do Word',NULL,NULL,1),(5,'Planilha',NULL,NULL,1),(6,'Apresentação de Slides',NULL,NULL,1),(7,'Imagem',NULL,NULL,1),(8,'Texto Simples',NULL,NULL,1),(9,'E-book',NULL,NULL,1),(10,'Arquivo Compactado',NULL,NULL,1),(11,'Tipo conteudo teste','2026-09-25','2026-09-25',1),(12,'Dvd Gold','2026-09-25','2026-09-25',1),(13,'Aspirador Robo','2026-09-28','2026-09-28',1);
/*!40000 ALTER TABLE `tipo_conteudo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turma`
--

DROP TABLE IF EXISTS `turma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `turma` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `descricao` varchar(200) NOT NULL,
  `dt_inicio` date DEFAULT NULL,
  `dt_termino` date DEFAULT NULL,
  `status` int NOT NULL DEFAULT '0',
  `observacao` text,
  `id_escola` int NOT NULL,
  `id_professor` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_escola` (`id_escola`),
  KEY `id_professor` (`id_professor`),
  CONSTRAINT `turma_ibfk_1` FOREIGN KEY (`id_escola`) REFERENCES `escola` (`id`),
  CONSTRAINT `turma_ibfk_2` FOREIGN KEY (`id_professor`) REFERENCES `professor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turma`
--

LOCK TABLES `turma` WRITE;
/*!40000 ALTER TABLE `turma` DISABLE KEYS */;
INSERT INTO `turma` VALUES (1,'Turma A','Turma de ensino fundamental','2024-02-01','2024-12-15',1,'Horário matutino',1,1),(2,'Turma B','Turma de ensino médio','2024-03-01','2024-12-20',1,'Horário vespertino',2,2),(3,'Turma C','Turma de pré-vestibular','2024-04-10','2024-11-30',1,'Aulas aos sábados',3,3),(4,'Turma D','Turma de reforço escolar','2024-01-15','2024-06-30',0,'Aulas de reforço para Matemática',4,4),(5,'Turma E','Turma de inglês básico','2024-05-05','2024-09-25',1,'Aulas às quartas e sextas',5,5),(6,'Turma F','Turma de ciências','2024-02-20','2024-07-15',0,'Preparação para olimpíadas científicas',6,1),(7,'Turma G','Turma de redação','2024-03-10','2024-10-20',1,'Foco em redação para ENEM',7,2),(8,'Turma H','Turma de história','2024-04-01','2024-12-10',1,'Aulas semanais com projetos históricos',8,3),(9,'Turma I','Turma de geografia','2024-01-10','2024-07-30',0,'Aulas práticas de cartografia',9,4),(10,'Turma J','Turma de física avançada','2024-02-25','2024-08-30',1,'Foco em resolução de questões de vestibulares',10,5);
/*!40000 ALTER TABLE `turma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turma_curso`
--

DROP TABLE IF EXISTS `turma_curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `turma_curso` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_turma` int NOT NULL,
  `id_curso` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_turma` (`id_turma`),
  KEY `id_curso` (`id_curso`),
  CONSTRAINT `turma_curso_ibfk_1` FOREIGN KEY (`id_turma`) REFERENCES `turma` (`id`),
  CONSTRAINT `turma_curso_ibfk_2` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turma_curso`
--

LOCK TABLES `turma_curso` WRITE;
/*!40000 ALTER TABLE `turma_curso` DISABLE KEYS */;
INSERT INTO `turma_curso` VALUES (1,1,1),(2,1,2),(3,1,3),(4,2,4),(5,2,5),(6,2,6),(7,3,7),(8,3,8),(9,3,9),(10,4,10),(11,4,11),(12,4,12),(13,5,13),(14,5,14),(15,5,15),(16,6,1),(17,6,4),(18,6,7),(19,7,10),(20,7,13),(21,8,2),(22,8,5),(23,8,8),(24,9,11),(25,9,14),(26,10,3),(27,10,6),(28,10,9),(29,10,12),(30,10,15);
/*!40000 ALTER TABLE `turma_curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-28 16:09:43
