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
  `所属分类_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`物品_id`,`物品_name`),
  KEY `FK_carry_idx` (`携带方式_id`),
  KEY `FK_classify_idx` (`所属分类_id`),
  CONSTRAINT `FK_carry` FOREIGN KEY (`携带方式_id`) REFERENCES `携带方式` (`方式_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_classify` FOREIGN KEY (`所属分类_id`) REFERENCES `随身携带和托运物品` (`分类_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=196 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `具体物品`
--

LOCK TABLES `具体物品` WRITE;
/*!40000 ALTER TABLE `具体物品` DISABLE KEYS */;
INSERT INTO `具体物品` VALUES (1,'手枪','以及物品的仿真品',4,'/',1),(2,'烟花爆竹','以及物品的仿真品',4,'/',2),(3,'步枪','以及物品的仿真品',4,'/',1),(4,'烟饼','以及物品的仿真品',4,'/',2),(5,'冲锋枪','以及物品的仿真品',4,'/',1),(6,'黄烟','以及物品的仿真品',4,'/',2),(7,'机枪','以及物品的仿真品',4,'/',1),(8,'礼花弹','以及物品的仿真品',4,'/',2),(9,'匕首','以及物品的仿真品',4,'/',3),(10,'防暴枪','以及物品的仿真品',4,'/',1),(11,'三棱刮刀','',4,'/',3),(12,'气枪','以及物品的仿真品',4,'/',1),(13,'猎枪','以及物品的仿真品',4,'/',1),(14,'跳刀','带有自锁装置',4,'/',3),(15,'射击运动枪','以及物品的仿真品',4,'/',1),(16,'弹簧刀','带有自锁装置',4,'/',3),(17,'刀具','刀尖角度大于60度刀身长度超过220毫米的各类单刃、双刃、多刃刀具',4,'/',3),(18,'麻醉注射枪','以及物品的仿真品',4,'/',1),(19,'弩',NULL,4,'/',3),(20,'道具枪','以及物品的仿真品',4,'/',1),(21,'发令枪','以及物品的仿真品',4,'/',1),(22,'氢气',NULL,4,'/',4),(23,'甲烷',NULL,4,'/',4),(24,'钢珠枪','以及物品的仿真品',4,'/',1),(25,'乙烷',NULL,4,'/',4),(26,'境外枪支以及各类非法制造的枪支','以及物品的仿真品',4,'/',1),(27,'丁烷',NULL,4,'/',4),(28,'炸弹','以及物品的仿真品',4,'/',2),(29,'天然气',NULL,4,'/',4),(30,'手榴弹','以及物品的仿真品',4,'/',2),(31,'乙烯',NULL,4,'/',4),(32,'照明弹','以及物品的仿真品',4,'/',2),(33,'丙烯',NULL,4,'/',4),(34,'燃烧弹','以及物品的仿真品',4,'/',2),(35,'乙炔','溶于介质的',4,'/',4),(36,'烟幕弹','以及物品的仿真品',4,'/',2),(37,'一氧化碳','',4,'/',4),(38,'信号弹','以及物品的仿真品',4,'/',2),(39,'催泪弹','以及物品的仿真品',4,'/',2),(40,'液化石油气',NULL,4,'/',4),(41,'毒气弹','以及物品的仿真品',4,'/',2),(42,'氟利昂',NULL,4,'/',4),(43,'子弹','以及物品的仿真品',4,'/',2),(44,'氧气',NULL,4,'/',4),(45,'二氧化碳',NULL,4,'/',4),(46,'铅弹','以及物品的仿真品',4,'/',2),(47,'水煤气',NULL,4,'/',4),(48,'空包弹','以及物品的仿真品',4,'/',2),(49,'打火机燃料',NULL,4,'/',4),(50,'教练弹','以及物品的仿真品',4,'/',2),(51,'黄磷',NULL,4,'/',4),(52,'白磷',NULL,4,'/',4),(53,'硝化纤维','含胶片',4,'/',4),(54,'油纸','及其制品',4,'/',4),(55,'红磷',NULL,4,'/',4),(56,'闪光粉',NULL,4,'/',4),(57,'固体酒精',NULL,4,'/',4),(58,'赛瑞珞',NULL,4,'/',4),(59,'发泡剂',NULL,4,'/',4),(60,'汽油',NULL,4,'/',4),(61,'煤油',NULL,4,'/',4),(62,'柴油',NULL,4,'/',4),(63,'苯',NULL,4,'/',4),(64,'乙醇','酒精',4,'/',4),(65,'丙酮',NULL,4,'/',4),(66,'乙醚',NULL,4,'/',4),(67,'油漆',NULL,4,'/',4),(68,'稀料',NULL,4,'/',4),(69,'松香油','及含易燃溶剂制品',4,'/',4),(70,'氯化物',NULL,4,'/',4),(71,'碰霜',NULL,4,'/',4),(72,'农药','剧毒的，以及剧毒化学品',4,'/',4),(73,'乙肝病毒','炭疽杆菌',4,'/',5),(74,'结核杆菌',NULL,4,'/',5),(75,'艾滋病病毒',NULL,4,'/',5),(76,'打火机',NULL,4,'/',5),(77,'火柴',NULL,4,'/',5),(78,'点烟器',NULL,4,'/',5),(79,'打火石','镁棒',4,'/',5),(80,'镁棒','打火石',4,'/',5),(81,'充电宝',NULL,2,'随身携带时：1.标识全面清晰，额定能量小于或等于100Wh；2.当额定能量大于100Wh、小于或等于160Wh时必须经航空公司批准且每人限带两块。3.对于可卸下的轮椅用锂电池，额定能量应不超过300Wh。经承运人批准后，方可将锂电池卸下携带登机；旅客可携带1块不超过300Wh的备用电池，或2块不超过160Wh的备用电池。必须托运时:额定能量超过160Wh。对于电动轮椅或代步工具的锂电池：其电池不可拆卸的，应进行托运',11),(82,'锂电池','电动轮椅使用的锂电池另有规定',2,'随身携带时：1.标识全面清晰，额定能量小于或等于100Wh；2.当额定能量大于100Wh、小于或等于160Wh时必须经航空公司批准且每人限带两块。3.对于可卸下的轮椅用锂电池，额定能量应不超过300Wh。经承运人批准后，方可将锂电池卸下携带登机；旅客可携带1块不超过300Wh的备用电池，或2块不超过160Wh的备用电池。必须托运时:额定能量超过160Wh。对于电动轮椅或代步工具的锂电池：其电池不可拆卸的，应进行托运',11),(83,'强磁化物',NULL,2,'/',5),(84,'刺激性气体',NULL,2,'/',5),(85,'菜刀','刀刃长度大于6厘米',2,'无',7),(86,'水果刀',NULL,2,'无',7),(87,'剪刀',NULL,2,'无',7),(88,'美工刀',NULL,2,'无',7),(89,'裁纸刀',NULL,2,'无',7),(90,'手术刀',NULL,2,'无',7),(91,'屠宰刀',NULL,2,'无',7),(92,'雕刻刀',NULL,2,'无',7),(93,'创刀',NULL,2,'无',7),(94,'铣刀',NULL,2,'无',7),(95,'文艺表演刀','用作武术文艺表演的刀',2,'无',7),(96,'矛',NULL,2,'无',7),(97,'剑',NULL,2,'无',7),(98,'戴',NULL,2,'无',7),(99,'棍棒','含伸缩棍、双节棍',2,'无',8),(100,'伸缩棍',NULL,2,'无',8),(101,'双节棍',NULL,2,'无',8),(102,'球棒',NULL,2,'无',8),(103,'桌球杆',NULL,2,'无',8),(104,'板球球拍',NULL,2,'无',8),(105,'曲棍球杆',NULL,2,'无',8),(106,'高尔夫球杆',NULL,2,'无',8),(107,'登山杖',NULL,2,'无',8),(108,'滑雪杖',NULL,2,'无',8),(109,'指节铜套','手钉',2,'无',8),(110,'手钉','指节铜套',2,'无',8),(111,'钻机','含钻头',2,'无',9),(112,'凿',NULL,2,'无',9),(113,'锥',NULL,2,'无',9),(114,'锯',NULL,2,'无',9),(115,'螺栓枪',NULL,2,'无',9),(116,'射钉枪',NULL,2,'无',9),(117,'螺丝刀',NULL,2,'无',9),(118,'撬棍',NULL,2,'无',9),(119,'锤',NULL,2,'无',9),(120,'钳',NULL,2,'无',9),(121,'焊枪',NULL,2,'无',9),(122,'扳手',NULL,2,'无',9),(123,'斧头',NULL,2,'无',9),(124,'短柄小斧','太平斧',2,'无',9),(125,'游标卡尺',NULL,2,'无',9),(126,'冰镐',NULL,2,'无',9),(127,'碎冰锥',NULL,2,'无',9),(128,'飞镖',NULL,2,'无',9),(129,'弹弓',NULL,2,'无',9),(130,'弓',NULL,2,'无',9),(131,'箭',NULL,2,'无',9),(132,'蜂鸣自卫器',NULL,2,'无',9),(133,'电击器','不在国家规定管制范圈内的',2,'无',9),(134,'梅斯气体',NULL,2,'无',9),(135,'泪瓦斯',NULL,2,'无',9),(136,'胡椒辣椒喷剂',NULL,2,'无',9),(137,'酸性喷雾剂',NULL,2,'无',9),(138,'驱除动物喷剂',NULL,2,'无',9),(139,'含有酒精的液体',NULL,2,'作为行李托运时：1.标识全面清晰且置于零售包装内，每个容器容积不得超过5L；2.酒精的体积百分含量小于或等于24%时，托运数量不受限制；3.酒精的体积百分含量大于24%、小于或等于70%时，每位旅客托运数量不超过5L。',10),(140,'液态乳制品','婴儿航空旅行途中必需的',3,'经安全检查确认后可随身携带。作为行李托运无限定条件。',10),(141,'液态药品','糖尿病或者其他疾病患者航空旅行途中必蓄的',3,'经安全检查确认后可随身携带。作为行李托运无限定条件。',10),(142,'茶水','茶水、饮料等所有液态物品',3,'一、乘坐国际、地区航班时：随身携带时：液态物品应当盛放在单体容器容积不超过100mL的容器内随身携带；2.盛放液态物品的容器应置于最大容积不超过1L、可重新封口的透明塑料袋中；每名旅客每次仅允许携带一个透明塑料袋，超出部分应作为行李托运。作为行李托运无限定条件。二、乘坐国内航班：随身携带时：仅航空旅行途中自用的化妆品（每种限带一件、盛放在单体容器容积不超过100mL的容器内、接受开瓶检查）、牙膏（每种限带一件且不得超过100g（mL））及剃须膏（每种限带一件且不得超过100g（mL））可随身携带。作为行李托运无限定条件。三、在同一机场控制区内由国际、地区航班转乘国内航班：随身携带入境的免税液态物品（出示购物凭证、置于已封口且完好无损的透明塑料袋中、经安全检查确认）可随身携带。作为行李托运无限定条件。',10),(143,'饮料','茶水、饮料等所有液态物品',3,'一、乘坐国际、地区航班时：随身携带时：液态物品应当盛放在单体容器容积不超过100mL的容器内随身携带；2.盛放液态物品的容器应置于最大容积不超过1L、可重新封口的透明塑料袋中；每名旅客每次仅允许携带一个透明塑料袋，超出部分应作为行李托运。作为行李托运无限定条件。二、乘坐国内航班：随身携带时：仅航空旅行途中自用的化妆品（每种限带一件、盛放在单体容器容积不超过100mL的容器内、接受开瓶检查）、牙膏（每种限带一件且不得超过100g（mL））及剃须膏（每种限带一件且不得超过100g（mL））可随身携带。作为行李托运无限定条件。三、在同一机场控制区内由国际、地区航班转乘国内航班：随身携带入境的免税液态物品（出示购物凭证、置于已封口且完好无损的透明塑料袋中、经安全检查确认）可随身携带。作为行李托运无限定条件。',10),(169,'钾',NULL,4,'/',NULL),(170,'钠',NULL,4,'/',NULL),(171,'锂',NULL,4,'/',NULL),(172,'碳化钙','电石',4,'/',NULL),(173,'电石','碳化钙',4,'/',NULL),(174,'镁铝粉',NULL,4,'/',NULL),(175,'炸药',NULL,4,'/',2),(176,'雷管',NULL,4,'/',2),(177,'引信',NULL,4,'/',2),(178,'起爆管',NULL,4,'/',2),(179,'导火索',NULL,4,'/',2),(180,'导爆索',NULL,4,'/',2),(181,'爆破剂',NULL,4,'/',2),(182,'警棍',NULL,4,'/',3),(183,'警用电击器',NULL,4,'/',3),(184,'军用或警用的匕首',NULL,4,'/',3),(185,'手铐',NULL,4,'/',3),(186,'拇指铐',NULL,4,'/',3),(187,'脚僚',NULL,4,'/',3),(188,'催泪喷射器',NULL,4,'/',3),(189,'高锰酸钾',NULL,4,'/',4),(190,'氯酸钾',NULL,4,'/',4),(191,'过氧化钠',NULL,4,'/',4),(192,'过氧化钾',NULL,4,'/',4),(193,'过氧化铅',NULL,4,'/',4),(194,'过醋酸',NULL,4,'/',4),(195,'双氧水',NULL,4,'/',4);
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
INSERT INTO `携带方式` VALUES (1,'随身携带'),(2,'行李托运'),(3,'随身携带/行李托运'),(4,'不能携带');
/*!40000 ALTER TABLE `携带方式` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `查找`
--

DROP TABLE IF EXISTS `查找`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `查找` (
  `物品_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `物品_name` varchar(100) CHARACTER SET utf8 NOT NULL,
  `物品_example` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `携带方式_id` int(10) unsigned NOT NULL,
  `限定规格` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `所属分类_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`物品_id`),
  KEY `携带ways_idx` (`携带方式_id`),
  KEY `所属分类id` (`所属分类_id`),
  CONSTRAINT `所属分类id` FOREIGN KEY (`所属分类_id`) REFERENCES `随身携带和托运物品` (`分类_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `携带ways` FOREIGN KEY (`携带方式_id`) REFERENCES `携带方式` (`方式_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `查找_ibfk_1` FOREIGN KEY (`所属分类_id`) REFERENCES `随身携带和托运物品` (`分类_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `查找`
--

LOCK TABLES `查找` WRITE;
/*!40000 ALTER TABLE `查找` DISABLE KEYS */;
INSERT INTO `查找` VALUES (1,'军用枪、公务用枪','手枪、步枪、冲锋枪、机枪、防暴枪',4,'无',1),(2,'民用枪','气枪、猎枪、射击运动枪、麻醉注射枪',4,'无',1),(3,'其他枪支','道具枪、发令枪、钢珠枪、境外枪支以及各类非法制造的枪支',4,'无',1),(4,'上述物品的仿真品','上述物品的仿真品',4,'无',1),(5,'弹药','炸弹、手榴弹、照明弹、燃烧弹、烟幕弹、信号弹、催泪弹、毒气弹、子弹（铅弹、空包弹、教练弹）',4,'无',2),(6,'爆破器材','炸药、雷管、引信、起爆管、导火索、导爆索、爆破剂',4,'无',2),(7,'烟火制品','烟花爆竹、烟饼、黄烟、礼花弹',4,'无',2),(8,'上述物品的仿真品','上述物品的仿真品',4,'无',2),(9,'管制刀具','匕首、三棱刮刀带有自锁装置的弹簧刀或跳刀，以及其他刀尖角度大于60度刀身长度超过220毫米的各类单刃、双刃、多刃刀具',4,'无',3),(10,'军警械具','警棍、警用电击器、军用或警用的匕首、手铐、拇指铐、脚僚、催泪喷射器',4,'无',3),(11,'其他属于国家规定的管制器具','弩',4,'无',3),(12,'压缩气体和液化气体','氢气、甲烷、乙烷、丁烷、天然气、乙烯、丙烯、乙炔（溶于介质的）、一氧化碳、液化石油气、氟利昂、氧气、二氧化碳、水煤气、打火机燃料及打火机用液化气体',4,'无',4),(13,'自燃物品','黄磷、白磷、硝化纤维（含胶片）、油纸及其制品',4,'无',4),(14,'遇湿易燃物品','金属钾、钠、锂、碳化钙（电石）、镁铝粉',4,'无',4),(15,'易燃固体','红磷、闪光粉、固体酒精、赛瑞珞、发泡剂',4,'无',4),(16,'易燃液体','汽油、煤油、柴油、苯、乙醇（酒精）、丙酮、乙醚、油漆、稀料、松香油及含易燃溶剂制品',4,'无',4),(17,'氧化剂和有机过氧化物','高锰酸钾、氯酸钾、过氧化钠、过氧化钾、过氧化铅、过醋酸、双氧水',4,'无',4),(18,'毒害品','氯化物、碰霜、剧毒农药等剧毒化学品',4,'无',4),(19,'传染病病原体','乙肝病毒、炭疽杆菌、结核杆菌、艾滋病病毒',4,'无',5),(20,'火种（包括各类点火装置）','打火机、火柴、点烟器、镁棒（打火石）',4,'无',5),(23,'强磁化物、有强烈刺激性气味或者容易引起旅客恐慌情绪的物品以及不能判明性质可能具有危险性的物品','/',4,'无',5),(24,'/','/',4,'无',6),(25,'/','/',4,'无',6),(26,'/','/',4,'无',6),(27,'日用刀具（刀刃长度大于6厘米）','菜刀、水果刀、剪刀、美工刀、裁纸刀',2,'无',7),(28,'专业刀具（刀刃长度不限）','手术刀、屠宰刀、雕刻刀、创刀、铣刀',2,'无',7),(29,'用作武术文艺表演的刀、矛、剑、戴等','用作武术文艺表演的刀、矛、剑、戴等',2,'无',7),(30,'钝器','棍棒（含伸缩棍、双节棍）、球棒、桌球杆、板球球拍、曲棍球杆、高尔夫球杆、登山杖、滑雪杖、指节铜套（手钉）',2,'无',8),(31,'工具','钻机（含钻头）、凿、锥、锯、螺栓枪、射钉枪、螺丝刀、撬棍、锤、钳、焊枪、扳手、斧头、短柄小斧（太平斧）、游标卡尺、冰镐、碎冰锥',2,'无',9),(32,'其他物品','飞镖、弹弓、弓、箭、蜂鸣自卫器以及不在国家规定管制范圈内的电击器、梅斯气体、催泪瓦斯、胡椒辣椒喷剂、酸性喷雾剂、驱除动物喷剂等',2,'无',9),(33,'酒精','含有酒精的液体',2,'作为行李托运时：1.标识全面清晰且置于零售包装内，每个容器容积不得超过5L；2.酒精的体积百分含量小于或等于24%时，托运数量不受限制；3.酒精的体积百分含量大于24%、小于或等于70%时，每位旅客托运数量不超过5L。',10),(34,'特殊人群所需的液体物品','婴儿航空旅行途中必需的液态乳制品、糖尿病或者其他疾病患者航空旅行途中必蓄的液态药品',3,'经安全检查确认后可随身携带/作为行李托运无限定条件。',10),(35,'乘坐国际、地区航班的旅客携带的液态物品','茶水、饮料等所有液态物品',3,'随身携带时：液态物品应当盛放在单体容器容积不超过100mL的容器内随身携带；盛放液态物品的容器应置于最大容积不超过1L、可重新封口的透明塑料袋中；/作为行李托运无限定条件。',10),(36,'乘坐国内航班的旅客携带的液态物品','茶水、饮料等所有液态物品',2,'随身携带时：仅航空旅行途中自用的化妆品（每种限带一件、盛放在单体容器容积不超过100mL的容器内、接受开瓶检查）、牙膏（每种限带一件且不得超过100g（mL））及剃须膏（每种限带一件且不得超过100g（mL））可随身携带。/作为行李托运无限定条件。',10),(37,'在同一机场控制区内由国际、地区航班转乘国内航班的旅客携带的液态物品','茶水、饮料等所有液态物品',3,'随身携带入境的免税液态物品（出示购物凭证、置于已封口且完好无损的透明塑料袋中、经安全检查确认）可随身携带。/作为行李托运无限定条件。',10),(38,'电池等储电物品','充电宝、锂电池',1,'随身携带时：1.标识全面清晰，额定能量小于或等于100Wh；2.当额定能量大于100Wh、小于或等于160Wh时必须经航空公司批准且每人限带两块。',11),(39,'电池等储电物品','电动轮椅使用的锂电池',3,'额定能量超过160Wh。对于电动轮椅或代步工具的锂电池：其电池不可拆卸的，应进行托运；电动轮椅或类似的代步工具中可拆卸的锂电池，额定能量应不超过300Wh。经承运人批准后，方可将锂电池卸下携带登机；对于可卸下的轮椅用锂电池，旅客可携带1块不超过300Wh的备用电池，或2块不超过160Wh的备用电池。',11);
/*!40000 ALTER TABLE `查找` ENABLE KEYS */;
UNLOCK TABLES;

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
  `admin_name` varchar(20) CHARACTER SET utf8 NOT NULL DEFAULT '未命名管理员',
  `passwd` varchar(30) CHARACTER SET utf8 NOT NULL DEFAULT '111111',
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'王老师','123'),(2,'王子泓','123'),(3,'马涛','123'),(4,'郑清沁','123'),(5,'刘鑫哲','123');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
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
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(30) CHARACTER SET utf8 NOT NULL,
  `passed` varchar(20) CHARACTER SET utf8 NOT NULL DEFAULT '123',
  `phone_number` decimal(13,0) NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'王老师','123',123456,'951471685@qq.com'),(2,'王子泓','123',123456,'951471685@qq.com'),(3,'马涛','123',123456,'951471685@qq.com'),(4,'郑清沁','123',123456,'951471685@qq.com'),(5,'刘鑫哲','123',123456,'951471685@qq.com');
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

-- Dump completed on 2019-08-13  0:09:17
