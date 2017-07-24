CREATE DATABASE /*!32312 IF NOT EXISTS*/ `test` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `additionalattribute` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PRIVATECREATOR` varchar(255) DEFAULT NULL,
  `SEQUENCEPRIVATECREATOR` varchar(255) DEFAULT NULL,
  `SEQUENCETAGTOCOMPARE` int(11) DEFAULT NULL,
  `TAGTOCOMPARE` int(11) DEFAULT NULL,
  `VALUE` varchar(1024) DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  `SOPINSTANCE_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_additionalAttribute_SOPINSTANCE_ID` (`SOPINSTANCE_ID`),
  CONSTRAINT `FK_additionalAttribute_SOPINSTANCE_ID` FOREIGN KEY (`SOPINSTANCE_ID`) REFERENCES `sopinstance` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `applicationentity` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `AEREMOTETYPE` int(11) DEFAULT NULL,
  `AETYPE` int(11) DEFAULT NULL,
  `AUTOCONFIGUID` varchar(255) DEFAULT NULL,
  `AUTOMATICORDERS` tinyint(1) DEFAULT '0',
  `CONTACT` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `IP` varchar(255) DEFAULT NULL,
  `LOCATION` varchar(255) DEFAULT NULL,
  `MODALITY` varchar(255) NOT NULL,
  `MWLUSER` tinyint(1) DEFAULT '0',
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PORT` int(11) DEFAULT NULL,
  `QUERYPROVIDER` tinyint(1) DEFAULT '0',
  `STORAGEPROVIDER` tinyint(1) DEFAULT '0',
  `TITLE` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `VERSION` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UNQ_applicationEntity_0` (`TITLE`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `applicationentity` VALUES (1,NULL,1,'TESTe3456654',0,NULL,NULL,'localhost',NULL,'OT',0,'TEST Server',11119,0,0,'123',0),(2,NULL,2,'TESTMWLc220d462',0,NULL,NULL,'localhost',NULL,'OT',0,'TEST Server Worklist',11119,0,0,'12s2s2',0);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `automaticfileimportlocation` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ACTIVE` tinyint(1) DEFAULT '0',
  `FILENAME` varchar(255) DEFAULT NULL,
  `location` varchar(255) NOT NULL,
  `LOCATIONTYPE` int(11) DEFAULT NULL,
  `timeout` bigint(20) NOT NULL,
  `VERSION` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UNQ_automaticfileimportlocation_0` (`LOCATIONTYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clinicaldisplayconfiguration` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CLINICALDISPLAYGROUP` varchar(255) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `NUMBEROFCOLUMNS` int(11) DEFAULT NULL,
  `NUMBEROFLINES` int(11) DEFAULT NULL,
  `SINGLEEYE` tinyint(1) NOT NULL DEFAULT '0',
  `TIMESPANINDAYS` int(11) DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UNQ_clinicalDisplayConfiguration_0` (`NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `clinicaldisplayconfiguration` VALUES (1,'TEST','TEST_OCT_VF_FI',3,1,1,180,1),(2,'TEST','TEST_OU_OCT_VF_FI',3,1,0,180,1),(3,'TEST','TEST_PROGRESSION_FI',2,2,1,-1,1),(4,'TEST','TEST_OVERVIEW_FI',3,2,1,1,1),(5,'TEST','TEST_ANGIOGRAPHY_2VISITS',4,2,1,-1,1),(6,'TEST','TEST_PROGRESSION_OCT_VF',4,1,0,180,2),(7,'TEST','TEST_CHOROIDAL_ICG_OCTADV_OCTHDIMG',3,1,1,1,1),(8,'TEST','TEST_TOPO_MACCUBE_IOLMASTER',3,1,1,180,1),(9,'TEST','TEST_AMD_PROGRESSION_OCT',4,1,1,-1,2);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clinicaldisplaypositionconfiguration` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CLINICALTYPESSTRING` varchar(255) DEFAULT NULL,
  `LATERALITY` varchar(255) DEFAULT NULL,
  `POSITION` int(11) DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  `VISITDATETYPE` varchar(255) DEFAULT NULL,
  `CLINICALDISPLAYCONFIGURATION_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `CLNCLDSPLYPSTNCONFIGURATIONCLNCLDSPLYCNFGURATIONID` (`CLINICALDISPLAYCONFIGURATION_ID`),
  CONSTRAINT `CLNCLDSPLYPSTNCONFIGURATIONCLNCLDSPLYCNFGURATIONID` FOREIGN KEY (`CLINICALDISPLAYCONFIGURATION_ID`) REFERENCES `clinicaldisplayconfiguration` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `clinicaldisplaypositionconfiguration` VALUES (1,'RNFL_OR_ONH_THICKNESS_ANALYSIS','B',0,1,'LATEST',1),(2,'FGW_SFA,HFA_SFA','B',1,1,'LATEST',1),(3,'TEST_IMAGE_COLOR,TEST_IMAGE_REDFREE','B',2,1,'LATEST',1),(4,'TEST_IMAGE_COLOR','R',0,1,'LATEST',2),(5,'VISUAL_FIELD_AND_RNFL_CR,VISUAL_FIELD_AND_ONH_CR,VISUAL_FIELD_FGW_AND_OCT_CR','B',1,1,'LATEST',2),(6,'TEST_IMAGE_COLOR','L',2,1,'LATEST',2),(7,'TEST_IMAGE_COLOR',NULL,0,1,'EARLIEST',3),(8,'TEST_IMAGE_COLOR',NULL,1,1,'SECOND_EARLIEST',3),(9,'TEST_IMAGE_COLOR',NULL,2,1,'SECOND_LATEST',3),(10,'TEST_IMAGE_COLOR',NULL,3,1,'LATEST',3),(11,'TEST_IMAGE_COLOR',NULL,0,1,'LATEST',4),(12,'TEST_IMAGE_REDFREE',NULL,1,1,'LATEST',4),(13,'FA_ICG',NULL,2,1,'LATEST',4),(14,'FA_ICG',NULL,0,1,'LATEST',5),(15,'FA_ICG',NULL,4,1,'SECOND_LATEST',5),(16,'OPTIC_DISC_GPA','R',0,1,'LATEST',6),(17,'FGW_GPA,HFA_GPA','R',1,1,'LATEST',6),(18,'OPTIC_DISC_GPA','L',2,1,'LATEST',6),(19,'FGW_GPA,HFA_GPA','L',3,1,'LATEST',6),(20,'FA_ICG','B',0,1,'LATEST',7),(21,'OCT_REPORT_ADVANCED_VISUALIZATION','B',1,1,'LATEST',7),(22,'OCT_REPORT_HD_IMAGES','B',2,1,'LATEST',7),(23,'TOPOGRAPHY_REPORT','B',0,1,'LATEST',8),(24,'MACULAR_THICKNESS_ANALYSIS','B',1,1,'LATEST',8),(25,'BIOMETRY_IOL_MASTER_REPORT','B',2,1,'LATEST',8),(26,'MACULAR_THICKNESS_ANALYSIS','B',0,1,'EARLIEST',9),(27,'MACULAR_THICKNESS_ANALYSIS','B',1,1,'SECOND_EARLIEST',9),(28,'MACULAR_THICKNESS_ANALYSIS','B',2,1,'SECOND_LATEST',9),(29,'MACULAR_THICKNESS_ANALYSIS','B',3,1,'LATEST',9);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clinicalevent` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `DISEASETYPE` int(11) DEFAULT NULL,
  `EVENTCOMMENT` text,
  `EVENTDATE` datetime DEFAULT NULL,
  `EVENTTYPE` int(11) DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  `PATIENT_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_CLINICALEVENT_PATIENT_ID` (`PATIENT_ID`),
  CONSTRAINT `FK_CLINICALEVENT_PATIENT_ID` FOREIGN KEY (`PATIENT_ID`) REFERENCES `patient` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clinicaltypeconfiguration` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CLINICALTYPE` varchar(255) DEFAULT NULL,
  `IMAGETYPE` varchar(255) DEFAULT NULL,
  `MANUFACTURERMODELNAME` varchar(255) DEFAULT NULL,
  `MODALITY` varchar(255) DEFAULT NULL,
  `SOPCLASSUID` varchar(255) DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `clinicaltypeconfiguration` VALUES (1,'RNFL_OR_ONH_THICKNESS_ANALYSIS','%ONH and RNFL OU Analysis%',NULL,NULL,NULL,'1.2.840.10008.5.1.4.1.1.104.1',NULL),(2,'RNFL_OR_ONH_THICKNESS_ANALYSIS','%RNFL Thickness OU%',NULL,NULL,NULL,'1.2.840.10008.5.1.4.1.1.104.1',NULL),(3,'RNFL_OR_ONH_THICKNESS_ANALYSIS','%RNFL OU Thickness%',NULL,NULL,NULL,'1.2.840.10008.5.1.4.1.1.104.1',NULL),(4,'MACULAR_THICKNESS_ANALYSIS','%Macular Thickness%',NULL,NULL,NULL,'1.2.840.10008.5.1.4.1.1.104.1',NULL),(5,'OPTIC_DISC_GPA','%Guided Progression Analysis%',NULL,'%CIRRUS%',NULL,'1.2.840.10008.5.1.4.1.1.104.1',NULL),(6,'OCT_REPORT_ADVANCED_VISUALIZATION','%Advanced Visualization%',NULL,NULL,NULL,'1.2.840.10008.5.1.4.1.1.104.1',NULL),(7,'OCT_REPORT_HD_IMAGES','%High Definition Images%',NULL,NULL,NULL,'1.2.840.10008.5.1.4.1.1.104.1',NULL),(8,'TOPOGRAPHY_REPORT','%Overview%',NULL,'%ATLAS%',NULL,'1.2.840.10008.5.1.4.1.1.104.1',NULL),(9,'BIOMETRY_IOL_MASTER_REPORT',NULL,NULL,'%IOLMaster%',NULL,'1.2.840.10008.5.1.4.1.1.104.1',NULL),(10,'TEST_IMAGE_COLOR',NULL,'COLOR',NULL,NULL,'1.2.840.10008.5.1.4.1.1.77.1.4',NULL),(11,'TEST_IMAGE_COLOR',NULL,'COLOR',NULL,NULL,'1.2.840.10008.5.1.4.1.1.77.1.5.1',NULL),(12,'TEST_IMAGE_REDFREE',NULL,'REDFREE',NULL,NULL,'1.2.840.10008.5.1.4.1.1.77.1.4',NULL),(13,'TEST_IMAGE_REDFREE',NULL,'REDFREE',NULL,NULL,'1.2.840.10008.5.1.4.1.1.77.1.5.1',NULL),(14,'TEST_IMAGE_REDFREE',NULL,'GREEN',NULL,NULL,'1.2.840.10008.5.1.4.1.1.77.1.4',NULL),(15,'TEST_IMAGE_REDFREE',NULL,'GREEN',NULL,NULL,'1.2.840.10008.5.1.4.1.1.77.1.5.1',NULL),(16,'FA_ICG',NULL,'FA',NULL,NULL,'1.2.840.10008.5.1.4.1.1.77.1.4',NULL),(17,'FA_ICG',NULL,'FAG',NULL,NULL,'1.2.840.10008.5.1.4.1.1.77.1.4',NULL),(18,'FA_ICG',NULL,'FA',NULL,NULL,'1.2.840.10008.5.1.4.1.1.77.1.5.1',NULL),(19,'FA_ICG',NULL,'ICG',NULL,NULL,'1.2.840.10008.5.1.4.1.1.77.1.4',NULL),(20,'FA_ICG',NULL,'ICG',NULL,NULL,'1.2.840.10008.5.1.4.1.1.77.1.5.1',NULL),(21,'HFA_SFA','%SFA%',NULL,'HFA%',NULL,'1.2.840.10008.5.1.4.1.1.104.1',NULL),(22,'HFA_GPA','GPA%',NULL,'HFA%',NULL,'1.2.840.10008.5.1.4.1.1.104.1',NULL),(23,'FGW_SFA','%SFA%',NULL,'TEST TEST Workplace%',NULL,'1.2.840.10008.5.1.4.1.1.104.1',NULL),(24,'FGW_GPA','GPA%',NULL,'TEST TEST Workplace%',NULL,'1.2.840.10008.5.1.4.1.1.104.1',NULL),(25,'VISUAL_FIELD_AND_RNFL_CR','%HFA Visual Field and Cirrus RNFL Combined Report%',NULL,NULL,NULL,'1.2.840.10008.5.1.4.1.1.104.1',NULL),(26,'VISUAL_FIELD_AND_ONH_CR','%HFA Visual Field and Cirrus ONH Combined Report%',NULL,NULL,NULL,'1.2.840.10008.5.1.4.1.1.104.1',NULL),(27,'VISUAL_FIELD_FGW_AND_OCT_CR','COMBINED_REPORT',NULL,'TEST TEST Workplace%',NULL,'1.2.840.10008.5.1.4.1.1.104.1',NULL),(28,'HFA_PURE_SFA','SFA',NULL,'HFA%',NULL,'1.2.840.10008.5.1.4.1.1.104.1',NULL),(29,'FGW_PURE_SFA','SFA',NULL,'TEST TEST Workplace%',NULL,'1.2.840.10008.5.1.4.1.1.104.1',NULL),(30,'HFA_GPA_SFA','GPASFA',NULL,'HFA%',NULL,'1.2.840.10008.5.1.4.1.1.104.1',NULL),(31,'FGW_GPA_SFA','GPA_SfaGpa%',NULL,'TEST TEST Workplace%',NULL,'1.2.840.10008.5.1.4.1.1.104.1',NULL),(32,'HFA_OVERVIEW','OVR',NULL,'HFA%',NULL,'1.2.840.10008.5.1.4.1.1.104.1',NULL),(33,'FGW_OVERVIEW','OVERVIEW_%',NULL,'TEST TEST Workplace%',NULL,'1.2.840.10008.5.1.4.1.1.104.1',NULL),(34,'HFA_PURE_GPA','GPA',NULL,'HFA%',NULL,'1.2.840.10008.5.1.4.1.1.104.1',NULL),(35,'FGW_GPA_COMPLETE','GPA_GpaComplete%',NULL,'TEST TEST Workplace%',NULL,'1.2.840.10008.5.1.4.1.1.104.1',NULL),(36,'HFA_LAST_3_FOLLOW_UP','GPAL3F',NULL,'HFA%',NULL,'1.2.840.10008.5.1.4.1.1.104.1',NULL),(37,'FGW_LAST_3_FOLLOW_UP','GPA_GpaLastThreeFollowUp_%',NULL,'TEST TEST Workplace%',NULL,'1.2.840.10008.5.1.4.1.1.104.1',NULL),(38,'HFA_GPA_SUMMARY','GPASUM',NULL,'HFA%',NULL,'1.2.840.10008.5.1.4.1.1.104.1',NULL),(39,'FGW_GPA_SUMMARY','GPA_GpaSummary_%',NULL,'TEST TEST Workplace%',NULL,'1.2.840.10008.5.1.4.1.1.104.1',NULL);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `destinationdocumenttemplate` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `AUTOCREATE` tinyint(1) DEFAULT '0',
  `DOCUMENTTITLE` varchar(255) NOT NULL,
  `LATERALITY` varchar(255) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VERSION` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `destinationdocumenttemplate` VALUES (1,1,'HFA Visual Field and Cirrus RNFL Combined Report','B','SFA_RNFL',1),(2,0,'HFA Visual Field and Cirrus RNFL Combined Report','B','SFA_RNFL_CB_HR',1),(3,0,'HFA Visual Field and Cirrus RNFL Combined Report','B','SFA_RNFL_CB_HL',1),(4,0,'HFA Visual Field and Cirrus RNFL Combined Report','B','SFA_RNFL_CR_HB',1),(5,1,'HFA Visual Field and Cirrus RNFL Combined Report','R','SFA_RNFL_CR_HR',1),(6,0,'HFA Visual Field and Cirrus RNFL Combined Report','B','SFA_RNFL_CL_HB',1),(7,1,'HFA Visual Field and Cirrus RNFL Combined Report','L','SFA_RNFL_CL_HL',1),(8,1,'HFA Visual Field and Cirrus ONH Combined Report','B','SFA_ONH',1),(9,0,'HFA Visual Field and Cirrus ONH Combined Report','B','SFA_ONH_CB_HR',1),(10,0,'HFA Visual Field and Cirrus ONH Combined Report','B','SFA_ONH_CB_HL',1),(11,0,'HFA Visual Field and Cirrus ONH Combined Report','B','SFA_ONH_CR_HB',1),(12,1,'HFA Visual Field and Cirrus ONH Combined Report','R','SFA_ONH_CR_HR',1),(13,0,'HFA Visual Field and Cirrus ONH Combined Report','B','SFA_ONH_CL_HB',1),(14,1,'HFA Visual Field and Cirrus ONH Combined Report','L','SFA_ONH_CL_HL',1);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forwardingrule` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `FORWARDALLDICOMFILESOURCES` tinyint(1) DEFAULT '0',
  `FORWARDINGTIME` int(11) DEFAULT NULL,
  `SOPCLASSUID` varchar(255) NOT NULL,
  `VERSION` int(11) DEFAULT NULL,
  `destinationApplicationEntity_ID` bigint(20) DEFAULT NULL,
  `sourceApplicationEntity_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UNQ_forwardingRule_0` (`sourceApplicationEntity_ID`,`SOPCLASSUID`,`destinationApplicationEntity_ID`),
  KEY `FK_forwardingRule_destinationApplicationEntity_ID` (`destinationApplicationEntity_ID`),
  CONSTRAINT `FK_forwardingRule_destinationApplicationEntity_ID` FOREIGN KEY (`destinationApplicationEntity_ID`) REFERENCES `applicationentity` (`ID`),
  CONSTRAINT `FK_forwardingRule_sourceApplicationEntity_ID` FOREIGN KEY (`sourceApplicationEntity_ID`) REFERENCES `applicationentity` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genericdata` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `DATA` longblob NOT NULL,
  `VERSION` int(11) DEFAULT NULL,
  `GENERICDATACONTAINER_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_genericData_GENERICDATACONTAINER_ID` (`GENERICDATACONTAINER_ID`),
  CONSTRAINT `FK_genericData_GENERICDATACONTAINER_ID` FOREIGN KEY (`GENERICDATACONTAINER_ID`) REFERENCES `genericdatacontainer` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genericdatacontainer` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CONTAINERID` varchar(255) NOT NULL,
  `CONTAINERVERSION` varchar(255) NOT NULL,
  `VERSION` int(11) DEFAULT NULL,
  `SOPINSTANCE_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_genericDataContainer_SOPINSTANCE_ID` (`SOPINSTANCE_ID`),
  CONSTRAINT `FK_genericDataContainer_SOPINSTANCE_ID` FOREIGN KEY (`SOPINSTANCE_ID`) REFERENCES `sopinstance` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grouptable` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `groupid` varchar(255) DEFAULT NULL,
  `userid` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UNQ_grouptable_0` (`userid`,`groupid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `grouptable` VALUES (1,'ADMINGROUP','123',0);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagemodification` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `DTYPE` varchar(31) DEFAULT NULL,
  `FRAMEINDEX` int(11) DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  `SOPINSTANCE_ID` bigint(20) NOT NULL,
  `MEASUREMENT` tinyint(1) DEFAULT '0',
  `properties` varchar(255) DEFAULT NULL,
  `X` double DEFAULT NULL,
  `Y` double DEFAULT NULL,
  `x2` double DEFAULT NULL,
  `y2` double DEFAULT NULL,
  `USERTEXT` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_IMAGEMODIFICATION_SOPINSTANCE_ID` (`SOPINSTANCE_ID`),
  CONSTRAINT `FK_IMAGEMODIFICATION_SOPINSTANCE_ID` FOREIGN KEY (`SOPINSTANCE_ID`) REFERENCES `sopinstance` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `DTYPE` varchar(31) DEFAULT NULL,
  `CREATIONDATE` datetime DEFAULT NULL,
  `EXECUTIONTIME` int(11) DEFAULT NULL,
  `REMOTEAETITLE` varchar(255) DEFAULT NULL,
  `SOPINSTANCEUID` varchar(255) DEFAULT NULL,
  `SOPINSTANCEANDCLASSUIDS` text,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ARCHID` tinyint(1) DEFAULT '0',
  `ARGUMENTS` text,
  `MESSAGEDATE` datetime DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  `IPADDRESS` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `BIRTHDATESTRING` varchar(10) DEFAULT NULL,
  `COMMENT` text,
  `CREATEDBY` int(11) NOT NULL,
  `ETHNICGROUP` varchar(255) DEFAULT NULL,
  `IRREGULARPATIENTCOUNTER` int(11) NOT NULL DEFAULT '0',
  `ISSUEROFPATIENTID` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `LOWERNAME` varchar(129) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `OTHERPATIENTIDS` text,
  `PATIENTID` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  `PREFIX` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SUFFIX` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PATIENTSTATUS_ID` bigint(20) DEFAULT NULL,
  `PATIENT_UID` char(64) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UNQ_patient_0` (`PATIENTID`,`ISSUEROFPATIENTID`,`IRREGULARPATIENTCOUNTER`),
  UNIQUE KEY `UNQ_patient_1` (`LASTNAME`,`FIRSTNAME`,`MIDDLENAME`,`PREFIX`,`SUFFIX`,`IDEOGRAPHICNAME`,`PHONETICNAME`,`PATIENTID`,`SEX`,`BIRTHDATESTRING`,`ISSUEROFPATIENTID`),
  UNIQUE KEY `patient_uid_index` (`PATIENT_UID`),
  KEY `FK_patient_PATIENTSTATUS_ID` (`PATIENTSTATUS_ID`),
  KEY `Index_PATIENTID_LOWERNAME` (`PATIENTID`,`LOWERNAME`),
  KEY `INDEX_ALPHABETICNAME_PARTS` (`LASTNAME`,`FIRSTNAME`,`MIDDLENAME`,`PREFIX`,`SUFFIX`),
  CONSTRAINT `FK_patient_PATIENTSTATUS_ID` FOREIGN KEY (`PATIENTSTATUS_ID`) REFERENCES `patientstatus` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patientstatus` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `DICOMFILESSTATUS` int(11) DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pluginconfigurationentity` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PLUGINID` varchar(255) NOT NULL,
  `VERSION` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `PLUGINID` (`PLUGINID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pluginconfigurationproperty` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `SETTINGKEY` varchar(255) DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  `PLUGINCONFIGURATIONENTITY_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `plgnConfigurationPropertyPLGNCONFIGURATIONENTITYID` (`PLUGINCONFIGURATIONENTITY_ID`),
  CONSTRAINT `plgnConfigurationPropertyPLGNCONFIGURATIONENTITYID` FOREIGN KEY (`PLUGINCONFIGURATIONENTITY_ID`) REFERENCES `pluginconfigurationentity` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `referencedsopinstance` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PURPOSECODEVALUE` varchar(255) DEFAULT NULL,
  `PURPOSECODINGSCHEMEDESIGNATOR` varchar(255) DEFAULT NULL,
  `PURPOSECODINGSCHEMEVERSION` varchar(255) DEFAULT NULL,
  `SEQUENCETAG` int(11) DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  `SOPINSTANCE_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_referencedSopInstance_SOPINSTANCE_ID` (`SOPINSTANCE_ID`),
  KEY `Index_SOPINSTANCEUID` (`SOPINSTANCEUID`),
  CONSTRAINT `FK_referencedSopInstance_SOPINSTANCE_ID` FOREIGN KEY (`SOPINSTANCE_ID`) REFERENCES `sopinstance` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reqproccode_aetitle` (
  `applicationEntity` bigint(20) NOT NULL,
  `requestedProcedureCode` bigint(20) NOT NULL,
  PRIMARY KEY (`applicationEntity`,`requestedProcedureCode`),
  KEY `FK_ReqProcCode_AETitle_requestedProcedureCode` (`requestedProcedureCode`),
  CONSTRAINT `FK_ReqProcCode_AETitle_applicationEntity` FOREIGN KEY (`applicationEntity`) REFERENCES `applicationentity` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `FK_ReqProcCode_AETitle_requestedProcedureCode` FOREIGN KEY (`requestedProcedureCode`) REFERENCES `requestedprocedurecode` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reqproccode_reqproc` (
  `requestedProcedure` bigint(20) NOT NULL,
  `requestedProcedureCode` bigint(20) NOT NULL,
  PRIMARY KEY (`requestedProcedure`,`requestedProcedureCode`),
  KEY `FK_ReqProcCode_ReqProc_requestedProcedureCode` (`requestedProcedureCode`),
  CONSTRAINT `FK_ReqProcCode_ReqProc_requestedProcedure` FOREIGN KEY (`requestedProcedure`) REFERENCES `requestedprocedure` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `FK_ReqProcCode_ReqProc_requestedProcedureCode` FOREIGN KEY (`requestedProcedureCode`) REFERENCES `requestedprocedurecode` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `requestedprocedure` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `COMMENT` text,
  `REQUESTEDPROCEDUREDESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `STATUS` varchar(255) DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  `WORKLISTORDER_ID` bigint(20) NOT NULL,
  `REQUESTEDPROCEDUREID` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_requestedProcedure_WORKLISTORDER_ID` (`WORKLISTORDER_ID`),
  KEY `studyinstanceuid` (`STUDYINSTANCEUID`),
  CONSTRAINT `FK_requestedProcedure_WORKLISTORDER_ID` FOREIGN KEY (`WORKLISTORDER_ID`) REFERENCES `worklistorder` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `requestedprocedurecode` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ACTIVE` tinyint(1) DEFAULT '0',
  `CODEMEANING` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `CODEVALUE` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `DELETED` tinyint(1) DEFAULT '0',
  `VERSION` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `INDEX_CODEMEANING` (`CODEMEANING`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scheduledprocedurestep` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `MODALITY` varchar(255) DEFAULT NULL,
  `SCHEDULEDSTATIONAENAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `SCHEDULEDSTATIONAETITLE` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `STEPDESCRIPTION` varchar(255) DEFAULT NULL,
  `STEPSTARTDATE` datetime NOT NULL,
  `VERSION` int(11) DEFAULT NULL,
  `SPP_PREFIX` varchar(255) DEFAULT NULL,
  `SPP_SUFFIX` varchar(255) DEFAULT NULL,
  `REQUESTEDPROCEDURE_ID` bigint(20) NOT NULL,
  `SCHEDULEDPROCEDURESTEPID` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_scheduledProcedureStep_REQUESTEDPROCEDURE_ID` (`REQUESTEDPROCEDURE_ID`),
  KEY `INDEX_MODALITY` (`MODALITY`),
  KEY `INDEX_SCHEDULEDSTATIONAENAME` (`SCHEDULEDSTATIONAENAME`),
  KEY `Index_stepStartDate` (`STEPSTARTDATE`),
  CONSTRAINT `FK_scheduledProcedureStep_REQUESTEDPROCEDURE_ID` FOREIGN KEY (`REQUESTEDPROCEDURE_ID`) REFERENCES `requestedprocedure` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_version` (
  `installed_rank` int(11) NOT NULL,
  `version` varchar(50) DEFAULT NULL,
  `description` varchar(200) NOT NULL,
  `type` varchar(20) NOT NULL,
  `script` varchar(1000) NOT NULL,
  `installed_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `execution_time` int(11) NOT NULL,
  `success` tinyint(1) NOT NULL,
  PRIMARY KEY (`installed_rank`),
  KEY `schema_version_s_idx` (`success`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `schema_version` VALUES (1,NULL,'<< Flyway Schema Creation >>','SCHEMA','`test`',NULL,'root','2017-07-20 08:37:50',0,1),(2,'3.3.0.0','create tables','SQL','sql/3.3/I3.3.0.0__create_tables.sql',-692543123,'root','2017-07-20 08:37:53',2355,1),(3,'3.3.0.1','initialize flyway db variables','SQL','sql/3.3/I3.3.0.1__initialize_flyway_db_variables.sql',-1007497059,'root','2017-07-20 08:37:53',0,1),(4,'3.3.0.2','init','SQL','sql/3.3/I3.3.0.init.sql',390945885,'root','2017-07-20 08:37:53',130,1),(5,'3.3.0.4','combinedreports','SQL','sql/3.3/I3.3.0.4__combinedreports.sql',1859469550,'root','2017-07-20 08:37:53',140,1),(6,'3.3.0.24','clinicaldisplay','SQL','sql/3.3/I3.3.0.24__clinicaldisplay.sql',-1631976558,'root','2017-07-20 08:37:53',19,1),(7,'3.3.0.29.1','sopinstance index path sync','SQL','sql/3.3/I3.3.0.29.1__sopinstance_index_path_sync.sql',-1932796003,'root','2017-07-20 08:37:53',14,1),(8,'3.3.0.32','postInstallation','SQL','sql/3.3/I3.3.0.32__postInstallation.sql',1214692104,'root','2017-07-20 08:37:53',99,1),(9,'3.3.0.36','create timerservice schema','SQL','sql/3.3/I3.3.0.36__create_timerservice_schema.sql',-234504164,'root','2017-07-20 08:37:53',1,1),(10,'3.3.0.37','change matrix mode for TEST display','SQL','sql/3.3/I3.3.0.37__change_matrix_mode_for_TEST_display.sql',-1499589297,'root','2017-07-20 08:37:53',0,1),(11,'3.3.0.38','change matrix mode for TEST display','SQL','sql/3.3/I3.3.0.38__change_matrix_mode_for_TEST_display.sql',42469730,'root','2017-07-20 08:37:53',0,1),(12,'3.3.0.40','delete system properties','SQL','sql/3.3/I3.3.0.40__delete_system_properties.sql',139149713,'root','2017-07-20 08:37:53',1,1),(13,'3.3.0.41','angle','SQL','sql/3.3/I3.3.0.41__angle.sql',1646889929,'root','2017-07-20 08:37:53',0,1),(14,'3.3.0.42','remove selectiontype from user','SQL','sql/3.3/I3.3.0.init.sql',1646889929,'root','2017-07-20 08:37:54',0,1),(15,'3.3.0.43','updates task index gen','SQL','sql/3.3/I3.3.0.43__updates_task_index_gen.sql',790703287,'root','2017-07-20 08:37:54',0,1);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `series` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `LASTSERIESINSTANCEUID` varchar(255) DEFAULT NULL,
  `LATERALITY` int(11) DEFAULT NULL,
  `MANUFACTURERMODELNAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `MODALITY` varchar(255) DEFAULT NULL,
  `ORIGINATINGSERIESINSTANCEUID` varchar(255) DEFAULT NULL,
  `PERFORMEDPROCEDURESTEPSTARTDATE` datetime DEFAULT NULL,
  `REQUESTEDPROCEDUREIDS` text,
  `SCHEDULEDPROCEDURESTEPIDS` text,
  `SERIESDATE` datetime DEFAULT NULL,
  `SERIESDESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `SERIESINSTANCEUID` varchar(64) NOT NULL,
  `SERIESNUMBER` int(11) DEFAULT NULL,
  `SOFTWAREVERSIONS` text,
  `VERSION` int(11) DEFAULT NULL,
  `PP_PREFIX` varchar(255) DEFAULT NULL,
  `PP_SUFFIX` varchar(255) DEFAULT NULL,
  `STUDY_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `SERIESINSTANCEUID` (`SERIESINSTANCEUID`),
  KEY `FK_series_STUDY_ID` (`STUDY_ID`),
  KEY `Index_MANUFACTURERMODELNAME` (`MANUFACTURERMODELNAME`),
  KEY `Index_MODALITY` (`MODALITY`),
  KEY `Index_SeriesDate` (`SERIESDATE`) USING BTREE,
  CONSTRAINT `FK_series_STUDY_ID` FOREIGN KEY (`STUDY_ID`) REFERENCES `study` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `sopinstance` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ACQUISITIONDATE` datetime DEFAULT NULL,
  `ADDITIONALINFOS` text,
  `CONTENTDATE` datetime DEFAULT NULL,
  `DBENTRYDATE` datetime DEFAULT NULL,
  `DISPLAYDETAILTYPE` int(11) DEFAULT NULL,
  `EMBEDDEDFILETYPE` int(11) DEFAULT NULL,
  `EXPECTEDPERMANENTCOPY` tinyint(1) DEFAULT '0',
  `FAVORITE` tinyint(1) NOT NULL DEFAULT '0',
  `HIDDEN` tinyint(1) NOT NULL DEFAULT '0',
  `IMAGELATERALITY` int(11) DEFAULT NULL,
  `THUMBNAIL` longblob,
  `TRANSFERSYNTAXUID` varchar(64) NOT NULL,
  `VERSION` int(11) DEFAULT NULL,
  `VISITSUBGROUPTYPE` int(11) NOT NULL,
  `VISITSUBGROUPVALUE` varchar(1024) NOT NULL,
  `SERIES_ID` bigint(20) NOT NULL,
  `STORAGE_ID` bigint(20) DEFAULT NULL,
  `REMOTETEST_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `PATHINSTORAGE` (`PATHINSTORAGE`),
  UNIQUE KEY `SOPINSTANCEUID` (`SOPINSTANCEUID`),
  KEY `FK_sopInstance_SERIES_ID` (`SERIES_ID`),
  KEY `sopinstance_path_sync` (`PATHINSTORAGE`(10),`ID`,`SERIES_ID`,`SOPINSTANCESYNCSTATUS`),
  KEY `Index_ACQUISITIONDATE` (`ACQUISITIONDATE`),
  KEY `INDEX_SOP_REMOTETEST_ID2` (`REMOTETEST_ID`,`ID`),
  CONSTRAINT `FK_sopInstance_REMOTETEST_ID` FOREIGN KEY (`REMOTETEST_ID`) REFERENCES `applicationentity` (`ID`),
  CONSTRAINT `FK_sopInstance_SERIES_ID` FOREIGN KEY (`SERIES_ID`) REFERENCES `series` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `test`.`trig_sopinstance_create_dbentrydate` BEFORE INSERT ON `test`.`sopinstance`
FOR EACH ROW BEGIN

  IF new.dbentrydate IS NULL THEN
	   SET new.dbentrydate = now();
  END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `test`.`trig_sopinstance_update_dbentrydate` BEFORE UPDATE ON `test`.`sopinstance`
FOR EACH ROW BEGIN

  -- avoid set dbentrydte to null or change the value
  if new.dbentrydate is null
    OR old.dbentrydate is null
    OR new.dbentrydate <> old.dbentrydate -- compare with null do not work
  then
     -- use in this case old value
     SET new.dbentrydate = old.dbentrydate;
  END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sopinstancecomment` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `AUTHOR` varchar(255) DEFAULT NULL,
  `CREATIONDATE` datetime DEFAULT NULL,
  `INCLUDEINDERIVEDDOCUMENTS` tinyint(1) DEFAULT '0',
  `TEXT` varchar(10240) DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  `SOPINSTANCE_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_SOPINSTANCECOMMENT_SOPINSTANCE_ID` (`SOPINSTANCE_ID`),
  CONSTRAINT `FK_SOPINSTANCECOMMENT_SOPINSTANCE_ID` FOREIGN KEY (`SOPINSTANCE_ID`) REFERENCES `sopinstance` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sopinstanceextended` (
  `ID` bigint(20) NOT NULL,
  `TRUNCATEDDICOMHEADER` longblob,
  `VERSION` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `source_destination` (
  `sourceDocumentType` bigint(20) NOT NULL,
  `destinationDocumentTemplate` bigint(20) NOT NULL,
  PRIMARY KEY (`sourceDocumentType`,`destinationDocumentTemplate`),
  KEY `FK_source_destination_destinationDocumentTemplate` (`destinationDocumentTemplate`),
  CONSTRAINT `FK_source_destination_destinationDocumentTemplate` FOREIGN KEY (`destinationDocumentTemplate`) REFERENCES `destinationdocumenttemplate` (`ID`),
  CONSTRAINT `FK_source_destination_sourceDocumentType` FOREIGN KEY (`sourceDocumentType`) REFERENCES `sourcedocumenttype` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `source_destination` VALUES (1,1),(4,1),(5,1),(1,2),(4,2),(1,3),(5,3),(2,4),(4,4),(5,4),(2,5),(4,5),(3,6),(4,6),(5,6),(3,7),(5,7),(4,8),(5,8),(6,8),(4,9),(6,9),(5,10),(6,10),(4,11),(5,11),(7,11),(4,12),(7,12),(4,13),(5,13),(8,13),(5,14),(8,14);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sourcedocumentclassification` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `LANGUAGE` varchar(255) NOT NULL,
  `PAPERSIZE` int(11) NOT NULL,
  `REPORTVERSION` varchar(255) NOT NULL,
  `VERSION` int(11) DEFAULT NULL,
  `SOURCEDOCUMENTTYPE_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `sourceDocumentClassification_SOURCEDOCUMENTTYPE_ID` (`SOURCEDOCUMENTTYPE_ID`),
  CONSTRAINT `sourceDocumentClassification_SOURCEDOCUMENTTYPE_ID` FOREIGN KEY (`SOURCEDOCUMENTTYPE_ID`) REFERENCES `sourcedocumenttype` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `sourcedocumentclassification` VALUES (1,'en',1,'1',1,1),(2,'en',1,'1',1,2),(3,'en',1,'1',1,3),(4,'de',0,'1',1,4),(5,'en',1,'1',1,4),(6,'de',0,'1',1,5),(7,'en',1,'1',1,5),(8,'en',1,'1',1,6),(9,'en',1,'1',1,7),(10,'en',1,'1',1,8),(11,'de',1,'1',1,4),(12,'en',0,'1',1,4),(13,'fr',1,'1',1,4),(14,'fr',0,'1',1,4),(15,'es',1,'1',1,4),(16,'es',0,'1',1,4),(17,'it',1,'1',1,4),(18,'it',0,'1',1,4),(19,'ja',1,'1',1,4),(20,'ja',0,'1',1,4),(21,'de',1,'1',1,5),(22,'en',0,'1',1,5),(23,'fr',1,'1',1,5),(24,'fr',0,'1',1,5),(25,'es',1,'1',1,5),(26,'es',0,'1',1,5),(27,'it',1,'1',1,5),(28,'it',0,'1',1,5),(29,'ja',1,'1',1,5),(30,'ja',0,'1',1,5);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sourcedocumenttype` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `MANUFACTURERMODELNAME` varchar(255) NOT NULL,
  `SUBTYPE` varchar(255) NOT NULL,
  `VERSION` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `sourcedocumenttype` VALUES (1,'CIRRUS','CIRRUS_RNFL_B',1),(2,'CIRRUS','CIRRUS_RNFL_R',1),(3,'CIRRUS','CIRRUS_RNFL_L',1),(4,'HFA','HFA_SFA_R',1),(5,'HFA','HFA_SFA_L',1),(6,'CIRRUS','CIRRUS_ONH_B',1),(7,'CIRRUS','CIRRUS_ONH_R',1),(8,'CIRRUS','CIRRUS_ONH_L',1);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sourcefield` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `EXTRACTIONBEANNAME` varchar(255) DEFAULT NULL,
  `FIELDNAME` varchar(255) DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  `SOURCEDOCUMENTCLASSIFICATION_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_sourceField_SOURCEDOCUMENTCLASSIFICATION_ID` (`SOURCEDOCUMENTCLASSIFICATION_ID`),
  CONSTRAINT `FK_sourceField_SOURCEDOCUMENTCLASSIFICATION_ID` FOREIGN KEY (`SOURCEDOCUMENTCLASSIFICATION_ID`) REFERENCES `sourcedocumentclassification` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2273 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `sourcefield` VALUES (425,'labelExtraction','cirrusDateLabel',1,5),(426,'labelExtraction','hfaVisualFieldIndexPercentODLabel',1,5),(427,'entityExtraction','patientDateOfBirth',1,5),(428,'labelExtraction','hfaDatelLabel',1,5),(429,'dicomHeaderExtraction','hfaQualityIndexFixationLossOD',1,5),(430,'headerExtraction','hfaMeanDeviation2OD',1,5);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sourcefieldextractionparam` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PROPERTY` varchar(255) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  `VERSION` int(11) DEFAULT NULL,
  `SOURCEFIELD_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_sourceFieldExtractionParam_SOURCEFIELD_ID` (`SOURCEFIELD_ID`),
  CONSTRAINT `FK_sourceFieldExtractionParam_SOURCEFIELD_ID` FOREIGN KEY (`SOURCEFIELD_ID`) REFERENCES `sourcefield` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4223 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `sourcefieldextractionparam` VALUES (1094,'dicomTag','0x0008002A',1,491),(1095,'messageKey','od',1,461),(1096,'messageKey','slash',1,466),(1097,'messageKey','visualFieldRNFLTitle',1,454),(1098,'subStringEndIndex','-1',1,456),(1099,'page','1',1,485),(1100,'messageKey','hfaSWVersion',1,452),(1101,'x','208',1,485),(1102,'dicomTag','0x77171010',1,431),(1103,'componentOfMultivaluedField','1',1,437),(1104,'dicomTag','0x77171034',1,480),(1105,'messageKey','hfaQualityIndexNegativeError',1,471),(1106,'x','264',1,438),(1107,'messageKey','physiciansSignature',1,489),(1108,'messageKey','comments',1,495),(1109,'messageKey','hfaMeanDeviation',1,486);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `study` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ACCESSIONNUMBER` varchar(255) DEFAULT NULL,
  `ADMITTINGDIAGNOSESDESCRIPTION` text,
  `LASTSTUDYINSTANCEUID` varchar(255) DEFAULT NULL,
  `STUDYDATE` datetime DEFAULT NULL,
  `STUDYDESCRIPTION` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `STUDYID` varchar(255) DEFAULT NULL,
  `STUDYINSTANCEUID` varchar(64) NOT NULL,
  `RFP_PHONETIC_NAME` varchar(255) DEFAULT NULL,
  `RFP_PREFIX` varchar(255) DEFAULT NULL,
  `RFP_SUFFIX` varchar(255) DEFAULT NULL,
  `PATIENT_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `STUDYINSTANCEUID` (`STUDYINSTANCEUID`),
  KEY `FK_study_PATIENT_ID` (`PATIENT_ID`),
  KEY `Index_STUDY_DATE` (`STUDYDATE`),
  KEY `Index_ACCESSIONNUMBER` (`ACCESSIONNUMBER`),
  CONSTRAINT `FK_study_PATIENT_ID` FOREIGN KEY (`PATIENT_ID`) REFERENCES `patient` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `synchronizationrecord` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ENDDATE` datetime DEFAULT NULL,
  `ERRORCOUNT` bigint(20) DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `systemproperty` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PROPERTYNAME` varchar(255) NOT NULL,
  `PROPERTYVALUE` varchar(255) NOT NULL,
  `VERSION` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UNQ_systemproperty_0` (`PROPERTYNAME`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `systemproperty` VALUES 
  (1,'APPLICATION_VERSION','1.2.0',1),
  (2,'APPLICATION_NAME','TEST Server',3),
  (3,'HIS_ISSUER','HIS',1),
  (4,'ACCESSION_NUMBER_CREATION_MODE','SEMI',1),
  (5,'PATIENT_ID_CREATION_MODE','SEMI',1),
  (6,'PATIENT_ID_PREFIX','',1);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usertable` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ACTIVE` tinyint(1) NOT NULL DEFAULT '0',
  `COMPRESSIONENABLED` tinyint(1) DEFAULT '0',
  `COMPRESSIONFACTOR` float DEFAULT NULL,
  `COUNTRY` varchar(255) DEFAULT NULL,
  `LANGUAGE` varchar(255) NOT NULL,
  `LASTNAME` varchar(255) DEFAULT NULL,
  `NAMELISTFILTERCONFIGURATION` int(11) NOT NULL,
  `PASSWORD` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PASSWORDFAILURECOUNT` int(11) DEFAULT NULL,
  `PLUGINUSER` text,
  `userid` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `VARIANT` varchar(255) DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UNQ_usertable_0` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `usertable` VALUES (1,1,0,1,NULL,'Change it','en','Change it',0,'65d64sd654sf654',0,NULL,'test',NULL,0);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `worklistorder` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ACCESSIONNUMBER` varchar(255) NOT NULL,
  `CREATEDBY` int(11) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `FILLERORDERNUMBER` varchar(428) DEFAULT NULL,
  `PLACERORDERNUMBER` varchar(428) DEFAULT NULL,
  `TOGGLETOINCREASEVERSION` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `VERSION` int(11) DEFAULT NULL,
  `RFP_FIRSTNAME` varchar(255) DEFAULT NULL,
  `RFP_IDEOGRAPHIC_NAME` varchar(255) DEFAULT NULL,
  `RFP_LASTNAME` varchar(255) DEFAULT NULL,
  `RQP_PREFIX` varchar(255) DEFAULT NULL,
  `RQP_SUFFIX` varchar(255) DEFAULT NULL,
  `PATIENT_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_worklistOrder_PATIENT_ID` (`PATIENT_ID`),
  CONSTRAINT `FK_worklistOrder_PATIENT_ID` FOREIGN KEY (`PATIENT_ID`) REFERENCES `patient` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
