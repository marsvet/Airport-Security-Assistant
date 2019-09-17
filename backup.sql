-- MySQL dump 10.13  Distrib 5.7.27, for Linux (x86_64)
--
-- Host: localhost    Database: aviation
-- ------------------------------------------------------
-- Server version	5.7.27-0ubuntu0.18.04.1

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
-- Table structure for table `具体物品`
--

DROP TABLE IF EXISTS `具体物品`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `具体物品` (
  `物品_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `物品_name` varchar(30) CHARACTER SET utf8 NOT NULL,
  `附加说明` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `携带方式_id` int(10) unsigned NOT NULL,
  `限定规格` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `统称_id` int(10) NOT NULL,
  `所属分类_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`物品_id`,`物品_name`),
  KEY `FK_carry_idx` (`携带方式_id`),
  KEY `FK_classify_idx` (`所属分类_id`),
  KEY `FK_统称_idx` (`统称_id`),
  CONSTRAINT `FK_carry` FOREIGN KEY (`携带方式_id`) REFERENCES `携带方式` (`方式_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_分类1` FOREIGN KEY (`所属分类_id`) REFERENCES `随身携带和托运物品` (`分类_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=196 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `具体物品`
--

LOCK TABLES `具体物品` WRITE;
/*!40000 ALTER TABLE `具体物品` DISABLE KEYS */;
INSERT INTO `具体物品` VALUES (1,'手枪','以及物品的仿真品',4,NULL,1,1),(2,'烟花爆竹','以及物品的仿真品',4,NULL,3,2),(3,'步枪','以及物品的仿真品',4,NULL,1,1),(4,'烟饼','以及物品的仿真品',4,NULL,3,2),(5,'冲锋枪','以及物品的仿真品',4,NULL,1,1),(6,'黄烟','以及物品的仿真品',4,NULL,7,2),(7,'机枪','以及物品的仿真品',4,NULL,1,1),(8,'礼花弹','以及物品的仿真品',4,NULL,7,2),(9,'匕首','以及物品的仿真品',4,NULL,9,3),(10,'防暴枪','以及物品的仿真品',4,NULL,1,1),(11,'三棱刮刀','',4,NULL,9,3),(12,'气枪','以及物品的仿真品',4,NULL,2,1),(13,'猎枪','以及物品的仿真品',4,NULL,2,1),(14,'跳刀','带有自锁装置',4,NULL,9,3),(15,'射击运动枪','以及物品的仿真品',4,NULL,2,1),(16,'弹簧刀','带有自锁装置',4,NULL,9,3),(17,'刀具','刀尖角度大于60度刀身长度超过220毫米的各类单刃、双刃、多刃刀具',4,NULL,9,3),(18,'麻醉注射枪','以及物品的仿真品',4,NULL,2,1),(19,'弩',NULL,4,NULL,11,3),(20,'道具枪','以及物品的仿真品',4,NULL,3,1),(21,'发令枪','以及物品的仿真品',4,NULL,3,1),(22,'氢气',NULL,4,NULL,12,4),(23,'甲烷',NULL,4,NULL,12,4),(24,'钢珠枪','以及物品的仿真品',4,NULL,3,1),(25,'乙烷',NULL,4,NULL,12,4),(26,'境外枪支以及各类非法制造的枪支','以及物品的仿真品',4,NULL,3,1),(27,'丁烷',NULL,4,NULL,12,4),(28,'炸弹','以及物品的仿真品',4,NULL,5,2),(29,'天然气',NULL,4,NULL,12,4),(30,'手榴弹','以及物品的仿真品',4,NULL,5,2),(31,'乙烯',NULL,4,NULL,12,4),(32,'照明弹','以及物品的仿真品',4,NULL,5,2),(33,'丙烯',NULL,4,NULL,12,4),(34,'燃烧弹','以及物品的仿真品',4,NULL,5,2),(35,'乙炔','溶于介质的',4,NULL,12,4),(36,'烟幕弹','以及物品的仿真品',4,NULL,5,2),(37,'一氧化碳','',4,NULL,12,4),(38,'信号弹','以及物品的仿真品',4,NULL,5,2),(39,'催泪弹','以及物品的仿真品',4,NULL,5,2),(40,'液化石油气',NULL,4,NULL,12,4),(41,'毒气弹','以及物品的仿真品',4,NULL,5,2),(42,'氟利昂',NULL,4,NULL,12,4),(43,'子弹','以及物品的仿真品',4,NULL,5,2),(44,'氧气',NULL,4,NULL,12,4),(45,'二氧化碳',NULL,4,NULL,12,4),(46,'铅弹','以及物品的仿真品',4,NULL,5,2),(47,'水煤气',NULL,4,NULL,12,4),(48,'空包弹','以及物品的仿真品',4,NULL,5,2),(49,'打火机燃料',NULL,4,NULL,12,4),(50,'教练弹','以及物品的仿真品',4,NULL,5,2),(51,'黄磷',NULL,4,NULL,13,4),(52,'白磷',NULL,4,NULL,13,4),(53,'硝化纤维','含胶片',4,NULL,13,4),(54,'油纸','及其制品',4,NULL,13,4),(55,'红磷',NULL,4,NULL,15,4),(56,'闪光粉',NULL,4,NULL,15,4),(57,'固体酒精',NULL,4,NULL,15,4),(58,'赛瑞珞',NULL,4,NULL,15,4),(59,'发泡剂',NULL,4,NULL,15,4),(60,'汽油',NULL,4,NULL,16,4),(61,'煤油',NULL,4,NULL,16,4),(62,'柴油',NULL,4,NULL,16,4),(63,'苯',NULL,4,NULL,16,4),(64,'乙醇','酒精',4,NULL,16,4),(65,'丙酮',NULL,4,NULL,16,4),(66,'乙醚',NULL,4,NULL,16,4),(67,'油漆',NULL,4,NULL,16,4),(68,'稀料',NULL,4,NULL,16,4),(69,'松香油','及含易燃溶剂制品',4,NULL,16,4),(70,'氯化物',NULL,4,NULL,18,4),(71,'碰霜',NULL,4,NULL,18,4),(72,'农药','剧毒的，以及剧毒化学品',4,NULL,18,4),(73,'乙肝病毒','炭疽杆菌',4,NULL,19,5),(74,'结核杆菌',NULL,4,NULL,19,5),(75,'艾滋病病毒',NULL,4,NULL,19,5),(76,'打火机',NULL,4,NULL,19,5),(77,'火柴',NULL,4,NULL,19,5),(78,'点烟器',NULL,4,NULL,19,5),(79,'打火石','镁棒',4,NULL,19,5),(80,'镁棒','打火石',4,NULL,19,5),(81,'充电宝','',5,'随身携带时：1.标识全面清晰，额定能量小于或等于100Wh；2.当额定能量大于100Wh、小于或等于160Wh时必须经航空公司批准且每人限带两块。必须托运时:额定能量超过160Wh。',38,11),(82,'锂电池','电动轮椅使用的锂电池另有规定',5,'随身携带时：对于可卸下的轮椅用锂电池，额定能量应不超过300Wh。经承运人批准后，方可将锂电池卸下携带登机；旅客可携带1块不超过300Wh的备用电池，或2块不超过160Wh的备用电池。必须托运时: 对于电动轮椅或代步工具的锂电池：其电池不可拆卸的，应进行托运。',38,11),(83,'强磁化物',NULL,2,'无',39,5),(84,'刺激性气体',NULL,2,'无',39,5),(85,'菜刀','刀刃长度大于6厘米',2,'无',27,7),(86,'水果刀',NULL,2,'无',27,7),(87,'剪刀',NULL,2,'无',27,7),(88,'美工刀',NULL,2,'无',27,7),(89,'裁纸刀',NULL,2,'无',27,7),(90,'手术刀',NULL,2,'无',28,7),(91,'屠宰刀',NULL,2,'无',28,7),(92,'雕刻刀',NULL,2,'无',28,7),(93,'创刀',NULL,2,'无',28,7),(94,'铣刀',NULL,2,'无',28,7),(95,'文艺表演刀','用作武术文艺表演的刀',2,'无',29,7),(96,'矛',NULL,2,'无',29,7),(97,'剑',NULL,2,'无',29,7),(98,'戴',NULL,2,'无',29,7),(99,'棍棒','含伸缩棍、双节棍',2,'无',30,8),(100,'伸缩棍',NULL,2,'无',30,8),(101,'双节棍',NULL,2,'无',30,8),(102,'球棒',NULL,2,'无',30,8),(103,'桌球杆',NULL,2,'无',30,8),(104,'板球球拍',NULL,2,'无',30,8),(105,'曲棍球杆',NULL,2,'无',30,8),(106,'高尔夫球杆',NULL,2,'无',330,8),(107,'登山杖',NULL,2,'无',30,8),(108,'滑雪杖',NULL,2,'无',30,8),(109,'指节铜套','手钉',2,'无',30,8),(110,'手钉','指节铜套',2,'无',30,8),(111,'钻机','含钻头',2,'无',31,9),(112,'凿',NULL,2,'无',31,9),(113,'锥',NULL,2,'无',31,9),(114,'锯',NULL,2,'无',31,9),(115,'螺栓枪',NULL,2,'无',31,9),(116,'射钉枪',NULL,2,'无',31,9),(117,'螺丝刀',NULL,2,'无',31,9),(118,'撬棍',NULL,2,'无',31,9),(119,'锤',NULL,2,'无',31,9),(120,'钳',NULL,2,'无',31,9),(121,'焊枪',NULL,2,'无',31,9),(122,'扳手',NULL,2,'无',31,9),(123,'斧头',NULL,2,'无',31,9),(124,'短柄小斧','太平斧',2,'无',31,9),(125,'游标卡尺',NULL,2,'无',31,9),(126,'冰镐',NULL,2,'无',31,9),(127,'碎冰锥',NULL,2,'无',31,9),(128,'飞镖',NULL,2,'无',32,9),(129,'弹弓',NULL,2,'无',32,9),(130,'弓',NULL,2,'无',32,9),(131,'箭',NULL,2,'无',32,9),(132,'蜂鸣自卫器',NULL,2,'无',32,9),(133,'电击器','不在国家规定管制范圈内的',2,'无',32,9),(134,'梅斯气体',NULL,2,'无',32,9),(135,'泪瓦斯',NULL,2,'无',32,9),(136,'胡椒辣椒喷剂',NULL,2,'无',32,9),(137,'酸性喷雾剂',NULL,2,'无',32,9),(138,'驱除动物喷剂',NULL,2,'无',32,9),(139,'含有酒精的液体',NULL,2,'作为行李托运时：1.标识全面清晰且置于零售包装内，每个容器容积不得超过5L；2.酒精的体积百分含量小于或等于24%时，托运数量不受限制；3.酒精的体积百分含量大于24%、小于或等于70%时，每位旅客托运数量不超过5L。',33,10),(140,'液态乳制品','婴儿航空旅行途中必需的',3,'经安全检查确认后可随身携带。作为行李托运无限定条件。',34,10),(141,'液态药品','糖尿病或者其他疾病患者航空旅行途中必蓄的',3,'经安全检查确认后可随身携带。作为行李托运无限定条件。',34,10),(142,'茶水','茶水、饮料等所有液态物品',3,'一、乘坐国际、地区航班时：随身携带时：液态物品应当盛放在单体容器容积不超过100mL的容器内随身携带；2.盛放液态物品的容器应置于最大容积不超过1L、可重新封口的透明塑料袋中；每名旅客每次仅允许携带一个透明塑料袋，超出部分应作为行李托运。作为行李托运无限定条件。二、乘坐国内航班：随身携带时：仅航空旅行途中自用的化妆品（每种限带一件、盛放在单体容器容积不超过100mL的容器内、接受开瓶检查）、牙膏（每种限带一件且不得超过100g（mL））及剃须膏（每种限带一件且不得超过100g（mL））可随身携带。作为行李托运无限定条件。三、在同一机场控制区内由国际、地区航班转乘国内航班：随身携带入境的免税液态物品（出示购物凭证、置于已封口且完好无损的透明塑料袋中、经安全检查确认）可随身携带。作为行李托运无限定条件。',39,10),(143,'饮料','茶水、饮料等所有液态物品',3,'一、乘坐国际、地区航班时：随身携带时：液态物品应当盛放在单体容器容积不超过100mL的容器内随身携带；2.盛放液态物品的容器应置于最大容积不超过1L、可重新封口的透明塑料袋中；每名旅客每次仅允许携带一个透明塑料袋，超出部分应作为行李托运。作为行李托运无限定条件。二、乘坐国内航班：随身携带时：仅航空旅行途中自用的化妆品（每种限带一件、盛放在单体容器容积不超过100mL的容器内、接受开瓶检查）、牙膏（每种限带一件且不得超过100g（mL））及剃须膏（每种限带一件且不得超过100g（mL））可随身携带。作为行李托运无限定条件。三、在同一机场控制区内由国际、地区航班转乘国内航班：随身携带入境的免税液态物品（出示购物凭证、置于已封口且完好无损的透明塑料袋中、经安全检查确认）可随身携带。作为行李托运无限定条件。',39,10),(169,'钾',NULL,4,NULL,14,4),(170,'钠',NULL,4,NULL,14,4),(171,'锂',NULL,4,NULL,14,4),(172,'碳化钙','电石',4,NULL,14,4),(173,'电石','碳化钙',4,NULL,14,4),(174,'镁铝粉',NULL,4,NULL,14,4),(175,'炸药',NULL,4,NULL,6,2),(176,'雷管',NULL,4,NULL,6,2),(177,'引信',NULL,4,NULL,6,2),(178,'起爆管',NULL,4,NULL,6,2),(179,'导火索',NULL,4,NULL,6,2),(180,'导爆索',NULL,4,NULL,6,2),(181,'爆破剂',NULL,4,NULL,6,2),(182,'警棍',NULL,4,NULL,10,3),(183,'警用电击器',NULL,4,NULL,10,3),(184,'军用或警用的匕首',NULL,4,NULL,10,3),(185,'手铐',NULL,4,NULL,10,3),(186,'拇指铐',NULL,4,NULL,10,3),(187,'脚僚',NULL,4,NULL,10,3),(188,'催泪喷射器',NULL,4,NULL,10,3),(189,'高锰酸钾',NULL,4,NULL,17,4),(190,'氯酸钾',NULL,4,NULL,17,4),(191,'过氧化钠',NULL,4,NULL,17,4),(192,'过氧化钾',NULL,4,NULL,17,4),(193,'过氧化铅',NULL,4,NULL,17,4),(194,'过醋酸',NULL,4,NULL,17,4),(195,'双氧水',NULL,4,NULL,17,4);
/*!40000 ALTER TABLE `具体物品` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `携带方式`
--

DROP TABLE IF EXISTS `携带方式`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `携带方式` (
  `方式_id` int(10) unsigned NOT NULL,
  `方式_name` varchar(20) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`方式_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `携带方式`
--

LOCK TABLES `携带方式` WRITE;
/*!40000 ALTER TABLE `携带方式` DISABLE KEYS */;
INSERT INTO `携带方式` VALUES (1,'随身携带'),(2,'行李托运'),(3,'随身携带/行李托运'),(4,'不能携带'),(5,'视情况随身携带或行李托运，详见限定规格');
/*!40000 ALTER TABLE `携带方式` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `物品信息`
--

DROP TABLE IF EXISTS `物品信息`;
/*!50001 DROP VIEW IF EXISTS `物品信息`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `物品信息` AS SELECT 
 1 AS `物品名称`,
 1 AS `附加说明`,
 1 AS `限定规格`,
 1 AS `携带方式`,
 1 AS `物品所属分类`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `物品大类`
--

DROP TABLE IF EXISTS `物品大类`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `物品大类` (
  `大类_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `大类_name` varchar(30) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`大类_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `物品大类`
--

LOCK TABLES `物品大类` WRITE;
/*!40000 ALTER TABLE `物品大类` DISABLE KEYS */;
INSERT INTO `物品大类` VALUES (1,'旅客禁止随身携带和托运物品'),(2,'旅客限制随身携带和托运物品');
/*!40000 ALTER TABLE `物品大类` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `统称`
--

DROP TABLE IF EXISTS `统称`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `统称` (
  `统称_id` int(10) NOT NULL,
  `统称_name` varchar(100) NOT NULL,
  PRIMARY KEY (`统称_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `统称`
--

LOCK TABLES `统称` WRITE;
/*!40000 ALTER TABLE `统称` DISABLE KEYS */;
INSERT INTO `统称` VALUES (1,'军用枪、公务用枪'),(2,'民用枪'),(3,'其他枪支'),(4,'上述物品的仿真品'),(5,'弹药'),(6,'爆破器材'),(7,'烟火制品'),(8,'上述物品的仿真品'),(9,'管制刀具'),(10,'军警械具'),(11,'其他属于国家规定的管制器具'),(12,'压缩气体和液化气体'),(13,'自燃物品'),(14,'遇湿易燃物品'),(15,'易燃固体'),(16,'易燃液体'),(17,'氧化剂和有机过氧化物'),(18,'毒害品'),(19,'传染病病原体'),(20,'火种（包括各类点火装置）'),(23,'强磁化物、有强烈刺激性气味或者容易引起旅客恐慌情绪的物品以及不能判明性质可能具有危险性的物品'),(24,'/'),(25,'/'),(26,'/'),(27,'日用刀具（刀刃长度大于6厘米）'),(28,'专业刀具（刀刃长度不限）'),(29,'用作武术文艺表演的刀、矛、剑、戴等'),(30,'钝器'),(31,'工具'),(32,'其他物品'),(33,'酒精'),(34,'特殊人群所需的液体物品'),(35,'乘坐国际、地区航班的旅客携带的液态物品'),(36,'乘坐国内航班的旅客携带的液态物品'),(37,'在同一机场控制区内由国际、地区航班转乘国内航班的旅客携带的液态物品'),(38,'电池等储电物品'),(39,'无');
/*!40000 ALTER TABLE `统称` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `随身携带和托运物品`
--

DROP TABLE IF EXISTS `随身携带和托运物品`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `随身携带和托运物品` (
  `分类_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `分类_name` varchar(40) CHARACTER SET utf8 NOT NULL,
  `分类_introduce` text CHARACTER SET utf8 NOT NULL,
  `所属大类_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`分类_id`),
  KEY `大类id` (`所属大类_id`),
  CONSTRAINT `大类id` FOREIGN KEY (`所属大类_id`) REFERENCES `物品大类` (`大类_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `随身携带和托运物品_ibfk_1` FOREIGN KEY (`所属大类_id`) REFERENCES `物品大类` (`大类_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `随身携带和托运物品`
--

LOCK TABLES `随身携带和托运物品` WRITE;
/*!40000 ALTER TABLE `随身携带和托运物品` DISABLE KEYS */;
INSERT INTO `随身携带和托运物品` VALUES (1,'枪支等武器（包括主要零部件）','能够发射弹药（包括弹丸及其他物品）并造成人身严重伤害的装置或者可能被误认为是此类装置的物品',1),(2,'爆炸或者燃烧物质和装置','能够造成人身严重伤害或者危及航空器安全的爆炸或燃烧装置（物质）或者可能被误认为是此类装置（物质）的物品',1),(3,'管制器具','能够造成人身伤害或者对航空安全和运输秩序构成较大危害的管制器具',1),(4,'危险物品','能够造成人身伤害或者对航空安全和运输秩序造成较大威海的危险物品',1),(5,'其他物品','其他能够造成人身伤害或者对航空安全和运输秩序造成较大威海的危险物品',1),(6,'国家法律、行政法规、规章规定的其他禁止运输的物品','/',1),(7,'锐器','该类物品带有锋利边缘或者锐利尖端，由金属或其他材料制成的、强度足以造成人身严重伤害的器械',2),(8,'钝器','该类物品不带有锋利边缘或者锐利尖端，由金属或其他材料制成的、强度足以造成人身严重伤害的器械',2),(9,'工具等其他器械','该类物品也属于能够造成人身伤害或者对航空安全和运输秩序构成较大危害的物品',2),(10,'液态物品','液体的易燃品危险性比固体大，燃烧起来漫延速度很快，几乎无法及时扑救，飞机在起落期间的压力变化很大，会导致可燃性气体的密度发生变化从而产生泄漏而发生安全事故。另外，很多恐怖袭击也都是借助液态物品展开。',2),(11,'电池等储电物品','货仓内环境不稳定，温度和气压的变化剧烈，同时行李放在货仓随着机身颠簸互相挤压，因为金属锂的不稳定性，锂电池都是脆性封装，在内部压力高时自动破裂。',2);
/*!40000 ALTER TABLE `随身携带和托运物品` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(20) CHARACTER SET utf8 NOT NULL,
  `passwd` varchar(200) CHARACTER SET utf8 NOT NULL,
  `phone_number` decimal(13,0) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `ID_card` varchar(18) DEFAULT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'王老师','123',NULL,NULL,NULL),(2,'王子泓','123',NULL,NULL,NULL),(3,'马涛','123',NULL,NULL,NULL),(4,'郑清沁','123',NULL,NULL,NULL),(5,'刘鑫哲','123',NULL,NULL,NULL);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city_code`
--

DROP TABLE IF EXISTS `city_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `city_code` (
  `code` varchar(3) NOT NULL,
  `city` varchar(45) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city_code`
--

LOCK TABLES `city_code` WRITE;
/*!40000 ALTER TABLE `city_code` DISABLE KEYS */;
INSERT INTO `city_code` VALUES ('AAT','阿勒泰'),('AKA','安康'),('AKU','阿克苏'),('AQC','安庆'),('BAV','包头'),('BHY','北海'),('BJS','北京'),('BSD','保山'),('CAN','广州'),('CGD','常德'),('CGO','郑州'),('CGQ','长春'),('CHG','朝阳'),('CHW','酒泉'),('CIF','赤峰'),('CIH','长治'),('CKG','重庆'),('CNI','长海'),('CSX','长沙'),('CTU','成都'),('CZX','常州'),('DAT','大同'),('DAX','达县'),('DDG','丹东'),('DLC','大连'),('DNH','敦煌'),('DYG','大庸'),('ENH','恩施'),('ENY','延安'),('FOC','福州'),('FUG','阜阳'),('FYN','富蕴'),('GHN','广汉'),('GOQ','格尔木'),('HAK','海口'),('HEK','黑河'),('HET','呼和浩特'),('HFE','合肥'),('HGH','杭州'),('HHA','黄花机场(长沙)'),('HLD','海拉尔'),('HLH','乌兰浩特'),('HMI','哈密'),('HNY','衡阳'),('HRB','哈尔滨'),('HTN','和田'),('HZG','汉中'),('INC','银川'),('IQM','且末'),('IQN','庆阳'),('JDZ','景德镇'),('JGN','嘉峪关'),('JIU','九江'),('JJN','晋江'),('JMU','佳木斯'),('KCA','库车'),('KHG','喀什'),('KHN','南昌'),('KMG','昆明'),('KNC','吉安'),('KOW','赣州'),('KRL','库尔勒'),('KRY','克拉玛依'),('KWE','贵阳'),('KWL','桂林'),('LHW','兰州'),('LIA','梁平'),('LUZ','庐山'),('LXA','拉萨'),('LXI','林西'),('LYA','洛阳'),('LYG','连云港'),('LYI','临沂'),('LZD','兰州东'),('LZH','柳州'),('MOG','牡丹江'),('MXZ','梅县'),('NAO','南充'),('NDG','齐齐哈尔'),('NGB','宁波'),('NKG','南京'),('NNG','南宁'),('NNY','南阳'),('PEK','首都机场(北京)'),('PVG','上海浦东'),('SHA','上海'),('SHE','沈阳'),('SHP','山海关'),('SHS','沙市'),('SIA','西安'),('SWA','汕头'),('SYM','思茅'),('SYX','三亚'),('SZX','深圳'),('TAO','青岛'),('TEN','铜仁'),('TGO','辽通'),('TNA','济南'),('TSN','天津'),('TXN','屯溪'),('TYN','太原'),('URC','乌鲁木齐'),('UYN','榆林'),('WUH','武汉'),('WXN','万县'),('XEN','兴城'),('XFN','襄樊'),('XIC','西昌'),('XIL','锡林浩特'),('XIN','兴宁'),('XIY','咸阳机场(西安)'),('XMN','厦门'),('XNN','西宁'),('XUZ','徐州'),('YIH','宜昌'),('YIN','伊宁'),('YLN','依兰'),('YNJ','延吉'),('YNT','烟台'),('ZAT','昭通'),('ZGC','中川机场(兰州)'),('ZHA','湛江'),('ZUH','珠海');
/*!40000 ALTER TABLE `city_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedback` (
  `fb_id` int(11) NOT NULL AUTO_INCREMENT,
  `fb_phone_number` decimal(13,0) NOT NULL COMMENT '中国大陆：86 + 11位电话号码。所以总共13位',
  `fb_email` varchar(50) CHARACTER SET utf8 NOT NULL,
  `fb_suggestion` text CHARACTER SET utf8 NOT NULL,
  `fb_star` enum('1','2','3','4','5') CHARACTER SET utf8 NOT NULL,
  `fb_name` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `fb_type` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`fb_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(30) CHARACTER SET utf8 NOT NULL DEFAULT '无昵称',
  `passwd` varchar(200) CHARACTER SET utf8 NOT NULL,
  `phone_number` decimal(13,0) DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'无昵称','pbkdf2:sha256:150000$yuzmUcUI$c74366cc53af5f9c44c15e60c0ec7db8e19697e680b1a33d960541b0a2139d96',NULL,'moli-ma@foxmail.com'),(2,'无昵称','pbkdf2:sha256:150000$F24fQjNJ$591cbb4c054fa04b512cc930d49a6edaae4ef28e658ca076ebe956bda15871ee',NULL,'1358044937@qq.com'),(4,'无昵称','pbkdf2:sha256:150000$3tC1Fyeb$d6583ab957641321f566d22f6b24ca10c3829995eee8a3ecda62ab2ee0782094',NULL,'691851237@qq.com'),(6,'无昵称','pbkdf2:sha256:150000$FIYAClER$006f835d2e24dc73d7b70886de4a2fc1f2c8a563b4cc48af24e4ccca013cc8fd',NULL,'wzhyt1@163.com');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `物品信息`
--

/*!50001 DROP VIEW IF EXISTS `物品信息`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `物品信息` AS select `具体物品`.`物品_name` AS `物品名称`,`具体物品`.`附加说明` AS `附加说明`,`具体物品`.`限定规格` AS `限定规格`,`携带方式`.`方式_name` AS `携带方式`,`统称`.`统称_name` AS `物品所属分类` from ((`具体物品` join `携带方式`) join `统称`) where ((`具体物品`.`携带方式_id` = `携带方式`.`方式_id`) and (`具体物品`.`统称_id` = `统称`.`统称_id`)) */;
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

-- Dump completed on 2019-09-17 23:51:29
