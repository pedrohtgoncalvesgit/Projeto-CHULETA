-- MariaDB dump 10.19  Distrib 10.4.25-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: ti93phpdb01
-- ------------------------------------------------------
-- Server version	10.4.25-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tbclientes`
--

DROP TABLE IF EXISTS `tbclientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbclientes` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbclientes`
--

LOCK TABLES `tbclientes` WRITE;
/*!40000 ALTER TABLE `tbclientes` DISABLE KEYS */;
INSERT INTO `tbclientes` VALUES (23,'Matheus de Castro Souza','12345678999','matheus@gmail.com'),(24,'Pedro','54620465800','sdsadsada@sadaf'),(25,'jonas','46545645','pedro@gmail.com'),(26,'Matheusss','11111111111','matheus@gmail'),(27,'Wellington Vieira','12547896587','softkleen@gmail.com'),(28,'Tiago','82814854259','tiago@gmail.com'),(29,'Charles','82814528040','charles@outlook.com'),(30,'Cesar','21545645231','cesar@gmail.com'),(31,'Alex','15403050020','alex@gmail'),(32,'Pedro Torres','52420461721','pedrogameplay@gmail.com');
/*!40000 ALTER TABLE `tbclientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbpedido_reserva`
--

DROP TABLE IF EXISTS `tbpedido_reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbpedido_reserva` (
  `id_pedido` int(11) NOT NULL AUTO_INCREMENT,
  `id_clientes` int(11) NOT NULL,
  `pessoas` varchar(2) NOT NULL,
  `data_pedido` date NOT NULL,
  `status` enum('Confirmado','Em Análise','Recusado','Cancelado') NOT NULL,
  `mesa` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `fk_tbpedido_reserva_tbclientes1_idx` (`id_clientes`),
  CONSTRAINT `fk_tbpedido_reserva_tbclientes1` FOREIGN KEY (`id_clientes`) REFERENCES `tbclientes` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbpedido_reserva`
--

LOCK TABLES `tbpedido_reserva` WRITE;
/*!40000 ALTER TABLE `tbpedido_reserva` DISABLE KEYS */;
INSERT INTO `tbpedido_reserva` VALUES (52,23,'4','2023-03-01','Confirmado','5'),(53,23,'2','2023-02-25','Confirmado','1'),(54,23,'3','2023-04-12','Recusado',''),(57,23,'5','2023-02-28','Confirmado',NULL),(58,23,'1','2023-02-22','Em Análise',NULL),(59,23,'3','2023-02-23','Confirmado',NULL),(60,23,'2','2023-02-25','Recusado',NULL),(61,23,'1','2023-02-22','Confirmado',NULL),(62,23,'2','2023-02-22','Confirmado',NULL),(63,23,'1','2023-02-25','Confirmado',NULL),(64,23,'4','2023-03-03','Confirmado',NULL),(65,23,'1','2023-02-24','Confirmado',NULL),(66,24,'2','2023-03-03','Em Análise',NULL),(67,24,'3','2023-02-27','Recusado',NULL),(68,25,'5','2023-05-24','Confirmado',NULL),(75,25,'1','2023-03-01','Em Análise',NULL),(76,25,'4','2023-03-08','Em Análise',NULL),(77,26,'3','2023-03-02','Em Análise',NULL),(78,27,'5','2023-02-26','Confirmado',NULL),(79,28,'1','2023-03-03','Em Análise',NULL),(80,29,'15','2023-03-10','Em Análise',NULL),(81,28,'15','2023-03-03','Em Análise',NULL),(82,30,'30','2023-03-25','Em Análise',NULL),(83,31,'12','2023-03-10','Em Análise',NULL),(84,25,'25','2023-03-11','Em Análise',NULL),(85,32,'23','2023-03-31','Em Análise',NULL),(86,32,'50','2023-03-13','Em Análise',NULL);
/*!40000 ALTER TABLE `tbpedido_reserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbprodutos`
--

DROP TABLE IF EXISTS `tbprodutos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbprodutos` (
  `id_produto` int(11) NOT NULL AUTO_INCREMENT,
  `id_tipo_produto` int(11) NOT NULL,
  `descri_produto` varchar(100) NOT NULL,
  `resumo_produto` varchar(1000) DEFAULT NULL,
  `valor_produto` decimal(9,2) DEFAULT NULL,
  `imagem_produto` varchar(50) DEFAULT NULL,
  `destaque_produto` enum('Sim','N?o') NOT NULL,
  PRIMARY KEY (`id_produto`),
  KEY `id_tipo_produto_fk` (`id_tipo_produto`),
  CONSTRAINT `id_tipo_produto_fk` FOREIGN KEY (`id_tipo_produto`) REFERENCES `tbtipos` (`id_tipo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbprodutos`
--

LOCK TABLES `tbprodutos` WRITE;
/*!40000 ALTER TABLE `tbprodutos` DISABLE KEYS */;
INSERT INTO `tbprodutos` VALUES (1,1,'Picanha ao alho',' Esta e a combina??o do sabor inconfund?vel da picanha com o aroma acentuado do alho. Condimento que casa perfeitamente com este corte nobre',29.90,'picanha_alho.jpg','N?o'),(2,1,'Fraldinha','Uma das carnes mais suculentas do card?pio. Requintada, com maciez particular e pouca gordura, e uma carne que chama aten??o pela sua textura',29.90,'fraldinha.jpg','N?o'),(4,1,'Cupim','Uma refer?ncia especial dos paulistas. Bastante gordurosa e macia, o cupim e uma carne fibrosa, que se desfia quando bem preparada ',29.90,'cupim.jpg','N?o'),(5,1,'Picanha','Considerada por muitos como a mais nobre e procurada carne de churrasco, a picanha pode ser servida ao ponto , mal passada ou bem passada. Suculenta e com sua caracter?stica capa de gordura',29.90,'picanha_sem.jpg','Sim'),(6,2,'Apfelstrudel','Sobremesa tradicional austro-germ?nica e um delicioso folhado de ma?a e canela com sorvete',29.90,'strudel.jpg','N?o'),(7,1,'Alcatra','Carne com muitas fibras, por?m macia. Sua lateral apresenta uma boa parcela de gordura. Equilibrando de forma harm?nica maciez e fibras.',29.90,'alcatra_pedra.jpg','N?o'),(8,1,'Maminha','Vem da parte inferior da Alcatra. E uma carne com fibras, por?m macia e saborosa.',29.90,'maminha.jpg','N?o'),(9,2,'Abacaxi','Abacaxi assado com canela ao creme de leite condensado ',29.90,'abacaxi.jpg','N?o'),(11,3,'Copo de ?gua','Copo de ?gua totalmente gelada',5.90,'agua.png','N?o'),(12,3,'Refrigerante','Refrigerante misterioso gelado de 500ml',6.90,'refrigerante.png','N?o'),(13,3,'Heineken','Balde de heineken totalmente gelada para beber com a galera',32.00,'balde_cerveja.png','N?o'),(14,1,'P?o de Alho','Um p?o de alho diretamente da churrasqueira',5.00,'paodealho.png','N?o'),(15,1,'Queijo','Tr?s queijos coalhado saboroso...',12.00,'queijo.png','Sim'),(16,9,'Hamburger','Um hamburger duas vezes mais carne com queijo e tomate',29.00,'hamburger.png','N?o'),(17,9,'Hamburger + Batata Frita','Promo??o da churrascaria, combo de hamburger e batata frita deliciosa',15.90,'hamburger_batata.png','Sim');
/*!40000 ALTER TABLE `tbprodutos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbreserva`
--

DROP TABLE IF EXISTS `tbreserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbreserva` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero` int(11) NOT NULL,
  `data_inicio` datetime NOT NULL,
  `data_fim` datetime NOT NULL,
  `id_cliente` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_idcliente` (`id_cliente`),
  CONSTRAINT `fk_idcliente` FOREIGN KEY (`id_cliente`) REFERENCES `tbclientes` (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbreserva`
--

LOCK TABLES `tbreserva` WRITE;
/*!40000 ALTER TABLE `tbreserva` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbreserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbtipos`
--

DROP TABLE IF EXISTS `tbtipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbtipos` (
  `id_tipo` int(11) NOT NULL AUTO_INCREMENT,
  `sigla_tipo` varchar(3) NOT NULL,
  `rotulo_tipo` varchar(15) NOT NULL,
  PRIMARY KEY (`id_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbtipos`
--

LOCK TABLES `tbtipos` WRITE;
/*!40000 ALTER TABLE `tbtipos` DISABLE KEYS */;
INSERT INTO `tbtipos` VALUES (1,'chu','Churrasco'),(2,'sob','Sobremesa'),(3,'beb','Bebidas'),(9,'lan','Lanche');
/*!40000 ALTER TABLE `tbtipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbusuarios`
--

DROP TABLE IF EXISTS `tbusuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbusuarios` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `login_usuario` varchar(30) NOT NULL,
  `senha_usuario` varchar(32) DEFAULT NULL,
  `nivel_usuario` enum('sup','com') NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `login_usuario_uniq` (`login_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbusuarios`
--

LOCK TABLES `tbusuarios` WRITE;
/*!40000 ALTER TABLE `tbusuarios` DISABLE KEYS */;
INSERT INTO `tbusuarios` VALUES (1,'senac','81dc9bdb52d04dc20036dbd8313ed055','sup'),(2,'joao','81dc9bdb52d04dc20036dbd8313ed055','com'),(3,'maria','68053af2923e00204c3ca7c6a3150cf7','com'),(9,'matheus','81dc9bdb52d04dc20036dbd8313ed055','sup'),(62,'12345678999','81dc9bdb52d04dc20036dbd8313ed055','com'),(63,'54620465800','81dc9bdb52d04dc20036dbd8313ed055','com'),(64,'46545645','81dc9bdb52d04dc20036dbd8313ed055','com'),(65,'11111111111','81dc9bdb52d04dc20036dbd8313ed055','com'),(66,'12547896587','733d7be2196ff70efaf6913fc8bdcabf','com'),(67,'82814854259','81dc9bdb52d04dc20036dbd8313ed055','com'),(68,'82814528040','81dc9bdb52d04dc20036dbd8313ed055','com'),(69,'21545645231','81dc9bdb52d04dc20036dbd8313ed055','com'),(70,'15403050020','81dc9bdb52d04dc20036dbd8313ed055','com'),(71,'52420461721','81dc9bdb52d04dc20036dbd8313ed055','com');
/*!40000 ALTER TABLE `tbusuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `vw_tbpedidos`
--

DROP TABLE IF EXISTS `vw_tbpedidos`;
/*!50001 DROP VIEW IF EXISTS `vw_tbpedidos`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_tbpedidos` (
  `id_pedido` tinyint NOT NULL,
  `id_clientes` tinyint NOT NULL,
  `pessoas` tinyint NOT NULL,
  `data_pedido` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `nome` tinyint NOT NULL,
  `cpf` tinyint NOT NULL,
  `email` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_tbprodutos`
--

DROP TABLE IF EXISTS `vw_tbprodutos`;
/*!50001 DROP VIEW IF EXISTS `vw_tbprodutos`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_tbprodutos` (
  `id_produto` tinyint NOT NULL,
  `id_tipo_produto` tinyint NOT NULL,
  `sigla_tipo` tinyint NOT NULL,
  `rotulo_tipo` tinyint NOT NULL,
  `descri_produto` tinyint NOT NULL,
  `resumo_produto` tinyint NOT NULL,
  `valor_produto` tinyint NOT NULL,
  `imagem_produto` tinyint NOT NULL,
  `destaque_produto` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_tbpedidos`
--

/*!50001 DROP TABLE IF EXISTS `vw_tbpedidos`*/;
/*!50001 DROP VIEW IF EXISTS `vw_tbpedidos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_tbpedidos` AS select `p`.`id_pedido` AS `id_pedido`,`p`.`id_clientes` AS `id_clientes`,`p`.`pessoas` AS `pessoas`,`p`.`data_pedido` AS `data_pedido`,`p`.`status` AS `status`,`c`.`nome` AS `nome`,`c`.`cpf` AS `cpf`,`c`.`email` AS `email` from (`tbpedido_reserva` `p` join `tbclientes` `c`) where `p`.`id_clientes` = `c`.`id_cliente` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_tbprodutos`
--

/*!50001 DROP TABLE IF EXISTS `vw_tbprodutos`*/;
/*!50001 DROP VIEW IF EXISTS `vw_tbprodutos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_tbprodutos` AS select `p`.`id_produto` AS `id_produto`,`p`.`id_tipo_produto` AS `id_tipo_produto`,`t`.`sigla_tipo` AS `sigla_tipo`,`t`.`rotulo_tipo` AS `rotulo_tipo`,`p`.`descri_produto` AS `descri_produto`,`p`.`resumo_produto` AS `resumo_produto`,`p`.`valor_produto` AS `valor_produto`,`p`.`imagem_produto` AS `imagem_produto`,`p`.`destaque_produto` AS `destaque_produto` from (`tbprodutos` `p` join `tbtipos` `t`) where `p`.`id_tipo_produto` = `t`.`id_tipo` */;
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

-- Dump completed on 2023-03-01 17:20:46
